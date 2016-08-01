<%@page import="edms.wsdl.GetUsersListResponse"%>
<%@page import="edms.webservice.client.UserClient"%>
<%@page import="javax.naming.directory.Attribute"%>
<%@page import="javax.naming.directory.Attributes"%>
<%@page import="javax.naming.directory.DirContext"%>
<%@page import="edms.core.LDAPConnection"%>
<%@page import="edms.core.Config"%>
<%@page import="edms.core.*"%>
<%@page import="java.text.*"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.newcsss{
left: 300px;
    position: absolute;
    top: -42px;
}
</style>
<style type="text/css">

select{
height: 28px;
}
</style>
<link type="text/css" href="css/jquery.datepick.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.plugin.js"></script>
<script type="text/javascript" src="js/jquery.datepick.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="css/autocomplete.css" />
<script src="js/jquery.autocomplete.js"></script> --> 
<script src="js/jquery.knob.js"></script> 
<script type="text/javascript">
$('.form_scolling_project input').keypress(function(event) {
	   if (event.which == 39 || event.which == 34) {
	       event.preventDefault();
	   }
	});

</script>
<script type="text/javascript">
$('.form_scolling_project textarea').keypress(function(event) {
	   if (event.which == 39 || event.which == 34) {
	       event.preventDefault();
	   }
	});

</script>

<script type="text/javascript">
$(document).ready(function(){ 
	$('.popupDatepicker').datepick();
	try
	{
	//$("#formTo").autocomplete("${pageContext.request.contextPath}/autocomp");
	}
	catch (e) {
		// TODO: handle exception
	}

	$('.popupDatepicker').datepick();
	

//	setTimeout(function(){ tr_load(); }, 1000);
});




function valiFormCPV(id,dec)
{
	var pg=true;
	/* if($("#formBy").val()==null || $("#formBy").val().trim()=="")
	{
	pg=false;
	showMsgWF("Please Fill From field");
	}
	else if($("#formTo").val()==null || $("#formTo").val().trim()=="")
		{
		pg=false;
		showMsgWF("Please Fill To field");
		}
	else if($("#voucherTotal").val()==null || $("#voucherTotal").val().trim()=="")
	{
	pg=false;
	showMsgWF("Please Fill Total field");
	} */
	
/* 	$(".blank_val").each(function() {
	    if($(this).val()=="" || $(this).val()==null)
	    	{
	    	pg=false;
	    	}
	}); */
	if(dec!="reject"){
	if($("#formTo").val()==null || $("#formTo").val().trim()=="index")
	{
	pg=false;
	showMsgWF("Please Fill To field");
	}

	 if($("#formBy").val()=="index")
		{
		pg=false;
		//alert("SDF");
		showMsgWF("Please Fill From field");
		}
	}
	if(pg==true)
		{
		try{

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
			if(dec=="accept"){
			$('#historyHiddenTasks').attr("value",$('#historyHiddenTasks').val()+"Verified By " + $("#formBy").val()+" on Dated "+today+",") ;

			$('#verifiedBy').attr("value",$("#formBy").val()+" on Dated "+today) ;
			$('#formSStatus').attr("value","Verified") ;
			
			}else{
				$('#historyHiddenTasks').attr("value",$('#historyHiddenTasks').val()+"Rejected By " + $("#formBy").val()+" on Dated "+today+",") ;
				$('#formSStatus').attr("value","Rejected") ;
				}
			
			
			$("#action_gif").show();
		}
		catch (e) {
			// TODO: handle exception
		}
		$("#"+id).attr("disabled",true);
		proceedTheForm(dec);
		}
	else
		{
		showMsgWF("Please Fill all fields");
		}
}



function myVal(id) {
	var nm=$("#"+id).val();
	$('#'+id).attr('value', nm);
}

function myTextareaVal(id) {
	var nm=$("textarea#"+id).val();
	$("#"+id).text(nm);
}

$('#formBy').on('change', function() {
	  $('option:selected', this).attr('selected',true).siblings().removeAttr('selected');
	});
$('#formTo').on('change', function() {
	  $('option:selected', this).attr('selected',true).siblings().removeAttr('selected');
	});
</script>

</head>
<body>
<%
Date curr_dt=new Date();
DateFormat dateformat = new SimpleDateFormat("dd-MM-yyyy");
String dt=dateformat.format(curr_dt);
Principal principal=(Principal) request.getAttribute("principal");
HttpSession hs=request.getSession();
String uid=principal.getName();
if(!uid.contains("@"))
{
	uid=uid+Config.EDMS_DOMAIN;
}

String entry=Config.LDAP_BASE+"="+uid+","+Config.LDAP_RDN;
List<String> ulst= LDAPUserList.listLdapUserDirectory(Config.LDAP_URL, entry, principal.getPassword(), Config.LDAP_RDN);
Collections.sort(ulst);
/* DirContext ctx=null;
String entry=Config.LDAP_BASE+"="+principal.getName()+","+Config.LDAP_RDN;
ctx=LDAPConnection.getConnection(Config.LDAP_URL, entry , principal.getPassword());
List<String> lst= LDAPUserList.listLdapUserDirectory(Config.LDAP_URL, entry, principal.getPassword(), Config.LDAP_RDN);
String uname="";
 try
 {
  Attributes testAttributes = ctx.getAttributes(entry);
 Attribute att = testAttributes.get("cn");
 if(att != null)
 {
	  uname = (String) att.get();
 }
 
 }
 catch(Exception e)
 {
	 e.printStackTrace();
 }
 LDAPConnection.closeConn(ctx); */
