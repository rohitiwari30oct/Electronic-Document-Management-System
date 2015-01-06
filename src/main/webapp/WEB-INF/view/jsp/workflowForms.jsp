<%@page import="org.w3c.dom.Element"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="java.io.StringReader"%>
<%@page import="org.xml.sax.InputSource"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@page import="edms.service.StringOperationsService"%>
<%@page import="edms.service.DemoUserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$( document ).ready(function() {
	var pageHtml = document.getElementById("htmlPage").value;
	//var pageHtml = "static/"+htmlHid+".html";
	jQuery.get(pageHtml, function(data) {
		 $("#insertWorkflowFormHere").html(data);
		 
		 <%String compressedForm = (String) request.getAttribute("xmlForm");
			System.out.println("xmlForm================= " + compressedForm);
			StringOperationsService stringOperationsService = (StringOperationsService) request
					.getAttribute("stringOperationsService");
			//String decompressedXmlForm = stringOperationsService.decompressString(compressedForm);
			//System.out.println("decompressedXmlForm $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ "+ decompressedXmlForm);%>
	//xml form parsing begin
	<%DocumentBuilder db = DocumentBuilderFactory.newInstance()
					.newDocumentBuilder();
			InputSource is = new InputSource();
			is.setCharacterStream(new StringReader(compressedForm));

			Document doc = db.parse(is);
			NodeList nodes = doc.getElementsByTagName("field");
			System.out.println("nodes length = " + nodes.getLength());
			for (int i = 0; i < nodes.getLength(); i++) {
				Element element = (Element) nodes.item(i);

				NodeList name = element.getElementsByTagName("attributeId");
				Element line = (Element) name.item(0);
				String attributeId = stringOperationsService
						.getCharacterDataFromElement(line);%>
				
		var attid = '<%=attributeId%>';
		

		<%NodeList title = element.getElementsByTagName("attributeValue");
				line = (Element) title.item(0);
				String attributeValue = stringOperationsService
						.getCharacterDataFromElement(line);%>
				var attval = '<%=attributeValue%>';
<%NodeList type = element.getElementsByTagName("attributeType");
				line = (Element) type.item(0);
				String attributeType = stringOperationsService
						.getCharacterDataFromElement(line);
				if (attributeType.equals("checkbox")) {%>
	document.getElementById(attid).disabled = true;
<%if (!(attributeValue.equals(""))) {%>
	$('#' + attid).prop("checked", true);
<%}%>
	
<%}%>
	$('#' + attid).val(attval);
<%}%>
		});
});
</script>
<script type="text/javascript">
	function proceedTheForm(requestType){
	    var jsonData2 = {};
	    var jsonData1 = {};
	    var jsonDataObject = {};
	    var workflowForm = [];
	    var tid = document.getElementById("taskid").value;
	    var selected = jQuery('#handleWorkflowForm').find('input, textarea, select'); 
		selected.each(function() {
			var type = $(this).attr('type');
			var ischecked = $(this).prop('checked');
			if(type!='button'){
				var keynm = $(this).attr('id');
				jsonData1[keynm] = $(this).attr('type');
				if((type=='checkbox') || (type=='radio')){
		        	if(ischecked==true){
		        		var keyname = $(this).attr('id');
		        		jsonData2[keyname] = $(this).val();
		        	}
		        	else{
		        		var keyname2 = $(this).attr('id');
		        		jsonData2[keyname2] = "";  
		        	}
		        }
		        else{
		        	var keyname1 = $(this).attr('id');
		        	jsonData2[keyname1] = $(this).val();
		        }
			}
		});
		workflowForm.push(jsonData2);
		workflowForm.push(jsonData1);
		jsonDataObject.workflowForm = workflowForm;
	   // turn the jsonData object into a string so it can be passed to the controller
	   var jsonData = JSON.stringify(jsonDataObject);
		    $.ajax ({
				type: "POST",
		    	url:"${pageContext.request.contextPath}/handleRequest_formDecision",
		    	data: {
		    		json:jsonData,
		    		taskid:tid,
		    		reqtype:requestType,
		    		formType:"WorkflowForm",
		    	},
		    	dataType: 'json',
		    	error: function(err){
		    		alert("Succesfully Submitted!");
		    		jQuery.get("leftActiviti_toDoTasks", function( data ) {
		    			 $( "#activitiForms" ).html( data );
		    			});
		        }
		    });
	}
</script>
</head>
<body>
<%String htmlPage = (String)request.getAttribute("htmlWorkflowPage");
String taskId = (String) request.getAttribute("taskid");%>
<input type="hidden" value="<%=taskId%>" id="taskid" name="taskid" />
<input type="hidden" value="<%=htmlPage%>" id="htmlPage" name="htmlPage" />
<div id="insertWorkflowFormHere">

</div>
</body>
</html>