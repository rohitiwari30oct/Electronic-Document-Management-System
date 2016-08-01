<%@page import="java.util.Collections"%>
<%@page import="edms.core.LDAPUserList"%>
<%@page import="java.util.List"%>
<%@page import="javax.naming.directory.Attribute"%>
<%@page import="javax.naming.directory.Attributes"%>
<%@page import="edms.core.LDAPConnection"%>
<%@page import="javax.naming.directory.DirContext"%>
<%@page import="edms.core.Config"%>
<%@page import="edms.core.Principal"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	//$("#formBy").autocomplete("${pageContext.request.contextPath}/autocomp");
	//$("#formTo").autocomplete("${pageContext.request.contextPath}/autocomp");
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
function addTrTable() {
	var hid_old_val=parseInt( $("#hid_tr_val").val()); 
	//alert(hid_old_val);
	if(hid_old_val<50)
		{
	var hid_val=hid_old_val+1;
	

	$("#serialNo"+hid_val).addClass("blank_val");
	 $("#itemCode"+hid_val).addClass("blank_val");
	 $("#itemDescription"+hid_val).addClass("blank_val");
	 $("#itemUnit"+hid_val).addClass("blank_val");
	 $("#itemPacking"+hid_val).addClass("blank_val");
	 $("#itemQuantity"+hid_val).addClass("blank_val");
	 $("#itemSource"+hid_val).addClass("blank_val");

//	$('#tr_'+hid_old_val).after(val);
	$('#tr_'+hid_val).show();
	 $("#hid_tr_val").val(hid_val);
		}
}

function remTrTable() {
	var i=parseInt( $("#hid_tr_val").val()); 
	if(i>2)
	{
		$("#serialNo"+i).val("");
		 $("#itemCode"+i).val("");
		 $("#itemDescription"+i).val("");
		 $("#itemUnit"+i).val("");
		 $("#itemPacking"+i).val("");
		 $("#itemQuantity"+i).val("");
		 $("#itemSource"+i).val("");
		 
		 var hid_val=i;
		 $("#serialNo"+hid_val).removeClass("blank_val");
		 $("#itemCode"+hid_val).removeClass("blank_val");
		 $("#itemDescription"+hid_val).removeClass("blank_val");
		 $("#itemUnit"+hid_val).removeClass("blank_val");
		 $("#itemPacking"+hid_val).removeClass("blank_val");
		 $("#itemQuantity"+hid_val).removeClass("blank_val");
		 $("#itemSource"+hid_val).removeClass("blank_val");
		 
		$('#tr_'+i).hide("");
		 $("#hid_tr_val").val(i-1);
	}
}

</script>



<script type="text/javascript">
function checkMail(id,dec){
/* 	var mailChk=$('#formTo').val();
	 var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	    
	if(re.test(mailChk))
		proceedTheForm(respnse);
	else
		alert("Please enter mail id"); */
		
		var pg=true;
		
		if(dec=="accept"){
		$(".blank_val").each(function() {
		    if($(this).val()=="" || $(this).val()==null)
		    	{
		    	pg=false;
		    	}
		});
		
		if($('input[name="priorityAboutTime"]:checked').length<=0)
		{
		pg=false;
		showMsgWF("Please chose form priority");
		} 
		 else if($("#formBy").val()==null || $("#formBy").val().trim()=="index")
		{
		pg=false;
		showMsgWF("Please Fill Indentor email field");
		}
		else if($("#formTo").val()==null || $("#formTo").val().trim()=="index")
			{
			pg=false;
			showMsgWF("Please Fill Indent Authorised/Approved By email field");
			}
		 
		else if( $('input[name="natureOfMaterial"]:checked').length<=0)
		{
		pg=false;
		showMsgWF("Please chose Nature of Materials");
		} 
		else if($('input[name="typo"]:checked').length<=0)
		{
		pg=false;
		showMsgWF("Please Check atleast one Category of Material");
		}
		else if($("#deptName").val()==null || $("#deptName").val().trim()=="index")
		{
		pg=false;
		showMsgWF("Please Select Department Name!");
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
				}
				else{
					$('#historyHiddenTasks').attr("value",$('#historyHiddenTasks').val()+"Rejected By " + $("#formBy").val()+" on Dated "+today+",") ;
					$('#formSStatus').attr("value","Rejected") ;
					}
				
				
				$("#action_gif").show();
			}
			catch (e) {
				// TODO: handle exception
			}
			$("#"+id).attr("disabled",true);
			proceedTheForm(dec)
			}else
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

