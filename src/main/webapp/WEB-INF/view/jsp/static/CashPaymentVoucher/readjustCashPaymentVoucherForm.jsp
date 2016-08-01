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
	//$("#formTo").autocomplete("${pageContext.request.contextPath}/autocomp");
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

	setTimeout(function(){ tr_load(); }, 1000);
});



function tr_load() {
	var hid_val=parseInt( $("#hid_tr_val").val()); 
	for(var i=2;i<=hid_val;i++)
		{
		$('#vrec_'+i).show();
		}
	
}

function addTrTable() {
	var hid_old_val=parseInt( $("#hid_tr_val").val()); 
	//alert(hid_old_val);
	if(hid_old_val<15)
		{
	var hid_val=hid_old_val+1;
	
	 $("#voucherDate"+hid_val).addClass("blank_val");
	 $("#voucherParticular"+hid_val).addClass("blank_val");
	 $("#voucherRs"+hid_val).addClass("blank_val");
	$('#vrec_'+hid_val).show();
	 $("#hid_tr_val").val(hid_val);
		}
}

function remTrTable() {
	var i=parseInt( $("#hid_tr_val").val()); 
	if(i>1)
	{
		 $("#voucherDate"+i).val("");
		 $("#voucherParticular"+i).val("");
		// $("#itemDescription"+i).val("");
		 $("#voucherRs"+i).val("");
		 $("#voucherDate"+i).removeClass("blank_val");
		 $("#voucherParticular"+i).removeClass("blank_val");
		 $("#voucherRs"+i).removeClass("blank_val");
		 $('#vrec_'+i).hide();
		 $("#hid_tr_val").val(i-1);
	}
}

function calTotal() {
	var n=parseInt( $("#hid_tr_val").val());
	var tot="";
	var rs=0;
	var p=0;
	for(var i=1;i<=n;i++)
		{
		var valrs=$("#voucherRs"+i).val();
		if(valrs!=null && valrs!="")
			{
			rs+=parseInt(valrs);
			}
		
		}
	//rs+=(p%100);
	//p= p/100;
	//alert(p%100)
	//alert(rs+(p/100))
	$("#voucherTotal").attr('value',rs+(p/100));
	
}

