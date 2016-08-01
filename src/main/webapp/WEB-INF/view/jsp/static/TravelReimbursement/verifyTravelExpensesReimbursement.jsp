<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Collections"%>
<%@page import="edms.core.LDAPUserList"%>
<%@page import="java.util.List"%>
<%@page import="edms.core.Config"%>
<%@page import="edms.core.Principal"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
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
function grandTotal(){
	
	var tvft=0.0;
	var rmrt=0.0;
	var mlrt=0.0;
	var txdt=0.0;
	var mcst=0.0;
	var cmlt=0.0;
	var opat=0.0;
	for(var i=1;i<=7;i++){
		
		if($("#tvf"+i).val()!="")
			tvft = tvft + parseInt($("#tvf"+i).val());
		if($("#rmr"+i).val()!="")
			rmrt = rmrt + parseInt($("#rmr"+i).val());
		if($("#mlr"+i).val()!="")
			mlrt = mlrt + parseInt($("#mlr"+i).val());
		if($("#txd"+i).val()!="")
			txdt = txdt + parseInt($("#txd"+i).val());
		if($("#mcs"+i).val()!="")
			mcst = mcst + parseInt($("#mcs"+i).val());
		if($("#cml"+i).val()!="")
			cmlt = cmlt + parseInt($("#cml"+i).val());
		if($("#opa"+i).val()!="")
			opat = opat + parseInt($("#opa"+i).val());
	}
	//alert("dsf");
	$("#tvfT").attr("value",tvft);
	$("#rmrT").attr("value",rmrt);
	$("#mlrT").attr("value",mlrt);
	$("#txdT").attr("value",txdt);
	$("#mcsT").attr("value",mcst);
	$("#cmlT").attr("value",cmlt);
	$("#opaT").attr("value",opat);
	/* $("#dcAdvance").attr("value",'0');
	$("#dTravelBill").attr("value",'0');
	$("#dHotelBill").attr("value",'0');
	$("#dTotal").attr("value",'0');
	$("#netDue").attr("value",'0');
	$("#netDueToAv").attr("value",'0'); */
	var A=(tvft+rmrt+mlrt+txdt+mcst+cmlt+opat);
	var B=parseInt($("#dcAdvance").val());
	var C=parseInt($("#dTravelBill").val());
	var D=parseInt($("#dHotelBill").val());
	$("#dTotal").attr("value",(B+C+D));
	var E=parseInt($("#dTotal").val());
	if(parseInt(A)>parseInt(E)){
		$("#netDue").attr("value",(A-E));
		$("#netDueToAv").attr("value",'0');
	}else{
		$("#netDueToAv").attr("value",(E-A));
		$("#netDue").attr("value",'0');
	}
	var F=parseInt($("#netDue").val());
	var G=parseInt($("#netDueToAv").val());
	
	$("#gtl").attr("value",A);
	
}

</script>

<script type="text/javascript">


function getDayy(){
	
	var weekday = new Array(7);
	weekday[0] = "sunday";
	weekday[1] = "monday";
	weekday[2] = "tuesday";
	weekday[3] = "wednesday";
	weekday[4] = "thursday";
	weekday[5] = "friday";
	weekday[6] = "saturday";

	var nm = $('#dt1').val();
	var nmm = nm.split("-");
	var d = new Date(nmm[2], nmm[1] - 1, nmm[0]);
	var n = weekday[d.getDay()];
	n = n.toLowerCase();

	$("#dy1 option[value='" + n + "']").attr("selected", "selected");

	nm = $('#dt2').val();
	nmm = nm.split("-");
	d = new Date(nmm[2], nmm[1] - 1, nmm[0]);
	n = weekday[d.getDay()];
	n = n.toLowerCase();
	$("#dy2 option[value='" + n + "']").attr("selected", "selected");

	nm = $('#dt3').val();
	nmm = nm.split("-");
	d = new Date(nmm[2], nmm[1] - 1, nmm[0]);
	n = weekday[d.getDay()];
	n = n.toLowerCase();
	$("#dy3 option[value='" + n + "']").attr("selected", "selected");

	nm = $('#dt4').val();
	nmm = nm.split("-");
	d = new Date(nmm[2], nmm[1] - 1, nmm[0]);
	n = weekday[d.getDay()];
	n = n.toLowerCase();
	$("#dy4 option[value='" + n + "']").attr("selected", "selected");

	nm = $('#dt5').val();
	nmm = nm.split("-");
	d = new Date(nmm[2], nmm[1] - 1, nmm[0]);
	n = weekday[d.getDay()];
	n = n.toLowerCase();
	$("#dy5 option[value='" + n + "']").attr("selected", "selected");

	nm = $('#dt6').val();
	nmm = nm.split("-");
	d = new Date(nmm[2], nmm[1] - 1, nmm[0]);
	n = weekday[d.getDay()];
	n = n.toLowerCase();
	$("#dy6 option[value='" + n + "']").attr("selected", "selected");

	nm = $('#dt7').val();
	nmm = nm.split("-");
	d = new Date(nmm[2], nmm[1] - 1, nmm[0]);
	n = weekday[d.getDay()];
	n = n.toLowerCase();
	$("#dy7 option[value='" + n + "']").attr("selected", "selected");

}