function setChkbox(id)
{
if($('#'+id).is(':checked'))
	{
	$('#'+id).attr('checked', true);
	}
else
	{
	$('#'+id).attr('checked', false);
	}
}

function setRadioTye(val)
{
$(':radio[name="priorityAboutTime"][id='+val+']').attr('checked', 'checked');
}

function setRadioNature(val)
{
$(':radio[name="natureOfMaterial"][id='+val+']').attr('checked', 'checked');
}

$('#deptName').on('change', function() {
	  $('option:selected', this).attr('selected',true).siblings().removeAttr('selected');
	});
	
$('#locationName').on('change', function() {
	  $('option:selected', this).attr('selected',true).siblings().removeAttr('selected');
	});
	
$('#indentlocationName').on('change', function() {
	  $('option:selected', this).attr('selected',true).siblings().removeAttr('selected');
	});
	
$('#formBy').on('change', function() {
	  $('option:selected', this).attr('selected',true).siblings().removeAttr('selected');
	});
$('#formTo').on('change', function() {
	  $('option:selected', this).attr('selected',true).siblings().removeAttr('selected');
	});
	
</script>
</head>
<body >
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
<div class="form_scolling_project"  id="myformPurPlant">
		<div class="from_main_leave" >
			<table id="handleWorkflowForm">
