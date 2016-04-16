<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<script src="js/left_event.js" type="application/javascript"></script>




<script type="text/javascript">
	function getStartWorkflowForm(diagData) {
		var diagDataValues = diagData.split(":");
		var startFormKey = diagDataValues[0];

		var divid = "#" + diagDataValues[1];
		//alert(divid);
		//alert(startFormKey);
		$
				.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/activitiDiagram_getStartWorkflowPage",
					data : {
						sfk : startFormKey,
					},
					success : function(respData) {
						jQuery.get(respData, function(data) {

							if (data == "ajaxTrue") {
								showMsg('error',"session timeout !");
								location.href = "index";
							}
							$(divid).html(data);
						});
					}
				});
	}
</script>
<script type="text/javascript">
	function getWorkflowDiagram(tabvalue) {
		var tabvalues = tabvalue.split(":");
		var divid = "#" + tabvalues[1];
		$
				.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/activitiDiagram_getActivitiDiagram",
					data : {
						tv : tabvalue,
					},
					success : function(data) {
						if (data == "ajaxTrue") {
							showMsg('error',"session timeout !");
							location.href = "index";
						}
						$(divid).html(data);
					}
				});
	}
</script>



<script type="text/javascript">
function travelExpensesReimbursement_submit(buttonData) {
	var buttonValues = buttonData.split("::");
	var jsonData2 = {};
	var jsonData1 = {};
	var jsonDataObject = {};
	var workflowForm = [];
	var selected = jQuery('#beginWorkflowForm').find(
			'input, textarea, select');
	selected.each(function() {
		var type = $(this).attr('type');
		var ischecked = $(this).prop('checked');
		if (type != 'button') {
			var keynm = $(this).attr('id');

			jsonData1[keynm] = $(this).attr('type');
			if ((type == 'checkbox') || (type == 'radio')) {
				if (ischecked == true) {
					var keyname = $(this).attr('id');
					jsonData2[keyname] = $(this).val();
				} else {
					var keyname2 = $(this).attr('id');
					jsonData2[keyname2] = "";
				}
			} else {
				var keyname1 = $(this).attr('id');
				jsonData2[keyname1] = $(this).val();
			}

		}
	});
	workflowForm.push(jsonData2);
	workflowForm.push(jsonData1);
	jsonDataObject.workflowForm = workflowForm;
	//alert(jsonData);
	// turn the jsonData object into a string so it can be passed to the controller
	var jsonData = JSON.stringify(jsonDataObject);
	$
			.ajax({
				type : "POST",
				async: false,
				url : "${pageContext.request.contextPath}/travelExpensesReimbursement_submit",
				dataType : 'json',
				data : {
					json : jsonData,
					formType : "WorkflowForm",
					pkey : buttonValues[0],
					pname : buttonValues[1],
				},
				
				success : function(data) {
					alert(data);
					if (data == "ajaxTrue") {
						showMsg('error',"session timeout !");
						location.href = "index";
					} else {

						$("#activitiForms").html(data);
					}
				},
				error : function(err) {
					//	alert('hh'+ err.status + ' ' + err.statusText);
					if (err) {
						//location.href="index";
					}
					//showMsg2("success","Succesfully Submitted!");
					try {
						$("#action_gif").hide();
					} catch (e) {
						// TODO: handle exception
					}
					showMsgWF("Successfully Submitted!");
					jQuery.get("header_activitydiagrams", function(data) {
						
						$("#activitiForms").html(data);
					});
				}
			});
}

function submitForm_MedicalReimbursement(buttonData){
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
	//alert(jsonData);
   // turn the jsonData object into a string so it can be passed to the controller
   var jsonData = JSON.stringify(jsonDataObject);
	   $.ajax ({
			type: "POST",
	    	url:"${pageContext.request.contextPath}/medicalExpensesReimbursement_submit",
	    	data: {
	    		json:jsonData,
	    		formType:"WorkflowForm",
	    		pkey:buttonValues[0],
	    		pname:buttonValues[1],
	    	},
	    	dataType: 'json',
	    	success: function(data){
					if(data=="ajaxTrue"){
						showMsg('error',"session timeout !");
						location.href="index";
					}
					else{

	    			 $( "#activitiForms" ).html(data);	
					}
	    	},
	    	error: function(err){
	    	//	alert(err);
					if(err){
						//location.href="index";
					}
			    	//showMsg2("success","Succesfully Submitted!");
			    try{
			$("#action_gif").hide();
			}
			catch (e) {
			// TODO: handle exception
			}
			    	showMsgWF("Successfully Submitted!");
	    		jQuery.get("header_activitydiagrams", function(data) {
	    			 $( "#activitiForms" ).html(data);
	    			});
	        }
	    });
}