function valiForm(id)
{
	var pg=true;
	
	$(".blank_val").each(function() {
	    if($(this).val()=="" || $(this).val()==null)
	    	{
	    	pg=false;
	    	}
	});
	

	
	
	 if($("#formTo").val()=="index" || $("#formBy").val()=="index")
		{
		pg=false;
		showMsgWF("Please select From and To field");
		}
	 else{
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
		$('#historyHiddenTasks').attr("value",$('#historyHiddenTasks').val()+"Resubmitted By " + $("#formBy").val()+" on Dated "+today+",") ;
		$('#formSStatus').attr("value","Resubmitted") ;
		
			$("#action_gif").show();
			
					}
		catch (e) {
			// TODO: handle exception
		}
		$("#"+id).attr("disabled",true);
		proceedTheForm('accept');
		}
	else
		{
		showMsgWF("Please Fill all fields");
		}
}}


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
%>
	<div class="form_scolling_project" id="myformPurPlant">
		<div class="from_main_leave">
			 <table id="handleWorkflowForm">
              <tbody><tr>
              <td colspan="1" width="20%"><img src="images/logo.png"></td>
                <td colspan="2" width="60%" class="table_heading">CASH PAYMENT VOUCHER&nbsp;<br>
                <input type="hidden" value="<%=dt %>" name="filledDaete"  id="filledDaete" />
               
                <input type="hidden"  name="formSStatus"  id="formSStatus" />
                 </td>
                  <td width="20%" class="voucher">
                    VOUCHER NO.
                    <input type="hidden" value="Cash Payment Voucher" name="formNameWF" id="formNameWF" /> 
                    <input type="text" disabled="disabled" onblur="myVal(this.id)" id="voucherNo" name="voucherNo" placeholder=" VOUCHER NO" /><br>
                    
                    <input type="text" onblur="myVal(this.id)" id="todaysDate" name="todaysDate"  class="blank_val popupDatepicker" placeholder="dd-MM-yyyy">
                 </td>
              </tr>
              <tr class="cash_1">
              
                <td  colspan="4">
                 <table >
                              <tbody><tr><td>
               From  <select id="formBy" name="formBy" style="    width: 80%;">
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
               
             <%--   <input type="text" class="blank_val"  onblur="myVal(this.id)" style="width: 80%;" value="<%=uid %>"  id="formBy" name="formBy" /> --%>
                </td><td>
               To 
               <select id="formTo" name="formTo" style="    width: 80%;">
               <option value="index">Please Select </option>
               <%
               for(String lst: ulst)
               {
               %>
               <option value="<%=lst %>"><%=lst %> </option>
               <%} %>
               </select>
               <!-- <input type="text"  class="blank_val" onblur="myVal(this.id)" style="width: 80%;"  id="formTo" name="formTo" /> -->
                </td></tr></tbody></table>
                </td>
              </tr>
              <tr class="cash_1">
                <td width="169">DATE</td>
                <td colspan="2">PARTICULARS .</td>
                <td>
                          <table class="rupee">
                              <tbody><tr>
                                <td  class="table_border" style="width: 95px;">Rs</td>
                                <td></td>
                              </tr>
                          </tbody></table>
                </td>
              </tr>
              <tr id="vrec_1">
              <input type="hidden" name="hid_tr_val" id="hid_tr_val" value="1">
                <td><input type="text"   onblur="myVal(this.id)" id="voucherDate1" name="voucherDate1" value="<%=dt %>" class="blank_val popupDatepicker" placeholder="dd-MM-yyyy"></td>
                <td colspan="2"><textarea rows="2" cols="25"  onblur="myTextareaVal(this.id)" id="voucherParticular1" class="blank_val" style="width: 97% !important;height:80px;"  name="voucherParticular1" class="particular" placeholder="PARTICULARS "></textarea></td>
                <td class="rupee_td"> <table class="rupee">
                <tbody><tr><td width="65%"><input class="blank_val" type="text"  onblur="myVal(this.id)" id="voucherRs1" name="voucherRs1"  class="only_num"  placeholder="Rs." style="width: 80% !important;"></td>
                 <td width="35%"></td> </tr></tbody></table> </td>
              </tr>
               
               <tr  style="display: none;" id="vrec_2">
              <td><input type="text"  onblur="myVal(this.id)" id="voucherDate2" name="voucherDate2" value="<%=dt %>" class="popupDatepicker" placeholder="dd-MM-yyyy"></td>
                <td colspan="2"><textarea rows="2" cols="25"  onblur="myTextareaVal(this.id)" id="voucherParticular2" style="width: 97% !important;height:80px;"  name="voucherParticular2" class="particular" placeholder="PARTICULARS "></textarea></td>
                <td class="rupee_td"> <table class="rupee">
                <tbody><tr><td width="65%"><input type="text"  onblur="myVal(this.id)" id="voucherRs2" name="voucherRs2" class="only_num"  placeholder="Rs." style="width: 80% !important;"></td>
                 <td width="35%"></td> </tr></tbody></table> </td>
              </tr>
			  
			  
			  <tr  style="display: none;" id="vrec_3">
                <td><input type="text"  onblur="myVal(this.id)" id="voucherDate3" name="voucherDate3" value="<%=dt %>" class="popupDatepicker" placeholder="dd-MM-yyyy"></td>
                <td colspan="2"><textarea rows="2" cols="25"  onblur="myTextareaVal(this.id)" id="voucherParticular3" style="width: 97% !important;height:80px;"  name="voucherParticular3" class="particular" placeholder="PARTICULARS "></textarea></td>
                <td class="rupee_td"> <table class="rupee">
              
                <tbody><tr><td width="65%"><input type="text"  onblur="myVal(this.id)" id="voucherRs3" name="voucherRs3" class="only_num"  placeholder="Rs." style="width: 80% !important;"></td>
                 <td width="35%"></td> </tr></tbody></table> </td>
              </tr>
			  
			  
			  <tr style="display: none;" id="vrec_4">
                <td><input type="text"  onblur="myVal(this.id)" id="voucherDate4" name="voucherDate4" value="<%=dt %>" class="popupDatepicker" placeholder="dd-MM-yyyy"></td>
                <td colspan="2"><textarea rows="2" cols="25"  onblur="myTextareaVal(this.id)" id="voucherParticular4" style="width: 97% !important;height:80px;"  name="voucherParticular4" class="particular" placeholder="PARTICULARS "></textarea></td>
                <td class="rupee_td"> <table class="rupee">
                <tbody><tr><td width="65%"><input type="text"  onblur="myVal(this.id)" id="voucherRs4" name="voucherRs4" class="only_num"  placeholder="Rs." style="width: 80% !important;"></td>
                 <td width="35%"></td> </tr></tbody></table> </td>
              </tr>
			  
			  
			  <tr style="display: none;" id="vrec_5">
                <td><input type="text"  onblur="myVal(this.id)" id="voucherDate5" name="voucherDate5" value="<%=dt %>" class="popupDatepicker" placeholder="dd-MM-yyyy"></td>
                <td colspan="2"><textarea rows="2" cols="25"  onblur="myTextareaVal(this.id)" id="voucherParticular5" style="width: 97% !important;height:80px;"  name="voucherParticular5" class="particular" placeholder="PARTICULARS "></textarea></td>
                <td class="rupee_td"> <table class="rupee">
                <tbody><tr><td width="65%"><input type="text"  onblur="myVal(this.id)" id="voucherRs5" name="voucherRs5" class="only_num"  placeholder="Rs." style="width: 80% !important;"></td>
                 <td width="35%"></td> </tr></tbody></table></td>
              </tr>
			  
			  <tr  style="display: none;"  id="vrec_6">
                <td><input type="text"  onblur="myVal(this.id)" id="voucherDate6" name="voucherDate6" value="<%=dt %>" class="popupDatepicker" placeholder="dd-MM-yyyy"></td>
                <td colspan="2"><textarea rows="2" cols="25"  onblur="myTextareaVal(this.id)" id="voucherParticular6" style="width: 97% !important;height:80px;"  name="voucherParticular6" class="particular" placeholder="PARTICULARS "></textarea></td>
                <td class="rupee_td"> <table class="rupee">
                <tbody><tr><td width="65%"><input type="text"  onblur="myVal(this.id)" id="voucherRs6" name="voucherRs6" class="only_num"  placeholder="Rs." style="width: 80% !important;"></td>
                 <td width="35%"></td> </tr></tbody></table> </td>
              </tr>
			  
			  <tr style="display: none;" id="vrec_7">
                <td><input type="text"  onblur="myVal(this.id)" id="voucherDate7" name="voucherDate7" value="<%=dt %>" class="popupDatepicker" placeholder="dd-MM-yyyy"></td>
                <td colspan="2"><textarea rows="2" cols="25"  onblur="myTextareaVal(this.id)" id="voucherParticular7" style="width: 97% !important;height:80px;"  name="voucherParticular7" class="particular" placeholder="PARTICULARS "></textarea></td>
                <td class="rupee_td"> <table class="rupee">
                <tbody><tr><td width="65%"><input type="text"  onblur="myVal(this.id)" id="voucherRs7" name="voucherRs7" class="only_num"  placeholder="Rs." style="width: 80% !important;"></td>
                 <td width="35%"></td> </tr></tbody></table> </td>
              </tr>
			  
			  <tr style="display: none;" id="vrec_8">
                <td><input type="text"  onblur="myVal(this.id)" id="voucherDate8" name="voucherDate8" value="<%=dt %>" class="popupDatepicker" placeholder="dd-MM-yyyy"></td>
                <td colspan="2"><textarea rows="2" cols="25"  onblur="myTextareaVal(this.id)" id="voucherParticular8" style="width: 97% !important;height:80px;"  name="voucherParticular8" class="particular" placeholder="PARTICULARS "></textarea></td>
                <td class="rupee_td"> <table class="rupee">
                <tbody><tr><td width="65%"><input type="text"  onblur="myVal(this.id)" id="voucherRs8" name="voucherRs8" class="only_num"  placeholder="Rs." style="width: 80% !important;"></td>
                 <td width="35%"></td> </tr></tbody></table></td>
              </tr>
			  
			  <tr style="display: none;" id="vrec_9">
                <td><input type="text"  onblur="myVal(this.id)" id="voucherDate9" name="voucherDate9" value="<%=dt %>" class="popupDatepicker" placeholder="dd-MM-yyyy"></td>
                <td colspan="2"><textarea rows="2" cols="25"  onblur="myTextareaVal(this.id)" id="voucherParticular9" style="width: 97% !important;height:80px;"  name="voucherParticular9" class="particular" placeholder="PARTICULARS "></textarea></td>
                <td class="rupee_td"> <table class="rupee">
                <tbody><tr><td width="65%"><input type="text"  onblur="myVal(this.id)" id="voucherRs9" name="voucherRs9" class="only_num"  placeholder="Rs." style="width: 80% !important;"></td>
                 <td width="35%"></td> </tr></tbody></table> </td>
              </tr>
			  
			  <tr style="display: none;" id="vrec_10">
                <td><input type="text"  onblur="myVal(this.id)" id="voucherDate10" name="voucherDate10" value="<%=dt %>" class="popupDatepicker" placeholder="dd-MM-yyyy"></td>
                <td colspan="2"><textarea rows="2" cols="25"  onblur="myTextareaVal(this.id)" id="voucherParticular10" style="width: 97% !important;height:80px;"  name="voucherParticular10" class="particular" placeholder="PARTICULARS "></textarea></td>
                <td class="rupee_td"> <table class="rupee">
                <tbody><tr><td width="65%"><input type="text"  onblur="myVal(this.id)" id="voucherRs10" name="voucherRs10" class="only_num"  placeholder="Rs." style="width: 80% !important;"></td>
                 <td width="35%"></td> </tr></tbody></table> </td>
              </tr>
			  
			  <tr style="display: none;" id="vrec_11">
                <td><input type="text"  onblur="myVal(this.id)" id="voucherDate11" name="voucherDate11" value="<%=dt %>" class="popupDatepicker" placeholder="dd-MM-yyyy"></td>
                <td colspan="2"><textarea rows="2" cols="25"  onblur="myTextareaVal(this.id)" id="voucherParticular11" style="width: 97% !important;height:80px;"  name="voucherParticular11" class="particular" placeholder="PARTICULARS "></textarea></td>
                <td class="rupee_td"> <table class="rupee">
                <tbody><tr><td width="65%"><input type="text"  onblur="myVal(this.id)" id="voucherRs11" name="voucherRs11" class="only_num"  placeholder="Rs." style="width: 80% !important;"></td>
                 <td width="35%"></td> </tr></tbody></table> </td>
              </tr>
			  
			  <tr style="display: none;" id="vrec_12">
                <td><input type="text"  onblur="myVal(this.id)" id="voucherDate12" name="voucherDate12" value="<%=dt %>" class="popupDatepicker" placeholder="dd-MM-yyyy"></td>
                <td colspan="2"><textarea rows="2" cols="25"  onblur="myTextareaVal(this.id)" id="voucherParticular12" style="width: 97% !important;height:80px;"  name="voucherParticular12" class="particular" placeholder="PARTICULARS "></textarea></td>
                <td class="rupee_td"> <table class="rupee">
                <tbody><tr><td width="65%"><input type="text"  onblur="myVal(this.id)" id="voucherRs12" name="voucherRs12" class="only_num"  placeholder="Rs." style="width: 80% !important;"></td>
                 <td width="35%"></td> </tr></tbody></table> </td>
              </tr>
			  
			  <tr style="display: none;" id="vrec_13">
                <td><input type="text"  onblur="myVal(this.id)" id="voucherDate13" name="voucherDate13" value="<%=dt %>" class="popupDatepicker" placeholder="dd-MM-yyyy"></td>
                <td colspan="2"><textarea rows="2" cols="25"  onblur="myTextareaVal(this.id)" id="voucherParticular13" style="width: 97% !important;height:80px;"  name="voucherParticular13" class="particular" placeholder="PARTICULARS "></textarea></td>
                <td class="rupee_td"> <table class="rupee">
                <tbody><tr><td width="65%"><input type="text"  onblur="myVal(this.id)" id="voucherRs13" name="voucherRs13" class="only_num"  placeholder="Rs." style="width: 80% !important;"></td>
                 <td width="35%"></td> </tr></tbody></table> </td>
              </tr>
			  
			  <tr style="display: none;" id="vrec_14">
                <td><input type="text"  onblur="myVal(this.id)" id="voucherDate14" name="voucherDate14" value="<%=dt %>" class="popupDatepicker" placeholder="dd-MM-yyyy"></td>
                <td colspan="2"><textarea rows="2" cols="25"  onblur="myTextareaVal(this.id)" id="voucherParticular14" style="width: 97% !important;height:80px;"  name="voucherParticular14" class="particular" placeholder="PARTICULARS "></textarea></td>
                <td class="rupee_td"> <table class="rupee">
                <tbody><tr><td width="65%"><input type="text"  onblur="myVal(this.id)" id="voucherRs14" name="voucherRs14" class="only_num"  placeholder="Rs." style="width: 80% !important;"></td>
                 <td width="35%"></td> </tr></tbody></table> </td>
              </tr>
			  
			  <tr style="display: none;" id="vrec_15">
                <td><input type="text"  onblur="myVal(this.id)" id="voucherDate15" name="voucherDate15" value="<%=dt %>" class="popupDatepicker" placeholder="dd-MM-yyyy"></td>
                <td colspan="2"><textarea rows="2" cols="25"  onblur="myTextareaVal(this.id)" id="voucherParticular15" style="width: 97% !important;height:80px;"  name="voucherParticular15" class="particular" placeholder="PARTICULARS "></textarea></td>
                <td class="rupee_td"> <table class="rupee">
                <tbody><tr><td width="65%"><input type="text"  onblur="myVal(this.id)" id="voucherRs15" name="voucherRs15" class="only_num"  placeholder="Rs." style="width: 80% !important;"></td>
                 <td width="35%"></td> </tr></tbody></table> </td>
              </tr>
               
                <tr>
                                <td class="rupee_td" colspan="4">
                                           <div class="addanddelete">
                                                     <div  onclick="addTrTable()" class="add_table"></div>
                                                     <div onclick="remTrTable()" class="delete_table"></div>
                                            </div>
                                
                                
                                 </td>
              </tr>
              <tr>
                <td colspan="3">AMOUNT IN WORDS:RUPEES <input type="text"  class="blank_val" onblur="myVal(this.id)" style="width: 95% !important;" id="voucherAmt" name="voucherAmt"  class="particular" placeholder="Amount in Words"></td>
                <td colspan="1"><div class="payment"> <input type="text"  class="blank_val" onblur="myVal(this.id)" id="voucherTotal" name="voucherTotal"  placeholder="Total"><span style="  background: #ccc; padding: 4px; border-radius: 2px; cursor: pointer;" onclick="calTotal()">TOTAL </span></div></td>
              </tr>
              <tr>
              
                <td colspan="4">
                <table>
                <tr>
                <td width="10%"> Initiated By</td>
                <td width="85%"><input type="text"  onblur="myVal(this.id)" style="width: 65% !important; border: 0px;" readonly="readonly" value="<%=uid %>" id="employeeID" name="employeeID"  /></td>
                </tr>
                </table>
               
               
                </td>
              
              </tr>
              
              <tr>
               <td colspan="4">
               <table>
                <tr>
                <td width="10%"> Verified By</td>
                <td width="85%"><input type="text"  onblur="myVal(this.id)" style="width: 65% !important; border: 0px;" readonly="readonly" value="" id="verifiedBy" name="verifiedBy"  /></td>
                </tr>
                </table>
               
                </td>
              </tr>
              
              <tr>
               <td colspan="4">
                <table>
                <tr>
                <td width="10%"> Approved By</td>
                <td width="85%"><input type="text"  onblur="myVal(this.id)" style="width: 65% !important; border: 0px;" readonly="readonly" value="" id="approvedBy" name="approvedBy"  /></td>
                </tr>
                </table>
               
                </td>
              </tr>
              
              <tr>
               <td colspan="4">
                <table>
                <tr>
                <td width="10%"> Payment Released By</td>
                <td width="85%"><input type="text"  onblur="myVal(this.id)" style="width: 65% !important; border: 0px;" readonly="readonly" value="" id="accountBy" name="accountBy"  /></td>
                </tr>
                </table>
               
               
               
                </td>
              </tr>
             
              <tr>
               <td colspan="4">
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
              <td colspan="4">   
             	  <input onclick="getAttachmentFile()" type="button" style="width:80px;height: 35px;" value="Attachment" class="right_upload_folder" id="attachmentFile">
	              <script type="text/javascript">
	              function getAttachmentFile(){
	            	  $('#upload').attr("action", "uploadAttachment");
	            	  $('#checkAttactmentPopup').val('ff');
	              }
	              </script><input type="hidden" id="attachmentID" name="attachmentID" >
	              
	              <div id="attlch">
	              </div>
              </td></tr>
                      
                     	<tr>
                     	
						<td colspan="4"> <input type="button"
							value="Get Attachment"
							onclick="getAttch()" class="getAttch" />
							<div id="attlch"></div></td>
							
				<script type="text/javascript">
					function getAttch(){
					var attid=$('#attachmentID').val();
					var attl=attid.split(',');
					for (var i in attl) {
						if(attl[i]!=""){
					// var rlt=$('<input/>').attr({ type: 'button', name:'btn1', value:attl[i],id:'ae'+attl[i],onclick:'getAttachment(this.value)',class:'attachClass'});
					 var rlt=$('<input/>').attr({ type: 'button', name:'btn1', value:attl[i]+' ------- Delete',onclick:'deleteAttachment(this)',id:attl[i],class:'attachClass'});
         			 $("#attlch").append(rlt);

      	        //    $('#attachmentID').attr({value:attid+attl[i]+','});
					}}

					$('.getAttch').attr("disabled","disabled");
					}
					</script>
					</tr>
                       <tr>
                                <td class="rupee_td" colspan="4">
                                <table ><tr><td width="10%">
                                          Remark</td><td width="90%">
                                          <textarea style="width: 100%" id="voucherRemark"  mane="voucherRemark" cols="50" rows="3" placeholder="Your Reasons" onblur="myTextareaVal(this.id)"></textarea>
                                </td></tr></table>
                                
                                 </td>
              </tr>
               <tr>
                     
                 <td colspan="4"><div class="table_right">
                                 
                                 <!----------/// ADD USER ----------->
								<!-- <div class="Logged_User_tab_color add_user_js add_user_bg">SAVE</div> -->
								<input type="button" id="CPVread"
									class="Logged_User_tab_color add_user_js add_user_bg"
									value="RESUBMIT" onclick="valiForm(this.id)">
								<!----------/// ADD USER END -------->
								<!----------/// User List ----------->
								<!--   <div class="Logged_User_tab  onclick">CANCEL</div> -->
								<input type="button" class="Logged_User_tab  onclick" id="iomrej" 
									value="CANCEL" onclick="proceedTheForm('reject')">
								<!----------/// User List END -------->
<input type="button"
								class="Logged_User_tab_color add_user_js add_user_bg"
								value="Print"
								onclick="printDiv()" />
                          </div></td>
              </tr>
            </tbody>
            </table>

		</div>
	</div>
	
</body>
</html>