<tr>
				<td rowspan="2">
				<img src="images/logo.png">
				</td>
					<td  colspan="5" rowspan="2" class="table_heading">
						PURCHASE REQUISITION (Head Office)
						 <input type="hidden" value="<%=dt %>" name="filledDaete" id="filledDaete" /> 
                <input type="hidden"  name="formSStatus"  id="formSStatus" /> 
						<input type="hidden" value="Purchase Requisition (HO)" name="formNameWF" id="formNameWF" /> 
					</td>
					<td colspan="2">
						P.R.No: 
						<input type="text" onblur="myVal(this.id)" id="prNo" name="prNo" class="small_medical" placeholder="Enter P.R.No">
					</td>
				</tr>
				<tr >
					<td colspan="2" >
						Date &nbsp;&nbsp;&nbsp;&nbsp;
						<input	type="text" onblur="myVal(this.id)"  id="todaysDate" name="todaysDate" class="small_medical popupDatepicker" placeholder="dd-MM-yyyy">
					</td>
				</tr>
					<tr>
				<td colspan="8">
				<table><tr>
					<td >
							<label><input type="radio" name="priorityAboutTime" id="mostUrgent" value="Most Urgent"/>
							MOST URGENT</label>
					</td>
					<td >
							<label><input type="radio" name="priorityAboutTime"  id="immediate" value="Immediate"/>
							IMMEDIATE </label>
					</td>
					<td >
							<label><input type="radio" name="priorityAboutTime" id="routinePurchase" value="Routine Purchase"/>
							ROUTINE PURCHASE</label>
					</td>
				</tr></table>
				
				</td>
				<tr>
					<td colspan="8" class="clearBorderBottom" >
						<strong>Indentor : </strong>
					</td >
					</tr>
				<tr>
					<td colspan="2"   class="clearBorderRight" >
					Name: <br>
					<input  type="text" onblur="myVal(this.id)" id="empName" name="empName" value="" placeholder="Name"/>	
					<input type="hidden" id="formName" name="formName" value="Purchase Requisition Application" placeholder="Name"/>	
					</td>
					<td  colspan="2"  class="clearBorderRight" >
					Email:  <br>
					<%-- <input  id="formBy" name="formBy" type="text" onblur="myVal(this.id)" value="<%=uid %>" class="small_medical" placeholder="emailid" /> --%>
					<select id="formBy" name="formBy" disabled="disabled">
               <option value="index">Please Select </option>
               <%
               for(String lst: ulst)
               {
               %>
               <option value="<%=lst %>"><%=lst %> </option>
               <%} %>
               </select>
					</td>
					<td   colspan="2"  class="clearBorderRight" >
					Dept: <br>
						<select id="deptName" name="deptName">
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
						
					</td>
					<td  colspan="2"  >Location: <br>
						<select  id="locationName" name="locationName">
						<option value="ho">Head Office</option>
							<!-- <option value="plant">Plant</option> -->
							
							<!-- <option value="rnd">R&D</option>
							<option value="others">Others</option> -->
						</select>
					 </td>
				</tr>
			
				<tr>
					<td colspan="8"  class="clearBorderBottom" >
						<label><strong>Indent Authorised/Approved By</strong></label>	
					</td>
				</tr>
				<tr>
					
					<td   colspan="3" class="clearBorderRight"><label>Email:</label><br>
					<select id="formTo" name="formTo" >
               <option value="index">Please Select </option>
               <%
               for(String lst: ulst)
               {
               %>
               <option value="<%=lst %>"><%=lst %> </option>
               <%} %>
               </select>
					
						 <!-- <input type="text"  onblur="myVal(this.id)" name="formTo"  id="formTo"/>  -->
						</td>
						<td   colspan="5" >
						<label>Location:</label><br>
						<select id="indentlocationName" name="indentlocationName">
							 <option value="plant">Plant</option> 
							<option value="ho">Head Office</option>
						</select>
						</td>
				</tr>
				
				<tr>
					<td colspan="8"  class="clearBorderBottom">
						<label><strong>Nature of Materials:</strong></label>
						</td></tr>
						
						<tr>
						<td colspan="8">
					<table><tr>
					<td   class="clearBorderRight">
						
						  <label> <input type="radio"  name="natureOfMaterial" id="stockItem" value="Stock Item" />Stock Item</label>
						</td>
					<td   class="clearBorderRight"> 
					 <label> <input  type="radio" name="natureOfMaterial" id="localPurchase"  value="Local Purchase" />Local Purchase</label>
					</td>
					<td >
						  <label> <input  type="radio"  name="natureOfMaterial" id="regularPurchase" value="Regular Purchase" />Regular Purchase</label>
					</td>
					
					</tr></table>
				</td>
				</tr>
				
				<tr>
				<td colspan="8">
				<strong>Category of Material Required:</strong>
				</td>
				</tr>
				
				<tr>
				<td colspan="8">
				<table><tr height="35px;">
					<td colspan="2"  class="clearBorderRight clearBorderBottom">
						<label><input   type="checkbox" name="typo" id="rawMaterials"	placeholder="RAW MATERIALS" value="RAW MATERIALS" />
						RAW MATERIALS</label>
						</td>
					<td colspan="2"  class="clearBorderRight clearBorderBottom">
						<label> <input  type="checkbox" id="components" name="typo" value="COMPONENTS &amp; SPARES	ADMIN.STORES" /> 
						COMPONENTS &amp; SPARES	ADMIN.STORES</label>
						</td>
					<td colspan="2" class="clearBorderBottom">
						<label> <input   type="checkbox" id="adminStores" name="typo" value="ADMIN STORES"/>
						ADMIN STORES</label>
					</td>
				</tr>
				<tr height="35px;">
					<td colspan="2"  class="clearBorderRight clearBorderBottom">
						<label><input  type="checkbox" name="typo" id="productionCousumables" value="PRODUCTION CONSUMABLES"  />
						PRODUCTION CONSUMABLES</label>
						</td>
					<td colspan="2"  class="clearBorderRight clearBorderBottom">
						<label><input   type="checkbox" id="maintainanceConsumables" name="typo" value="MAINTENANCE CONSUMABLES" />
						MAINTENANCE CONSUMABLES</label>
						</td>
					<td colspan="2" class="clearBorderBottom">
						<label> <input   type="checkbox" id="miscStores" name="typo"  value="MISC.STORES" />
						MISC.STORES</label>
					</td>
				</tr>
				<tr height="35px;">
					<td colspan="2"  class="clearBorderRight">
						<label> <input   type="checkbox" id="packagingMaterials" name="typo" value="PACKAGING MATERIALS" />
						PACKAGING MATERIALS</label> 
						</td>
					<td colspan="2"  class="clearBorderRight">
						<label> <input  	type="checkbox" id="labMatls" name="typo" value="LAB MATLS" />
						LAB MATLS</label>
						</td>
					<td colspan="2">
						<label> <input  type="checkbox" id="it" name="typo" value="IT" />
						IT</label> 
					</td></tr>
					<tr height="35px;">
					<td colspan="2"  class="clearBorderRight">
						<label> <input type="checkbox" onclick="setChkbox(this.id)" id="fixedasset" name="typo" value="FIXED ASSET" />
						FIXED ASSET</label> 
						</td>
						<td></td>
						<td></td>
				</tr>
					
					</table></td>
				</tr>
				<tr height="35px;">
				<td colspan="8">
				<table style="border-width: 1px;" style="width: 420px;">
				<tr >
					<td style="width: 50px;" align="center" ><strong>S.No</strong></td>
					<td style="width: 75px;"  align="center"><strong>Item Code</strong></td>
					<td style="width: 363px;" align="center"><strong>Description</strong></td>
					<td style="width: 75px;"  align="center"><strong>Unit</strong></td>
					<td style="width: 75px;"  align="center"><strong>Packing</strong></td>
					<td style="width: 75px;"  align="center"><strong>Quantity</strong></td>
					<td   align="center"><strong>Source<br/>(For LPO/PO)</strong></td>
				</tr>
				<tr height="35px;" >
				<input type="hidden" name="hid_tr_val" id="hid_tr_val" value="1">
					<td><input style="width: 50px;" type="text"  onblur="myVal(this.id)"  id="serialNo1" name="serialNo1" class="blank_val" /></td>
					<td><input style="width: 75px;" type="text"  onblur="myVal(this.id)" id="itemCode1" name="itemCode1" class="blank_val"  /></td>
					<td><input style="width: 363px;" type="text"  onblur="myVal(this.id)" id="itemDescription1" name="itemDescription1"  class="blank_val" /></td>
					<td><input style="width: 75px;"  type="text"  onblur="myVal(this.id)" id="itemUnit1" name="itemUnit1"  class="blank_val" /></td>
					<td><input style="width: 75px;"  type="text"  onblur="myVal(this.id)" id="itemPacking1" name="itemPacking1"  class="blank_val" /></td>
					<td><input style="width: 75px;"  type="text"  onblur="myVal(this.id)"  id="itemQuantity1" name="itemQuantity1"  class="blank_val"  /></td>
					<td><input type="text"  onblur="myVal(this.id)"  id="itemSource1" name="itemSource1"  /></td>
				</tr>
				<tr height="35px;" id="tr_2" style="display: none;" >
					<td><input style="width: 50px;"  type="text"  onblur="myVal(this.id)"  id="serialNo2" name="serialNo2" /></td>
					<td><input style="width: 75px;" type="text"  onblur="myVal(this.id)" id="itemCode2" name="itemCode2" /></td>
					<td><input style="width: 363px;" type="text"  onblur="myVal(this.id)" id="itemDescription2" name="itemDescription2" /></td>
					<td><input style="width: 75px;"  type="text"  onblur="myVal(this.id)" id="itemUnit2" name="itemUnit2" /></td>
					<td><input style="width: 75px;"  type="text"  onblur="myVal(this.id)" id="itemPacking2" name="itemPacking2" /></td>
					<td><input style="width: 75px;"  type="text"  onblur="myVal(this.id)"  id="itemQuantity2" name="itemQuantity2"  /></td>
					<td><input type="text"  onblur="myVal(this.id)"  id="itemSource2" name="itemSource2" /></td>
				</tr>
				
				<tr height="35px;" style="display: none;" id="tr_3" >
					<td><input  style="width: 50px;" type="text"  onblur="myVal(this.id)"  id="serialNo3" name="serialNo3" /></td>
					<td><input style="width: 75px;" type="text"  onblur="myVal(this.id)" id="itemCode3" name="itemCode3" /></td>
					<td><input  style="width:363px;" type="text"  onblur="myVal(this.id)" id="itemDescription3" name="itemDescription3" /></td>
					<td><input style="width: 75px;"  type="text"  onblur="myVal(this.id)" id="itemUnit3" name="itemUnit3" /></td>
					<td><input style="width: 75px;"  type="text"  onblur="myVal(this.id)" id="itemPacking3" name="itemPacking3" /></td>
					<td><input style="width: 75px;"  type="text"  onblur="myVal(this.id)"  id="itemQuantity3" name="itemQuantity3"  /></td>
					<td><input type="text"  onblur="myVal(this.id)"  id="itemSource3" name="itemSource3" /></td>
				</tr>
				
				<tr height="35px;" style="display: none;" id="tr_4" >
					<td><input style="width: 50px;"  type="text"  onblur="myVal(this.id)"  id="serialNo4" name="serialNo4" /></td>
					<td><input style="width: 75px;" type="text"  onblur="myVal(this.id)" id="itemCode4" name="itemCode4" /></td>
					<td><input  style="width:363px;" type="text"  onblur="myVal(this.id)" id="itemDescription4" name="itemDescription4" /></td>
					<td><input style="width: 75px;"  type="text"  onblur="myVal(this.id)" id="itemUnit4" name="itemUnit4" /></td>
					<td><input style="width: 75px;"  type="text"  onblur="myVal(this.id)" id="itemPacking4" name="itemPacking4" /></td>
					<td><input style="width: 75px;"  type="text"  onblur="myVal(this.id)"  id="itemQuantity4" name="itemQuantity4"  /></td>
					<td><input type="text"  onblur="myVal(this.id)"  id="itemSource4" name="itemSource4" /></td>
				</tr>
				
				<tr height="35px;" style="display: none;" id="tr_5" >
					<td><input style="width: 50px;"  type="text"  onblur="myVal(this.id)" id="serialNo5" name="serialNo5" /></td>
					<td><input style="width: 75px;" type="text"  onblur="myVal(this.id)" id="itemCode5" name="itemCode5" /></td>
					<td><input  style="width:363px;" type="text"  onblur="myVal(this.id)" id="itemDescription5" name="itemDescription5" /></td>
					<td><input  style="width: 75px;" type="text"  onblur="myVal(this.id)" id="itemUnit5" name="itemUnit5" /></td>
					<td><input style="width: 75px;"  type="text"  onblur="myVal(this.id)" id="itemPacking5" name="itemPacking5" /></td>
					<td><input  style="width: 75px;" type="text"  onblur="myVal(this.id)"  id="itemQuantity5" name="itemQuantity5"  /></td>
					<td><input type="text"  onblur="myVal(this.id)"  id="itemSource5" name="itemSource5" /></td>
				</tr>
				
				<tr height="35px;" style="display: none;" id="tr_6" >
					<td><input style="width: 50px;"  type="text"  onblur="myVal(this.id)"  id="serialNo6" name="serialNo6" /></td>
					<td><input style="width: 75px;" type="text"  onblur="myVal(this.id)" id="itemCode6" name="itemCode6" /></td>
					<td><input  style="width:363px;" type="text"  onblur="myVal(this.id)" id="itemDescription6" name="itemDescription6" /></td>
					<td><input style="width: 75px;"  type="text"  onblur="myVal(this.id)" id="itemUnit6" name="itemUnit6" /></td>
					<td><input style="width: 75px;"  type="text"  onblur="myVal(this.id)" id="itemPacking6" name="itemPacking6" /></td>
					<td><input style="width: 75px;"  type="text"  onblur="myVal(this.id)"  id="itemQuantity6" name="itemQuantity6"  /></td>
					<td><input type="text"  onblur="myVal(this.id)"  id="itemSource6" name="itemSource6" /></td>
				</tr>
				
				<tr height="35px;" style="display: none;" id="tr_7" >
					<td><input style="width: 50px;"  type="text"  onblur="myVal(this.id)"  id="serialNo7" name="serialNo7" /></td>
					<td><input style="width: 75px;" type="text"  onblur="myVal(this.id)" id="itemCode7" name="itemCode7" /></td>
					<td><input  style="width:363px;" type="text"  onblur="myVal(this.id)" id="itemDescription7" name="itemDescription7" /></td>
					<td><input style="width: 75px;"  type="text"  onblur="myVal(this.id)" id="itemUnit7" name="itemUnit7" /></td>
					<td><input style="width: 75px;"  type="text"  onblur="myVal(this.id)" id="itemPacking7" name="itemPacking7" /></td>
					<td><input style="width: 75px;"  type="text"  onblur="myVal(this.id)"  id="itemQuantity7" name="itemQuantity7"  /></td>
					<td><input type="text"  onblur="myVal(this.id)"  id="itemSource7" name="itemSource7" /></td>
				</tr>
				
				<tr height="35px;" style="display: none;" id="tr_8" >
					<td><input style="width: 50px;"  type="text"  onblur="myVal(this.id)"  id="serialNo8" name="serialNo8" /></td>
					<td><input style="width: 75px;" type="text"  onblur="myVal(this.id)" id="itemCode8" name="itemCode8" /></td>
					<td><input  style="width:363px;" type="text"  onblur="myVal(this.id)" id="itemDescription8" name="itemDescription8" /></td>
					<td><input style="width: 75px;"  type="text"  onblur="myVal(this.id)" id="itemUnit8" name="itemUnit8" /></td>
					<td><input style="width: 75px;"  type="text"  onblur="myVal(this.id)" id="itemPacking8" name="itemPacking8" /></td>
					<td><input style="width: 75px;"  type="text"  onblur="myVal(this.id)"  id="itemQuantity8" name="itemQuantity8"  /></td>
					<td><input type="text"  onblur="myVal(this.id)"  id="itemSource8" name="itemSource8" /></td>
				</tr>
				
				<tr height="35px;" style="display: none;" id="tr_9" >
					<td><input style="width:50px;"  type="text"  onblur="myVal(this.id)"  id="serialNo9" name="serialNo9" /></td>
					<td><input style="width: 75px;" type="text"  onblur="myVal(this.id)" id="itemCode9" name="itemCode9" /></td>
					<td><input  style="width:363px;" type="text"  onblur="myVal(this.id)" id="itemDescription9" name="itemDescription9" /></td>
					<td><input style="width: 75px;"  type="text"  onblur="myVal(this.id)" id="itemUnit9" name="itemUnit9" /></td>
					<td><input style="width: 75px;"  type="text"  onblur="myVal(this.id)" id="itemPacking9" name="itemPacking9" /></td>
					<td><input style="width: 75px;"  type="text"  onblur="myVal(this.id)"  id="itemQuantity9" name="itemQuantity9"  /></td>
					<td><input type="text"  onblur="myVal(this.id)"  id="itemSource9" name="itemSource9" /></td>
				</tr>
				
				<tr height="35px;" style="display: none;" id="tr_10" >
					<td><input style="width: 50px;"  type="text"  onblur="myVal(this.id)"  id="serialNo10" name="serialNo10" /></td>
					<td><input style="width: 75px;" type="text"  onblur="myVal(this.id)" id="itemCode10" name="itemCode10" /></td>
					<td><input  style="width:363px;" type="text"  onblur="myVal(this.id)" id="itemDescription10" name="itemDescription10" /></td>
					<td><input style="width: 75px;" type="text"  onblur="myVal(this.id)" id="itemUnit10" name="itemUnit10" /></td>
					<td><input style="width: 75px;"  type="text"  onblur="myVal(this.id)" id="itemPacking10" name="itemPacking10" /></td>
					<td><input style="width: 75px;"  type="text"  onblur="myVal(this.id)"  id="itemQuantity10" name="itemQuantity10"  /></td>
					<td><input type="text"  onblur="myVal(this.id)"  id="itemSource10" name="itemSource10" /></td>
				</tr>
				
				
				</table>
				</td></tr>
				 <tr>
					<td colspan="8">
						<div class="addanddelete">
							<div onclick="addTrTable()" class="add_table"></div>
							<div onclick="remTrTable()" class="delete_table"></div>
						</div>
					</td>
				</tr> 
				<tr>
				  <td colspan="8">
                <table>
                <tr>
                <td width="10%"> Initiated By</td>
                <td width="85%"><input readonly="readonly"  type="text" onblur="myVal(this.id)"  style="width: 65% !important; border: 0px;" value="<%=uid %>" id="employeeID" name="employeeID"  /></td>
                </tr>
                </table>
               
               
                </td>
              
              </tr>
              
              <tr>
               <td colspan="8">
               <table>
                <tr>
                <td width="10%"> Verified By</td>
                <td width="85%"><input readonly="readonly"  type="text" onblur="myVal(this.id)"   style="width: 65% !important; border: 0px;" value="" id="verifiedBy" name="verifiedBy"  /></td>
                </tr>
                </table>
               
                </td>
              </tr>
              
              <tr>
               <td colspan="8">
                <table>
                <tr>
                <td width="10%"> Approved By</td>
                <td width="85%"><input readonly="readonly"  type="text" onblur="myVal(this.id)"  style="width: 65% !important; border: 0px;" value="" id="approvedBy" name="approvedBy"  /></td>
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
                     
                     	<tr>
                     	
						<td colspan="8"><input type="hidden" id="attachmentID"
						name="attachmentID"> <input type="button"
						value="Get Attachment" onclick="getAtt()" class="getAttch" />
						<div id="attlch"></div></td>
							
				
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
						
						<td colspan="8"><div class="table_right">
								<!----------/// ADD USER ----------->
								<!-- <div class="Logged_User_tab_color add_user_js add_user_bg">SAVE</div> -->
								<input type="button" id="plantpur1"
									class="Logged_User_tab_color add_user_js add_user_bg"
									value="VERIFY" onclick="checkMail(this.id,'accept')">
								<!----------/// ADD USER END -------->
								<!----------/// User List ----------->
								<!--   <div class="Logged_User_tab  onclick">CANCEL</div> -->
									<input type="button" class="Logged_User_tab  onclick" id="rejprho"
									value="REJECT" onclick="checkMail(this.id,'reject')">
								<!----------/// User List END -------->
<input type="button"
								class="Logged_User_tab_color add_user_js add_user_bg"
								value="Print"
								onclick="printDiv()">
							</div></td>
					</tr>
			</table>

		</div>
	</div>
</body>
</html>