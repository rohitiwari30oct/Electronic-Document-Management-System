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
<link rel="stylesheet" type="text/css" href="css/autocomplete.css" />
<script src="js/jquery.autocomplete.js"></script> 
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
	
	
	setTimeout(function(){ tr_load(); }, 1000);
});

function tr_load() {
	var hid_val=parseInt( $("#hid_tr_val").val()); 
//	alert(hid_val);
	for(var i=2;i<=hid_val;i++)
		{
		$('#tr_'+i).show();
	//	alert('#tr_'+i);
		}
	
}


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
		 


		 if(dec!='reject'&&($("#accountStep").val()==null || $("#accountStep").val().trim()=="index"))
			{
			pg=false;
			showMsgWF("Please Fill Account Dept. email!");
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
				$('#historyHiddenTasks').attr("value",$('#historyHiddenTasks').val()+"Authorized By " + $("#authorizationStep").val()+" on Dated "+today+",") ;
				$('#authorizedBy').attr("value",$("#authorizationStep").val()+" on Dated "+today) ;
				$('#formSStatus').attr("value","Authorized") ;
				
				}
				else{
					$('#historyHiddenTasks').attr("value",$('#historyHiddenTasks').val()+"Rejected By " + $("#authorizationStep").val()+" on Dated "+today+",") ;
					$('#formSStatus').attr("value","Rejected") ;
					}
				
		
				$("#action_gif").show();
			}
			catch (e) {
				// TODO: handle exception
			}
			$("#"+id).attr("disabled",true);
			if(dec=='reject')
				{
				$("#accountStep option[value='index']").attr("selected","selected");
				
				}
			
			
			proceedTheForm(dec)
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