function submitForm(buttonData) {
	var buttonValues = buttonData.split("::");
	var jsonData2 = {};
	var jsonData1 = {};
	var jsonDataObject = {};
	var workflowForm = [];
	var selected = jQuery('#beginWorkflowForm').find(
			'input, textarea, select');
	selected.each(function() {
		var type = $(this).attr('type');
		var ischecked = $(this).prop('checked');
		if (type != 'button') {
			var keynm = $(this).attr('id');

			jsonData1[keynm] = $(this).attr('type');
			if ((type == 'checkbox') || (type == 'radio')) {
				if (ischecked == true) {
					var keyname = $(this).attr('id');
					jsonData2[keyname] = $(this).val();
				} else {
					var keyname2 = $(this).attr('id');
					jsonData2[keyname2] = "";
				}
			} else {
				var keyname1 = $(this).attr('id');
				jsonData2[keyname1] = $(this).val();
			}

		}
	});
	workflowForm.push(jsonData2);
	workflowForm.push(jsonData1);
	jsonDataObject.workflowForm = workflowForm;
	//alert(jsonData);
	// turn the jsonData object into a string so it can be passed to the controller
	var jsonData = JSON.stringify(jsonDataObject);
	$
			.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/startPurchaseRequisitionForm_submit",
				data : {
					json : jsonData,
					formType : "WorkflowForm",
					pkey : buttonValues[0],
					pname : buttonValues[1],
				},
				dataType : 'json',
				success : function(data) {
					if (data == "ajaxTrue") {
						showMsg('error',"session timeout !");
						location.href = "index";
					} else {

						$("#activitiForms").html(data);
					}
				},
				error : function(err) {
					//	alert(err);
					if (err) {
						//location.href="index";
					}
					//showMsg2("success","Succesfully Submitted!");
					try {
						$("#action_gif").hide();
					} catch (e) {
						// TODO: handle exception
					}
					showMsgWF("Successfully Submitted!");
					jQuery.get("header_activitydiagrams", function(data) {
						$("#activitiForms").html(data);
					});
				}
			});
}

	function submitFormHO(buttonData) {
		var buttonValues = buttonData.split("::");
		var jsonData2 = {};
		var jsonData1 = {};
		var jsonDataObject = {};
		var workflowForm = [];
		var selected = jQuery('#beginWorkflowForm').find(
				'input, textarea, select');
		selected.each(function() {
			var type = $(this).attr('type');
			var ischecked = $(this).prop('checked');
			if (type != 'button') {
				var keynm = $(this).attr('id');

				jsonData1[keynm] = $(this).attr('type');
				if ((type == 'checkbox') || (type == 'radio')) {
					if (ischecked == true) {
						var keyname = $(this).attr('id');
						jsonData2[keyname] = $(this).val();
					} else {
						var keyname2 = $(this).attr('id');
						jsonData2[keyname2] = "";
					}
				} else {
					var keyname1 = $(this).attr('id');
					jsonData2[keyname1] = $(this).val();
				}

			}
		});
		workflowForm.push(jsonData2);
		workflowForm.push(jsonData1);
		jsonDataObject.workflowForm = workflowForm;
		//alert(jsonData);
		// turn the jsonData object into a string so it can be passed to the controller
		var jsonData = JSON.stringify(jsonDataObject);
		$
				.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/startPurchaseRequisitionForm_submitHO",
					data : {
						json : jsonData,
						formType : "WorkflowForm",
						pkey : buttonValues[0],
						pname : buttonValues[1],
					},
					dataType : 'json',
					success : function(data) {
						if (data == "ajaxTrue") {
							showMsg('error',"session timeout !");
							location.href = "index";
						} else {

							$("#activitiForms").html(data);
						}
					},
					error : function(err) {
						//	alert(err);
						if (err) {
							//location.href="index";
						}
						//showMsg2("success","Succesfully Submitted!");
						try {
							$("#action_gif").hide();
						} catch (e) {
							// TODO: handle exception
						}
						showMsgWF("Successfully Submitted!");
						jQuery.get("header_activitydiagrams", function(data) {
							$("#activitiForms").html(data);
						});
					}
				});
	}

	function submitForm_CashPayment(buttonData) {
		var buttonValues = buttonData.split("::");
		var jsonData2 = {};
		var jsonData1 = {};
		var jsonDataObject = {};
		var workflowForm = [];
		var selected = jQuery('#beginWorkflowForm').find(
				'input, textarea, select');
		selected.each(function() {
			var type = $(this).attr('type');
			var ischecked = $(this).prop('checked');
			if (type != 'button') {
				var keynm = $(this).attr('id');
				jsonData1[keynm] = $(this).attr('type');
				if ((type == 'checkbox') || (type == 'radio')) {
					if (ischecked == true) {
						var keyname = $(this).attr('id');
						jsonData2[keyname] = $(this).val();
					} else {
						var keyname2 = $(this).attr('id');
						jsonData2[keyname2] = "";
					}
				} else {
					var keyname1 = $(this).attr('id');
					jsonData2[keyname1] = $(this).val();
				}
			}
		});
		workflowForm.push(jsonData2);
		workflowForm.push(jsonData1);
		jsonDataObject.workflowForm = workflowForm;
		//alert(jsonData);
		// turn the jsonData object into a string so it can be passed to the controller
		var jsonData = JSON.stringify(jsonDataObject);
		$
				.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/startCashPaymentVoucher_submit",
					data : {
						json : jsonData,
						formType : "WorkflowForm",
						pkey : buttonValues[0],
						pname : buttonValues[1],
					},
					dataType : 'json',
					success : function(data) {
						if (data == "ajaxTrue") {
							showMsg('error',"session timeout !");
							location.href = "index";
						} else {

							$("#activitiForms").html(data);
						}
					},
					error : function(err) {
						//	alert(err);
						if (err) {
							//alert(err);
							//location.href="index";
						}
						//showMsg("success","Succesfully Submitted!");
						try {
							$("#action_gif").hide();
						} catch (e) {
							// TODO: handle exception
						}
						showMsgWF("Successfully Submitted!");
						jQuery.get("header_activitydiagrams", function(data) {
							$("#activitiForms").html(data);
						});
					}
				});
	}

	function submitForm_IOM(buttonData) {
		var buttonValues = buttonData.split("::");
		var jsonData2 = {};
		var jsonData1 = {};
		var jsonDataObject = {};
		var workflowForm = [];
		var selected = jQuery('#beginWorkflowForm').find(
				'input, textarea, select');
		selected.each(function() {
			var type = $(this).attr('type');
			var ischecked = $(this).prop('checked');
			if (type != 'button') {
				var keynm = $(this).attr('id');
				jsonData1[keynm] = $(this).attr('type');
				if ((type == 'checkbox') || (type == 'radio')) {
					if (ischecked == true) {
						var keyname = $(this).attr('id');
						jsonData2[keyname] = $(this).val();
					} else {
						var keyname2 = $(this).attr('id');
						jsonData2[keyname2] = "";
					}
				} else {
					var keyname1 = $(this).attr('id');
					jsonData2[keyname1] = $(this).val();
				}
			}
		});
		workflowForm.push(jsonData2);
		workflowForm.push(jsonData1);
		jsonDataObject.workflowForm = workflowForm;
		//alert(jsonData);
		// turn the jsonData object into a string so it can be passed to the controller
		var jsonData = JSON.stringify(jsonDataObject);
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/startIOMForm_submit",
			data : {
				json : jsonData,
				formType : "WorkflowForm",
				pkey : buttonValues[0],
				pname : buttonValues[1],
			},
			dataType : 'json',
			success : function(data) {
				if (data == "ajaxTrue") {
					showMsg('error',"session timeout !");
					location.href = "index";
				} else {

					$("#activitiForms").html(data);
				}
			},
			error : function(err) {
				//	alert(err);
				if (err) {
					//location.href="index";
				}
				try {
					$("#action_gif").hide();
				} catch (e) {
					// TODO: handle exception
				}
				showMsgWF("Successfully Submitted!");
				jQuery.get("header_activitydiagrams", function(data) {
					$("#activitiForms").html(data);
				});
			}
		});
	}

	function submitForm_leave(buttonData){
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
		//alert(jsonData);
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
 					if(data=="ajaxTrue"){
						showMsg('error',"session timeout !");
							location.href="index";
						}
 					else{

		    			 $( "#activitiForms" ).html(data);	
 					}
		    	},
		    	error: function(err){
		    	//	alert(err);
 					if(err){
							//location.href="index";
						}
 					try{
 						$("#action_gif").hide();
 						}
 						catch (e) {
 						// TODO: handle exception
 						}
 						
 					showMsgWF("Successfully Submitted!");
		    		jQuery.get("header_activitydiagrams", function(data) {
		    			 $( "#activitiForms" ).html(data);
		    			});
		        }
		    });
	}
