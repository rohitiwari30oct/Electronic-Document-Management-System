<%@page import="edms.service.DemoUserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/left_event.js" type="application/javascript"></script>

<script type="text/javascript">
function getStartWorkflowForm(diagData) {
	var diagDataValues = diagData.split(":");
	var startFormKey = diagDataValues[0];
	var divid = "#"+diagDataValues[1];
	 $.ajax ({
			type: "POST",
	    	url:"${pageContext.request.contextPath}/activitiDiagram_getStartWorkflowPage",
	    	data: {
	    		sfk:startFormKey,
	    	},
	    	success: function(respData){
	    		jQuery.get(respData, function(data) {
	    			 $(divid).html(data);
	    			});
	        }
	    });
}
</script> 
<script type="text/javascript">
function getWorkflowDiagram(tabvalue){
	var tabvalues = tabvalue.split(":");
	var divid = "#"+tabvalues[1];
	 $.ajax ({
			type: "POST",
	    	url:"${pageContext.request.contextPath}/activitiDiagram_getActivitiDiagram",
	    	data: {
	    		tv:tabvalue,
	    	},
	    	success: function(data){
	    		$(divid).html(data);
	        }
	    });
}
</script>
<script type="text/javascript">
	function submitForm(buttonData){
		var buttonValues = buttonData.split("::");
	    var jsonData2 = {};
	    var jsonData1 = {};
	    var jsonDataObject = {};
	    var workflowForm = [];
	    var selected = jQuery('#beginWorkflowForm').find('input, textarea, select'); 
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
		    	url:"${pageContext.request.contextPath}/startLeaveApplicationForm_submitLeave",
		    	data: {
		    		json:jsonData,
		    		formType:"WorkflowForm",
		    		pkey:buttonValues[0],
		    		pname:buttonValues[1],
		    	},
		    	dataType: 'json',
		    	success: function(data){
		    	},
		    	error: function(err){
		    		alert("Succesfully Submitted!");
		    		jQuery.get("header_activitydiagrams", function(data) {
		    			 $( "#activitiForms" ).html(data);
		    			});
		        }
		    });
	}
</script>
<script type="text/javascript">
function cancelForm(){
	jQuery.get("header_activitydiagrams", function(data) {
		 $( "#activitiForms" ).html(data);
		});
}
</script>
</head>
<body>
<%
DemoUserService demouser = (DemoUserService) request.getAttribute("demoUserService");
%>
 <div class="right other_pages">
                              <!--------/// FORM ALL CONTENT STARED HERE ------------->
                                <!----------/// MAIN FORM MENU STARTED HERE --------->
                                <div class="form_tab table_menu_height_1">
                                                                    <ul class="tabs user_tab_1 table_menu_height form_11">
    <li class="table_menu active" rel="tab31">

        Customer Creation Form 
    </li>
    <li rel="tab32" class="table_menu ">
        Master Vendor Database
    </li>
    <li rel="tab33" class="table_menu">
        Vender Creation Form 
    </li>
    <li rel="tab34" class="table_menu" onclick="getWorkflowDiagram('testRequest:tab34')">
        Cash Payment Voucher 
    </li>
    <li rel="tab35" class="table_menu" onclick="getWorkflowDiagram('leaveRequest:tab35')">
        Leave Application Form 
    </li>
    <li rel="tab36" class="table_menu travel">
        Travel Expenses Reimbursement Claim 
    </li>
      <li rel="tab37" class="table_menu medical_expenses">
        Reimbursement of Medical Expenses 
    </li>
      <li rel="tab38" class="table_menu">
        Purchase Requisition
    </li>
      <li rel="tab39" class="table_menu memo">
        Inter Office Memo
    </li>
  </ul>
