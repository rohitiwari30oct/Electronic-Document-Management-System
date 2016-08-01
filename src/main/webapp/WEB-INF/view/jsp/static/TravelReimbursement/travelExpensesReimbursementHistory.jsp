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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
	$(document).ready(
			function() {
				$('.popupDatepicker').datepick();
				try {
					/* $("#verificationStep").autocomplete("${pageContext.request.contextPath}/autocomp");
					$("#approvalStep").autocomplete("${pageContext.request.contextPath}/autocomp");
					$("#authorizationStep").autocomplete("${pageContext.request.contextPath}/autocomp"); */
				} catch (e) {
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

<style type="text/css">
.giveWidth {
	width: 82px !important;
	height: 23px;
}

.giveWidthToDrop {
	width: 95px !important;
	height: 29px;
}

.giveBorderBottom {
	border: 1px solid #ccc;
}
</style>




<script type="text/javascript">
	function checkMail(id) {
		/* var mailChk=$('#formTo').val();
		 var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		    
		if(re.test(mailChk))
		submitForm('purchaseRequisitionRequest::Purchase Requisition Request');
		else
			alert("Please enter mail id"); */

		 var pg = true;
			/*if ($('input[name="priorityAboutTime"]:checked').length <= 0) {
			pg = false;
			showMsgWF("Please chose form priority");
		} else if ($("#formBy").val() == null
				|| $("#formBy").val().trim() == "") {
			pg = false;
			showMsgWF("Please Fill Indentor email field");
		} else if ($("#formTo").val() == null
				|| $("#formTo").val().trim() == "") {
			pg = false;
			showMsgWF("Please Fill Indent Authorised/Approved By email field");
		}

		else if ($('input[name="natureOfMaterial"]:checked').length <= 0) {
			pg = false;
			showMsgWF("Please chose Nature of Materials");
		} else if ($('input[name="typo"]:checked').length <= 0) {
			pg = false;
			showMsgWF("Please Check atleast one Category of Material");
		} */
		 if($("#verificationStep").val()==null || $("#verificationStep").val().trim()=="")
			{
			pg=false;
			showMsgWF("Please Fill From field");
			}
			else if($("#approvalStep").val()==null || $("#approvalStep").val().trim()=="")
				{
				pg=false;
				showMsgWF("Please Fill To field");
				}
			else if($("#authorizationStep").val()==null || $("#authorizationStep").val().trim()=="")
			{
			pg=false;
			showMsgWF("Please Fill Total field");
			} 
			
		
		
		if (pg == true) {
			try {
				$("#action_gif").show();
			} catch (e) {
				// TODO: handle exception
			}
			$("#" + id).attr("disabled", true);
			proceedTheForm('accept');
		}
	}

	function myVal(id) {
		var nm = $("#" + id).val();
		$('#' + id).attr('value', nm);
	}

	function myTextareaVal(id) {
		var nm = $("textarea#" + id).val();
		$("#" + id).text(nm);
	}

	$('#dy1').on('change', function() {
		  $('option:selected', this).attr('selected',true).siblings().removeAttr('selected');
		});
	$('#dy2').on('change', function() {
		  $('option:selected', this).attr('selected',true).siblings().removeAttr('selected');
		});
	$('#dy3').on('change', function() {
		  $('option:selected', this).attr('selected',true).siblings().removeAttr('selected');
		});
	$('#dy4').on('change', function() {
		  $('option:selected', this).attr('selected',true).siblings().removeAttr('selected');
		});
	$('#dy5').on('change', function() {
		  $('option:selected', this).attr('selected',true).siblings().removeAttr('selected');
		});
	$('#dy6').on('change', function() {
		  $('option:selected', this).attr('selected',true).siblings().removeAttr('selected');
		});
	$('#dy7').on('change', function() {
		  $('option:selected', this).attr('selected',true).siblings().removeAttr('selected');
		});

	$('#tm1').on('change', function() {
		  $('option:selected', this).attr('selected',true).siblings().removeAttr('selected');
		});
	$('#tm2').on('change', function() {
		  $('option:selected', this).attr('selected',true).siblings().removeAttr('selected');
		});
	$('#tm3').on('change', function() {
		  $('option:selected', this).attr('selected',true).siblings().removeAttr('selected');
		});
	$('#tm4').on('change', function() {
		  $('option:selected', this).attr('selected',true).siblings().removeAttr('selected');
		});
	$('#tm5').on('change', function() {
		  $('option:selected', this).attr('selected',true).siblings().removeAttr('selected');
		});
	$('#tm6').on('change', function() {
		  $('option:selected', this).attr('selected',true).siblings().removeAttr('selected');
		});
	$('#tm7').on('change', function() {
		  $('option:selected', this).attr('selected',true).siblings().removeAttr('selected');
		});
	
</script>
</head>
<body><%
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
		<div class="from_main_leave left_space_one">
			<table  id="beginWorkflowForm">
				<tbody>
					<tr>
						<td class="table_heading"><img src="images/logo.png"></td>
						<td colspan="5" class="table_heading">TRAVEL EXPENSES
							REIMBURSEMENT CLAIM
							<input disabled="disabled" type="hidden" value="Travel Expenses Reimbursement Claim" name="formNameWF" id="formNameWF" /> 
					</td>
					<td>DATE
							<div class="claer"></div> <input disabled="disabled" type="text" onblur="myVal(this.id)"  class="popupDatepicker"  id="requestDate">
						</td>
					</tr>
					<tr class="depart_form">
						<td colspan="2">NAME
							<div class="claer"></div> <input disabled="disabled" type="text" onblur="myVal(this.id)" value=""   id="empName" >
						</td>
						<td colspan="2">EMP.NO
							<div class="claer"></div> <input disabled="disabled" type="text" onblur="myVal(this.id)"  id="empNo">
						</td>
						<td colspan="3">DESIGNATION
							<div class="claer"></div> 
						 <select disabled="disabled" style="height: 28px;"  disabled="disabled"   name="empDesignation"  id="empDesignation">
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
                </select>
						
						</td>
						
					</tr>
					<tr class="depart_form">
						<td colspan="2">DEPT
							<div class="claer"></div> 
							
						<select disabled="disabled"  id="empDept" name="empDept">
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
							
						<!-- 	
							<input disabled="disabled" type="text"   onblur="myVal(this.id)"  id="empDept"> -->
						</td>
						<td colspan="2">LOCATION
							<div class="claer"></div>
							
						<select  disabled="disabled"  id="empLocation" name="empLocation">
							<option value="plant">Plant</option>
							<option value="ho">Head Office</option>
							<!-- <option value="rnd">R&D</option>
							<option value="others">Others</option> -->
						</select>
							
							 <!-- <input disabled="disabled" type="text"   onblur="myVal(this.id)"  id="empLocation"> -->
						</td>
						<td colspan="2">CLAIM FROM
							<div class="claer"></div> <input disabled="disabled" type="text" onblur="myVal(this.id)"  id="claimFrom">
						</td>
						<td>TO
							<div class="claer"></div> <input disabled="disabled" type="text" onblur="myVal(this.id)"    id="claimTo" >
						</td>
					</tr>
					<tr>
						<td colspan="7"><strong>DETAILS OF JOURNEY</strong></td>
					</tr>
					<tr>
						<td colspan="7">
							<table style="width: 100%">
								<tr>
									<td colspan="9"></td>
								</tr>
<tr>
									<td class="giveBorderBottom">Time</td>
									<%for(int m=1;m<=7;m++){ %>
									<td>
									<select class="giveWidthToDrop" id="tm<%=m %>" >
										<%
	                   NumberFormat formatter = new DecimalFormat("00");  
	                   for(int i=00;i<=11;i++){
	                   %>
	                   <option value='<%=formatter.format(i)+":00 AM" %>'><%=formatter.format(i) %>:00 AM</option>
	                 <%if(i==9){ %>
	                   <option selected="selected" value='<%=formatter.format(i)+":30 AM" %>'><%=formatter.format(i) %>:30 AM</option>
					  <%}else{ %>
					   <option value='<%=formatter.format(i)+":30 AM" %>'><%=formatter.format(i) %>:30 AM</option>
					  <%} %>
					   <%} %>
	                   <option value="12:00 PM">12:00 PM</option>
	                   <option value="12:30 PM">12:30 PM</option>
					<%
	                   for(int i=1;i<=11;i++){ %>
						
	                   <option value='<%=formatter.format(i)+":00 PM" %>'><%=formatter.format(i) %>:00 PM</option>
	                  
	                   <option value='<%=formatter.format(i)+":30 PM" %>'><%=formatter.format(i) %>:30 PM</option>
						<%} %>
									</select>
									</td>
							<%} %>
									<td class="giveBorderBottom"><strong></strong></td>
								</tr>
								
								
								<tr>
									<td class="giveBorderBottom">DATE</td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth popupDatepicker" id="dt1" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth popupDatepicker" id="dt2"  /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth popupDatepicker" id="dt3"  /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth popupDatepicker" id="dt4"  /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth popupDatepicker" id="dt5"  /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth popupDatepicker" id="dt6"  /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth popupDatepicker" id="dt7"  /></td>
									<td class="giveBorderBottom"><strong>Total</strong></td>
								</tr>
								<tr>
									<td class="giveBorderBottom">Day</td>
									<td> <select disabled="disabled" class="giveWidthToDrop"  id="dy1" >
											<option value="sunday">Sunday</option>
											<option value="monday">Monday</option>
											<option value="tuesday">Tuesday</option>
											<option value="wednesday">Wednesday</option>
											<option value="thursday">Thursday</option>
											<option value="friday">Friday</option>
											<option value="saturday">Saturday</option>
									</select></td>
									<td> <select disabled="disabled" class="giveWidthToDrop" id="dy2" >
											<option value="sunday">Sunday</option>
											<option value="monday">Monday</option>
											<option value="tuesday">Tuesday</option>
											<option value="wednesday">Wednesday</option>
											<option value="thursday">Thursday</option>
											<option value="friday">Friday</option>
											<option value="saturday">Saturday</option>
									</select></td>
									<td> <select disabled="disabled" class="giveWidthToDrop" id="dy3" >
											<option value="sunday">Sunday</option>
											<option value="monday">Monday</option>
											<option value="tuesday">Tuesday</option>
											<option value="wednesday">Wednesday</option>
											<option value="thursday">Thursday</option>
											<option value="friday">Friday</option>
											<option value="saturday">Saturday</option>
									</select></td>
									<td> <select disabled="disabled" class="giveWidthToDrop" id="dy4" >
											<option value="sunday">Sunday</option>
											<option value="monday">Monday</option>
											<option value="tuesday">Tuesday</option>
											<option value="wednesday">Wednesday</option>
											<option value="thursday">Thursday</option>
											<option value="friday">Friday</option>
											<option value="saturday">Saturday</option>
									</select></td>
									<td> <select disabled="disabled" class="giveWidthToDrop" id="dy5" >
											<option value="sunday">Sunday</option>
											<option value="monday">Monday</option>
											<option value="tuesday">Tuesday</option>
											<option value="wednesday">Wednesday</option>
											<option value="thursday">Thursday</option>
											<option value="friday">Friday</option>
											<option value="saturday">Saturday</option>
									</select></td>
									<td> <select disabled="disabled" class="giveWidthToDrop" id="dy6" >
											<option value="sunday">Sunday</option>
											<option value="monday">Monday</option>
											<option value="tuesday">Tuesday</option>
											<option value="wednesday">Wednesday</option>
											<option value="thursday">Thursday</option>
											<option value="friday">Friday</option>
											<option value="saturday">Saturday</option>
									</select></td>
									<td> <select disabled="disabled" class="giveWidthToDrop" id="dy7" >
											<option value="sunday">Sunday</option>
											<option value="monday">Monday</option>
											<option value="tuesday">Tuesday</option>
											<option value="wednesday">Wednesday</option>
											<option value="thursday">Thursday</option>
											<option value="friday">Friday</option>
											<option value="saturday">Saturday</option>
									</select></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" /></td>
								</tr>
								<tr>
									<td class="giveBorderBottom">Travel Fare</td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth"  id="tvf1"  /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth"  id="tvf2"  /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth"  id="tvf3"  /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth"  id="tvf4"  /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth"  id="tvf5"  /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth"  id="tvf6"  /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth"  id="tvf7"  /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth"  id="tvfT"  /></td>
								</tr>
								<tr>
									<td class="giveBorderBottom">Room(Attach Receipts)</td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth"  id="rmr1" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth"  id="rmr2" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth"  id="rmr3" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth"  id="rmr4" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth"  id="rmr5" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth"  id="rmr6" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth"  id="rmr7" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth"  id="rmrT" /></td>
								</tr>
								<tr>
									<td class="giveBorderBottom">Meal(Attach Receipts)</td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="mlr1" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="mlr2" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="mlr3" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="mlr4" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="mlr5" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="mlr6" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="mlr7" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="mlrT" /></td>
								</tr>
								<tr>
									<td class="giveBorderBottom">Taxi(Full Detail, A)</td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="txd1" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="txd2" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="txd3" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="txd4" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="txd5" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="txd6" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="txd7" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="txdT" /></td>
								</tr>
								<tr>
									<td class="giveBorderBottom">Miscellaneous(Full Detail, B)</td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="mcs1" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="mcs2" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="mcs3" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="mcs4" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="mcs5" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="mcs6" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="mcs7" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="mcsT" /></td>
								</tr>
								<tr>
									<td class="giveBorderBottom">*Car Mileage @ 12/-km</td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="cml1" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="cml2" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="cml3" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="cml4" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="cml5" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="cml6" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="cml7" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="cmlT" /></td>
								</tr>
								<tr>
									<td class="giveBorderBottom">*Out of pocket allowance</td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="opa1" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="opa2" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="opa3" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="opa4" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="opa5" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="opa6" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="opa7" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="opaT" /></td>
								</tr>
								<tr>
									<td colspan="8" class="giveBorderBottom">Total
										Expenditure(Rounded)</td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="gtl" /></td>
								</tr>

							</table>
						</td>
					</tr>



<tr>
<td colspan="7">
<strong>
Important<br>
1. All Claims must have supporting bill except *.
</strong>
</td>

</tr>





					<tr>
						<td colspan="4">Deduct :Cash Advance</td>
						<td colspan="3"><input disabled="disabled" type="text" onblur="myVal(this.id)"  id="dcAdvance" /></td>
					</tr>
					<tr>
						<td colspan="4">Deduct :Travel bills not paid by me</td>
						<td colspan="3"><input disabled="disabled" type="text" onblur="myVal(this.id)"  id="dTravelBill"/></td>
					</tr>
					<tr>
						<td colspan="4">Deduct :Hotel bills not paid by me</td>
						<td colspan="3"><input disabled="disabled" type="text" onblur="myVal(this.id)"  id="dHotelBill"/></td>
					</tr>
					<tr>
						<td colspan="4">Total Deductions</td>
						<td colspan="3"><input disabled="disabled" type="text" onblur="myVal(this.id)"  id="dTotal"/></td>
					</tr>
					<tr>
						<td colspan="4">Net Due to Me</td>
						<td colspan="3"><input disabled="disabled" type="text" onblur="myVal(this.id)"  id="netDue"/></td>
					</tr>
					<tr>
						<td colspan="4">Net Due to AVI-OIL</td>
						<td colspan="3"><input disabled="disabled" type="text" onblur="myVal(this.id)"  id="netDueToAv"/></td>
					</tr>






					<tr>
						<td colspan="7"><strong>A. Details of Taxi/car
								Mileage</strong></td>
					</tr>
					<tr>
						<td colspan="4">
							<table>
								<tr>
									<td><strong>Date</strong></td>
									<td><strong>From/To</strong></td>
									<td><strong>KM</strong></td>
									<td><strong>Amount</strong></td>
								</tr>

								<tr>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth popupDatepicker" id="taxiDate1"  /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="taxiFrom1" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="taxiKm1" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="taxiAmount1" /></td>
								</tr>
								<tr>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"   class="giveWidth popupDatepicker" id="taxiDate2"   /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="taxiFrom2" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="taxiKm2" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="taxiAmount2" /></td>
								</tr>
								<tr>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"   class="giveWidth popupDatepicker" id="taxiDate3"    /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="taxiFrom3" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="taxiKm3" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="taxiAmount3" /></td>
								</tr>
								<tr>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"   class="giveWidth popupDatepicker" id="taxiDate4"    /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="taxiFrom4" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="taxiKm4" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="taxiAmount4" /></td>
								</tr>
								<tr>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"   class="giveWidth popupDatepicker" id="taxiDate5"    /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="taxiFrom5" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="taxiKm5" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="taxiAmount5" /></td>
								</tr>
							</table>

						</td>
						<td colspan="3">

							<table>
								<tr>
									<td><strong>Date</strong></td>
									<td><strong>From/To</strong></td>
									<td><strong>KM</strong></td>
									<td><strong>Amount</strong></td>
								</tr>

								<tr>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth popupDatepicker" id="ttaxiDate1"   /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="ttaxiFrom1" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="ttaxiKm1" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="ttaxiAmount1" /></td>
								</tr>
								<tr>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth popupDatepicker" id="ttaxiDate2"    /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="ttaxiFrom2" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="ttaxiKm2" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="ttaxiAmount2" /></td>
								</tr>
								<tr>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth popupDatepicker" id="ttaxiDate3"   /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="ttaxiFrom3" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="ttaxiKm3" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="ttaxiAmount3" /></td>
								</tr>
								<tr>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth popupDatepicker" id="ttaxiDate4"    /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="ttaxiFrom4" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="ttaxiKm4" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="ttaxiAmount4" /></td>
								</tr>
								<tr>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth popupDatepicker" id="ttaxiDate5"    /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="ttaxiFrom5" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="ttaxiKm5" /></td>
									<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  class="giveWidth" id="ttaxiAmount5" /></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="7"><strong> B. Detail of Miscellaneous
								expenses (Attached Receipts) </strong></td>
					</tr>
					<tr>
						<td colspan="2"><strong>Date</strong></td>
						<td colspan="2"><strong>Purpose/Nature of expenses</strong></td>
						<td colspan="2"><strong>Name of Client/Other Details</strong></td>
						<td><strong>Amount</strong></td>
					</tr>
					<tr>
						<td colspan="2"><input disabled="disabled" type="text" onblur="myVal(this.id)"  id="miscDate1" class="popupDatepicker" /></td>
						<td colspan="2"><input disabled="disabled" type="text" onblur="myVal(this.id)"  id="miscPurpose1" /></td>
						<td colspan="2"><input disabled="disabled" type="text" onblur="myVal(this.id)"  id="nameClient1" /></td>
						<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  id="miscAmount1" /></td>

					</tr>
					<tr>
						<td colspan="2"><input disabled="disabled" type="text" onblur="myVal(this.id)"  id="miscDate2"  class="popupDatepicker" /></td>
						<td colspan="2"><input disabled="disabled" type="text" onblur="myVal(this.id)"  id="miscPurpose2" /></td>
						<td colspan="2"><input disabled="disabled" type="text" onblur="myVal(this.id)"  id="nameClient2" /></td>
						<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  id="miscAmount2" /></td>

					</tr>
					<tr>
						<td colspan="2"><input disabled="disabled" type="text" onblur="myVal(this.id)"  id="miscDate3"  class="popupDatepicker" /></td>
						<td colspan="2"><input disabled="disabled" type="text" onblur="myVal(this.id)"  id="miscPurpose3" /></td>
						<td colspan="2"><input disabled="disabled" type="text" onblur="myVal(this.id)"  id="nameClient3" /></td>
						<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  id="miscAmount3" /></td>

					</tr>
					<tr>
						<td colspan="2"><input disabled="disabled" type="text" onblur="myVal(this.id)"  id="miscDate4" class="popupDatepicker"  /></td>
						<td colspan="2"><input disabled="disabled" type="text" onblur="myVal(this.id)"  id="miscPurpose4" /></td>
						<td colspan="2"><input disabled="disabled" type="text" onblur="myVal(this.id)"  id="nameClient4" /></td>
						<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  id="miscAmount4" /></td>

					</tr>
					<tr>
						<td colspan="2"><input disabled="disabled" type="text" onblur="myVal(this.id)"  id="miscDate5"  class="popupDatepicker" /></td>
						<td colspan="2"><input disabled="disabled" type="text" onblur="myVal(this.id)"  id="miscPurpose5" /></td>
						<td colspan="2"><input disabled="disabled" type="text" onblur="myVal(this.id)"  id="nameClient5" /></td>
						<td><input disabled="disabled" type="text" onblur="myVal(this.id)"  id="miscAmount5" /></td>

					</tr>
		<tr>
						<td colspan="2"><input disabled="disabled" type="text" onblur="myVal(this.id)"    id="miscDate6"  class="popupDatepicker" /></td>
						<td colspan="2"><input disabled="disabled" type="text" onblur="myVal(this.id)"     id="miscPurpose6" /></td>
						<td colspan="2"><input disabled="disabled" type="text" onblur="myVal(this.id)"    id="nameClient6" /></td>
						<td><input disabled="disabled" type="text" onblur="myVal(this.id)"    id="miscAmount6" /></td>

					</tr>
					<tr>
						<td colspan="2"><input disabled="disabled" type="text" onblur="myVal(this.id)"    id="miscDate7"  class="popupDatepicker" /></td>
						<td colspan="2"><input disabled="disabled" type="text" onblur="myVal(this.id)"     id="miscPurpose7" /></td>
						<td colspan="2"><input disabled="disabled" type="text" onblur="myVal(this.id)"    id="nameClient7" /></td>
						<td><input disabled="disabled" type="text" onblur="myVal(this.id)"    id="miscAmount7" /></td>

					</tr>
					<tr>
                <td  width="30%" colspan="2">
                HR/Finance(Verifier) <br><!-- <input disabled="disabled" type="text"  onblur="myVal(this.id)" class="emple_np" id="verificationStep"  placeholder="Email"/> -->
                 <select id="verificationStep" name="verificationStep" disabled="disabled" onchange="verselectChange(this.value)">
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
               Reporting Officer / HOD/CEO (Approver) <br><!-- <input disabled="disabled" type="text"  onblur="myVal(this.id)" class="emple_np" id="approvalStep" placeholder="Email"/> -->
                <select style="height: 28px;"  id="approvalStep" name="approvalStep" disabled="disabled" onchange="appselectChange(this.value)">
               <option value="index">Please Select </option>
               <%
               for(String lst: ulst)
               {
               %>
               <option value="<%=lst %>"><%=lst %> </option>
               <%} %>
               </select>
                </td>
                <td  width="35%" colspan="2">
              CFO/ AGM (F)(Payment Authorizer) <br><!-- <input disabled="disabled" type="text"  onblur="myVal(this.id)" class="emple_np"  id="authorizationStep" placeholder="Email"/> -->
                <select id="authorizationStep" name="authorizationStep" disabled="disabled" onchange="authselectChange(this.value)" >
               <option value="index">Please Select </option>
               <%
               for(String lst: ulst)
               {
               %>
               <option value="<%=lst %>"><%=lst %> </option>
               <%} %>
               </select>
                </td>
            
                
                </tr>
                 <tr>
                
                <td   colspan="7">
                <table>
                <tr>
                <td width="10%"> Account Dept.</td>
                <td width="85%">
                
              <!-- <input type="text"  onblur="myVal(this.id)" class="emple_np"  id="authorizationStep" placeholder="Email"/> -->
                <select disabled="disabled" id="accountStep" name="accountStep"  onchange="accselectChange(this.value)" >
               <option value="index">Please Select </option>
               <%
               for(String lst: ulst)
               {
               %>
               <option value="<%=lst %>"><%=lst %> </option>
               <%} %>
               </select></td></tr></table>
                </td> 
                
                </tr>
					<tr>
             	<td colspan="7">
                <table>
                <tr>
                <td width="10%"> Initiated By</td>
                <td width="85%"><input disabled="disabled" type="text"  onblur="myVal(this.id)"   style="width: 65% !important; border: 0px;" readonly="readonly" value="<%=uid %>" id="employeeID" name="employeeID"  /></td>
                </tr>
                </table>
               
               
                </td>
              
              </tr>
             <tr>
               <td colspan="7">
               <table>
                <tr>
                <td width="10%"> Claim Verified by HR/Finance
</td>
                <td width="85%"><input type="text"  onblur="myVal(this.id)"   style="width: 65% !important; border: 0px;" readonly="readonly" value="" id="verifiedBy" name="verifiedBy"  /></td>
                </tr>
                </table>
               
                </td>
              </tr>
              
              <tr>
               <td colspan="7">
                <table>
                <tr>
                <td width="10%"> Claim Approved by Reporting Officer/HOD/CEO
</td>
                <td width="85%"><input type="text"  onblur="myVal(this.id)"  style="width: 65% !important; border: 0px;" readonly="readonly" value="" id="approvedBy" name="approvedBy"  /></td>
                </tr>
                </table>
               
                </td>
              </tr>
              <tr>
               <td colspan="7">
                <table>
                <tr>
                <td width="10%"> Claim Authorized by CFO/AGM (F)
</td>
                <td width="85%"><input type="text"  onblur="myVal(this.id)"  style="width: 65% !important; border: 0px;" readonly="readonly" value="" id="authorizedBy" name="authorizedBy"  /></td>
                </tr>
                </table>
               
                </td>
              </tr>
					 <tr>
               <td colspan="7">
                <table>
                <tr>
                <td width="100%">
               
               
               <input disabled="disabled" type="hidden" id="historyHiddenTasks" value=""/>
               <div id="showHistoryHiddenTasks" >
            <input  type="button" onclick="getHistoryForms()" class="getHistory"  value="Get History" />
               		
               </div>
                  </td>
                </tr>
                </table>
            
                </td>
              </tr>
                       <tr >
                                <td class="rupee_td" colspan="7">
                                <table ><tr><td width="10%">
                                          Remark</td><td width="90%">
                                          <textarea style="width: 100%" id="voucherRemark"  mane="voucherRemark" cols="50" rows="3" placeholder="Your Reasons" onblur="myTextareaVal(this.id)"></textarea>
                                </td></tr></table>
                                
                                 </td>
              </tr>
                     	<tr>
                     	
						<td colspan="7"><input disabled="disabled" type="hidden" id="attachmentID"
						name="attachmentID"> <input  type="button"
						value="Get Attachment" onclick="getAtt()" class="getAttch" />
						<div id="attlch"></div></td>
							
				
					</tr>
              
					<tr>
						<td colspan="7"><div class="table_right">
								<input
									type="button"
									class="Logged_User_tab_color add_user_js add_user_bg"
									value="Print" onclick="printDiv()">
							</div></td>
					</tr>

				</tbody>
			</table>
		</div>
	</div>
	<div class="claer"></div>
</body>
</html>