%>
	<div class="form_scolling_project"  id="myformCPV" >
		<div class="from_main_leave">
				
				 <table id="handleWorkflowForm">
                       <tbody><tr>
				<td rowspan="1">
				<img src="images/logo.png">
				</td>
                <td colspan="3" class="table_heading">INTER OFFICE MEMO
                <input type="hidden" value="Inter Office Memo" name="formNameWF" id="formNameWF" /> 
                 <input type="hidden" value="<%=dt %>" name="filledDaete" id="filledDaete" /> 
                <input type="hidden"  name="formSStatus"  id="formSStatus" /> </td>
              </tr>
              <tr>
                <td>FROM</td>
                <td>
                <%-- <input  type="text"  onblur="myVal(this.id)"  id="formBy" name="formBy"  class="memo_form" placeholder="FROM" value="<%=uid%>"> --%>
                  <select id="formBy" name="formBy" style="    width: 300px;">
               <option value="index">Please Select </option>
                <%
               for(String lst: ulst)
               {
            	   if(lst.equalsIgnoreCase(uid))
            	   {
               %>
               <option selected="selected" value="<%=lst %>"><%=lst %> </option>
               <%}
            	   else
            	   {
            	   %>
               <option value="<%=lst %>"><%=lst %> </option>
               <%} }%>
               </select>
                
                </td>
                <td>TO</td>
                <td>
                <select id="formTo" name="formTo" style="    width: 300px;">
               <option value="index">Please Select </option>
               <%
               for(String lst: ulst)
               {
               %>
               <option value="<%=lst %>"><%=lst %> </option>
               <%} %>
               </select>
                
                <%-- <input  type="text"  onblur="myVal(this.id)"   class="memo_form userforshare" id="formTo" name="formTo" placeholder="FROM" value="<%=uid%>"> --%>
                
                </td>
              </tr>
              <tr>
                <td>OUR REF</td>
                <td><input  type="text"  onblur="myVal(this.id)"  class="memo_form"   placeholder="OUR REF" id="ourReference"></td>
                <td>YOUR REF</td>
                <td><input  type="text"  onblur="myVal(this.id)"  class="memo_form"  placeholder="YOUR REF" id="yourReference"></td>
              </tr>
              <tr>
                <td>DATE</td>
                <td><input  type="text"  onblur="myVal(this.id)"  placeholder="dd-MM-yyyyy"   id="initiatedDate" class="memo_form popupDatepicker"></td>
                <td>DATE</td>
                <td><input  type="text"  onblur="myVal(this.id)"  placeholder="dd-MM-yyyy"  id="stepDate" class="memo_form popupDatepicker"></td>
              </tr>
              <tr>
                <td colspan="4" class="textarea_div">
                   <textarea onblur="myTextareaVal(this.id)"  id="memoArea" class="memo_textarea"  id="memoTextArea" ></textarea>
                </td>
              </tr>
               <tr>
              <td colspan="4">Remark:<br>
              <textarea onblur="myTextareaVal(this.id)"  style="height: 69px;
    width: 100%;" id="remark" name="remark"></textarea>
              </td>
              </tr>
             
               <tr>
              
                <td colspan="4">
                <table>
                <tr>
                <td width="10%"> Initiated By</td>
                <td width="85%"><input  readonly="readonly"  type="text"  onblur="myVal(this.id)"   style="width: 65% !important; border: 0px;" value="<%=uid %>" id="employeeID" name="employeeID"  /></td>
                </tr>
                </table>
               
               
                </td>
              
              </tr>
              
              <tr>
               <td colspan="4">
               <table>
                <tr>
                <td width="10%"> Verified By</td>
                <td width="85%"><input readonly="readonly"   type="text"  onblur="myVal(this.id)"   style="width: 65% !important; border: 0px;" value="" id="verifiedBy" name="verifiedBy"  /></td>
                </tr>
                </table>
               
                </td>
              </tr>
              
              <tr>
               <td colspan="4">
                <table>
                <tr>
                <td width="10%"> Approved By</td>
                <td width="85%"><input readonly="readonly"   type="text"  onblur="myVal(this.id)"    style="width: 65% !important; border: 0px;" value="" id="approvedBy" name="approvedBy"  /></td>
                </tr>
                </table>
               
                </td>
              </tr>
              
               <tr>
               <td colspan="4">
                <table>
                <tr>
                <td width="100%">
               
               
               <input type="hidden" id="historyHiddenTasks" value="" />
               <div id="showHistoryHiddenTasks" >
            <input type="button" onclick="getHistoryForms()" class="getHistory" value="Get History" />
               		
               </div>
                  </td>
                </tr>
                </table>
                
				
                </td>
              </tr>
              
              <tr>
                     	
						<td colspan="8"><input type="hidden" id="attachmentID"
						name="attachmentID"> <input type="button"
						value="Get Attachment" onclick="getAtt()" class="getAttch" />
						<div id="attlch"></div></td>
							
				
					</tr>
              
              
              <tr>
              <!-- <td colspan="2"><input type="hidden" id="attachmentID" name="attachmentID" >
              <input type="button" value="Get Attachment" onclick="getAttachment($('#attachmentID').val())" ></td>
              --> <td colspan="4"><div class="table_right">
                <input type="button" id="subButton"
									class="Logged_User_tab_color add_user_js add_user_bg"
									value="VERIFY" onclick="valiFormCPV(this.id,'accept')">
								<!----------/// ADD USER END -------->
								<!----------/// User List ----------->
								<!--   <div class="Logged_User_tab  onclick">CANCEL</div> -->
								<input type="button" class="Logged_User_tab  onclick" id="iomrej"
									value="REJECT" onclick="valiFormCPV(this.id,'reject')">
								<!----------/// User List END -------->
              </div></td>
              </tr>
            </tbody>
            </table>
		</div>
	</div>
	<script type="text/javascript">
					
	</script>
</body>
</html>