</script>

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
					/* $("#hodEmail").autocomplete(
							"${pageContext.request.contextPath}/autocomp");
					$("#formTo").autocomplete(
							"${pageContext.request.contextPath}/autocomp"); */
				} catch (e) {
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
	function checkMail(id,dec) {
		/* var mailChk=$('#formTo').val();
		 var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		    
		if(re.test(mailChk))
		submitForm('purchaseRequisitionRequest::Purchase Requisition Request');
		else
			alert("Please enter mail id"); */

		var pg = true;
		/* if ($('input[name="priorityAboutTime"]:checked').length <= 0) {
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
if(dec=="accept"){
		if($("#gtl").val()==null || $("#gtl").val().trim()=="")
		{
		pg=false;
		showMsgWF("Please Fill total expenditure field");
		}
		 else if($("#approvalStep").val()==null || $("#approvalStep").val().trim()=="index")
		{
		pg=false;
		showMsgWF("Please Fill Approver's email!");
		}
			else if($("#empDept").val()==null || $("#empDept").val().trim()=="index")
			{
			pg=false;
			showMsgWF("Please Select Department Name!");
			}
			else if($("#empDesignation").val()==null || $("#empDesignation").val().trim()=="index")
			{
			pg=false;
			showMsgWF("Please Select Employee Designation!");
			}

		$(".blank_val").each(function() {
		    if($(this).val()=="" || $(this).val()==null)
		    	{
		    	pg=false;
		    	}
		});
		
}
		if (pg == true) {
			try {
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
			} catch (e) {
				// TODO: handle exception
			}
			$("#" + id).attr("disabled", true);
			proceedTheForm(dec);
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

	function setChkbox(id) {
		if ($('#' + id).is(':checked')) {
			$('#' + id).attr('checked', true);
		} else {
			$('#' + id).attr('checked', false);
		}
	}

	function setRadioTye(val) {
		$(':radio[name="priorityAboutTime"][id=' + val + ']').attr('checked',
				'checked');
	}

	function setRadioNature(val) {
		$(':radio[name="natureOfMaterial"][id=' + val + ']').attr('checked',
				'checked');
	}

	$('#empDesignation').on('change', function() {
		  $('option:selected', this).attr('selected',true).siblings().removeAttr('selected');
		});
	
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
	
	$('#deptName').on(
			'change',
			function() {
				$('option:selected', this).attr('selected', true).siblings()
						.removeAttr('selected');
			});

	$('#locationName').on(
			'change',
			function() {
				$('option:selected', this).attr('selected', true).siblings()
						.removeAttr('selected');
			});

	$('#indentlocationName').on(
			'change',
			function() {
				$('option:selected', this).attr('selected', true).siblings()
						.removeAttr('selected');
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
		<div class="from_main_leave left_space_one">
			<table id="handleWorkflowForm">
				<tbody>
					<tr>
						<td class="table_heading"><img src="images/logo.png"></td>
						<td colspan="5" class="table_heading">TRAVEL EXPENSES
							REIMBURSEMENT CLAIM
							<input type="hidden" value="Reimbursement of Medical Expenses" name="formNameWF" id="formNameWF" /> 
							<input type="hidden" value="<%=dt %>" name="filledDaete" id="filledDaete" /></td>
							<td>DATE
							<div class="claer"></div> <input type="text"  onblur="myVal(this.id)"  class="popupDatepicker"  id="requestDate">
						</td>
					</tr>
					<tr class="depart_form">
						<td colspan="2">NAME
							<div class="claer"></div> <input type="text"  onblur="myVal(this.id)"   id="empName" >
						</td>
						<td colspan="2">EMP.NO
							<div class="claer"></div> <input type="text"  onblur="myVal(this.id)"  id="empNo">
						</td>
						<td colspan="3">DESIGNATION
							<div class="claer"></div> 
							
							
							<select style="height: 28px;"   name="empDesignation"  id="empDesignation">
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
							
						<select id="empDept" name="empDept">
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
							
						<!-- 	
							<input type="text"  onblur="myVal(this.id)"  id="empDept"> -->
						</td>
						<td colspan="2">LOCATION
							<div class="claer"></div>
							
						<select  id="empLocation" name="empLocation">
							<option value="plant">Plant</option>
							<option value="ho">Head Office</option>
							<!-- <option value="rnd">R&D</option>
							<option value="others">Others</option> -->
						</select>
							
							 <!-- <input type="text"  onblur="myVal(this.id)"  id="empLocation"> -->
						</td>
						<td colspan="2">CLAIM FROM
							<div class="claer"></div> <input type="text" onblur="myVal(this.id)"  id="claimFrom" class="blank_val popupDatepicker">
						</td>
						<td>TO
							<div class="claer"></div> <input type="text" onblur="myVal(this.id)"    id="claimTo"  class="blank_val popupDatepicker">
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
									<td class="giveBorderBottom">DATE</td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth popupDatepicker" id="dt1" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth popupDatepicker" id="dt2"  /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth popupDatepicker" id="dt3"  /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth popupDatepicker" id="dt4"  /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth popupDatepicker" id="dt5"  /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth popupDatepicker" id="dt6"  /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth popupDatepicker" id="dt7"  /></td>
									<td class="giveBorderBottom"><strong>Total</strong></td>
								</tr>
								<tr>
									<td class="giveBorderBottom">Day</td>
									<td><select class="giveWidthToDrop"  id="dy1" >
											<option value="sunday">Sunday</option>
											<option value="monday">Monday</option>
											<option value="tuesday">Tuesday</option>
											<option value="wednesday">Wednesday</option>
											<option value="thursday">Thursday</option>
											<option value="friday">Friday</option>
											<option value="saturday">Saturday</option>
									</select></td>
									<td><select class="giveWidthToDrop" id="dy2" >
											<option value="sunday">Sunday</option>
											<option value="monday">Monday</option>
											<option value="tuesday">Tuesday</option>
											<option value="wednesday">Wednesday</option>
											<option value="thursday">Thursday</option>
											<option value="friday">Friday</option>
											<option value="saturday">Saturday</option>
									</select></td>
									<td><select class="giveWidthToDrop" id="dy3" >
											<option value="sunday">Sunday</option>
											<option value="monday">Monday</option>
											<option value="tuesday">Tuesday</option>
											<option value="wednesday">Wednesday</option>
											<option value="thursday">Thursday</option>
											<option value="friday">Friday</option>
											<option value="saturday">Saturday</option>
									</select></td>
									<td><select class="giveWidthToDrop" id="dy4" >
											<option value="sunday">Sunday</option>
											<option value="monday">Monday</option>
											<option value="tuesday">Tuesday</option>
											<option value="wednesday">Wednesday</option>
											<option value="thursday">Thursday</option>
											<option value="friday">Friday</option>
											<option value="saturday">Saturday</option>
									</select></td>
									<td><select class="giveWidthToDrop" id="dy5" >
											<option value="sunday">Sunday</option>
											<option value="monday">Monday</option>
											<option value="tuesday">Tuesday</option>
											<option value="wednesday">Wednesday</option>
											<option value="thursday">Thursday</option>
											<option value="friday">Friday</option>
											<option value="saturday">Saturday</option>
									</select></td>
									<td><select class="giveWidthToDrop" id="dy6" >
											<option value="sunday">Sunday</option>
											<option value="monday">Monday</option>
											<option value="tuesday">Tuesday</option>
											<option value="wednesday">Wednesday</option>
											<option value="thursday">Thursday</option>
											<option value="friday">Friday</option>
											<option value="saturday">Saturday</option>
									</select></td>
									<td><select class="giveWidthToDrop" id="dy7" >
											<option value="sunday">Sunday</option>
											<option value="monday">Monday</option>
											<option value="tuesday">Tuesday</option>
											<option value="wednesday">Wednesday</option>
											<option value="thursday">Thursday</option>
											<option value="friday">Friday</option>
											<option value="saturday">Saturday</option>
									</select></td>
									<td><input  value="Fill Days" type="button" style="display: block;"  onclick="getDayy()" class="giveWidth" /></td>
								
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
									<td class="giveBorderBottom">Travel Fare</td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num"  id="tvf1"  /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num"  id="tvf2"  /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num"  id="tvf3"  /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num"  id="tvf4"  /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num"  id="tvf5"  /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num"  id="tvf6"  /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num"  id="tvf7"  /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num"  id="tvfT"  /></td>
								</tr>
								<tr>
									<td class="giveBorderBottom">Room(Attach Receipts)</td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num"  id="rmr1" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num"  id="rmr2" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num"  id="rmr3" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num"  id="rmr4" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num"  id="rmr5" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num"  id="rmr6" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num"  id="rmr7" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num"  id="rmrT" /></td>
								</tr>
								<tr>
									<td class="giveBorderBottom">Meal(Attach Receipts)</td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="mlr1" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="mlr2" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="mlr3" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="mlr4" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="mlr5" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="mlr6" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="mlr7" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="mlrT" /></td>
								</tr>
								<tr>
									<td class="giveBorderBottom">Taxi(Full Detail, A)</td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="txd1" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="txd2" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="txd3" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="txd4" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="txd5" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="txd6" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="txd7" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="txdT" /></td>
								</tr>
								<tr>
									<td class="giveBorderBottom">Miscellaneous(Full Detail, B)</td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="mcs1" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="mcs2" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="mcs3" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="mcs4" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="mcs5" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="mcs6" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="mcs7" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="mcsT" /></td>
								</tr>
								<tr>
									<td class="giveBorderBottom">*Car Mileage @ 12/-km</td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="cml1" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="cml2" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="cml3" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="cml4" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="cml5" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="cml6" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="cml7" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="cmlT" /></td>
								</tr>
								<tr>
									<td class="giveBorderBottom">*Out of pocket allowance</td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="opa1" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="opa2" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="opa3" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="opa4" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="opa5" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="opa6" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="opa7" /></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="opaT" /></td>
								</tr>
								<tr>
									<td colspan="8" class="giveBorderBottom"><button onclick="grandTotal()">Total
										Expenditure(Rounded)</button></td>
									<td><input type="text" onblur="myVal(this.id)"  class="giveWidth only_num" id="gtl" /></td>
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
						<td colspan="3"><input type="text" onblur="myVal(this.id)" value="0" class="only_num" id="dcAdvance" /></td>
					</tr>
					<tr>
						<td colspan="4">Deduct :Travel bills not paid by me</td>
						<td colspan="3"><input type="text" onblur="myVal(this.id)" value="0"  class="only_num"   id="dTravelBill"/></td>
					</tr>
					<tr>
						<td colspan="4">Deduct :Hotel bills not paid by me</td>
						<td colspan="3"><input type="text" onblur="myVal(this.id)" value="0"   class="only_num"  id="dHotelBill"/></td>
					</tr>
					<tr>
						<td colspan="4">Total Deductions</td>
						<td colspan="3"><input type="text" onblur="myVal(this.id)" value="0"   class="only_num"  id="dTotal"/></td>
					</tr>
					<tr>
						<td colspan="4">Net Due to Me</td>
						<td colspan="3"><input type="text" onblur="myVal(this.id)" value="0"  class="only_num"   id="netDue"/></td>
					</tr>
					<tr>
						<td colspan="4">Net Due to AVI-OIL</td>
						<td colspan="3"><input type="text" onblur="myVal(this.id)" value="0"  class="only_num"   id="netDueToAv"/></td>
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
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth popupDatepicker" id="taxiDate1"  /></td>
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth" id="taxiFrom1" /></td>
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth" id="taxiKm1" /></td>
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth" id="taxiAmount1" /></td>
								</tr>
								<tr>
									<td><input type="text"  onblur="myVal(this.id)"   class="giveWidth popupDatepicker" id="taxiDate2"   /></td>
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth" id="taxiFrom2" /></td>
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth" id="taxiKm2" /></td>
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth" id="taxiAmount2" /></td>
								</tr>
								<tr>
									<td><input type="text"  onblur="myVal(this.id)"   class="giveWidth popupDatepicker" id="taxiDate3"    /></td>
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth" id="taxiFrom3" /></td>
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth" id="taxiKm3" /></td>
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth" id="taxiAmount3" /></td>
								</tr>
								<tr>
									<td><input type="text"  onblur="myVal(this.id)"   class="giveWidth popupDatepicker" id="taxiDate4"    /></td>
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth" id="taxiFrom4" /></td>
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth" id="taxiKm4" /></td>
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth" id="taxiAmount4" /></td>
								</tr>
								<tr>
									<td><input type="text"  onblur="myVal(this.id)"   class="giveWidth popupDatepicker" id="taxiDate5"    /></td>
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth" id="taxiFrom5" /></td>
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth" id="taxiKm5" /></td>
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth" id="taxiAmount5" /></td>
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
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth popupDatepicker" id="ttaxiDate1"   /></td>
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth" id="ttaxiFrom1" /></td>
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth" id="ttaxiKm1" /></td>
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth" id="ttaxiAmount1" /></td>
								</tr>
								<tr>
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth popupDatepicker" id="ttaxiDate2"    /></td>
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth" id="ttaxiFrom2" /></td>
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth" id="ttaxiKm2" /></td>
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth" id="ttaxiAmount2" /></td>
								</tr>
								<tr>
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth popupDatepicker" id="ttaxiDate3"   /></td>
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth" id="ttaxiFrom3" /></td>
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth" id="ttaxiKm3" /></td>
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth" id="ttaxiAmount3" /></td>
								</tr>
								<tr>
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth popupDatepicker" id="ttaxiDate4"    /></td>
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth" id="ttaxiFrom4" /></td>
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth" id="ttaxiKm4" /></td>
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth" id="ttaxiAmount4" /></td>
								</tr>
								<tr>
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth popupDatepicker" id="ttaxiDate5"    /></td>
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth" id="ttaxiFrom5" /></td>
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth" id="ttaxiKm5" /></td>
									<td><input type="text"  onblur="myVal(this.id)"  class="giveWidth" id="ttaxiAmount5" /></td>
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
						<td colspan="2"><input type="text"  onblur="myVal(this.id)"  id="miscDate1" class="popupDatepicker" /></td>
						<td colspan="2"><input type="text"  onblur="myVal(this.id)"  id="miscPurpose1" /></td>
						<td colspan="2"><input type="text"  onblur="myVal(this.id)"  id="nameClient1" /></td>
						<td><input type="text"  onblur="myVal(this.id)"  id="miscAmount1" /></td>

					</tr>
					<tr>
						<td colspan="2"><input type="text"  onblur="myVal(this.id)"  id="miscDate2"  class="popupDatepicker" /></td>
						<td colspan="2"><input type="text"  onblur="myVal(this.id)"  id="miscPurpose2" /></td>
						<td colspan="2"><input type="text"  onblur="myVal(this.id)"  id="nameClient2" /></td>
						<td><input type="text"  onblur="myVal(this.id)"  id="miscAmount2" /></td>

					</tr>
					<tr>
						<td colspan="2"><input type="text"  onblur="myVal(this.id)"  id="miscDate3"  class="popupDatepicker" /></td>
						<td colspan="2"><input type="text"  onblur="myVal(this.id)"  id="miscPurpose3" /></td>
						<td colspan="2"><input type="text"  onblur="myVal(this.id)"  id="nameClient3" /></td>
						<td><input type="text"  onblur="myVal(this.id)"  id="miscAmount3" /></td>

					</tr>
					<tr>
						<td colspan="2"><input type="text"  onblur="myVal(this.id)"  id="miscDate4" class="popupDatepicker"  /></td>
						<td colspan="2"><input type="text"  onblur="myVal(this.id)"  id="miscPurpose4" /></td>
						<td colspan="2"><input type="text"  onblur="myVal(this.id)"  id="nameClient4" /></td>
						<td><input type="text"  onblur="myVal(this.id)"  id="miscAmount4" /></td>

					</tr>
					<tr>
						<td colspan="2"><input type="text"  onblur="myVal(this.id)"  id="miscDate5"  class="popupDatepicker" /></td>
						<td colspan="2"><input type="text"  onblur="myVal(this.id)"  id="miscPurpose5" /></td>
						<td colspan="2"><input type="text"  onblur="myVal(this.id)"  id="nameClient5" /></td>
						<td><input type="text"  onblur="myVal(this.id)"  id="miscAmount5" /></td>

					</tr>
		<tr>
						<td colspan="2"><input type="text" onblur="myVal(this.id)"    id="miscDate6"  class="popupDatepicker" /></td>
						<td colspan="2"><input type="text" onblur="myVal(this.id)"    id="miscPurpose6" /></td>
						<td colspan="2"><input type="text" onblur="myVal(this.id)"    id="nameClient6" /></td>
						<td><input type="text" onblur="myVal(this.id)"    id="miscAmount6" /></td>
					</tr>
					<tr>
						<td colspan="2"><input type="text" onblur="myVal(this.id)"    id="miscDate7"  class="popupDatepicker" /></td>
						<td colspan="2"><input type="text" onblur="myVal(this.id)"    id="miscPurpose7" /></td>
						<td colspan="2"><input type="text" onblur="myVal(this.id)"    id="nameClient7" /></td>
						<td><input type="text" onblur="myVal(this.id)"    id="miscAmount7" /></td>

					</tr>
					<tr>
                <td style="display: none;" width="30%" colspan="7">
                HR/Finance(Verifier) <!-- <input type="text"  onblur="myVal(this.id)" class="emple_np" id="verificationStep"  placeholder="Email"/> -->
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
                <td   width="35%" colspan="7">
               Reporting Officer / HOD/CEO (Approver) <!-- <input type="text"  onblur="myVal(this.id)" class="emple_np" id="approvalStep" placeholder="Email"/> -->
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
                <td  style="display: none;" width="35%" colspan="3">
              CFO/ AGM (F)(Payment Authorizer) <br><!-- <input type="text"  onblur="myVal(this.id)" class="emple_np"  id="authorizationStep" placeholder="Email"/> -->
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
                </tr>
					<tr>
             	<td colspan="7">
                <table>
                <tr>
                <td width="10%"> Initiated By</td>
                <td width="85%"><input type="text"    onblur="myVal(this.id)"   style="width: 65% !important; border: 0px;" readonly="readonly"  id="employeeID" name="employeeID"  /></td>
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
                                <td class="rupee_td" colspan="7">
                                <table ><tr><td width="10%">
                                          Remark</td><td width="90%">
                                          <textarea style="width: 100%" id="voucherRemark"  mane="voucherRemark" cols="50" rows="3" placeholder="Your Reasons" onblur="myTextareaVal(this.id)"></textarea>
                                </td></tr></table>
                                
                                 </td>
              </tr>

				
                     	<tr>
                     	
						<td colspan="7"><input type="hidden" id="attachmentID"
						name="attachmentID"> <input type="button"
						value="Get Attachment" onclick="getAtt()" class="getAttch" />
						<div id="attlch"></div></td>
							
				
					</tr>
					<tr>
						<td colspan="7"><div class="table_right">
								<input type="button" id="plantpur1"
									class="Logged_User_tab_color add_user_js add_user_bg"
									value="VERIFY" onclick="checkMail(this.id,'accept')">
							<input type="button" class="Logged_User_tab  onclick" id="travrej" 
									value="REJECT" onclick="checkMail(this.id,'reject')"> 
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