<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="edms.wsdl.GetUsersListResponse"%>
<%@page import="edms.webservice.client.UserClient"%>
<%@page import="javax.naming.directory.Attribute"%>
<%@page import="javax.naming.directory.Attributes"%>
<%@page import="javax.naming.directory.DirContext"%>
<%@page import="edms.core.LDAPConnection"%>
<%@page import="edms.core.Config"%>
<%@page import="edms.core.*"%>
<%@page import="java.text.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" href="css/jquery.datepick.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.plugin.js"></script>
<script type="text/javascript" src="js/jquery.datepick.js"></script>
<link rel="stylesheet" type="text/css" href="css/autocomplete.css" />
<script src="js/jquery.autocomplete.js"></script> 
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
	/* $("#verificationStep").autocomplete("${pageContext.request.contextPath}/autocomp");
	$("#approvalStep").autocomplete("${pageContext.request.contextPath}/autocomp");
	$("#authorizationStep").autocomplete("${pageContext.request.contextPath}/autocomp"); */
	}
	
	catch (e) {
		// TODO: handle exception
	}
	
	try
	{
		  $('.only_num').keypress(function(event){
	        
	        if(event.which != 8 && isNaN(String.fromCharCode(event.which))){
	            event.preventDefault();
	        }});
	}
	catch (e) {
		// TODO: handle exception
	}
});