</script>
<script type="text/javascript">
	function cancelForm() {
		jQuery.get("header_activitydiagrams", function(data) {
			if (data == "ajaxTrue") {
				showMsg('error',"session timeout !");
				location.href = "index";
			}
			$("#activitiForms").html(data);
		});
	}
</script>
</head>
<body>
	<div class="right other_pages">
		<!--------/// FORM ALL CONTENT STARED HERE ------------->
		<!----------/// MAIN FORM MENU STARTED HERE --------->
		<div class="form_tab table_menu_height_1">
			<ul class="tabs user_tab_1 table_menu_height form_11">

				<!-- <li rel="tab32" class="table_menu ">
        Master Vendor Database
    </li>
    <li rel="tab33" class="table_menu">
        Vender Creation Form 
    </li> -->
				<li rel="tab34" class="table_menu"
					onclick="getWorkflowDiagram('cashPaymentVoucherRequest:tab34')">
					Cash Payment Voucher</li>
				 <li rel="tab35" class="table_menu" onclick="getWorkflowDiagram('LeaveApplicationFormRequest:tab35')">Leave
					Application Form</li>
				<li rel="tab36" class="table_menu travel" onclick="getWorkflowDiagram('travelReimbursementRequest:tab36')" >Travel Expenses
					Reimbursement Claim</li>
				  <li rel="tab37" class="table_menu medical_expenses" onclick="getWorkflowDiagram('MedicalReimbursementRequest:tab37')">
					Reimbursement of Medical Expenses</li>
				<li rel="tab38" class="table_menu"
					onclick="getWorkflowDiagram('purchaseRequisitionRequest:tab38')">
					Purchase Requisition (Plant)</li>
				<li class="table_menu" rel="tab31"
					onclick="getWorkflowDiagram('purchaseRequisitionRequestHO:tab31')">
					Purchase Requisition (HO)</li>
				<li rel="tab39" class="table_menu memo"
					onclick="getWorkflowDiagram('iomRequest:tab39')">Inter Office
					Memo</li>
			</ul>
			<div class="claer"></div>
		</div>
		<div id="tab31" class="user_static_7 tab_content_1"
			style="display: block;"></div>
		<div id="tab34" class="user_static_6 tab_content_1"></div>
		<div id="tab35" class="user_static_8 tab_content_1"></div>
		<div id="tab36" class="user_static_13 tab_content_1">
			<div class="form_scolling_project">
				<div class="from_main_leave">
					<div class="claer"></div>
				</div>
			</div>

		</div>
		<div id="tab37" class="user_static_10 tab_content_1"></div>
		<div id="tab38" class="user_static_11 tab_content_1">
			<div class="form_scolling_project">
				<div class="from_main_leave">
					<div class="claer"></div>
				</div>
			</div>
			<!-----------------/// TAB SCROLLING END HERE --------------->

		</div>
		<!---------------/// TAB EIGHT END HERE --------------->
		<!--------------/// TAB NINE ---------------->
		<div id="tab39" class="user_static_14 tab_content_1"
			style="display: block;"></div>
		<!-------------/// TAB NINE ----------------->

		<!--------/// FORM ALL CONTENT END HERE ---------------->
	</div>
	<!----// RIGHT END HERE -->


	</div>

</body>
</html>