function sethClaim(val)
{
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
	
$('#verificationStep').on('change', function() {
	  $('option:selected', this).attr('selected',true).siblings().removeAttr('selected');
	});
$('#approvalStep').on('change', function() {
	  $('option:selected', this).attr('selected',true).siblings().removeAttr('selected');
	});
$('#authorizationStep').on('change', function() {
	  $('option:selected', this).attr('selected',true).siblings().removeAttr('selected');
	});
$('#accountStep').on('change', function() {
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
	<div class="form_scolling_project" id="myformPurPlant">
		<div class="from_main_leave">
			<table id="handleWorkflowForm">
			
			
              
			<tr>
              <td width="10%"><img src="images/logo.png"></td>
                <td width="80%" colspan="6" class="table_heading">REIMBURSEMENT OF MEDICAL EXPENSES</td>
               <td width="10%">Date:<input type="text" disabled="disabled" onblur="myVal(this.id)" value="<%=dt %>" id="curr_Date"  name="curr_Date" class="emple_date" placeholder="dd-MM-yyyy"></td>
              <input type="hidden" value="<%=dt %>" name="filledDaete" id="filledDaete" />
             
                <input type="hidden"  name="formSStatus"  id="formSStatus" />
                 <input type="hidden" value="Reimbursement of Medical Expenses" name="formNameWF" id="formNameWF" /> 
              </tr>
              
              <tr>
                <td  colspan="4">
                <!-- <table width="100%"><tr><td width="20%">Name</td>
                <td width="80%"></td></tr></table> -->
                <table width="100%"><tr><td width="20%">Name</td>
                <td width="80%"> 	<input type="text" disabled="disabled"  onblur="myVal(this.id)" value="" id="empName"  class="emple_np" placeholder="Name of the Employee"></td></tr></table>
               </td>
                <td  colspan="4">
                <table width="100%"><tr><td width="40%">Employee No.</td>
                <td width="60%">	<input type="text" disabled="disabled"  onblur="myVal(this.id)" placeholder="Employee No." id="empNo"></td></tr></table>
               </td>
              </tr>
             <tr>
                <td   colspan="3">
                <table width="100%"><tr><td width="40%">Designation</td>
                <td width="60%"> 
                <select style="height: 28px;"  disabled="disabled" name="empDesig"  id="empDesig">
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
                </select> </td></tr></table>
              </td>
                <td  colspan="3">
                 <table width="100%"><tr><td width="20%"> Dept</td>
                <td width="80%">
              
						<select id="deptName" disabled="disabled" name="deptName" style="height: 28px;">
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
							<option value="Projects">Projects</option>
							<option value="Maintenance">Maintenance</option>
						</select>
                </td></tr></table></td>
                <td  colspan="2">
                 <table width="100%"><tr><td width="30%">Location</td>
                <td width="70%">
                <select id="locationName" disabled="disabled" name="locationName" style="height: 28px;">
							<option value="plant">Plant</option>
							<option value="ho">Head Office</option>
						</select>
                </td></tr></table></td>
              </tr>
             
              <tr>
                <td width="100%" colspan="8">
                <table width="100%"><tr><td colspan="2" width="30%">Hospitalization Claim</td>
                <td colspan="3" width="70%"> 
                <table width="100%"><tr><td  width="10%">  <label><input type="radio" disabled="disabled" onclick="setHClaim(this.value)" name="hClaim" id="hClaimNo" value="No"/>
							No</label></td>
                <td width="90%"><label><input type="radio" onclick="setHClaim(this.value)" disabled="disabled" name="hClaim" id="hClaimYes" value="Yes"/>
							Yes </label> </td></tr></table>	
                </td></tr>
                <tr>
                <td width="10%">if Yes,</td>
                <td width="20%">Name of the Hospital</td>
                <td width="30%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" class="emple_np" id="HosName"  /></td>
                <td width="20%">DOA: <input type="text" disabled="disabled"  onblur="myVal(this.id)" class="emple_date" id="hName" placeholder="dd-MM-yyyy"> </td>
               
                <td width="20%">DOD: <input type="text" disabled="disabled"  onblur="myVal(this.id)" class="emple_date" id="hDate" placeholder="dd-MM-yyyy"></td>
                </table>
               </td>
               </tr>
               
               <tr>
                <td width="100%" colspan="8">
                
							
                <table width="100%" >
                  <tr><td width="20%" style="text-align:center;">Name of the Patient </td>
                <td width="10%" style="text-align:center;"> Relationship with the Employee</td>
                <td width="10%" style="text-align:center;"> Receipt No.</td>
                <td width="10%" style="text-align:center;"> Date</td>
                <td width="10%" style="text-align:center;"> Consultation/  Investigations</td>
                <td width="20%" style="text-align:center;"> Medicines</td>
                <td width="10%" style="text-align:center;"> Hospital charges</td>
                <td width="10%" style="text-align:center;"> Others</td>
                </tr>
                <tr><td width="20%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="pName1" class="emple_table" /> </td>
                <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="relation1" class="emple_table" /> </td>
                <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="recNo1" class="emple_table" /> </td>
                <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="dt1" value="<%=dt %>" class="emple_date popupDatepicker" placeholder="dd-MM-yyyy" /> </td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="consultation1" class="emple_table"/> </td>
                <td width="20%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="medicines1" class="emple_table" /></td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="hCharges1" class="emple_table" /> </td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="others1" class="emple_table" /> </td>
                </tr>
                <input type="hidden" name="hid_tr_val" id="hid_tr_val" value="1">
                
               <tr id="tr_2" style="display: none;">
				<td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="pName2" class="emple_table" /> </td>
                <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="relation2" class="emple_table" /> </td>
                <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="recNo2" class="emple_table" /> </td>
                <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="dt2" value="<%=dt %>" class="emple_date popupDatepicker" placeholder="dd-MM-yyyy" /> </td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="consultation2" class="emple_table"/> </td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="medicines2" class="emple_table" /></td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="hCharges2" class="emple_table" /> </td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="others2" class="emple_table" /> </td>
                </tr>
				
				 <tr id="tr_3" style="display: none;">
              <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="pName3" class="emple_table" /> </td>
                <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="relation3" class="emple_table" /> </td>
                <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="recNo3" class="emple_table" /> </td>
                <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="dt3" value="<%=dt %>" class="emple_date popupDatepicker" placeholder="dd-MM-yyyy" /> </td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="consultation3" class="emple_table"/> </td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="medicines3" class="emple_table" /></td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="hCharges3" class="emple_table" /> </td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="others3" class="emple_table" /> </td>
                </tr>
				
				
				 <tr id="tr_4" style="display: none;">
              <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="pName4" class="emple_table" /> </td>
                <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="relation4" class="emple_table" /> </td>
                <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="recNo4" class="emple_table" /> </td>
                <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="dt4" value="<%=dt %>" class="emple_date popupDatepicker" placeholder="dd-MM-yyyy" /> </td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="consultation4" class="emple_table"/> </td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="medicines4" class="emple_table" /></td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="hCharges4" class="emple_table" /> </td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="others4" class="emple_table" /> </td>
                </tr>
				
				
				 <tr id="tr_5" style="display: none;">
              <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="pName5" class="emple_table" /> </td>
                <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="relation5" class="emple_table" /> </td>
                <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="recNo5" class="emple_table" /> </td>
                <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="dt5" value="<%=dt %>" class="emple_date popupDatepicker" placeholder="dd-MM-yyyy" /> </td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="consultation5" class="emple_table"/> </td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="medicines5" class="emple_table" /></td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="hCharges5" class="emple_table" /> </td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="others5" class="emple_table" /> </td>
                </tr>
				
				 <tr id="tr_6" style="display: none;">
              <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="pName6" class="emple_table" /> </td>
                <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="relation6" class="emple_table" /> </td>
                <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="recNo6" class="emple_table" /> </td>
                <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="dt6" value="<%=dt %>" class="emple_date popupDatepicker" placeholder="dd-MM-yyyy" /> </td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="consultation6" class="emple_table"/> </td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="medicines6" class="emple_table" /></td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="hCharges6" class="emple_table" /> </td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="others6" class="emple_table" /> </td>
                </tr>
				
				
				 <tr id="tr_7" style="display: none;">
              <td width="10%"><input type="text" disabled="disabled" disabled="disabled"  onblur="myVal(this.id)" id="pName7" class="emple_table" /> </td>
                <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="relation7" class="emple_table" /> </td>
                <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="recNo7" class="emple_table" /> </td>
                <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="dt7" value="<%=dt %>" class="emple_date popupDatepicker" placeholder="dd-MM-yyyy" /> </td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="consultation7" class="emple_table"/> </td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="medicines7" class="emple_table" /></td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="hCharges7" class="emple_table" /> </td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="others7" class="emple_table" /> </td>
                </tr>
				
				
				 <tr id="tr_8" style="display: none;">
              <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="pName8" class="emple_table" /> </td>
                <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="relation8" class="emple_table" /> </td>
                <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="recNo8" class="emple_table" /> </td>
                <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="dt8" value="<%=dt %>" class="emple_date popupDatepicker" placeholder="dd-MM-yyyy" /> </td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="consultation8" class="emple_table"/> </td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="medicines8" class="emple_table" /></td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="hCharges8" class="emple_table" /> </td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="others8" class="emple_table" /> </td>
                </tr>
				
				
				 <tr id="tr_9" style="display: none;">
              <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="pName9" class="emple_table" /> </td>
                <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="relation9" class="emple_table" /> </td>
                <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="recNo9" class="emple_table" /> </td>
                <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="dt9" value="<%=dt %>" class="emple_date popupDatepicker" placeholder="dd-MM-yyyy" /> </td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="consultation9" class="emple_table"/> </td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="medicines9" class="emple_table" /></td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="hCharges9" class="emple_table" /> </td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="others9" class="emple_table" /> </td>
                </tr>
				
				
				 <tr id="tr_10" style="display: none;">
              <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="pName10" class="emple_table" /> </td>
                <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="relation10" class="emple_table" /> </td>
                <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="recNo10" class="emple_table" /> </td>
                <td width="10%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="dt10" value="<%=dt %>" class="emple_date popupDatepicker" placeholder="dd-MM-yyyy" /> </td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="consultation10" class="emple_table"/> </td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="medicines10" class="emple_table" /></td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="hCharges10" class="emple_table" /> </td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="others10" class="emple_table" /> </td>
                </tr>
              
                
                
                <tr><td width="40%" colspan="3"> </td>
                <td width="10%">Total </td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="total1" class="emple_table"/> </td>
                <td width="20%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="total2" class="emple_table" /></td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="total3" class="emple_table" /> </td>
                <td width="10%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="total4" class="emple_table" /> </td>
                </tr>
                <tr><td width="40%" colspan="3"> </td>
                <td width="10%">Grand Total </td>
                <td width="50%" colspan="4"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" class="emple_table" id="gtotal" style="width: 100%"/> </td>
                </tr>
                </table>
                </td>
                </tr>
               
             <!--   <tr>
					<td colspan="8">
						<div class="addanddelete">
							<div onclick="addTrTable()" class="add_table"></div>
							<div onclick="remTrTable()" class="delete_table"></div>
						</div>
					</td>
				</tr> -->
                 <tr>
					<td colspan="8">
               Certified that the expenditure incurred as above is for me and my dependents only and is as per AVI-OIL’s Medical Policy.
			
				(Employee to sign on each Bill / Receipt)
               
               </td></tr>
             
              <tr style="display: none;">
                <td  width="30%" colspan="2">
                HR/Finance(Verifier) <br><!-- <input type="text"  onblur="myVal(this.id)" class="emple_np" id="verificationStep"  placeholder="Email"/> -->
                 <select id="verificationStep" name="verificationStep" onchange="verselectChange(this.value)">
               <option value="index">Please Select </option>
               <%
               for(String lst: ulst)
               {
               %>
               <option value="<%=lst %>"><%=lst %> </option>
               <%} %>
               </select>
                
                </td>
                <td  width="35%" colspan="3">
               HOD/CEO (Approver) <br><!-- <input type="text"  onblur="myVal(this.id)" class="emple_np" id="approvalStep" placeholder="Email"/> -->
                <select style="height: 28px;"  id="approvalStep" name="approvalStep" onchange="appselectChange(this.value)">
               <option value="index">Please Select </option>
               <%
               for(String lst: ulst)
               {
               %>
               <option value="<%=lst %>"><%=lst %> </option>
               <%} %>
               </select>
                </td>
                <td  width="35%" colspan="3">
               CFO/ AGM (F) or (HR)(Payment Authorizer) <br><!-- <input type="text"  onblur="myVal(this.id)" class="emple_np"  id="authorizationStep" placeholder="Email"/> -->
                <select id="authorizationStep" name="authorizationStep"  onchange="authselectChange(this.value)" >
               <option value="index">Please Select </option>
               <%
               for(String lst: ulst)
               {
               %>
               <option value="<%=lst %>"><%=lst %> </option>
               <%} %>
               </select>
                </td>
                <td  width="35%" colspan="3">
              
                </td>
                </tr>
             
            <tr>
              <td colspan="8">
               Account Dept. <br><!-- <input type="text"  onblur="myVal(this.id)" class="emple_np"  id="authorizationStep" placeholder="Email"/> -->
                <select id="accountStep" name="accountStep"  onchange="accselectChange(this.value)" >
               <option value="index">Please Select </option>
               <%
               for(String lst: ulst)
               {
               %>
               <option value="<%=lst %>"><%=lst %> </option>
               <%} %>
               </select>
              </td></tr> 
              <tr>
              <td colspan="8">
              A.	Domiciliary Entitlement Block Year  <span id="financialYear">2015-16</span><br>
              <table width="100%" style="margin-top: 10px;">
              <tr>
              	
              <td width="35%">Eligibility </td>
               <td width="30%"> Availed	Balance</td>
                <td width="35%">  Available</td>
                </tr>
                <tr>
                 <td width="35%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" class="emple_np"  id="Eligibility" placeholder=""/></td>
                  <td width="30%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" class="emple_np" id="AvailedBalance"  placeholder=""/></td>
                   <td width="35%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" class="emple_np" id="Available" placeholder=""/> </td>
                   </tr>
              
              </table>
              </td>
              </tr>
              
              <tr>
              <td colspan="8">
              B.	Claim Verification<br>
              <table width="100%">
              <tr>
              	 <td width="25%"> </td>
              <td width="25%">Domiciliary		 </td>
               <td width="25%"> Hospitalization	</td>
                <td width="25%">  Pre & Post Hospitalization</td>
                </tr>
                <tr>
                <td width="25%">Amount Claimed</td>
                 <td width="25%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="AmountClaimed1" class="emple_np"  placeholder=""/></td>
                  <td width="25%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="AmountClaimed2" class="emple_np"  placeholder=""/></td>
                   <td width="25%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="AmountClaimed3" class="emple_np"  placeholder=""/> </td>
                   </tr>
                 <tr>
                <td width="25%">Claim admitted for</td>
                 <td width="25%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="Claimadmitted1" class="emple_np"  placeholder=""/></td>
                  <td width="25%"> <input type="text" disabled="disabled"  onblur="myVal(this.id)" id="Claimadmitted2" class="emple_np"  placeholder=""/></td>
                   <td width="25%"><input type="text" disabled="disabled"  onblur="myVal(this.id)" id="Claimadmitted3" class="emple_np"  placeholder=""/> </td>
                   </tr>
              
              </table>
              </td>
              </tr>
              
                <tr>
             <td colspan="8">
                <table>
                <tr>
                <td width="10%"> Initiated By</td>
                <td width="85%"><input type="text"  onblur="myVal(this.id)"   style="width: 65% !important; border: 0px;" readonly="readonly" value="<%=uid %>" id="employeeID" name="employeeID"  /></td>
                </tr>
                </table>
               
               
                </td>
              
              </tr>
              
              <tr>
               <td colspan="8">
               <table>
                <tr>
                <td width="10%"> Verified By(HR/Finance)</td>
                <td width="85%"><input type="text"  onblur="myVal(this.id)"   style="width: 65% !important; border: 0px;" readonly="readonly" value="" id="verifiedBy" name="verifiedBy"  /></td>
                </tr>
                </table>
               
                </td>
              </tr>
              
              <tr>
               <td colspan="8">
                <table>
                <tr>
                <td width="10%"> Approved By(HOD/CEO)</td>
                <td width="85%"><input type="text"  onblur="myVal(this.id)"  style="width: 65% !important; border: 0px;" readonly="readonly" value="" id="approvedBy" name="approvedBy"  /></td>
                </tr>
                </table>
               
                </td>
              </tr>
              
				<tr>
					<td colspan="8">
						<table>
							<tr>
								<td width="10%">Authorized By CFO/ AGM (F) or (HR):</td>
								<td width="85%"><input type="text" onblur="myVal(this.id)"
									style="width: 65% !important; border: 0px;" readonly="readonly"
									value="" id="authorizedBy" name="authorizedBy" /></td>
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
									value="Authorise" onclick="valiForm(this.id,'accept')">
								<!----------/// ADD USER END -------->
								<!----------/// User List ----------->
								<!--   <div class="Logged_User_tab  onclick">CANCEL</div> -->
								  <input type="button" id="CPVrej" class="Logged_User_tab  onclick"
									value="REJECT" onclick="valiForm(this.id,'reject')"> 
								<!----------/// User List END -------->
<input type="button"
								class="Logged_User_tab_color add_user_js add_user_bg"
								value="Print"
								onclick="printDiv()" />

						</div></td>
				</tr>
         
            </table>
            </div>
                                   </div>
	
</body>
</html>