<div class="claer"></div>
                                </div>
                                <!-----------/// MAIN FORM MENU END HERE ---------->
                               <!------/// TAB FIRST STARED HERE ----------> 
                               <div id="tab31" class="user_static_7 tab_content_1" style="display: block;">
  				          
                                  <div class="form_scolling_project">
              
                                            <div class="from_main">
                                                <table>
              <tbody><tr>
                <td colspan="3" class="table_heading">NEW CUSTOMER ID CREATION FORM</td>
              </tr>
              <tr>
                <td colspan="3">Details required to be submitted for opening new customer by the end users:-</td>
              </tr>
              <tr>
                <td width="6%">S.No</td>
                <td width="34%">Check Points </td>
                <td width="60%">To be Filled up by the respective users who wants to create a new Customer</td>
              </tr>
              <tr>
                <td>1</td>
                <td>Old Customer code, if any:</td>
                <td class="new_customer"><input type="text" class="particular" placeholder="Enter Customer code Ex:EMS1286979"></td>
              </tr>
              <tr>
                <td>2</td>
                <td>Name of the Company  OR Customer  : </td>
                <td class="new_customer"><input type="text" class="particular" placeholder="Enter Name of the Comapny"></td>
              </tr>
              <tr>
                <td>3(a)</td>
                <td>Customer âs Address: Registered Office</td>
                 <td class="new_customer"><input type="text" class="particular" placeholder="Enter Customer âs Address: Registered Office"></td>
              </tr>
              <tr>
                <td>3(b)</td>
                <td>Dispatch /Consignee Address, if any: </td>
                <td class="new_customer"><input type="text" class="particular flat_detele" placeholder="Enter Dispatch /Consignee Address, if any">
                          <div class="addanddelete">
                                   <div class="add_table"></div>
                                   <div class="delete_table"></div>
                          </div>
                </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                  <div class="box_input_1"> 
                        <input type="text" class="small_box" placeholder="Enter Pin code Ex:910090">
                        <div class="claer"></div>
                         Pin code
                  </div>
                  <div class="box_input_2">
                        <input type="text" class="small_box" placeholder="Enter City">
                        <div class="claer"></div>
                        City 
                  </div>
                  </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                  <div class="box_input_1">
                        <input type="text" class="small_box" placeholder="Enter State">
                        <div class="claer"></div>
                        State 
            
                  </div>
                  <div class="box_input_2">
                  <input type="text" class="small_box" placeholder="Enter Country">
                    <div class="claer"></div>
                      Country 
                  </div>
                  </td>
              </tr>
              <tr>
                <td>4.</td>
                <td>Tel. no. of the Customer with STD code:</td>
                <td class="new_customer">
                  <input type="text" class="particular number std_phone" placeholder="Enter Tel. no. ">
                  <select>
                      <option>Country Code</option>
                      <option>+91</option>
                      <option>+92</option>
                      <option>+93</option>
                      <option>+94</option>
                      <option>+95</option>
                      <option>+96</option>    
                  </select>
                  <select>
                    <option>STD</option>
                    <option>01634</option>
                    <option>08732</option>
                    <option>08512</option>
                    <option>08513</option>
                    <option>08514</option>
                    <option>08515</option>
                    <option>08516</option>
                  </select>
                
            </td>
              </tr>
              <tr>
                <td>5.</td>
                <td>Fax no. of the Customer with STD Code: </td>
                <td class="new_customer">
                 <input type="text" class="particular number std_phone" placeholder="Enter Tel. no. ">
                  <select>
                      <option>Country Code</option>
                      <option>+91</option>
                      <option>+92</option>
                      <option>+93</option>
                      <option>+94</option>
                      <option>+95</option>
                      <option>+96</option>    
                  </select>
                  <select>
                    <option>STD</option>
                    <option>01634</option>
                    <option>08732</option>
                    <option>08512</option>
                    <option>08513</option>
                    <option>08514</option>
                    <option>08515</option>
                    <option>08516</option>
                  </select>
                
                
                </td>
              </tr>
              <tr>
                <td>6.</td>
                <td>Email ID:</td>
                <td class="new_customer"><input type="email" class="particular" placeholder="Enter Email Id Ex:xxx@xx.com"></td>
              </tr>
              <tr>
                <td>7.</td>
                <td>Website:</td>
                <td class="new_customer"><input type="text" class="particular" placeholder="Enter Website Ex:http://xxxxx.com"></td>
              </tr>
              <tr>
                <td>8.</td>
                <td>Name of the Contact Person:</td>
                <td class="new_customer"><input type="text" class="particular" placeholder="Enter Name of the Contact Person"></td>
              </tr>
              <tr>
                <td>9.</td>
                <td>PAN  (*Copy Attach)<div class="claer"></div>
            (If applied, IT acknowledged copy of Application is to be collected &amp; should <br>
                be given to respective VMGs. )</td>
                <td class="new_customer"><input type="file" class="particular"></td>
              </tr>
              <tr>
                <td>10.</td>
                <td>Service Tax Registration No. &amp; Date:</td>
                <td class="new_customer"><input type="text" class="particular" placeholder="Enter Service Tax Registration No"><input type="date"></td>
              </tr>
              <tr>
                <td>11.</td>
                <td>Service tax category:</td>
                <td class="new_customer"><input type="text" class="particular" placeholder="Enter Service tax category">
                
                          <div class="addanddelete">
                                   <div class="add_table"></div>
                                   <div class="delete_table"></div>
                          </div>
                
                </td>
              </tr>
              <tr>
                <td>12(a).</td>
                <td>Old Sales Tax Registration no. with date:</td>
                <td class="new_customer"><input type="text" class="particular" placeholder="Enter Old Sales Tax Registration no"><input type="date"></td>
              </tr>
              <tr>
                <td>12(b)</td>
                <td>Local sales tax No: (* Copy Attach)</td>
                <td class="new_customer"><input type="file" class="particular"></td>
              </tr>
              <tr>
                <td>12(c)</td>
                <td>Central sales tax No.: (*Copy Attach)</td>
                <td class="new_customer"><input type="file" class="particular"></td>
              </tr>
              <tr>
                <td>12(d)</td>
                <td>WCT Regn. No. with date:</td>
                <td class="new_customer"><input type="text" class="particular"><input type="date"></td>
              </tr>
              <tr>
                <td>12(e)</td>
                <td>VAT TIN:  (*Copy Attach)</td>
                <td class="new_customer"><input type="file" class="particular"></td>
              </tr>
              <tr>
                <td>13.</td>
                <td>SSI Regn. No. &amp; date:</td>
                <td class="new_customer"><input type="text" class="particular"> <input type="date"></td>
              </tr>
              <tr>
                <td>14.</td>
                <td>SSI Validity till:</td>
                <td class="new_customer"><input type="file" class="particular"></td>
              </tr>
              <tr>
                <td>15.</td>
                <td>EPF A/c No.:</td>
                <td class="new_customer"><input type="text" class="particular" placeholder="Enter EPF A/c No"></td>
              </tr>
              <tr>
                <td>16</td>
                <td>Customer Type: Mfg./Service/Misc.:<div class="claer"></div>
                Category: Co./Non-co./Firm/Govt. agency/others</td>
                <td class="new_customer"><input type="text" class="particular" placeholder="Enter Customer Type"></td>
              </tr>
              <tr>
                <td>17.</td>
                <td>Other (Please specify)</td>
                <td class="new_customer"><input type="text" class="particular" placeholder="Enter Other"></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>Excise related details: </td>
                <td class="new_customer"><input type="text" class="particular" placeholder="Enter Excise related details"></td>
              </tr>
              <tr>
                <td>18.</td>
                <td>Excise Registration No.:</td>
                <td class="new_customer"><input type="text" class="particular" placeholder="Enter Excise Registration No"></td>
              </tr>
                <tr>
                <td>19.</td>
                <td>ECC No.</td>
                <td class="new_customer"><input type="text" class="particular" placeholder="ECC No."></td>
              </tr>
                <tr>
                <td>20.</td>
                <td>EXC Range</td>
               <td class="new_customer"><input type="text" class="particular" placeholder="Enter EXC Range"></td>
              </tr>
                <tr>
                <td>21.</td>
                <td>EXC Division</td>
                <td class="new_customer"><input type="text" class="particular" placeholder="Enter EXC Division"></td>
              </tr>
                <tr>
                <td>22.</td>
                <td>Commissionerate</td>
                <td class="new_customer"><input type="text" class="particular" placeholder="Enter Commissionerate"></td>
              </tr>
                <tr>
                <td>23.</td>
                <td>Sign of the user submitting the above details</td>
                <td class="new_customer"><input type="text" class="particular" placeholder="user submitting"></td>
              </tr>
                <tr>
                <td colspan="3">&nbsp;</td>
              </tr>
                <tr>
                <td colspan="3">For Office Use: (AVI-OIL INDIA [P] LTD.)</td>
              </tr>
                <tr>
                <td>24.</td>
                <td>Gen. Bus. Posting Group </td>
                <td class="new_customer small_cc">CC <input type="text">DOM<input type="text">FOR<input type="text">JW<input type="text">OSL<input type="text"></td>
              </tr>
                <tr>
                <td>25.</td>
                <td>Excise Bus. Posting Group </td>
                <td class="new_customer small_cc">DOM<input type="text">DOM-EX<input type="text">EX-ZERO<input type="text">FOR<input type="text"></td>
              </tr>
                <tr>
                <td>26.</td>
                <td>Customer Posting Group </td>
                <td class="new_customer small_cc">CAV<input type="text">CC<input type="text">DEF-SEC<input type="text">EXP<input type="text">HAL<input type="text">IAF<input type="text">IAR<input type="text">IDL<input type="text">INV<input type="text">OTH<input type="text"></td>
              </tr>
                <tr>
                <td>27.</td>
                <td colspan="2">
                          <div class="twitten_seven_main">
                                 
                                   <input type="text" class="twitten_seven" placeholder="Enter Customer Code ">
                                   <div class="claer"></div>
                                   Customer Code 
                          
                          </div>
                          <div class="twitten_seven_main">
                                 <input type="text" class="twitten_seven" placeholder="Enter Payment Term Code">
                                 <div class="claer"></div>
                                 Payment Term Code
                                 
                           </div> 
                   </td>
              </tr>
                <tr>
                <td>28.</td>
                <td>Customer Creation Date </td>
                <td><input type="date" class="particular"></td>
              </tr>
                <tr>
                <td colspan="3">
                   <div class="box_input">
                           <input type="text" placeholder="Enter Dep. ">
                           <div class="claer"></div>
                           (Marketing Dep.) 
                   </div>  
                   <div class="box_input">
                            <input type="text" placeholder="Enter Dep. "> 
                            <div class="claer"></div>
                            (Information Technology Dep.)
                   </div>
                   <div class="box_input">
                            <input type="text" placeholder="Enter Dep. ">
                            <div class="claer"></div>
                            (Accounts Dep.)
                    </div>
                    </td>
              </tr>
                <tr>
                <td colspan="3">
                     <div class="box_input">
                             <input type="text" placeholder="Indented by ">
                             <div class="claer"></div>
                             Indented by 
                     </div>
                     <div class="box_input">
                             <input type="text" placeholder="Prepared by">
                             <div class="claer"></div>
                             Prepared by 
                     </div>
                     <div class="box_input">
                            <input type="text" placeholder="Checked by">
                            <div class="claer"></div>
                            Checked by
                     </div>
                    </td>
                </tr>
                <tr>
                <td colspan="3">
                  <div class="box_input">
                           <input type="text" placeholder="Indent approved by">
                           <div class="claer"></div>
                           Indent approved by 
                  </div> 
                  <div class="box_input">
                           <input type="text" placeholder="Verified by">
                           <div class="claer"></div>
                           Verified by
                  </div> 
                  <div class="box_input">
                          <input type="text" placeholder=" Authorised by">
                          <div class="claer"></div>
                          Authorised by
                  </div>
                   </td>
              </tr>
              <tr>
                 <td colspan="3"><div class="table_right">
                                  <!----------/// ADD USER ----------->
                                  <div class="Logged_User_tab_color add_user_js add_user_bg">SAVE</div>
                                  <!----------/// ADD USER END --------> 
                                  <!----------/// User List ----------->
                                  <div class="Logged_User_tab  onclick">CANCEL</div>
                                  <!----------/// User List END --------> 
                            
                          </div></td>
              </tr>
              
            </tbody></table>
                                            </div>
                                  </div>
            
                               </div>
                             
                              <!--------------/// TAB FIRST END HERE ---------------->
                                   <!---------/// TAB SEACOND STARED HERE ----------->
                              <div id="tab32" class="user_static_9 tab_content_1" >
                                        
                           
                                          <div class="form_scolling_project">
                            
                                         <div class="from_main_leave">
                                           <table>
              <tbody><tr>
                <td colspan="2" class="table_heading">Master Vendor Database</td>
              </tr>
              <tr>
                <td width="57%">Full Name of the Company </td>
                <td width="43%"><input type="text" class="bank_name" placeholder="Full Name of the Company"></td>
              </tr>
              <tr>
                <td>Registration Number (if any)</td>
                <td><input type="text" class="bank_name" placeholder="Registration Number"></td>
              </tr>
              <tr>
                <td>Full Address:</td>
                <td><input type="text" class="bank_name" placeholder="Full Address">
                            <div class="addanddelete">
                                 <div class="add_table"></div>
                                 <div class="delete_table"></div>
                            </div>
               </td>
              </tr>
              <tr>
                <td colspan="2" class="for_inner master_vendor_database">
                <table class="inner_table_data">
                  <tbody><tr>
                    <td><strong>Correspondence Address</strong></td>
                    <td><strong>Works/ Despatch Address</strong></td>
                    <td><strong>Invoicing Address</strong></td>
                  </tr>
                  <tr>
                    <td><textarea class="database" placeholder="Correspondence Address"></textarea></td>
                    <td><textarea class="database" placeholder="Works/ Despatch Address"></textarea></td>
                    <td><textarea class="database" placeholder="Invoicing Address"></textarea></td>
                  </tr>
                   <tr>
                    <td><strong>Contact Details</strong></td>
                    <td><strong>Sales  / Operations</strong></td>
                    <td><strong>Accounts</strong></td>
                  </tr>
                   <tr>
                    <td>Name</td>
                    <td><input type="text" placeholder="Enter Name"></td>
                    <td><input type="text" placeholder="Enter Name"></td>
                  </tr>
                   <tr>
                    <td>Title</td>
                    <td><input type="text" placeholder="Enter Title "></td>
                    <td><input type="text" placeholder="Enter Title "></td>
                  </tr>
                   <tr>
                    <td>Direct Telephone / Hand phone</td>
                    <td><input type="text" placeholder="Enter phone No."></td>
                    <td><input type="text" placeholder="Enter phone No."></td>
                  </tr>
                </tbody></table>
                </td>
              </tr>
              <tr>
                <td colspan="2">Bank Details</td>
              </tr>
              <tr>
                <td>Currency</td>
                <td><input type="text" class="bank_name" placeholder="Enter Currency"></td>
              </tr>
              <tr>
                <td>Bank Name</td>
                <td><input type="text" class="bank_name" placeholder="Enter Bank Name"></td>
              </tr>
              <tr>
                <td>Bank Account Number</td>
                <td><input type="text" class="bank_name" placeholder="Enter Bank Account Number"></td>
              </tr>
              <tr>
                <td>Bank Address</td>
                <td><input type="text" class="bank_name" placeholder="Enter Bank Address">
                
                    <div class="addanddelete">
                         <div class="add_table"></div>
                         <div class="delete_table"></div>
                    </div>
                
                </td>
              </tr>
              <tr>
                <td>Bank Code</td>
                <td><input type="text" class="bank_name" placeholder="Enter Bank Code"></td>
              </tr>
              <tr>
                <td>Swift Code (Mandatory)</td>
                <td><input type="text" class="bank_name" placeholder="Enter Swift Code"></td>
              </tr>
              <tr>
                <td>RIB</td>
                <td><input type="text" class="bank_name" placeholder="Enter RIB"></td>
              </tr>
              <tr>
                <td>IBAN (for Euro payments)</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>Fedwire routing number 
                (for USD payments)</td>
                <td><input type="text" class="bank_name" placeholder="Enter Fedwire routing number "></td>
              </tr>
              <tr>
                <td>Sort Code (for GBP payments)</td>
                <td><input type="text" class="bank_name" placeholder="Enter Sort Code"></td>
              </tr>
              <tr>
                <td>Name of Beneficiary Bankâs
                Correspondent</td>
                <td><input type="text" class="bank_name" placeholder="Name of Beneficiary Bankâs Correspondent"></td>
              </tr>
              <tr>
                <td>Correspondent Bankâs Swift
                Code (Mandatory)</td>
                <td><input type="text" class="bank_name" placeholder="Correspondent Bankâs Swift Code"></td>
              </tr>
              <tr>
                <td>Other (Please specify)</td>
                <td><input type="text" class="bank_name" placeholder="Other"></td>
              </tr>
              <tr>
                <td colspan="2">For Office Use: (AVI-OIL INDIA [P] LTD.)</td>
              </tr>
              <tr>
                <td>Gen. Bus. Posting Group </td><td><input type="checkbox"><label>CC</label><input type="checkbox"><label>DOM</label>
                <input type="checkbox"><label>FOR</label>
                <input type="checkbox"><label>JW</label>
                <input type="checkbox"><label>OSL</label></td>
              </tr>
              <tr>
                <td>Excise Bus. Posting Group</td>
                <td><input type="checkbox"><label>DOM</label><input type="checkbox"><label>FOR</label></td>
              </tr>
              <tr>
                <td>Vendor Posting Group</td>
                <td><input type="checkbox"><label>IMP</label><input type="checkbox"><label> DOM</label>
                <input type="checkbox"><label> SRP</label>
                <input type="checkbox"><label> CPC</label>
                <input type="checkbox"><label> OTH</label>
                <input type="checkbox"><label> CC</label></td>
              </tr>
              <tr>
                <td>Vendor code</td>
                <td><input type="text" class="bank_name" placeholder="Enter Vendor code"></td>
              </tr>
              <tr>
                <td>Vendor Creation Date</td>
                <td><input type="date" class="bank_name"></td>
              </tr>
                     <tr>
                 <td colspan="3"><div class="table_right">
                                  <!----------/// ADD USER ----------->
                                  <div class="Logged_User_tab_color add_user_js add_user_bg">SAVE</div>
                                  <!----------/// ADD USER END --------> 
                                  <!----------/// User List ----------->
                                  <div class="Logged_User_tab  onclick">CANCEL</div>
                                  <!----------/// User List END --------> 
                            
                          </div></td>
              </tr>
            </tbody>
            </table>
                                         </div>
                             </div>
                              </div>
                             <!---------------/// TAB SECXOND END HERE ------------>
                             <!-----------------// TAB THIRD STARED HERE ------------>
                             <div id="tab33" class="user_static_12 tab_content_1">
                                   
                                   <div class="form_scolling_project">
                                        <div class="from_main_leave">
                                             <table>
              <tbody><tr>
                <td colspan="3" class="table_heading">VENDOR CREATION FORM</td>
              </tr>
              <tr>
                <td width="4%">S.No</td>
                <td width="46%">Description</td>
                <td width="50%">&nbsp;</td>
              </tr>
              <tr>
                <td>1</td>
                <td>Vendor Legacy code, if any:</td>
                <td><input type="text" class="vender" placeholder="Vendor Legacy code"></td>
              </tr>
              <tr>
                <td>2(a)</td>
                <td>Vendorâs Name </td>
                <td><input type="text" class="vender" placeholder="Vendorâs Name"></td>
              </tr>
              <tr>
                <td>2(b)</td>
                <td>Vendorâs  Address: </td>
                <td><input type="text" class="vender" placeholder="Vendorâs  Address">
                      <div class="addanddelete">
                             <div class="add_table"></div>
                             <div class="delete_table"></div>
                     </div>
                
                
                </td>
              </tr>
              <tr>
                <td>2(c)</td>
                <td>Registered Office Address:</td>
                <td><input type="text" class="vender" placeholder="Registered Office Address">
                     <div class="addanddelete">
                             <div class="add_table"></div>
                             <div class="delete_table"></div>
                     </div>
                
                </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="register_add">
                  <ul>
                    <li class="pin_text">Pin code</li>
                    <li><input type="text" placeholder="Pin Code"></li>
                    <li class="pin_text">City</li>
                    <li><input type="text" placeholder="City"></li>
                  </ul>
                </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="register_add">
                  <ul>
                    <li class="pin_text">State</li>
                    <li><input type="text" placeholder="State"></li>
                    <li class="pin_text">Country</li>
                    <li><input type="text" placeholder="Country"></li>
                  </ul>
                   </td>
              </tr>
              <tr>
                <td>2(d)</td>
                <td>Address on which Purchase Order to be raised :</td>
                <td><input type="text" class="vender" placeholder="Address on which Purchase Order to be raised">
                      <div class="addanddelete">
                             <div class="add_table"></div>
                             <div class="delete_table"></div>
                     </div>
                
                </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                 <td class="register_add">
                  <ul>
                    <li class="pin_text">Pin code</li>
                    <li><input type="text" placeholder="Pin code"></li>
                    <li class="pin_text">City</li>
                    <li><input type="text" placeholder="City"></li>
                  </ul>
                </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="register_add">
                  <ul>
                    <li class="pin_text">State</li>
                    <li><input type="text" placeholder="State"></li>
                    <li class="pin_text">Country</li>
                    <li><input type="text" placeholder="Country"></li>
                  </ul>
               </td>
              </tr>
              <tr>
                <td>3</td>
                <td>Tel. no. of the vendor with STD code:</td>
                <td class="new_customer">
                
                  <select>
                      <option>Country Code</option>
                      <option>+91</option>
                      <option>+92</option>
                      <option>+93</option>
                      <option>+94</option>
                      <option>+95</option>
                      <option>+96</option>    
                  </select>
                  <select>
                    <option>STD</option>
                    <option>01634</option>
                    <option>08732</option>
                    <option>08512</option>
                    <option>08513</option>
                    <option>08514</option>
                    <option>08515</option>
                    <option>08516</option>
                  </select>
                    <input type="text" placeholder="Enter Tel. no. ">
                
            </td>
              </tr>
              <tr>
                <td>4</td>
                <td>Fax no. of the vendor with STD Code: </td>
                <td class="new_customer">
            
                  <select>
                      <option>Country Code</option>
                      <option>+91</option>
                      <option>+92</option>
                      <option>+93</option>
                      <option>+94</option>
                      <option>+95</option>
                      <option>+96</option>    
                  </select>
                  <select>
                    <option>STD</option>
                    <option>01634</option>
                    <option>08732</option>
                    <option>08512</option>
                    <option>08513</option>
                    <option>08514</option>
                    <option>08515</option>
                    <option>08516</option>
                  </select>
                        <input type="text" placeholder="Enter Tel. no. ">
                
            </td>
              </tr>
              <tr>
                <td>5</td>
                <td>Email ID:</td>
                <td><input type="text" class="vender" placeholder="Enter Email ID"></td>
              </tr>
              <tr>
                <td>6</td>
                <td>Website :</td>
                <td><input type="text" class="vender" placeholder="Enter Website"></td>
              </tr>
              <tr>
                <td>7</td>
                <td>Name of the Contact Person:</td>
                <td><input type="text" class="vender" placeholder="Name of the Contact Person"></td>
              </tr>
              <tr>
                <td>8</td>
                <td>PAN (*Mandatory &amp; Pan Card copy should be attached)
                  (If applied, IT acknowledged copy of Application is to be
                collected &amp; should be given to respective VMGs.) </td>
                <td><input type="file" class="vender"></td>
              </tr>
              <tr>
                <td>9</td>
                <td>Service Tax Registration No. &amp; Date: (*Copy Attach)</td>
                <td><input type="text" class="service" placeholder="Registration N"><input type="date"></td>
              </tr>
              <tr>
                <td>10.</td>
                <td>Service tax category :</td>
                <td><input type="text" class="vender" placeholder="Service tax category"></td>
              </tr>
              <tr>
                <td>11.(a)</td>
                <td>Sales Tax Registration Details:</td>
                <td><input type="text" class="vender" placeholder="Sales Tax Registration Details"></td>
              </tr>
              <tr>
                <td>11.(b)</td>
                <td>Local sales tax No: (*Enclose copy of registration Certificate)</td>
                <td><input type="text" class="vender" placeholder="Local sales tax No"></td>
              </tr>
              <tr>
                <td>11.(c)</td>
                <td>Central Sales tax No.: (*Enclose copy of registration Certificate)</td>
                <td><input type="text" class="vender" placeholder="Central Sales tax No"></td>
              </tr>
              <tr>
                <td>11(d)</td>
                <td>WCT Regn. No. with date:</td>
                <td><input type="text" class="wct"><input type="date"></td>
              </tr>
              <tr>
                <td>11(e)</td>
                <td>VAT TIN:  (*Enclose copy of registration Certificate)</td>
                <td><input type="text" class="vender" placeholder="Enter VAT TIN"></td>
              </tr>
              <tr>
                <td>12</td>
                <td>Type of Industry : Micro, Small &amp; Medium Enterprises, if other
                  Please specify (*Enclose copy of registration Certificate)</td>
                <td><input type="text" class="vender" placeholder="Type of Industry"></td>
              </tr>
              <tr>
                <td>13(a)</td>
                <td>Vendor Type: Manufacturer, Service Provider, other please Specify</td>
                <td><input type="text" class="vender" placeholder="Vendor Type"></td>
              </tr>
              <tr>
                <td>13(b)</td>
                <td>Category: Company / Non-Company / Govt. Agency if other â Please specify</td>
                <td><input type="text" class="vender" placeholder="Category"></td>
              </tr>
                <tr>
                <td colspan="3">Bank Details: </td>
              </tr>
              <tr>
                <td>14(a)</td>
                <td>Currency</td>
                <td><input type="text" class="vender" placeholder="Currency"></td>
              </tr>
              <tr>
                <td>14(b)</td>
                <td>Bank Name</td>
                <td><input type="text" class="vender" placeholder="Bank Name"></td>
              </tr>
                <tr>
                <td>14(c)</td>
                <td>Bank Address</td>
                <td><input type="text" class="vender" placeholder="Bank Address"></td>
              </tr>
              <tr>
                <td>14(d)</td>
                <td>Bank Account Number</td>
                <td><input type="text" class="vender" placeholder="Bank Account Number"></td>
              </tr>
              <tr>
                <td>14</td>
                <td>Bank Code </td>
                <td><input type="text" class="vender" placeholder="Bank Code"></td>
              </tr>  <tr>
                <td>14</td>
                <td>Branch Code </td>
                <td><input type="text" class="vender" placeholder="Branch Code"></td>
              </tr>
              <tr>
                <td>14</td>
                <td>MICR Number </td>
                <td><input type="text" class="vender" placeholder="MICR Number"></td>
              </tr>
              <tr>
                <td>14</td>
                <td>NEFT / IFSC CODE </td>
                <td><input type="text" class="vender" placeholder="NEFT / IFSC CODE"></td>
              </tr>
                <tr>
                <td>14</td>
                <td>RTGS CODE </td>
                <td><input type="text" class="vender" placeholder="RTGS CODE"></td>
              </tr>
              <tr>
                <td colspan="3">Excise related details: </td>
              </tr>
              <tr>
                <td>15</td>
                <td>Excise Registration No.: (*Enclose copy of registration Certificate)</td>
                <td><input type="text" class="vender" placeholder="Excise Registration No"></td>
              </tr>  <tr>
                <td>&nbsp;</td>
                <td>ECC Number</td>
                <td><input type="text" class="vender" placeholder="ECC Number"></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>EXC Range </td>
                <td><input type="text" class="vender" placeholder="EXC Range"></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>EXC Division</td>
                <td><input type="text" class="vender" placeholder="EXC Division"></td>
              </tr>
                <tr>
                <td>&nbsp;</td>
                <td>Commissionerate</td>
                <td><input type="text" class="vender" placeholder="Commissionerate"></td>
              </tr>
              <tr>
                <td>16</td>
                <td>Name of person who submitting the above details</td>
                <td><input type="text" class="vender" placeholder="Name of person"></td>
              </tr>
              <tr>
                <td>16</td>
                <td>Signature &amp; Company Seal</td>
                <td>&nbsp;</td>
              </tr>
                <tr>
                <td colspan="3">*Mandatory requriments</td>
              </tr>
              <tr>
                <td>1</td>
                <td>For Office Use: (AVI-OIL INDIA [P] LTD.)</td>
                <td><input type="text" class="vender" placeholder="For Office Use"></td>
              </tr>
              <tr>
                <td>2</td>
                <td colspan="2">Gen. Bus. Posting Group <input type="checkbox"><label>CC</label><input type="checkbox"><label>DOM</label>         <input type="checkbox"><label>FOR</label><input type="checkbox"><label>JW</label><input type="checkbox"><label>OSL</label></td>
              </tr>
                <tr>
                <td>3</td>
                <td>Excise Bus. Posting Group<input type="checkbox"><label>DOM</label><input type="checkbox"><label>FOR</label></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>4</td>
                <td colspan="2">Vendor Posting Group<input type="checkbox"><label>IMP</label><input type="checkbox"><label>DOM</label>        <input type="checkbox"><label>SRP</label><input type="checkbox"><label>CPC</label><input type="checkbox"><label>OTH</label><input type="checkbox"><label>CC</label></td>
              </tr>
              <tr>
                <td>5</td>
                <td>GTA</td>
                <td><input type="text" class="vender" placeholder="Enter GTA"></td>
              </tr>
                <tr>
                <td>6</td>
                <td>Vendor code </td>
                <td><input type="text" class="vender" placeholder="Vendor code"></td>
              </tr>
              <tr>
                <td>7</td>
                <td>Vendor Creation Date </td>
                <td><input type="date" class="vender"></td>
              </tr>
              <tr>
                <td colspan="3">
                         <div class="by"><input type="text" placeholder="Indented by">Indented by </div>
                         <div class="by"><input type="text" placeholder="Prepared by">Prepared by </div>
                         <div class="by"><input type="text" placeholder="Verified by (IT)">Verified by (IT)  </div>
                         <div class="by"><input type="text" placeholder="Checked by">Checked by</div>
                         <div class="by"><input type="text" placeholder="Authorised by<">Authorised by</div>
                </td>
              </tr>
                     <tr>
                 <td colspan="3"><div class="table_right">
                                  <!----------/// ADD USER ----------->
                                  <div class="Logged_User_tab_color add_user_js add_user_bg">SAVE</div>
                                  <!----------/// ADD USER END --------> 
                                  <!----------/// User List ----------->
                                  <div class="Logged_User_tab  onclick">CANCEL</div>
                                  <!----------/// User List END --------> 
                            
                          </div></td>
              </tr>
               
            </tbody></table>
                                        </div>
                                   </div>
                                <div class="claer"></div>
                            </div>
                             <!-----------------/// TAB THIRD END HERE --------------->
                             
                             <!-----------/// TAB FOURTH STARED HERE ----------->
                             <div id="tab34" class="user_static_6 tab_content_1">
                               <!------------------/// TABLE SAVE OPTION HERE -------------->
                                             
                                <!------------------/// TABLE SAVE OPTION -------------->
                                 <div class="form_scolling_project">
                                     <div class="from_main">
                                          <table>
              <tbody><tr>
                <td colspan="3" class="table_heading">CASH PAYMENT VOUCHER&nbsp;</td>
                  <td width="128" class="voucher">
                    VOUCHER NO.
                    <input type="text" placeholder=" VOUCHER NO">
                 </td>
              </tr>
              <tr class="cash_1">
                <td width="169">DATE</td>
                <td colspan="2">PARTICULARS .</td>
                <td>
                          <table class="rupee">
                              <tbody><tr>
                                <td class="table_border">Rs</td>
                                <td>P.</td>
                              </tr>
                          </tbody></table>
                </td>
              </tr>
              <tr>
                <td><input type="date"></td>
                <td colspan="2"><input type="text" class="particular" placeholder="PARTICULARS "></td>
                <td class="rupee_td">
                          <table class="rupee">
                              <tbody><tr>
                                 <td><input type="text" placeholder="Rs."></td>
                                <td><input type="text" placeholder="P."></td>
                              </tr>
                          </tbody></table>
              
              </td>
              </tr>
                <tr>
                                <td class="rupee_td" colspan="4">
                                           <div class="addanddelete">
                                                     <div class="add_table"></div>
                                                     <div class="delete_table"></div>
                                            </div>
                                
                                
                                 </td>
              </tr>
              <tr>
                <td colspan="2">AMOUNT IN WORDS:RUPEES <input type="text" class="particular" placeholder="Amount in Words"></td>
                <td colspan="2"><div class="payment"> <input type="text" placeholder="Total">TOTAL</div></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td colspan="2">&nbsp;</td>
              </tr>
              <tr>
                <td><div class="payment"><input type="text" placeholder="PAYMENT AUTHORISED">PAYMENT </div> </td>
                <td><div class="payment">  <input type="text" class="particular" placeholder="PAYMENT RELEASED"><div class="claer"></div>PAYMENT RELEASED</div></td>
                <td colspan="2"> <div class="payment"><input type="text" placeholder="RECEIVED BY">RECEIVED BY</div></td>
              </tr>
                     <tr>
                 <td colspan="4"><div class="table_right">
                                  <!----------/// ADD USER ----------->
                                  <div class="Logged_User_tab_color add_user_js add_user_bg">SAVE</div>
                                  <!----------/// ADD USER END --------> 
                                  <!----------/// User List ----------->
                                  <div class="Logged_User_tab  onclick">CANCEL</div>
                                  <!----------/// User List END --------> 
                            
                          </div></td>
              </tr>
            </tbody>
            </table>
                                         <div class="claer"></div>
                                     </div>
                                 </div>
                            </div>
                             <!----------/// TAB FOURTH END HERE --------------->
                             <!----------/// TAB FIVE STARED HERE ----------->
                             <div id="tab35" class="user_static_8 tab_content_1"></div>
                                   </div>
                            </div>
                             <!----------/// TAB FIVE END HERE -------------->
                             <!-----------/// SIX TAB STARED HERE -------------->
                             <div id="tab36" class="user_static_13 tab_content_1" style="display: block;">
                                
                               <div class="form_scolling_project">
                               <div class="from_main_leave left_space_one">
                                   <table>
              <tbody><tr>
                <td colspan="7" class="table_heading">TRAVEL EXPENSES REIMBURSEMENT CLAM</td>
              </tr>
              <tr class="depart_form">
                <td colspan="2">NAME<div class="claer"></div><input type="text" placeholder="Enter Name"></td>
                <td colspan="2">EMP.NO<div class="claer"></div><input type="text" placeholder="EMP.NO"></td>
                <td colspan="2">DESIGNATION<div class="claer"></div><input type="text" placeholder="DESIGNATION"></td>
                <td>DATE<div class="claer"></div><input type="date"></td>
              </tr>
              <tr class="depart_form">
                <td colspan="2">DEPT<div class="claer"></div><input type="text" placeholder="Enter DEPT"></td>
                <td colspan="2">LOCATION<div class="claer"></div><input type="text" placeholder="Enter LOCATION"></td>
                <td colspan="2">CLAIM FROM <div class="claer"></div><input type="text" placeholder="CLAIM FROM"></td>
                <td>TO<div class="claer"></div><input type="text" placeholder="To"></td>
              </tr>
              <tr>
                <td colspan="7">PART I       DETAILS OF JOURNEY</td>
              </tr>
              <tr class="time_travel">
                <td> DATE OF DEPARTURE</td>
                <td>LOCATION</td>
                <td>FLT/TRAIN NO.</td>
                <td>TIME</td>
                <td>DATE OF ARRIVAL</td>
                <td>PLACE OF VISIT</td>
                <td>TIME OF ARRIVAL</td>
              </tr>
              <tr class="time_travel">
                <td><input type="date"></td>
                <td><input type="text" placeholder="LOCATION"></td>
                <td><input type="text" placeholder="FLT/TRAIN NO"></td>
                <td><input type="text" placeholder="TIME"></td>
                <td><input type="date"></td>
                <td><input type="text" placeholder="PLACE OF VISIT"></td>
                <td><input type="text" placeholder="TIME OF ARRIVAL"></td>
              </tr>
              <tr>
                <td colspan="7">
                
                   <div class="addanddelete">
                           <div class="add_table"></div>
                           <div class="delete_table"></div>
                  </div>
                
                </td>
              
              </tr>
              <tr>
                <td colspan="6">PART-II       DETAIL OF EXPENSES</td>
                <td>
                  <table class="part_two">
                    <tbody><tr>
                      <td>Rs.</td>
                      <td>P.</td>
                    </tr>
                </tbody></table></td>
              </tr>
              <tr>
                <td colspan="6">A.  JOURNEY TICKET NO.(S).</td>
                <td><table>
                  <tbody><tr>
                    <td><input type="text" class="money" placeholder="Rs."></td>
                    <td><input type="text" class="money" placeholder="P."></td>
                  </tr>
                </tbody></table></td>
              </tr>
              <tr>
                <td colspan="6">B.  HOTEL EXPENSES BILL NO(S):</td>
                <td><table>
                  <tbody><tr>
                    <td><input type="text" class="money" placeholder="Rs."></td>
                    <td><input type="text" class="money" placeholder="P."></td>
                  </tr>
                </tbody></table></td>
              </tr>
              <tr>
                <td colspan="6">C.  TAXI FARE : TO &amp; FROM AIRPORT/RLY.STN:</td>
                <td><table>
                  <tbody><tr>
                    <td><input type="text" class="money" placeholder="Rs."></td>
                    <td><input type="text" class="money" placeholder="P."></td>
                  </tr>
                </tbody></table></td>
              </tr>
              <tr>
                <td colspan="6">AT PLACE OF VISIT</td>
                <td><table>
                  <tbody><tr>
                    <td><input type="text" class="money" placeholder="Rs."></td>
                    <td><input type="text" class="money" placeholder="P."></td>
                  </tr>
                </tbody></table></td>
              </tr>
              <tr>
                <td colspan="7">D.OUT OF POCKET EXPENSES FOR</td>
              </tr>
              <tr>
                <td colspan="3" rowspan="4">AMOUNT CLAIM/REFUNDED IN WORDS
                RUPEES</td>
                <td colspan="3">TOTAL</td>
                <td>
                     <table>
                      <tbody><tr>
                        <td><input type="text" class="money" placeholder="Rs."></td>
                        <td><input type="text" class="money" placeholder="P."></td>
                      </tr>
                    </tbody></table>
                </td>
              </tr>
              <tr>
                <td colspan="3">LESS ADVANCE</td>
                <td>
                    <table>
                      <tbody><tr>
                        <td><input type="text" class="money" placeholder="Rs."></td>
                        <td><input type="text" class="money" placeholder="P."></td>
                      </tr>
                    </tbody></table>
                </td>
              </tr>
              <tr>
                <td colspan="3">NET CLAIMED / REFUNDED</td>
                <td><table>
                  <tbody><tr>
                    <td><input type="text" class="money" placeholder="Rs."></td>
                    <td><input type="text" class="money" placeholder="P."></td>
                  </tr>
                </tbody></table></td>
              </tr>
                <tr>
                <td colspan="3">ROUNDED TO</td>
                <td><table>
                  <tbody><tr>
                    <td><input type="text" class="money" placeholder="Rs."></td>
                    <td><input type="text" class="money" placeholder="P."></td>
                  </tr>
                </tbody></table></td>
              </tr>
              <tr>
                <td colspan="2">
                  <div class="claim_main">Claim Approved<input type="text" placeholder="Claim Approved"></div>
                </td>
                <td colspan="3">&nbsp;</td>
                <td colspan="2"><div class="declation">DECLARATION <div class="claer"></div>
            Certified that the expenses as
                above were actually incurred </div>
            </td>
              </tr>
                <tr>
                <td colspan="2">
                  <div class="claim_main">
                        <ul>
                         <li>Competent Authority</li>
                         <li><input type="text" placeholder="Competent Authority"></li>
                         </ul>
                   </div>
                  <div class="claim_main">
                     <ul>
                        <li>Date</li>
                        <li><input type="date"></li>
                     </ul>
                  </div>
                </td>
                <td colspan="2">
                  <div class="claim_main">
                     <ul>
                       <li>Controlling Officer</li>
                       <li><input type="text" placeholder="Controlling Officer"></li>
                       </ul>
                   </div>
                  <div class="claim_main">
                     <ul>
                       <li> Date</li>
                       <li><input type="date"></li>
                       </ul>
                  </div>
                </td>
                <td class="number_of"> 
                      <div class="claim_main">
                        <ul>
                          <li>No.of  enclosures</li>
                          <li> <input type="text" placeholder="No.of  enclosures"></li>
                        </ul>
                      </div>
                </td>
                <td colspan="2">
                      <div class="claim_main">
                          <ul>
                               <li>Signature</li>
                               <li><input type="file" class="enco"></li>
                         </ul>
                     </div>
                      <div class="claim_main"> Date<input type="date"></div>
            </td>
              </tr>
              <tr>
                <td colspan="4">Claim verified for Rs. <input type="text" class="claim_verified" placeholder="Claim verified for Rs"></td>
                <td colspan="3">Received Rs.<input type="text" class="received" placeholder="Received Rs"></td>
              </tr>
               <tr>
                 <td colspan="7"><div class="table_right">
                                  <!----------/// ADD USER ----------->
                                  <div class="Logged_User_tab_color add_user_js add_user_bg">SAVE</div>
                                  <!----------/// ADD USER END --------> 
                                  <!----------/// User List ----------->
                                  <div class="Logged_User_tab  onclick">CANCEL</div>
                                  <!----------/// User List END --------> 
                            
                          </div></td>
              </tr>
              
            </tbody>
            </table>
                               </div>
                               </div>
                               <div class="claer"></div>
                             </div>
                             <!------------/// SIX TAB END HERE ---------------->
                             <!---------------// TAB SEVEN STARTED HERE ---------->
                             <div id="tab37" class="user_static_10 tab_content_1">
                                             
                                   <div class="form_scolling_project">
                                            <div class="from_main_leave_2">
            <table>
              <tbody><tr>
                <td colspan="6" class="table_heading">REIMBURSEMENT OF MEDICAL EXPENSES</td>
              </tr>
              <tr>
                <td width="224">Name of the Employee</td>
                <td colspan="2"><input type="text" class="emple_1" placeholder="Name of the Employee"></td>
                <td width="144">Employee No.</td>
                <td colspan="2"><input type="text" class="small_medical" placeholder="Enter Employee No."></td>
              </tr>
              <tr>
                <td>Designation</td>
                <td colspan="2"><input type="text" class="emple_1" placeholder="Enter Designation"></td>
                <td>Location</td>
                 <td colspan="2"><input type="text" class="small_medical" placeholder="Location"></td>
              </tr>
              <tr>
                <td colspan="6">Hospitalisation claim No,Yes No Yes (if yes  please indicate 'H' against Patient Name in Col.3 below)</td>
              </tr>
              <tr>
                <td colspan="6">If yes,Name of the Hospital: <input type="text" class="emple_1" placeholder="If yes,Name of the Hospita"></td>
              </tr>
              <tr>
                <td>Name of the Patient</td>
                <td width="217">Age</td>
                <td width="167">Name of claim</td>
                <td>Relationship with the Employee</td>
                <td width="224">Nature of illness</td>
                <td width="168">Name of the Doctor</td>
              </tr>
              <tr>
                <td><input type="text" class="small_medical" placeholder="Enter Name"></td>
                <td><input type="text" class="small_medical" placeholder="Enter Age"></td>
                <td><input type="text" class="small_medical" placeholder="Enter Name"></td>
                <td><input type="text" class="small_medical" placeholder="Relationship"></td>
                <td><input type="text" class="small_medical" placeholder="Illness"></td>
                <td><input type="text" class="small_medical" placeholder="Doctor">
                </td>            
              </tr>
              <tr>
                 <td colspan="6">    
                             <div class="addanddelete">
                                         <div class="add_table"></div>
                                         <div class="delete_table"></div>
                            </div>
                
                </td>
              </tr>
              
              <tr>
                <td rowspan="3" colspan="3"><p>Duration of Treatment/Hospitalisation:From</p>
                <p> (To be given each patient)</p></td>
                <td colspan="3">(i) <input type="text" class="small_medical" placeholder="Duration"> To <input type="text" class="small_medical" placeholder="Duration"></td>
              </tr>
              <tr>
              <td colspan="3">(i) <input type="text" class="small_medical" placeholder="Duration"> To <input type="text" class="small_medical" placeholder="Duration"></td>
              </tr>
              <tr>
            <td colspan="3">(i) <input type="text" class="small_medical" placeholder="Duration"> To <input type="text" class="small_medical" placeholder="Duration"></td>
              </tr>
              <tr>
                <td colspan="1">Expenses incurred towards:</td>
                <td colspan="2">No.of Receipts</td>
                <td colspan="2">Receipt Nos.and dates</td>
                <td>Total Amount</td>
              </tr>
              <tr>
                <td>Consultation</td>
                <td colspan="2"><input type="text" class="emple_1" placeholder="Consultation"></td>
                <td colspan="2"><input type="text" class="small_medical" placeholder="Consultation"><input type="date" class="small_medical"></td>
                <td>
                <table>
                  <tbody><tr>
                    <td><input type="text" class="rs money" placeholder="Rs."></td>
                    <td><input type="text" class="rs money" placeholder="p."></td>
                  </tr>
                </tbody></table>
                </td>
              </tr>
              <tr>
                <td>Investigation</td>
                <td colspan="2"><input type="text" class="emple_1" placeholder="Investigation"></td>
                <td colspan="2"><input type="text" class="small_medical" placeholder="Receipt Nos"><input type="date" class="small_medical"></td>
                <td>
                <table>
                <tbody><tr>
                    <td><input type="text" class="rs money" placeholder="Rs."></td>
                    <td><input type="text" class="rs money" placeholder="p."></td>
                  </tr>
                </tbody></table>
                </td>
              </tr>
               <tr>
                <td>Medicines</td>
                <td colspan="2"><input type="text" class="emple_1" placeholder="Medicines"></td>
                <td colspan="2"><input type="text" class="small_medical" placeholder="Receipt Nos"><input type="date" class="small_medical"></td>
                <td>
                <table>
                 <tbody><tr>
                    <td><input type="text" class="rs money" placeholder="Rs."></td>
                    <td><input type="text" class="rs money" placeholder="p."></td>
                  </tr>
                </tbody></table>
                </td>
              </tr>
              <tr>
                <td>Hospital Charges</td>
                <td colspan="2"><input type="text" class="emple_1" placeholder="Hospital Charges"></td>
                <td colspan="2"><input type="text" class="small_medical" placeholder="Receipt Nos"><input type="date" class="small_medical"></td>
                <td>
                <table>
                  <tbody><tr>
                    <td><input type="text" class="rs money" placeholder="Rs."></td>
                    <td><input type="text" class="rs money" placeholder="p."></td>
                  </tr>
                </tbody></table>
                </td>
              </tr>
             <tr>
                <td>Other</td>
                <td colspan="2"><input type="text" class="emple_1" placeholder="Other"></td>
                <td colspan="2"><input type="text" class="small_medical" placeholder="Receipt Nos"><input type="date" class="small_medical"></td>
                <td>
                <table>
                <tbody><tr>
                    <td><input type="text" class="rs money" placeholder="Rs."></td>
                    <td><input type="text" class="rs money" placeholder="p."></td>
                  </tr>
                </tbody></table>
                </td>
              </tr>
              <tr>
                <td colspan="3" rowspan="2">Amount in Words:Rupees <input type="text" class="emple_1"></td>
                <td>G.Total</td>
                <td><input type="text" class="small_medical" placeholder="G.Total"></td>
                <td><input type="text" class="small_medical" placeholder="G.Total"></td>
              </tr>
              <tr>
                <td>Rounded to</td>
                <td><input type="text" class="small_medical" placeholder="Rounded to"></td>
                <td><input type="text" class="small_medical" placeholder="Rounded to"></td>
              </tr>
              <tr>
                <td colspan="6">Certifled that the expenditure incurred as above has not been claimed/reimbursed through any other scheme such as medicalInsurance,scheme of spouse's organisation etc.The members of the family are dependent on me.</td>
              </tr>
              <tr>
                <td colspan="4" rowspan="2">Total No. of Enclosure
                (Employee to sign on the reverse of each Bill/Receipt)<input type="text" class="emple_1" placeholder="Total No. of Enclosure"></td>
                <td colspan="2">SIGNATURE OF THE EMPLOYEE<br><input type="file" class="emple_1"></td>
              </tr>
              <tr>
                <td colspan="2">Date <input type="date" class="emple_1"></td>
              </tr>
              <tr>
                <td colspan="2" rowspan="2">A.Domiciliary Entitlement Block Year 20</td>
                <td>Eligibility</td>
                <td>Availed</td>
                <td>Balance Available</td>
                <td>Balance c/f</td>
              </tr>
              <tr>
                <td><input type="text" class="small_medical" placeholder="Eligibility"></td>
                <td><input type="text" class="small_medical" placeholder="Availed"></td>
                <td><input type="text" class="small_medical" placeholder="Balance Available"></td>
                <td><input type="text" class="small_medical" placeholder="Balance c/f"></td>
              </tr>
              <tr>
                <td colspan="3">B.Clam Verification</td>
                <td>Domiciliary</td>
                <td>Hospitalisation</td>
                <td>Total</td>
              </tr>
              <tr>
                <td colspan="3">Amount Claimed</td>
                <td><input type="text" class="small_medical" placeholder="Amount Claimed"></td>
                <td><input type="text" class="small_medical" placeholder="Amount Claimed"></td>
                <td><input type="text" class="small_medical" placeholder="Amount Claimed"></td>
              </tr>
              <tr>
                <td colspan="3">Claim admitted for </td>
                <td><input type="text" class="small_medical" placeholder="Claim admitted for"></td>
                <td><input type="text" class="small_medical" placeholder="Claim admitted for"></td>
                <td><input type="text" class="small_medical" placeholder="Claim admitted for"></td>
              </tr>
              <tr>
                <td colspan="3">Rupees</td>
                <td><input type="text" class="small_medical" placeholder="Rupees"></td>
                <td><input type="text" class="small_medical" placeholder="Rupees"></td>
                <td><input type="text" class="small_medical" placeholder="Rupees"></td>
              </tr>
              <tr>
                <td colspan="2">CLAIM VERIFIED DATE
                <input type="date" class="small_medical">
                </td>
                <td colspan="2">CLAIM APPROVED DATE
                 <input type="date" class="small_medical">
                </td>
                <td colspan="2">PAYMENT AUTHORISED DATE
                 <input type="date" class="small_medical">
                </td>
              </tr>
                     <tr>
                 <td colspan="6"><div class="table_right">
                                  <!----------/// ADD USER ----------->
                                  <div class="Logged_User_tab_color add_user_js add_user_bg">SAVE</div>
                                  <!----------/// ADD USER END --------> 
                                  <!----------/// User List ----------->
                                  <div class="Logged_User_tab  onclick">CANCEL</div>
                                  <!----------/// User List END --------> 
                            
                          </div></td>
              </tr>
                
            </tbody>
            </table>
            </div>
                                   </div>
                                          <div class="claer"></div>
                             </div>
                             
                             <!--------------/// TAB SEVEN END HERE ------------->
                             <!------------/// TAB EIGHT END HERE ----------------->
                                   <div id="tab38" class="user_static_11 tab_content_1">
                                     
                                     
                                 <!------------------/// TAB SROLLING CONTENT ----------->    
                                         <div class="form_scolling_project">    
                                      <div class="from_main_leave">
                                         <table>
              <tbody><tr>
                <td colspan="5" rowspan="2" class="table_heading">PURCHASE REQUISITION</td>
                <td colspan="2">P.R.No: <input type="text" class="small_medical" placeholder="Enter P.R.No"></td>
              </tr>
              <tr>
                <td colspan="2">Date &nbsp;&nbsp;&nbsp;&nbsp;<input type="date" class="small_medical"></td>
              </tr>
              <tr>
                <td colspan="7"><input type="checkbox"><label>MOST URGENT</label>  <input type="checkbox"><label>IMMEDIATE</label>
                  <input type="checkbox"><label>ROUTINE PURCHASE</label></td>
              </tr>
              <tr>
                <td colspan="7">From: <input type="text" class="small_medical" placeholder="From"> Dept. <input type="text" class="small_medical" placeholder="Dept"> Location<input type="text" class="small_medical" placeholder="Location"></td>
              </tr>
              <tr>
                <td colspan="5">To:COMMERCIAL/MATERIAL /ADMIN <input type="text" class="small_medical" placeholder="Enter Here"></td>
                <td colspan="2">PLANT /HO <input type="text" class="small_medical" placeholder="PLANT /HO"></td>
              </tr>
              <tr>
                <td colspan="7">Nature of Materials:<input type="checkbox" placeholder="Nature of Materials"> <label>STOCK ITEM</label><input type="checkbox" placeholder="STOCK ITEM">
                <label> LOCAL PURCHASE</label><input type="checkbox" placeholder="LOCAL PURCHASE"><label> REGULAR PURCHASE</label></td>
              </tr>
              <tr>
                <td colspan="7"><input type="checkbox" placeholder="RAW MATERIALS"><label>RAW MATERIALS</label><input type="checkbox">
                <label> COMPONENTS &amp; SPARES ADMIN.STORES</label><input type="checkbox"><label> PRODUCTION CONSUMABLES</label></td>
              </tr>
              <tr>
                <td colspan="7"><input type="checkbox"><label>MAINTENANCE CONSUMABLES</label><input type="checkbox"><label> MISC.STORES</label>
                <input type="checkbox"><label> PACKAGING MATERIALS</label>
                <input type="checkbox"><label> LAB MATLS</label></td>
              </tr>
              <tr>
                <td width="5%">S.No</td>
                <td width="19%">Item Code</td>
                <td width="20%">Description</td>
                <td width="12%">Unit</td>
                <td width="14%">Packing</td>
                <td width="14%">Quantity</td>
                <td width="16%"> Source<br>
                (For LPO/PO)</td>
              </tr>
              <tr class="serial_no_page">
                <td><input type="text" class="serial_no" placeholder="No"></td>
                <td><input type="text" placeholder="Item Code"></td>
                <td><input type="text" placeholder="Description"></td>
                <td><input type="text" placeholder="Unit"></td>
                <td><input type="text" placeholder="Packing"></td>
                <td><input type="text" placeholder="Quantity"></td>
                <td><input type="text" placeholder="Source"></td>
              </tr>
              <tr>
                <td colspan="7">
                    <div class="addanddelete">
                           <div class="add_table"></div>
                           <div class="delete_table"></div>
                  </div>
                </td>
              </tr>
              <tr>
                <td colspan="4" class="indent_ul">
                   <ul>
                     <li class="indent">INDENTOR </li>
                     <li><input type="text" class="small_medical indent_input" placeholder="INDENTOR"></li>
                   </ul>
                </td>
                <td colspan="3" class="indent_ul">
                   <ul>
                     <li class="indent">INDENT AUTHORISED BY</li>
                     <li><input type="text" class="small_medical" placeholder="INDENT AUTHORISED "></li>
                   </ul>
                </td>
              </tr>
                <tr>
                <td colspan="4" class="indent_ul">
                   <ul>
                     <li class="indent">DATE</li>
                     <li><input type="date" class="small_medical"></li>
                   </ul>
                </td>
                <td colspan="3" class="indent_ul">
                  <ul>
                    <li class="indent"> DATE </li>
                    <li> <input type="date" class="small_medical"></li>
                  </ul>
                </td>
              </tr>
                     <tr>
                 <td colspan="7"><div class="table_right">
                                  <!----------/// ADD USER ----------->
                                  <div class="Logged_User_tab_color add_user_js add_user_bg">SAVE</div>
                                  <!----------/// ADD USER END --------> 
                                  <!----------/// User List ----------->
                                  <div class="Logged_User_tab  onclick">CANCEL</div>
                                  <!----------/// User List END --------> 
                            
                          </div></td>
              </tr>
            </tbody></table>
                                         <div class="claer"></div>
                                      </div>
                                 </div>
                                 <!-----------------/// TAB SCROLLING END HERE --------------->
                                 
                            </div>
                             <!---------------/// TAB EIGHT END HERE --------------->
                             <!--------------/// TAB NINE ---------------->
                             <div id="tab39" class="user_static_14 tab_content_1" style="display: block;">
                                   
                                  <div class="form_scolling_project">
                                     <div class="from_main_leave">
                                          <table>
              <tbody><tr>
                <td colspan="4" class="table_heading">INTER OFFICE MEMO</td>
              </tr>
              <tr>
                <td>FROM</td>
                <td><input type="text" class="memo_form" placeholder="FROM"></td>
                <td>TO</td>
                <td><input type="text" class="memo_form" placeholder="To"></td>
              </tr>
              <tr>
                <td>OUR REF</td>
                <td><input type="text" class="memo_form" placeholder="OUR REF"></td>
                <td>YOUR REF</td>
                <td><input type="text" class="memo_form" placeholder="YOUR REF"></td>
              </tr>
              <tr>
                <td>DATE</td>
                <td><input type="date" class="memo_form"></td>
                <td>DATE</td>
                <td><input type="date" class="memo_form"></td>
              </tr>
              <tr>
                <td colspan="4" class="textarea_div">
                   <textarea class="memo_textarea"></textarea>
                
                </td>
              </tr>
                     <tr>
                 <td colspan="4"><div class="table_right">
                                  <!----------/// ADD USER ----------->
                                  <div class="Logged_User_tab_color add_user_js add_user_bg">SAVE</div>
                                  <!----------/// ADD USER END --------> 
                                  <!----------/// User List ----------->
                                  <div class="Logged_User_tab  onclick">CANCEL</div>
                                  <!----------/// User List END --------> 
                            
                          </div></td>
              </tr>
            </tbody>
            </table>
                                     </div>
                                     <div class="claer"></div>
                                  </div>
            
                           </div>
                             <!-------------/// TAB NINE ----------------->
                             
                              <!--------/// FORM ALL CONTENT END HERE ---------------->
                        </div>
                        <!----// RIGHT END HERE -->

            
                                                            </div>
            
</body>
</html>