<%@page import="org.w3c.dom.Element"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="java.io.StringReader"%>
<%@page import="org.xml.sax.InputSource"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@page import="edms.service.StringOperationsService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery-1.7.2.min.js" type="application/javascript"></script>
<script src="js/jquery.noty.packaged.js"></script>

    <script type="text/javascript">
						function getAtt() {
							var attid = $('#attachmentID').val();
							var attl = attid.split(',');
							for ( var i in attl) {
								//alert(attl[i]);
								if (attl[i] != "") {
									//var csl=attl[i];
									var rlt = $('<input/>').attr({
										type : 'button',
										name : 'btn1',
										value : attl[i],
										id : 'ae' + attl[i],
										onclick : 'getAttachment(this.value)',
										class : 'attachClass'
									});
									$("#attlch").append(rlt);
								}
							}

							$('.getAttch').attr("disabled","disabled");
						}
					</script>
				<script type="text/javascript">
					function getHistoryForms(){
					var attid=$('#historyHiddenTasks').val();
					var attl=attid.split(',');
					for (var i in attl) {
						if(i!=""){

		     		        var br = document.createElement("br");
		     		       $("#showHistoryHiddenTasks").append(br);
					 var rlt='<label>'+ attl[i]+'</label>';
     				 $("#showHistoryHiddenTasks").append(rlt);

					}}
					
					$('.getHistory').attr("disabled","disabled");
					
					}
					</script>

<script type="text/javascript">
$( document ).ready(function() {

	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();

	if(dd<10) {
	    dd='0'+dd
	} 

	if(mm<10) {
	    mm='0'+mm
	} 

	today = dd+'-'+mm+'-'+yyyy;
	
	var recent_win_he1 = $(window).width();
    $('.other_pages').css('width',recent_win_he1-230);
	
	
			var pageHtml = document.getElementById("htmlPage").value;
			jQuery.get(pageHtml, function(data) {
				if(data=="true"){
					location.href="index";
				}
		 	$("#insertWorkflowFormHere").html(data);
		 	<%
		 	String compressedForm = (String) request.getAttribute("xmlForm");
			String processInstId = (String) request.getAttribute("processInstId");
			StringOperationsService stringOperationsService = (StringOperationsService) request
					.getAttribute("stringOperationsService");
			DocumentBuilder db = DocumentBuilderFactory.newInstance().newDocumentBuilder();
			InputSource is = new InputSource();
			is.setCharacterStream(new StringReader(compressedForm));
			Document doc = db.parse(is);
			NodeList nodes = doc.getElementsByTagName("field");
			for (int i = 0; i < nodes.getLength(); i++) {
				Element element = (Element) nodes.item(i);
				NodeList name = element.getElementsByTagName("attributeId");
				Element line = (Element) name.item(0);
				if (line != null) {
					String attributeId = stringOperationsService.getCharacterDataFromElement(line);%>
				var attid = "<%=attributeId%>";
					<%
					NodeList title = element.getElementsByTagName("attributeValue");
					line = (Element) title.item(0);
					String attributeValue = stringOperationsService.getCharacterDataFromElement(line);
					%>
				
				var attval = "<%=attributeValue.replace("\n", "_lineechange_")%>";
				var someString = attval;
				attval = someString.replace(/_lineechange_/g, '\n');
					
				<%	NodeList type = element.getElementsByTagName("attributeType");
					line = (Element) type.item(0);
					if (line != null) {

						String attributeType = stringOperationsService.getCharacterDataFromElement(line);
						if (attributeType.equals("checkbox") || attributeType.equals("radio")) {%>
				<%if (!(attributeValue.equals(""))) {%>
					$('#' + attid).attr("checked", true);
				<%}%>
				<%}
						
					}
					%>
	
				if(attval!=null && attval.trim()!="")
					{
					if(attid!="filledDaete")
					{
					try
					{
						
						$('#' + attid).attr("value",attval);	
					}
					catch(err)
					{
						$('#' + attid).val(attval);	
					}
					}
					else{
						try{
						var dtl=attval.split("-");
						if(parseInt(dtl[1])>3&&parseInt(dtl[2])>2015){
							$('#financialYear').html("2016-17");
						}
						}catch(err){
							
						}
						
					}
					try
					{
						if(attid=="voucherRemark" || attid=="remark" || attid=="memoArea"|| attid=="leaveReason"|| attid=="leaveAddr"|| attid=="voucherParticular1"|| attid=="voucherParticular2"|| attid=="voucherParticular3"|| attid=="voucherParticular4"|| attid=="voucherParticular5"|| attid=="voucherParticular6"|| attid=="voucherParticular7"|| attid=="voucherParticular8"|| attid=="voucherParticular9"|| attid=="voucherParticular10"|| attid=="voucherParticular11"|| attid=="voucherParticular12"|| attid=="voucherParticular13"|| attid=="voucherParticular14"|| attid=="voucherParticular15")
							$("#"+attid).text(attval);
					}
					catch(err)
					{
						
					}
					try
					{
						$("#"+attid+" option[value='" + attval + "']").attr("selected","selected");	
					}
					catch(err)
					{
						
					}
					}
				<%}
			}%>
				if(pageHtml.indexOf("History")<0)
				{

					
					var hisVal=$('#historyHiddenTasks').val();

				
				

				if(pageHtml.indexOf("readjust")>=0)
					$("#formBy").val($("#employeeID").val());
				else
					$("#formBy").attr("value",$("#formTo").val());
				

				
					if(pageHtml.indexOf("lastHandle")>=0)
					{	$("#formTo option[value='"+$("#employeeID").val()+"']").attr("selected","selected");	
					$("#formTo").attr("value",$("#employeeID").val());}
				else
					{$("#formTo option[value='index']").attr("selected","selected");	
				
					$("#formTo").attr("value",'index');}
			
				}
				
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
		//alert(jsonData);
		jsonDataObject.workflowForm = workflowForm;
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
		    	success: function(data){
		    		//alert(data);
		    	},
		    	error: function(err){
		    		//alert(err);
 			    	showMsgWF("Succesfully Submitted!");
 			    	$("#action_gif").hide();
		    		jQuery.get("leftActiviti_toDoTasks", function( data ) {
		    			 $( "#activitiForms" ).html( data );
		    			});
		        }
		    });
	}
</script>
</head>
<body>
	<%
		String htmlPage = (String) request.getAttribute("htmlWorkflowPage");
		String taskId = (String) request.getAttribute("taskid");
	%>
	<input type="hidden" value="<%=taskId%>" id="taskid" name="taskid" />
	<input type="hidden" value="<%=htmlPage%>" id="htmlPage"
		name="htmlPage" />
	<input type="hidden" id="processInstanceeID" value="<%=processInstId%>" />

	<div class="right other_pages">
		<!-------------/// TRASH PAGES STARED HERE --------->

		<!--------/// TRASH MENU STARTED HERE --------->
		<div class="trash_menu">
			<h1>To Do Tasks</h1>
		</div>

		<div id="insertWorkflowFormHere"></div>
	</div>
		
</body>
</html>