</script>
<script type="text/javascript">
function valiForm(id,dec){
	/* var mailChk=$('#formTo').val();
	 var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	    
	if(re.test(mailChk))
	submitForm('purchaseRequisitionRequest::Purchase Requisition Request');
	else
		alert("Please enter mail id"); */
		
		var pg=true;
		
		if(dec=='accept')
		{
		
		 if($("#creditsl").val()==null || $("#creditsl").val().trim()=="" || $("#creditel").val()==null || $("#creditel").val().trim()=="")
			{
			pg=false;
			showMsgWF("Please Fill Leave credit available field!");
			}
			else  if($("#availedel").val()==null || $("#availedel").val().trim()=="" || $("#availedsl").val()==null || $("#availedsl").val().trim()=="")
			{
				pg=false;
				showMsgWF("Please Fill No. of times availed during the year field!");
				}
	
		 if($("#empName").val()==null || $("#empName").val().trim()=="")
			{
			pg=false;
			showMsgWF("Please Fill your Name");
			}
		 else if($('input[name="natureOfLeave"]:checked').length<=0)
			{
				pg=false;
				showMsgWF("Please chose Nature of Leave!");
				} 
			else  if($("#fromDate").val()==null || $("#fromDate").val().trim()=="")
			{
				pg=false;
				showMsgWF("Please Fill Date applied- From field");
				}
			else  if($("#toDate").val()==null || $("#toDate").val().trim()=="")
				{
					pg=false;
					showMsgWF("Please Fill Date applied- To field");
					}
			else  if($("#noOfDays").val()==null || $("#noOfDays").val().trim()=="")
			{
				pg=false;
				showMsgWF("Please Fill No of Days field");
				}
			else if($("#deptName").val()==null || $("#deptName").val().trim()=="index")
			{
			pg=false;
			showMsgWF("Please Select Department Name!");
			}
			/* else if($("#verificationStep").val()==null || $("#verificationStep").val().trim()=="")
				{
				pg=false;
				showMsgWF("Please Fill email of Recommending Authority!");
				} */
			/* else if($("#approvalStep").val()==null || $("#approvalStep").val().trim()=="")
			{
			pg=false;
			showMsgWF("Please Fill email of Personnel Officer!");
			} */
			 else if($("#approvalStep").val()==null || $("#approvalStep").val().trim()=="index")
			{
			pg=false;
			showMsgWF("Please Fill email of Sanctioning Authority!");
			} 

				else if($("#empDesig").val()==null || $("#empDesig").val().trim()=="index")
				{
				pg=false;
				showMsgWF("Please Select Employee Designation!");
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
				$('#historyHiddenTasks').attr("value",$('#historyHiddenTasks').val()+"Verified By " + $("#verificationStep").val()+" on Dated "+today+",") ;
				$('#verifiedBy').attr("value",$("#verificationStep").val()+" on Dated "+today) ;
				$('#formSStatus').attr("value","Verified") ;
				}
				else{
					$('#historyHiddenTasks').attr("value",$('#historyHiddenTasks').val()+"Rejected By " + $("#verificationStep").val()+" on Dated "+today+",") ;
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
}

function myVal(id) {
	var nm=$("#"+id).val();
	$('#'+id).attr('value', nm);
}

function myTextareaVal(id) {
	var nm=$("textarea#"+id).val();
	$("#"+id).text(nm);
}


function setHClaim(val)
{
//	alert("hii");
$(':radio[name="hClaim"][id='+val+']').attr('checked', 'checked');
}
$('#empDesig').on('change', function() {
	  $('option:selected', this).attr('selected',true).siblings().removeAttr('selected');
	});
$('#deptName').on('change', function() {
	  $('option:selected', this).attr('selected',true).siblings().removeAttr('selected');
	});
	
$('#locationName').on('change', function() {
	  $('option:selected', this).attr('selected',true).siblings().removeAttr('selected');
	});

$('#approvalStep').on('change', function() {
	  $('option:selected', this).attr('selected',true).siblings().removeAttr('selected');
	});
$('#verificationStep').on('change', function() {
	  $('option:selected', this).attr('selected',true).siblings().removeAttr('selected');
	});
$('#authorizationStep').on('change', function() {
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

%>
 <div class="form_scolling_project" id="myformLeave">
                                            <div class="from_main_leave" >
            <table id="handleWorkflowForm">
             <input type="hidden" value="<%=dt %>" name="filledDaete" id="filledDaete" />  
                <input type="hidden"  name="formSStatus"  id="formSStatus" />
             <input type="hidden" value="Leave Application Form" name="formNameWF" id="formNameWF" /> 
			<tr>
              <td width="10%"><img src="images/logo.png"></td>
                <td width="80%" colspan="6" class="table_heading">Leave Application Form</td>
               <td width="10%">Date:<input type="text"   onblur="myVal(this.id)" class="small_medical popupDatepicker" value="<%=dt %>" id="curr_Date"  placeholder="dd-MM-yyyy"></td>
              </tr>
              <tr>
									<td colspan="8">The application must be submitted at least
										7 days before the date on which Earned Leave is to commence
										except in the case of unforeseen circumstances. Sick Leave
										application must be submitted within 2 working days from
										rejoining.</td>
								</tr>
              <tr>
                <td width="50%" colspan="4">
                <!-- <table width="100%"><tr><td width="20%">Name</td>
                <td width="80%"></td></tr></table> -->
                <table width="100%"><tr><td width="20%">Name</td>
                <td width="80%"> 	<input type="text"  onblur="myVal(this.id)" value="" id="empName" class="emple_np" placeholder="Name of the Employee"></td></tr></table>
               </td>
                <td width="50%" colspan="4">
                <table width="100%"><tr><td width="40%">Employee No.</td>
                <td width="60%">	<input type="text"  onblur="myVal(this.id)" placeholder="Employee No." id="empNo"/></td></tr></table>
               </td>
              </tr>
             <tr>
                <td  width="35%" colspan="3">
                <table width="100%"><tr><td width="40%">Designation</td>
                <td width="60%">  <select style="height: 28px;" name="empDesig"  id="empDesig">
               <option value="index">Please Select</option>
                
                <option value="Chief Executive Officer">Chief Executive Officer</option>
                <option value="CFO & CS">CFO & CS</option>
                <option value="General Manager">General Manager</option>
                
             <!--    <option value="General Manager (Sales)">General Manager (Sales)</option>
                <option value="General Manager (Research & Quality Assurance)/GM‐Technical Services">General Manager (Research & Quality Assurance)/GM‐Technical Services</option>
               -->  <option value="Marketing Manager">Marketing Manager </option>
                
                <option value="Asst. General Manager">Asst. General Manager</option>
                <option value="Dy. General Manager">Dy. General Manager</option>
               <!--  <option value="AGM Sales (Industrial)">AGM Sales (Industrial) </option>
                
                <option value="Asstt General Manager (Finance)">Asstt General Manager (Finance) </option>
                --> <option value="Manager Finance">Manager</option>
                <option value="Sr. Manager">Sr. Manager</option>
                
                <!-- <option value="Sr. Manager‐Production">Sr. Manager‐Production </option>
                <option value="Sr. Manager (Materials)">Sr. Manager (Materials) </option>
                <option value="Sr. Manager (Maintenance)">Sr. Manager (Maintenance) </option>
                --> 
                <option value="Dy Manager">Dy Manager</option>
                <option value="Executive">Executive</option>
               <!--  <option value="Dy Manager(R&Q A)">Dy Manager(R&Q A)</option>
                --> 
                <option value="Asst. Manager">Asst. Manager</option>
                <!-- <option value="Dy Manager (Purchase)">Dy Manager (Purchase) </option>
                <option value="Dy Manager (IT)">Dy Manager (IT) </option> -->
                
               <!--  <option value="Asst. Manager">Asst. Manager</option> -->
              <!--   <option value="HRD Coordinator">HRD Coordinator</option>-->
                <option value="Jr. Executive">Jr. Executive</option> 
               
                <!-- <option value="Finance Support Coordinator">Finance Support Coordinator </option>
            -->    <option value="Sales Coordinator">Sales Coordinator</option> 
                <option value="Sr. Research Assistant">Sr. Research Assistant</option>
               
                <option value="Front Office Coordinator">Front Office Coordinator</option>
               <!--  <option value="Purchase Support‐Coordinator">Purchase Support‐Coordinator </option>
               -->  <option value="Support-Coordinator">Support-Coordinator</option>
               
                <option value="Assistant Gr I">Assistant Gr I</option>
               <!--  <option value="Sales Support-Coordinator">Sales Support-Coordinator </option>
                <option value="IT Support-Coordinator">IT Support-Coordinator </option>
                --> 
                
                <option value="Assistant Gr II">Assistant Gr II</option>
                <option value="Jr. Assistant">Jr. Assistant</option>
                <!-- <option value="IT & Marketing Support">IT & Marketing Support </option>
               -->
                <option value="Helper">Helper </option>
                <option value="Workmen">Workmen </option>
                </select></td></tr></table>
              </td>
                <td width="35%" colspan="3">
                 <table width="100%"><tr><td width="20%"> Dept</td>
                <td width="80%">
              
						<select id="deptName"   name="deptName" style="height: 28px;">
							
							
						<option value="index">Please Select</option>
						<option value="purchase/commercial">Purchase/Commercial</option>
							<option value="material/store">Material/Store</option>
							<option value="admin/hr">Admin/HR</option> 
							<option value="finance/accounts">Finance/Accounts</option>
							<option value="it">IT</option>
							<option value="sales">Sales</option>
							<option value="production">Production</option>
							<option value="quality">Quality</option>
							<option value="logistic">Logistic</option>
							<option value="Technical Services">Technical Services</option>
							<option value="Plant Operations">Plant Operations</option>
							<option value="Projects">Projects</option><option value="Maintenance">Maintenance</option>
						</select>
                </td></tr></table></td>
                <td width="30%" colspan="2">
                 <table width="100%"><tr><td width="30%">Location</td>
                <td width="70%">
                		<select id="locationName"   name="locationName" style="height: 28px;">
							<option value="plant">Plant</option>
							<option value="ho">Head Office</option>
						</select>
                </td></tr></table></td>
              </tr>
             
              <tr>
                <td width="100%" colspan="8">
                <table width="100%"><tr><td width="20%">Nature of leave applied for:</td>
                    <td width="80%"> 	
                <label><input type="radio" onclick="setNatureOfLeave(this.value)" name="natureOfLeave" id="EL" value="EL"/>
							EL</label>
				<label><input type="radio" onclick="setNatureOfLeave(this.value)" name="natureOfLeave" id="SL" value="SL"/>
							SL</label>
                <label><input type="radio" onclick="setNatureOfLeave(this.value)" name="natureOfLeave" id="ML" value="ML"/>
							ML</label>
				<label><input type="radio" onclick="setNatureOfLeave(this.value)" name="natureOfLeave" id="PL" value="PL"/>
							PL</label>
                <label><input type="radio" onclick="setNatureOfLeave(this.value)" name="natureOfLeave" id="StL" value="StL"/>
							StL</label>
				<label><input type="radio" onclick="setNatureOfLeave(this.value)" name="natureOfLeave" id="SpL" value="SpL"/>
							SpL</label>
                <label><input type="radio" onclick="setNatureOfLeave(this.value)" name="natureOfLeave" id="LWP" value="LWP"/>
							LWP</label>
				<label><input type="radio" onclick="setNatureOfLeave(this.value)" name="natureOfLeave" id="CgL" value="CgL"/>
							CgL</label>
                </td></tr></table>
               </td>
               </tr>
               
                <tr>
                <td width="100%" colspan="8">
                <table width="100%"><tr><td width="10%">Date applied:</td>
                <td width="30%"> 	
                From <input type="text"  onblur="myVal(this.id)" id="fromDate" class="small_medical popupDatepicker" placeholder="dd-MM-yyyy">
                </td>
                <td width="30%"> 	
                To <input type="text"  onblur="myVal(this.id)" id="toDate" class="small_medical popupDatepicker" placeholder="dd-MM-yyyy">
                </td>
                <td width="30%"> 	
                No. of Days <input type="text"  onblur="myVal(this.id)" id="noOfDays" class="emple_1" />
                </td>
                </tr></table>
               </td>
               </tr>
             
             <tr>
                <td width="100%" colspan="8">
                <table width="100%"><tr><td width="20%">Brief reasons for leave</td>
                <td width="80%"> 	   <textarea style="width: 100%" id="leaveReason"   name="leaveReason" cols="50" rows="3" placeholder="Your Reasons" onblur="myTextareaVal(this.id)"></textarea></td></tr></table>
               </td>
               </tr>
               
                <tr>
                <td width="100%" colspan="8">
                <table width="100%"><tr><td  width="20%">Address while on leave</td>
                <td width="80%"> 	   <textarea style="width: 100%" id="leaveAddr"   name="leaveAddr" cols="50" rows="3" placeholder="Your Address" onblur="myTextareaVal(this.id)"></textarea></td></tr>
                <tr>
                <td width="20%"></td>
                <td width="80%"> 
                <table width="100%">
                <tr>
                <td width="50%">Telephone(s)(if any) <input type="text"  onblur="myVal(this.id)" id="telephone" /> </td>
                <td width="50%">Pin  <input type="text"  onblur="myVal(this.id)" id="pin" /></td>
                </tr>
                </table>
                	</td>
                <tr>
                </table>
               </td>
               </tr>
             
            <tr>
               <!--  <td  width="30%" colspan="2">
                Recommending Authority <br><input type="text" onblur="myVal(this.id)" class="emple_np" id="verificationStep" placeholder="Email"/>
                </td> -->
                <td style="display: none;" width="35%" colspan="3">
                Personnel Officer 
                <!-- <input type="text" onblur="myVal(this.id)" class="emple_np" id="approvalStep" placeholder="Email"/> -->
               <select id="verificationStep" name="verificationStep" onchange="verselectChange(this.value)">
               <option value="index">Please Select </option>
               <option value="chandra@avi-oil.com">chandra@avi-oil.com </option>
               <option value="jyoti@avi-oil.com">jyoti@avi-oil.com </option>
               <option value="pankaj@avi-oil.com">pankaj@avi-oil.com </option>
               <option value="rohit@avi-oil.com">rohit@avi-oil.com </option>
               <option value="demo1@avi-oil.com">demo1@avi-oil.com </option>
               </select>
                </td>
                <td  width="35%" colspan="8">
                Recommending Officer
                <select  id="approvalStep" name="approvalStep" onchange="appselectChange(this.value)" >
               <option value="index">Please Select </option>
               <%
               for(String lst: ulst)
               {
               %>
               <option value="<%=lst %>"><%=lst %> </option>
               <%} %>
               </select>
                <!-- <input type="text" onblur="myVal(this.id)" class="emple_np" id="authorizationStep" placeholder="Email"/> -->
                </td>
                <td   style="display: none;"   width="35%" colspan="8">
                Sanctioning Authority 
                <select id="authorizationStep" name="authorizationStep" onchange="authselectChange(this.value)" >
               <option value="index">Please Select </option>
               <%
               for(String lst: ulst)
               {
               %>
               <option value="<%=lst %>"><%=lst %> </option>
               <%} %>
               </select>
                <!-- <input type="text" onblur="myVal(this.id)" class="emple_np" id="authorizationStep" placeholder="Email"/> -->
                </td>
                </tr>
             
              <tr>
                <td  width="50%" colspan="5">
                <table width="100%">
                <tr>
								<td  width="60%">(For Personnel Officer)</td>
								<td  width="20%" style="text-align: center">E.L.</td>
								<td width="20%" style="text-align: center">S.L.</td>
                </tr>
                 <tr><td width="60%">Leave credit available</td>
                 <td width="20%"><input type="text"  onblur="myVal(this.id)" id="creditel"   placeholder="E.L." class="emple_no only_num"/></td><td width="20%"><input type="text"  onblur="myVal(this.id)"  class="emple_no only_num" id="creditsl" placeholder="S.L." /></td></tr>
                  <tr><td width="60%">No. of times availed during the year</td>
                  <td width="20%"><input type="text" onblur="myVal(this.id)" id="availedel"  placeholder="E.L." class="emple_no only_num"/></td><td width="20%"><input type="text"  onblur="myVal(this.id)"  class="emple_no only_num" id="availedsl" placeholder="S.L." /></td></tr>
                <tr>
                </table>
                </td>
                
                <td  width="50%" colspan="5">
                <table width="100%">
                <tr>
                <td width="100%">(For Sanctioning Authority)</td>
                </tr>
               <tr><td width="100%"> 
               <label> <input type="radio"  disabled="disabled" onclick="setLeaveGranted(this.id)" id="leaveWith" name="leaveGranted" value="Leave granted with pay" />
						Leave granted with pay</label> 
               </td></tr>
               <tr><td width="100%"> 
               <label> <input type="radio"  disabled="disabled" onclick="setLeaveGranted(this.id)" id="leaveWithout" name="leaveGranted" value="Leave granted without pay" />
						Leave granted without pay</label> 
               </td></tr>
               <tr><td width="100%"> 
               <label> <input type="radio" disabled="disabled"  onclick="setLeaveGranted(this.id)" id="leaveNot" name="leaveGranted" value="Leave not granted" />
						Leave not granted</label> 
               </td></tr>
                 
                <tr>
                </table>
                </td>
                </tr>
                <tr>
             <td colspan="8">
                <table>
                <tr>
                <td width="10%"> Initiated By</td>
                <td width="85%"><input type="text"  onblur="myVal(this.id)"  style="width: 65% !important; border: 0px;" readonly="readonly" value="" id="employeeID" name="employeeID"  /></td>
                </tr>
                </table>
               
               
                </td>
              
              </tr>
              
              <tr>
               <td colspan="8">
               <table>
                <tr>
                <td width="10%"> Verified By</td>
                <td width="85%"><input type="text"  onblur="myVal(this.id)"   style="width: 65% !important; border: 0px;" readonly="readonly" value="" id="verifiedBy" name="verifiedBy"  /></td>
                </tr>
                </table>
               
                </td>
              </tr> 
              
              <tr>
               <td colspan="8">
                <table>
                <tr>
                <td width="10%"> Recommended By</td>
                <td width="85%"><input type="text" onblur="myVal(this.id)" style="width: 65% !important; border: 0px;" readonly="readonly" value="" id="approvedBy" name="approvedBy"  /></td>
                </tr>
                </table>
               
                </td>
              </tr>
              
              <tr>
               <td colspan="8">
                <table>
                <tr>
                <td width="10%"> Approved By</td>
                <td width="85%"><input type="text" onblur="myVal(this.id)" style="width: 65% !important; border: 0px;" readonly="readonly" value="" id="authorizedBy" name="authorizedBy"  /></td>
                </tr>
                </table>
               
                </td>
              </tr>
              
              
 <tr>
               <td colspan="8">
                <table>
                <tr>
                <td width="100%">
               
               
               <input type="hidden" id="historyHiddenTasks" value=""/>
               <div id="showHistoryHiddenTasks" >
            <input type="button" onclick="getHistoryForms()" class="getHistory"  value="Get History" />
               		
               </div>
                  </td>
                </tr>
                </table>
            
                </td>
              </tr>
                     
                       <tr >
                                <td class="rupee_td" colspan="8">
                                <table ><tr><td width="10%">
                                          Remark</td><td width="90%">
                                          <textarea style="width: 100%" id="voucherRemark"  mane="voucherRemark" cols="50" rows="3" placeholder="Your Reasons" onblur="myTextareaVal(this.id)"></textarea>
                                </td></tr></table>
                                
                                 </td>
              </tr>


				<tr>
					<td colspan="8"><input type="hidden" id="attachmentID"
						name="attachmentID"> <input type="button"
						value="Get Attachment" onclick="getAtt()" class="getAttch" />
						<div id="attlch"></div></td>
				</tr>

				<tr>
					<td colspan="8"><div class="table_right">
							<!----------/// ADD USER ----------->
							<!-- <div class="Logged_User_tab_color add_user_js add_user_bg">SAVE</div> -->
						<input type="button" id="CPVAppr"
									class="Logged_User_tab_color add_user_js add_user_bg"
									value="Verify" onclick="valiForm(this.id,'accept')">
								<!----------/// ADD USER END -------->
								<!----------/// User List ----------->
								<!--   <div class="Logged_User_tab  onclick">CANCEL</div> -->
								<input type="button" id="leaveRej" class="Logged_User_tab  onclick"
									value="REJECT" onclick="valiForm(this.id,'reject')">
							<!----------/// ADD USER END -------->
<input type="button"
								class="Logged_User_tab_color add_user_js add_user_bg"
								value="Print"
								onclick="printDivLeave()">

						</div></td>
				</tr>
         
            </table>
            </div>
                                   </div> 
                             
                             
</body>
</html>