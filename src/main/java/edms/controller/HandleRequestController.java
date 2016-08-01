package edms.controller;

import java.io.StringWriter;

import edms.core.Config;
import edms.core.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

import edms.service.StringOperationsService;
import edms.webservice.client.WorkflowClient;
import edms.webservice.client.WorkflowHistoryClient;
import edms.wsdl.GetHistoryTaskInstanceResponse;
import edms.wsdl.GetTaskFormDataResponse;
import edms.wsdl.HashMap;
import edms.wsdl.HistTaskInstList;
import edms.wsdl.HistTaskInstListReturn;
import edms.wsdl.TaskFormData;
import edms.wsdl.TaskFormProperty;

@Controller
public class HandleRequestController {

	@Autowired
	private WorkflowClient workflowClient;
	@Autowired
	private StringOperationsService stringOperationService;
	@Autowired
	private WorkflowHistoryClient workflowHistoryClient;

	@RequestMapping(value = "/handleRequest_formDecision", method = RequestMethod.POST)
	public @ResponseBody String requestResponseNo(HttpServletRequest request, Principal principal) {
		if (principal == null) {
			return "ajaxTrue";
		} else {
			String taskid = request.getParameter("taskid");
			String json = request.getParameter("json");
			String formType = request.getParameter("formType");
			String requestType = request.getParameter("reqtype");
			JSONObject jsonDataObject = (JSONObject) JSONValue.parse(json);
			JSONArray jsonArr = (JSONArray) jsonDataObject.get("workflowForm");

			GetHistoryTaskInstanceResponse respHistTaskInstt = workflowHistoryClient
					.getHistoryTaskInstanceRequest(taskid);
			HistTaskInstListReturn historicTaskListReturn = respHistTaskInstt.getHistTaskInstListReturn();
			List<HistTaskInstList> historicTaskInstance = historicTaskListReturn.getHistTaskInstList();
			String processInstId = historicTaskInstance.get(0).getProcessInstanceId();

			String formName = "";
			GetTaskFormDataResponse respTaskFormData = workflowClient.getTaskFormDataRequest(taskid);
			TaskFormData taskFormData = respTaskFormData.getTaskFormData();
			String frmNmae = taskFormData.getFormKey();
			List<TaskFormProperty> formProperties = taskFormData.getTaskFormProperties();
			for (TaskFormProperty tf : formProperties) {
			}
			List<edms.wsdl.HashMap> taskVariables = new ArrayList<edms.wsdl.HashMap>();
			DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
			try {
				DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
				// root element
				Document doc = docBuilder.newDocument();
				Element rootElement = doc.createElement(formType);
				doc.appendChild(rootElement);

				// take each value from the json array separately
				JSONObject jsonFormObj = (JSONObject) jsonArr.get(0);
				Set<String> keys = jsonFormObj.keySet();
				Iterator<String> it = keys.iterator();
				Map<Integer,HashMap> hmpset=new TreeMap<Integer,HashMap>();
				int id = 1;

				String subject = "";
				String mailContent = "";
				String userName = "";
				String formTo = "";
				String employeeID = "";
				String gtotal="";
				String empName="";
				String empNo="";
				String empDesig="";
				String verificationStep="";
				String approvalStep="";
				String authorizationStep="";
				String accountStep="";

				String lv_name = "";
				String lv_empno = "";
				String lv_desig = "";
				String lv_dept = "";
				String lv_nod = "";
				String lv_type = "";
				String lv_from = "";
				String lv_to = "";
				String lv_dt = "";
				String lv_el = "";
				String lv_sl = "";
				String lv_granted = "";
				String formBy = "";
				String usersubject = "";
				String usermailContent = "";
				String remark = "";
				String historyHiddenTasks = "";
				String deptName = "";
				String prNo = "";
				String natureOfCategory="";
				String natureOfMaterial="";
				String itemCode1="";
				String itemDescription1="";
				String itemQuantity1="";
				String urgency="";
				String itemCode2="";
				String itemDescription2="";
				String itemQuantity2="";

				String itemCode3="";
				String itemDescription3="";
				String itemQuantity3="";

				String itemCode4="";
				String itemDescription4="";
				String itemQuantity4="";

				String itemCode5="";
				String itemDescription5="";
				String itemQuantity5="";

				String itemCode6="";
				String itemDescription6="";
				String itemQuantity6="";

				String itemCode7="";
				String itemDescription7="";
				String itemQuantity7="";

				String itemCode8="";
				String itemDescription8="";
				String itemQuantity8="";

				String itemCode9="";
				String itemDescription9="";
				String itemQuantity9="";

				String itemCode10="";
				String itemDescription10="";
				String itemQuantity10="";

				String serialNo1="";
				String itemUnit1="";
				String itemPacking1="";
				String itemSource1="";

				String serialNo2="";
				String itemUnit2="";
				String itemPacking2="";
				String itemSource2="";
				
				String serialNo3="";
				String itemUnit3="";
				String itemPacking3="";
				String itemSource3="";
			
				String serialNo4="";
				String itemUnit4="";
				String itemPacking4="";
				String itemSource4="";
			
				String serialNo5="";
				String itemUnit5="";
				String itemPacking5="";
				String itemSource5="";
			
				String serialNo6="";
				String itemUnit6="";
				String itemPacking6="";
				String itemSource6="";
			
				String serialNo7="";
				String itemUnit7="";
				String itemPacking7="";
				String itemSource7="";
				
				String serialNo8="";
				String itemUnit8="";
				String itemPacking8="";
				String itemSource8="";
				
				String serialNo9="";
				String itemUnit9="";
				String itemPacking9="";
				String itemSource9="";
				
				String serialNo10="";
				String itemUnit10="";
				String itemPacking10="";
				String itemSource10="";
			
				
				String ourReference="";
				String yourReference="";
				

				while (it.hasNext()) {
					String key = (String) it.next();
					// loop to get the dynamic key
					String value = (String) jsonFormObj.get(key);

					if (key.equals("filledDaete")) {
					//	workflowClient.getAuthorizeUserRequest(value);
						HashMap hmp = new HashMap();
						hmp.setKey(key);
						hmp.setValue(value);
					//	taskVariables.add(hmp);
						hmpset.put(8, hmp);
					
					}

					if (key.equals("formSStatus")) {
						
					//	workflowClient.getAuthorizeUserRequest(value);
						HashMap hmp = new HashMap();
						hmp.setKey(key);
						hmp.setValue(value);
					//	taskVariables.add(hmp);
						hmpset.put(7, hmp);
					}
					if (key.equals("formTo")) {
					//	workflowClient.getAuthorizeUserRequest(value);
						HashMap hmp = new HashMap();
						hmp.setKey(key);
						hmp.setValue(value);
					//	taskVariables.add(hmp);
						formTo = value;
						hmpset.put(6, hmp);
					}
					if (key.equals("formBy")) {
						formBy = value;

					}
					if (key.equals("voucherRemark")) {
						remark = value;

					}
					if (key.equals("employeeID")) {
						//workflowClient.getAuthorizeUserRequest(value);
						HashMap hmp = new HashMap();
						hmp.setKey(key);
						hmp.setValue(value);
						//taskVariables.add(hmp);
						employeeID = value;
						hmpset.put(1, hmp);

					}

					if (key.equals("empNo")) {
						lv_empno = value;

					}
					if (key.equals("empDesig")) {
						lv_desig = value;

					}
					if (key.equals("deptName")) {
						lv_dept = value;

					}
					if (key.equals("noOfDays")) {
						lv_nod = value;

					}

					if (key.equals("EL") && !value.equalsIgnoreCase("")) {
						lv_type = "EL";

					}
					if (key.equals("SL") && !value.equalsIgnoreCase("")) {
						lv_type = "SL";

					}
					if (key.equals("ML") && !value.equalsIgnoreCase("")) {
						lv_type = "ML";

					}
					if (key.equals("PL") && !value.equalsIgnoreCase("")) {
						lv_type = "PL";

					}
					if (key.equals("StL") && !value.equalsIgnoreCase("")) {
						lv_type = "StL";

					}
					if (key.equals("SpL") && !value.equalsIgnoreCase("")) {
						lv_type = "SpL";

					}
					if (key.equals("LWP") && !value.equalsIgnoreCase("")) {
						lv_type = "LWP";

					}
					if (key.equals("CgL") && !value.equalsIgnoreCase("")) {
						lv_type = "CgL";

					}

					if (key.equals("gtotal")||key.equals("gtl")||key.equals("voucherTotal")) {
						if(value!=null&&value!=""&&value!="undefined")
						gtotal=value;
					}
					if (key.equals("empName")) {
						empName=value;
					}
					if (key.equals("empNo")) {
						empNo=value;
					}
					if (key.equals("empDesig")||key.equals("empDesignation")) {
						if(value!=null&&value!=""&&value!="undefined")
						if(value!=null&&value!=""&&value!="undefined")
						empDesig=value;
					}
					if (key.equals("deptName")||key.equals("empDept")) {
						deptName=value;
					}

					if (key.equals("rawMaterials") && !value.equalsIgnoreCase("")) {
						natureOfCategory+= value+", ";

					}
					if (key.equals("adminStores") && !value.equalsIgnoreCase("")) {
						natureOfCategory+= value+", ";

					}
					if (key.equals("components") && !value.equalsIgnoreCase("")) {
						natureOfCategory+= value+", ";

					}
					if (key.equals("productionCousumables") && !value.equalsIgnoreCase("")) {
						natureOfCategory+= value+", ";

					}
					if (key.equals("maintainanceConsumables") && !value.equalsIgnoreCase("")) {
						natureOfCategory+= value+", ";

					}
					if (key.equals("miscStores") && !value.equalsIgnoreCase("")) {
						natureOfCategory += value+", ";

					}
					if (key.equals("packagingMaterials") && !value.equalsIgnoreCase("")) {
						natureOfCategory+= value+", ";

					}
					if (key.equals("labMatls") && !value.equalsIgnoreCase("")) {
						natureOfCategory += value+", ";

					}
					if (key.equals("it") && !value.equalsIgnoreCase("")) {
						natureOfCategory += value+", ";

					}
					
					
					if (key.equals("stockItem") && !value.equalsIgnoreCase("")) {
						natureOfMaterial=value;

					}
					if (key.equals("localPurchase") && !value.equalsIgnoreCase("")) {
						natureOfMaterial=value;

					}
					if (key.equals("regularPurchase") && !value.equalsIgnoreCase("")) {
						natureOfMaterial=value;

					}
					if (key.equals("itemCode1") ) {
						itemCode1 = value;;

					}
					if (key.equals("itemDescription1") ) {
						itemDescription1 = value;;

					}
					if (key.equals("itemQuantity1") ) {
						itemQuantity1 = value;;

					}
					if (key.equals("itemCode2") ) {
						itemCode2 = value;;

					}
					if (key.equals("itemDescription2") ) {
						itemDescription2 = value;;

					}
					if (key.equals("itemQuantity2") ) {
						itemQuantity2 = value;;

					}
					if (key.equals("itemCode3") ) {
						itemCode3 = value;;

					}
					if (key.equals("itemDescription3") ) {
						itemDescription3 = value;;

					}
					if (key.equals("itemQuantity3") ) {
						itemQuantity3 = value;;

					}
					if (key.equals("itemCode4") ) {
						itemCode4 = value;;

					}
					if (key.equals("itemDescription4") ) {
						itemDescription4 = value;;

					}
					if (key.equals("itemQuantity4") ) {
						itemQuantity4 = value;;

					}
					if (key.equals("itemCode5") ) {
						itemCode5 = value;;

					}
					if (key.equals("itemDescription5") ) {
						itemDescription5= value;;

					}
					if (key.equals("itemQuantity5") ) {
						itemQuantity5 = value;;

					}
					if (key.equals("itemCode6") ) {
						itemCode6 = value;;

					}
					if (key.equals("itemDescription6") ) {
						itemDescription6 = value;;

					}
					if (key.equals("itemQuantity6") ) {
						itemQuantity6 = value;;

					}
					if (key.equals("itemCode7") ) {
						itemCode7 = value;;

					}
					if (key.equals("itemDescription7") ) {
						itemDescription7 = value;;

					}
					if (key.equals("itemQuantity7") ) {
						itemQuantity7 = value;;

					}
					if (key.equals("itemCode8") ) {
						itemCode8 = value;;

					}
					if (key.equals("itemDescription8") ) {
						itemDescription8 = value;;

					}
					if (key.equals("itemQuantity8") ) {
						itemQuantity8 = value;;

					}
					if (key.equals("itemCode9") ) {
						itemCode9 = value;;

					}
					if (key.equals("itemDescription9") ) {
						itemDescription9 = value;;

					}
					if (key.equals("itemQuantity9") ) {
						itemQuantity9 = value;;

					}
					if (key.equals("itemCode10") ) {
						itemCode10 = value;;

					}
					if (key.equals("itemDescription10") ) {
						itemDescription10 = value;;

					}
					if (key.equals("itemQuantity10") ) {
						itemQuantity10 = value;;

					}

					if (key.equals("serialNo1") ) {
						serialNo1 = value;;

					}

					if (key.equals("itemUnit1") ) {
						itemUnit1 = value;;

					}

					if (key.equals("itemPacking1") ) {
						itemPacking1 = value;;

					}

					if (key.equals("itemSource1") ) {
						itemSource1 = value;;

					}
					
					
					
				
					if (key.equals("serialNo2") ) {
						serialNo2 = value;;

					}

					if (key.equals("itemUnit2") ) {
						itemUnit2 = value;;

					}

					if (key.equals("itemPacking2") ) {
						itemPacking2 = value;;

					}

					if (key.equals("itemSource2") ) {
						itemSource2 = value;;

					}
					
					
					
					if (key.equals("serialNo3") ) {
						serialNo3 = value;;

					}

					if (key.equals("itemUnit3") ) {
						itemUnit3 = value;;

					}

					if (key.equals("itemPacking3") ) {
						itemPacking3 = value;;

					}

					if (key.equals("itemSource3") ) {
						itemSource3 = value;;

					}
					
					
					if (key.equals("serialNo4") ) {
						serialNo4 = value;;

					}

					if (key.equals("itemUnit4") ) {
						itemUnit4 = value;;

					}

					if (key.equals("itemPacking4") ) {
						itemPacking4 = value;;

					}

					if (key.equals("itemSource4") ) {
						itemSource4 = value;;

					}
					
					
					if (key.equals("serialNo5") ) {
						serialNo5 = value;;

					}

					if (key.equals("itemUnit5") ) {
						itemUnit5 = value;;

					}

					if (key.equals("itemPacking5") ) {
						itemPacking5 = value;;

					}

					if (key.equals("itemSource5") ) {
						itemSource5 = value;;

					}
					

					if (key.equals("serialNo6") ) {
						serialNo6 = value;;

					}

					if (key.equals("itemUnit6") ) {
						itemUnit6 = value;;

					}

					if (key.equals("itemPacking6") ) {
						itemPacking6 = value;;

					}

					if (key.equals("itemSource6") ) {
						itemSource6 = value;;

					}
					

					if (key.equals("serialNo7") ) {
						serialNo7 = value;;

					}

					if (key.equals("itemUnit7") ) {
						itemUnit7 = value;;

					}

					if (key.equals("itemPacking7") ) {
						itemPacking7 = value;;

					}

					if (key.equals("itemSource7") ) {
						itemSource7 = value;;

					}
					
					
					
					
					if (key.equals("serialNo8") ) {
						serialNo8 = value;;

					}

					if (key.equals("itemUnit8") ) {
						itemUnit8 = value;;

					}

					if (key.equals("itemPacking8") ) {
						itemPacking8 = value;;

					}

					if (key.equals("itemSource8") ) {
						itemSource8 = value;;

					}
					
					
					
					
					if (key.equals("serialNo9") ) {
						serialNo9 = value;;

					}

					if (key.equals("itemUnit9") ) {
						itemUnit9 = value;;

					}

					if (key.equals("itemPacking9") ) {
						itemPacking9 = value;;

					}

					if (key.equals("itemSource9") ) {
						itemSource9 = value;;

					}
					
					
					if (key.equals("serialNo10") ) {
						serialNo10 = value;;

					}

					if (key.equals("itemUnit10") ) {
						itemUnit10 = value;;

					}

					if (key.equals("itemPacking10") ) {
						itemPacking10 = value;;

					}

					if (key.equals("itemSource10") ) {
						itemSource10 = value;;

					}
					if (key.equals("mostUrgent") && !value.equalsIgnoreCase("") ) {
						urgency = value;;

					}
					if (key.equals("immediate") && !value.equalsIgnoreCase("") ) {
						urgency = value;;

					}
					if (key.equals("routinePurchase") && !value.equalsIgnoreCase("") ) {
						urgency = value;;

					}
					
					
					
					
					

					if (key.equals("authorizationStep")) {
						/*
						 * if(value.indexOf(Config.EDMS_DOMAIN)<0) flag=false;
						 */
						authorizationStep = value;
					//	workflowClient.getAuthorizeUserRequest(value);
						HashMap hmp = new HashMap();
						hmp.setKey(key);
						hmp.setValue(value);
					//	taskVariables.add(hmp);
						hmpset.put(4, hmp);
					
					}
					if (key.equals("verificationStep")) {
						/*
						 * if(value.indexOf(Config.EDMS_DOMAIN)<0) flag=false;
						 */

						verificationStep = value;
					//	workflowClient.getAuthorizeUserRequest(value);
						HashMap hmp = new HashMap();
						hmp.setKey(key);
						hmp.setValue(value);
					//	taskVariables.add(hmp);
						hmpset.put(2, hmp);
					}
					if (key.equals("approvalStep")) {
						/*
						 * if(value.indexOf(Config.EDMS_DOMAIN)<0) flag=false;
						 */
						approvalStep = value;
					//	workflowClient.getAuthorizeUserRequest(value);
						HashMap hmp = new HashMap();
						hmp.setKey(key);
						hmp.setValue(value);
					//	taskVariables.add(hmp);
						hmpset.put(3, hmp);
					}
					if (key.equals("accountStep")) {
						/*
						 * if(value.indexOf(Config.EDMS_DOMAIN)<0) flag=false;
						 */
						accountStep = value;
					//	workflowClient.getAuthorizeUserRequest(value);
						HashMap hmp = new HashMap();
						hmp.setKey(key);
						hmp.setValue(value);
					//	taskVariables.add(hmp);
						hmpset.put(5, hmp);
					}
					if (key.equals("fromDate")) {
						lv_from = value;

					}
					if (key.equals("toDate")) {
						lv_to = value;

					}
					if (key.equals("curr_Date")) {
						lv_dt = value;

					}
					if (key.equals("creditel")) {
						lv_el = value;

					}
					if (key.equals("creditsl")) {
						lv_sl = value;

					}
					if (key.equals("leaveNot") && !value.equalsIgnoreCase("")) {
						lv_granted = value;

					}

					if (key.equals("empName")) {
						userName = value;
						lv_name = value;
						//workflowClient.getAuthorizeUserRequest(value);
						HashMap hmp = new HashMap();
						hmp.setKey(key);
						hmp.setValue(value);
						//taskVariables.add(hmp);
						hmpset.put(9, hmp);
					}
					if (key.equals("prNo")) {
						// userName=value;
						prNo=value;
						//workflowClient.getAuthorizeUserRequest(value);
						HashMap hmp = new HashMap();
						hmp.setKey(key);
						hmp.setValue(value);
						//taskVariables.add(hmp);
						hmpset.put(10, hmp);
					}
					if (key.equals("formName")) {
						// userName=value;
						//workflowClient.getAuthorizeUserRequest(value);
						HashMap hmp = new HashMap();
						hmp.setKey(key);
						hmp.setValue(value);
						//taskVariables.add(hmp);
						hmpset.put(11, hmp);
					}
					if (key.equals("formNameWF")) {
						formName = value;

					}
					if (key.equals("yourReference")) {
						yourReference = value;

					}
					if (key.equals("ourReference")) {
						ourReference = value;

					}

					if (key.equals("formTo")) {
						/*
						 * if(value.indexOf(Config.EDMS_DOMAIN)<0) flag=false;
						 */

					}

					/*if (key.equals("historyHiddenTasks")) {
						if (requestType.equals("accept")) {
							if (frmNmae.equalsIgnoreCase("authorizeLeaveApplicationForm")
									|| frmNmae.equalsIgnoreCase("authorizeMedicalExpensesReimbursement")
									|| frmNmae.equalsIgnoreCase("handleIOMForm2")
									|| frmNmae.equals("authorizeTravelExpensesReimbursement")
									|| formTo.equals(employeeID) && employeeID != "") {
								if (frmNmae.indexOf("cashPayment") > 0)
									value = value + "Payment released By " + authorizationStep + " on Dated "
											+ (new Date()).toString();
								else
									value = value + "Authorized By " + authorizationStep + " on Dated "
											+ (new Date()).toString();

							}
						}
					}*/

					// attribute elements
					Element attribute = doc.createElement("field");
					rootElement.appendChild(attribute);
					// set attribute to staff element
					Attr attr = doc.createAttribute("id");
					attr.setValue(String.valueOf(id));
					attribute.setAttributeNode(attr);

					// attribute id elements
if(key!=null){
					Element newElement = doc.createElement("attributeId");
					newElement.appendChild(doc.createTextNode(key.trim()));
					attribute.appendChild(newElement);
}
					if(value!=null){

// attribute value elements
					Element attvalue = doc.createElement("attributeValue");
					attvalue.appendChild(doc.createTextNode(value.trim()));
					attribute.appendChild(attvalue);
					}
					JSONObject jsonFormObj1 = (JSONObject) jsonArr.get(1);
					Set<String> keys1 = jsonFormObj1.keySet();
					Iterator<String> it1 = keys1.iterator();
					while (it1.hasNext()) {
						String key1 = (String) it1.next();
						// loop to get the dynamic key
						String value1 = (String) jsonFormObj1.get(key1);
						if (key1!=null&&key1.equals(key)) {
							// attribute type elements
							Element attType = doc.createElement("attributeType");
							if(value1!=null)
							attType.appendChild(doc.createTextNode(value1.trim()));
							attribute.appendChild(attType);
							break;
						}
					}
					id++;
				}


				//for Medical Reimbursement accept after rejection
				if(requestType.equals("accept")&&(frmNmae.equalsIgnoreCase("readjustMedicalExpensesReimbursement")||frmNmae.equalsIgnoreCase("readjustTravelExpensesReimbursement"))){

				/*	HashMap hmp = new HashMap();
					hmp.setKey(key);
					hmp.setValue(value);
					taskVariables.add(hmp);*/
					
					
					
					//for verifier
					 subject = "Action Required : " + formName;
					 mailContent = "<br>Dear Sir/Madam,<br><br>" +

					"You have new request for Verification<br><br><br>" +

					"<strong>Request Category: </strong> " + formName + "<br>" +
					"<strong> Amount: " + gtotal + "</strong><br><br><br>" +

					"<strong>Name : </strong>" + empName + "<br>" +
					"<strong>Emp. Code : </strong>" + empNo + "<br>" +
					"<strong>Designation : </strong>" + empDesig + "<br>" +
					"<strong>Department : </strong>" + deptName + "<br><br><br>" +

					"Resubmitted By: " + employeeID + "<br><br>";
					if (remark != null)
						mailContent += "Remark: " + remark + "<br><br><br>";
					mailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					mailContent += "*** This is an automatically generated email, please do not reply ***";
					
					//for user
					 usersubject = "Info : " + formName;
					 usermailContent = "<br>Dear Sir/Madam,<br><br>" +

					"Your form have been successfully Resubmitted. <br><br><br>" +

					"<strong>Request Category: </strong> " + formName + "<br>" +
					"<strong> Amount: " + gtotal + "</strong><br><br><br>" +
					
					"<strong>Name : </strong>" + empName + "<br>" +
					"<strong>Emp. Code : </strong>" + empNo + "<br>" +
					"<strong>Designation : </strong>" + empDesig + "<br>" +
					"<strong>Department : </strong>" + deptName + "<br><br><br>" ;

					
					if (remark != null)
					usermailContent += "<strong>Remark: </strong>" + remark + "<br><br><br>";
					usermailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					usermailContent += "*** This is an automatically generated email, please do not reply ***";
					
				}
				//for Medical Reimbursement Verification
				if(requestType.equals("accept")&&(frmNmae.equalsIgnoreCase("verifyMedicalExpensesReimbursement")||frmNmae.equalsIgnoreCase("verifyTravelExpensesReimbursement"))){
					//for verifier
					 subject = "Action Required : " + formName;
					 mailContent = "<br>Dear Sir/Madam,<br><br>" ;
						//	 if(frmNmae.equalsIgnoreCase("verifyMedicalExpensesReimbursement"))
					 mailContent += "You have new request for Approval<br><br><br>" ;
							/* else
								 mailContent += "You have new request for Verification<br><br><br>" ;*/
					mailContent += "<strong>Request Category: </strong> " + formName + "<br>" +
					"<strong>Amount: " + gtotal + "</strong><br><br><br>" +
					"<strong>Name : </strong>" + empName + "<br>" +
					"<strong>Emp. Code : </strong>" + empNo + "<br>" +
					"<strong>Designation : </strong>" + empDesig + "<br>" +
					"<strong>Department : </strong>" + deptName + "<br><br><br>" +
					"Initiated By: " + employeeID + "<br><br>";
					if (remark != null)
						mailContent += "Remark: " + remark + "<br><br><br>";
					mailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					mailContent += "*** This is an automatically generated email, please do not reply ***";
					
					//for user
					 usersubject = "Info : " + formName;
					 usermailContent = "<br>Dear Sir/Madam,<br><br>" ;

							// if(frmNmae.equalsIgnoreCase("verifyMedicalExpensesReimbursement"))
								 usermailContent += "Your form have been Verified. <br><br><br>" ;
								/* else

									 usermailContent += "Your form have been Approved. <br><br><br>" ;*/
							 usermailContent +="<strong>Request Category: </strong> " + formName + "<br>" +
					"<strong> Amount: " + gtotal + "</strong><br><br><br>" +
					
					"<strong>Name : </strong>" + empName + "<br>" +
					"<strong>Emp. Code : </strong>" + empNo + "<br>" +
					"<strong>Designation : </strong>" + empDesig + "<br>" +
					"<strong>Department : </strong>" + deptName + "<br><br><br>" ;
					// if(frmNmae.equalsIgnoreCase("verifyMedicalExpensesReimbursement"))
						 usermailContent += 					"Verified By: " + verificationStep + "<br><br>";
					/* else

						 usermailContent += 					"Approved By: " + verificationStep + "<br><br>";*/
					if (remark != null)
					usermailContent += "<strong>Remark: </strong>" + remark + "<br><br><br>";
					usermailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					usermailContent += "*** This is an automatically generated email, please do not reply ***";
					
				}

				//for Medical Reimbursement Approval
				if(requestType.equals("accept")&&(frmNmae.equalsIgnoreCase("approveMedicalExpensesReimbursement")||frmNmae.equalsIgnoreCase("approveTravelExpensesReimbursement"))){
					//for verifier
					 subject = "Action Required : " + formName;
					 mailContent = "<br>Dear Sir/Madam,<br><br>" +

					"You have new request for Authorization<br><br><br>" +

					"<strong>Request Category: </strong> " + formName + "<br>" +
					"<strong> Amount: " + gtotal + "</strong><br><br><br>" +

					"<strong>Name : </strong>" + empName + "<br>" +
					"<strong>Emp. Code : </strong>" + empNo + "<br>" +
					"<strong>Designation : </strong>" + empDesig + "<br>" +
					"<strong>Department : </strong>" + deptName + "<br><br><br>" +

					"Initiated By: " + employeeID + "<br><br>";
					if (remark != null)
						mailContent += "Remark: " + remark + "<br><br><br>";
					mailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					mailContent += "*** This is an automatically generated email, please do not reply ***";
					
					//for user
					 usersubject = "Info : " + formName;
					 usermailContent = "<br>Dear Sir/Madam,<br><br>" ;

					// if(frmNmae.equalsIgnoreCase("verifyMedicalExpensesReimbursement"))
						 usermailContent += "Your form have been Approved. <br><br><br>" ;
					/*	 else

							 usermailContent += "Your form have been Verified. <br><br><br>" ;*/

					 usermailContent += "<strong>Request Category: </strong> " + formName + "<br>" +
					"<strong> Amount: " + gtotal + "</strong><br><br><br>" +

					"<strong>Name : </strong>" + empName + "<br>" +
					"<strong>Emp. Code : </strong>" + empNo + "<br>" +
					"<strong>Designation : </strong>" + empDesig + "<br>" +
					"<strong>Department : </strong>" + deptName + "<br><br><br>" ;
				//	 if(frmNmae.equalsIgnoreCase("verifyMedicalExpensesReimbursement"))
						 usermailContent += 					"Approved By: " + approvalStep + "<br><br>";
					/* else

						 usermailContent += 					"Verified By: " + verificationStep + "<br><br>";*/
					if (remark != null)
					usermailContent += "<strong>Remark: </strong>" + remark + "<br><br><br>";
					usermailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					usermailContent += "*** This is an automatically generated email, please do not reply ***";
					
				}
				//for Medical Reimbursement Authorization
				if(requestType.equals("accept")&&(frmNmae.equalsIgnoreCase("authorizeMedicalExpensesReimbursement")||frmNmae.equalsIgnoreCase("authorizeTravelExpensesReimbursement"))){
					//for verifier
					 subject = "Action Required : " + formName;
					 mailContent = "<br>Dear Sir/Madam,<br><br>" +

					"You have new request for Release of Payment<br><br><br>" +

					"<strong>Request Category: </strong> " + formName + "<br>" +
					"<strong> Amount: " + gtotal + "</strong><br><br><br>" +
					
					"<strong>Name : </strong>" + empName + "<br>" +
					"<strong>Emp. Code : </strong>" + empNo + "<br>" +
					"<strong>Designation : </strong>" + empDesig + "<br>" +
					"<strong>Department : </strong>" + deptName + "<br><br><br>" +

					"Initiated By: " + employeeID + "<br><br>";
					if (remark != null)
						mailContent += "Remark: " + remark + "<br><br><br>";
					mailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					mailContent += "*** This is an automatically generated email, please do not reply ***";
					
					//for user
					 usersubject = "Info : " + formName;
					 usermailContent = "<br>Dear Sir/Madam,<br><br>" +

					"You form have been Authorized. <br><br><br>" +

					"<strong>Request Category: </strong> " + formName + "<br>" +
					"<strong> Amount: " + gtotal + "</strong><br><br><br>" +
					
					"<strong>Name : </strong>" + empName + "<br>" +
					"<strong>Emp. Code : </strong>" + empNo + "<br>" +
					"<strong>Designation : </strong>" + empDesig + "<br>" +
					"<strong>Department : </strong>" + deptName + "<br><br><br>" +

					"Authorized By: " + authorizationStep + "<br><br>";
					if (remark != null)
					usermailContent += "<strong>Remark: </strong>" + remark + "<br><br><br>";
					usermailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					usermailContent += "*** This is an automatically generated email, please do not reply ***";
					
				}
				//for Medical Reimbursement Payement Release
				if(requestType.equals("accept")&&(frmNmae.equalsIgnoreCase("accountMedicalExpensesReimbursement")||frmNmae.equalsIgnoreCase("accountTravelExpensesReimbursement"))){
			
					//for user
					 subject = "Info : " + formName;
					 mailContent = "<br>Dear Sir/Madam,<br><br>" +

					"Your payment is under process. <br><br><br>" +

					"<strong>Request Category: </strong> " + formName + "<br>" +
					"<strong> Amount: " + gtotal + "</strong><br><br><br>" +
					
					"<strong>Name : </strong>" + empName + "<br>" +
					"<strong>Emp. Code : </strong>" + empNo + "<br>" +
					"<strong>Designation : </strong>" + empDesig + "<br>" +
					"<strong>Department : </strong>" + deptName + "<br><br><br>" +

					"Payment Released By: " + accountStep + "<br><br>";
					if (remark != null)
					mailContent += "<strong>Remark: </strong>" + remark + "<br><br><br>";
					mailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					mailContent += "*** This is an automatically generated email, please do not reply ***";
					
				}
				//for Medical Reimbursement Reject 
				if(requestType.equals("reject")&&(frmNmae.equalsIgnoreCase("verifyMedicalExpensesReimbursement")||frmNmae.equalsIgnoreCase("verifyTravelExpensesReimbursement"))){
			
					//for user
					 subject = "Info : " + formName;
					 mailContent = "<br>Dear Sir/Madam,<br><br>" +

					"Your request have been rejected for further modification. <br><br><br>" +

					"<strong>Request Category: </strong> " + formName + "<br>" +
					"<strong> Amount: " + gtotal + "</strong><br><br><br>" +
					
					"<strong>Name : </strong>" + empName + "<br>" +
					"<strong>Emp. Code : </strong>" + empNo + "<br>" +
					"<strong>Designation : </strong>" + empDesig + "<br>" +
					"<strong>Department : </strong>" + deptName + "<br><br><br>" +

					"Rejected By: " + verificationStep + "<br><br>";
					if (remark != null)
					mailContent += "<strong>Remark: </strong>" + remark + "<br><br><br>";
					mailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					mailContent += "*** This is an automatically generated email, please do not reply ***";
					
				}
				//for Medical Reimbursement Reject Release
				if(requestType.equals("reject")&&(frmNmae.equalsIgnoreCase("approveMedicalExpensesReimbursement")||frmNmae.equalsIgnoreCase("approveTravelExpensesReimbursement"))){
			
					//for user
					 subject = "Info : " + formName;
					 mailContent = "<br>Dear Sir/Madam,<br><br>" +

					"Your request have been rejected for further modification. <br><br><br>" +

					"<strong>Request Category: </strong> " + formName + "<br>" +
					"<strong> Amount: " + gtotal + "</strong><br><br><br>" +
					
					"<strong>Name : </strong>" + empName + "<br>" +
					"<strong>Emp. Code : </strong>" + empNo + "<br>" +
					"<strong>Designation : </strong>" + empDesig + "<br>" +
					"<strong>Department : </strong>" + deptName + "<br><br><br>" +

					"Rejected By: " + approvalStep + "<br><br>";
					if (remark != null)
					mailContent += "<strong>Remark: </strong>" + remark + "<br><br><br>";
					mailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					mailContent += "*** This is an automatically generated email, please do not reply ***";
					
				}
				//for Medical Reimbursement Reject Release
				if(requestType.equals("reject")&&(frmNmae.equalsIgnoreCase("authorizeMedicalExpensesReimbursement")||frmNmae.equalsIgnoreCase("authorizeTravelExpensesReimbursement"))){
			
					//for user
					 subject = "Info : " + formName;
					 mailContent = "<br>Dear Sir/Madam,<br><br>" +

					"Your request have been rejected for further modification. <br><br><br>" +

					"<strong>Request Category: </strong> " + formName + "<br>" +
					"<strong> Amount: " + gtotal + "</strong><br><br><br>" +
					
					"<strong>Name : </strong>" + empName + "<br>" +
					"<strong>Emp. Code : </strong>" + empNo + "<br>" +
					"<strong>Designation : </strong>" + empDesig + "<br>" +
					"<strong>Department : </strong>" + deptName + "<br><br><br>" +

					"Rejected By: " + authorizationStep + "<br><br>";
					if (remark != null)
					mailContent += "<strong>Remark: </strong>" + remark + "<br><br><br>";
					mailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					mailContent += "*** This is an automatically generated email, please do not reply ***";
					
				}

				
				
				
				

				
				

				//for Leave Application accept after rejection
				if(requestType.equals("accept")&&(frmNmae.equalsIgnoreCase("readjustLeaveApplicationForm"))){
					//for verifier
					 subject = "Action Required : " + formName;
					 mailContent = "<br>Dear Sir/Madam,<br><br>" +

					"You have new request for Verification<br><br><br>" +

					"<strong>Request Category: </strong> " + formName + "<br><br><br>" +
					
					"<strong>Name : " + empName + "</strong><br>" +
					"<strong>Emp. Code : " + empNo + "</strong><br>" +
					"<strong>Designation : " + empDesig + "</strong><br>" +
					"<strong>Department : " + deptName + "</strong><br><br><br>" +

					"Resubmitted By: " + employeeID + "<br><br>";
					if (remark != null)
						mailContent += "Remark: " + remark + "<br><br><br>";
					mailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					mailContent += "*** This is an automatically generated email, please do not reply ***";
					
					//for user
					 usersubject = "Info : " + formName;
					 usermailContent = "<br>Dear Sir/Madam,<br><br>" +

					"Your form have been successfully Resubmitted. <br><br><br>" +

					"<strong>Request Category: </strong> " + formName + "<br><br><br>" +
					
					"<strong>Name : </strong>" + empName + "<br>" +
					"<strong>Emp. Code : </strong>" + empNo + "<br>" +
					"<strong>Designation : </strong>" + empDesig + "<br>" +
					"<strong>Department : </strong>" + deptName + "<br><br><br>" ;

					
					if (remark != null)
					usermailContent += "<strong>Remark: </strong>" + remark + "<br><br><br>";
					usermailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					usermailContent += "*** This is an automatically generated email, please do not reply ***";
					
				}
				
				
				
				//for Leave Application Verification
				if(requestType.equals("accept")&&(frmNmae.equalsIgnoreCase("verifyLeaveApplicationForm"))){
					//for verifier
					 subject = "Action Required : " + formName;
					 mailContent = "<br>Dear Sir/Madam,<br><br>" +

					"You have new request for Recommendation<br><br><br>" +

					"<strong>Request Category: </strong> " + formName + "<br><br><br>" +
					
					"<strong>Name : " + empName + "</strong><br>" +
					"<strong>Emp. Code : " + empNo + "</strong><br>" +
					"<strong>Designation : " + empDesig + "</strong><br>" +
					"<strong>Department : " + deptName + "</strong><br><br><br>" +

					"Initiated By: " + employeeID + "<br><br>";
					if (remark != null)
						mailContent += "Remark: " + remark + "<br><br><br>";
					mailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					mailContent += "*** This is an automatically generated email, please do not reply ***";
					
					//for user
					 usersubject = "Info : " + formName;
					 usermailContent = "<br>Dear Sir/Madam,<br><br>" +

					"Your form have been Verified. <br><br><br>" +

					"<strong>Request Category: </strong> " + formName + "<br><br><br>" +
					
					"<strong>Name : </strong>" + empName + "<br>" +
					"<strong>Emp. Code : </strong>" + empNo + "<br>" +
					"<strong>Designation : </strong>" + empDesig + "<br>" +
					"<strong>Department : </strong>" + deptName + "<br><br><br>" +

					"Verified By: " + verificationStep + "<br><br>";
					if (remark != null)
					usermailContent += "<strong>Remark: </strong>" + remark + "<br><br><br>";
					usermailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					usermailContent += "*** This is an automatically generated email, please do not reply ***";
					
				}


				

				
				//for Leave Application Recommendation
				if(requestType.equals("accept")&&(frmNmae.equalsIgnoreCase("approveLeaveApplicationForm"))){
					//for verifier
					 subject = "Action Required : " + formName;
					 mailContent = "<br>Dear Sir/Madam,<br><br>" +

					"You have new request for Approval<br><br><br>" +

					"<strong>Request Category: </strong> " + formName + "<br><br><br>" +
					
					"<strong>Name : " + empName + "</strong><br>" +
					"<strong>Emp. Code : " + empNo + "</strong><br>" +
					"<strong>Designation : " + empDesig + "</strong><br>" +
					"<strong>Department : " + deptName + "</strong><br><br><br>" +

					"Initiated By: " + employeeID + "<br><br>";
					if (remark != null)
						mailContent += "Remark: " + remark + "<br><br><br>";
					mailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					mailContent += "*** This is an automatically generated email, please do not reply ***";
					
					//for user
					 usersubject = "Info : " + formName;
					 usermailContent = "<br>Dear Sir/Madam,<br><br>" +

					"Your form have been recommended for approval. <br><br><br>" +

					"<strong>Request Category: </strong> " + formName + "<br><br><br>" +
					
					"<strong>Name : </strong>" + empName + "<br>" +
					"<strong>Emp. Code : </strong>" + empNo + "<br>" +
					"<strong>Designation : </strong>" + empDesig + "<br>" +
					"<strong>Department : </strong>" + deptName + "<br><br><br>" +

					"Recommended By: " + approvalStep + "<br><br>";
					if (remark != null)
					usermailContent += "<strong>Remark: </strong>" + remark + "<br><br><br>";
					usermailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					usermailContent += "*** This is an automatically generated email, please do not reply ***";
					
				}


				
				//for Leave Application authorization
				if(requestType.equals("accept")&&(frmNmae.equalsIgnoreCase("authorizeLeaveApplicationForm"))){
					
					//for user
					 subject = "Info : " + formName;
					 mailContent = "<br>Dear Sir/Madam,<br><br>" +

					"You have been granted "+lv_nod+" day "+lv_type+" from "+lv_from +" to "+
					lv_to+" upon your request date "+lv_dt+" . <br><br>"+
					"You have to your credit "+lv_el+" days Earned leave and "+lv_sl+" days Sick Leave"+
					"after accounting for the sanctioned leave.<br><br><br>"+
					

					"<strong>Request Category: </strong> " + formName + "<br><br><br>" +
					
					"<strong>Name : </strong>" + empName + "<br>" +
					"<strong>Emp. Code : </strong>" + empNo + "<br>" +
					"<strong>Designation : </strong>" + empDesig + "<br>" +
					"<strong>Department : </strong>" + deptName + "<br><br><br>" +

					"Approved By: " + verificationStep + "<br><br>";
					if (remark != null)
					mailContent += "<strong>Remark: </strong>" + remark + "<br><br><br>";
					mailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					mailContent += "*** This is an automatically generated email, please do not reply ***";
					
				}

				//for Leave Appliation Verification Reject 
				if(requestType.equals("reject")&&(frmNmae.equalsIgnoreCase("verifyLeaveApplicationForm"))){
			
					//for user
					 subject = "Action Required : " + formName;
					 mailContent = "<br>Dear Sir/Madam,<br><br>" +

					"Your request have been rejected for further modification. <br><br><br>" +

					"<strong>Request Category: </strong> " + formName + "<br><br><br>" +
					
					"<strong>Name : </strong>" + empName + "<br>" +
					"<strong>Emp. Code : </strong>" + empNo + "<br>" +
					"<strong>Designation : </strong>" + empDesig + "<br>" +
					"<strong>Department : </strong>" + deptName + "<br><br><br>" +

					"Rejected By: " + verificationStep + "<br><br>";
					if (remark != null)
					mailContent += "<strong>Remark: </strong>" + remark + "<br><br><br>";
					mailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					mailContent += "*** This is an automatically generated email, please do not reply ***";
					
				}
				//for Leave Appliation Recommended Reject 
				if(requestType.equals("reject")&&(frmNmae.equalsIgnoreCase("approveLeaveApplicationForm"))){
			
					//for user
					 subject = "Action Required : " + formName;
					 mailContent = "<br>Dear Sir/Madam,<br><br>" +

					"Your request have been rejected for further modification. <br><br><br>" +

					"<strong>Request Category: </strong> " + formName + "<br><br><br>" +
					
					"<strong>Name : </strong>" + empName + "<br>" +
					"<strong>Emp. Code : </strong>" + empNo + "<br>" +
					"<strong>Designation : </strong>" + empDesig + "<br>" +
					"<strong>Department : </strong>" + deptName + "<br><br><br>" +

					"Rejected By: " + approvalStep + "<br><br>";
					if (remark != null)
					mailContent += "<strong>Remark: </strong>" + remark + "<br><br><br>";
					mailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					mailContent += "*** This is an automatically generated email, please do not reply ***";
					
				}

				//for Leave Appliation Authorization Reject 
				if(requestType.equals("reject")&&(frmNmae.equalsIgnoreCase("authorizeLeaveApplicationForm"))){
			
					//for user
					 subject = "Action Required : " + formName;
					 mailContent = "<br>Dear Sir/Madam,<br><br>" +

					"Your request dated "+lv_dt+" was considered but leave not granted due to exigencies of work. <br><br><br>" +

					"<strong>Request Category: </strong> " + formName + "<br><br><br>" +
					
					"<strong>Name : </strong>" + empName + "<br>" +
					"<strong>Emp. Code : </strong>" + empNo + "<br>" +
					"<strong>Designation : </strong>" + empDesig + "<br>" +
					"<strong>Department : </strong>" + deptName + "<br><br><br>" +

					"Rejected By: " + authorizationStep + "<br><br>";
					if (remark != null)
					mailContent += "<strong>Remark: </strong>" + remark + "<br><br><br>";
					mailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					mailContent += "*** This is an automatically generated email, please do not reply ***";
					
				}
				
				
				
				
				
				
				
				
				//cash payment voucher

				//for cash payment voucher accept after rejection
				if(requestType.equals("accept")&&(frmNmae.equalsIgnoreCase("readjustCashPaymentVoucherForm"))){
					//for verifier
					 subject = "Action Required : " + formName;
					 mailContent = "<br>Dear Sir/Madam,<br><br>" +

					"You have new request for Verification<br><br><br>" +
					
					"<strong>Request Category: </strong> " + formName + "<br><br><br>" +
					"<strong> Amount: " + gtotal + "</strong><br><br><br>" +

					"Resubmitted By: " + employeeID + "<br><br>";
					if (remark != null)
						mailContent += "Remark: " + remark + "<br><br><br>";
					mailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					mailContent += "*** This is an automatically generated email, please do not reply ***";
					
					//for user
					 usersubject = "Info : " + formName;
					 usermailContent = "<br>Dear Sir/Madam,<br><br>" +

					"Your form have been successfully Resubmitted. <br><br><br>" +

					"<strong>Request Category: </strong> " + formName + "<br><br><br>" +
					"<strong> Amount: " + gtotal + "</strong><br><br><br>"  ;

					
					if (remark != null)
					usermailContent += "<strong>Remark: </strong>" + remark + "<br><br><br>";
					usermailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					usermailContent += "*** This is an automatically generated email, please do not reply ***";
					
				}
				//for cash payment voucher  Verification
				if(requestType.equals("accept")&&(frmNmae.equalsIgnoreCase("handleCashPaymentVoucherForm"))){
					//for verifier
					 subject = "Action Required : " + formName;
					 mailContent = "<br>Dear Sir/Madam,<br><br>" +

					"You have new request for Approval<br><br><br>" +

					"<strong>Request Category: </strong> " + formName + "<br><br><br>" +
					"<strong> Amount: " + gtotal + "</strong><br><br><br>" +
					
					"Initiated By: " + employeeID + "<br><br>";
					if (remark != null)
						mailContent += "Remark: " + remark + "<br><br><br>";
					mailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					mailContent += "*** This is an automatically generated email, please do not reply ***";
					
					//for user
					 usersubject = "Info : " + formName;
					 usermailContent = "<br>Dear Sir/Madam,<br><br>" +

					"Your form have been Verified. <br><br><br>" +

					"<strong>Request Category: </strong> " + formName + "<br><br><br>" +
					"<strong> Amount: " + gtotal + "</strong><br><br><br>" +
					
					

					"Verified By: " + formBy + "<br><br>";
					if (remark != null)
					usermailContent += "<strong>Remark: </strong>" + remark + "<br><br><br>";
					usermailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					usermailContent += "*** This is an automatically generated email, please do not reply ***";
					
				}

				//for cash payment voucher  Approval
				if(requestType.equals("accept")&&(frmNmae.equalsIgnoreCase("handleCashPaymentVoucherApproveForm"))){
					//for verifier
					 subject = "Action Required : " + formName;
					 mailContent = "<br>Dear Sir/Madam,<br><br>" +

					"You have new request for release of payment<br><br><br>" +

					"<strong>Request Category: </strong> " + formName + "<br><br><br>" +
					"<strong> Amount: " + gtotal + "</strong><br><br><br>" +
					
				

					"Initiated By: " + employeeID + "<br><br>";
					if (remark != null)
						mailContent += "Remark: " + remark + "<br><br><br>";
					mailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					mailContent += "*** This is an automatically generated email, please do not reply ***";
					
					//for user
					 usersubject = "Info : " + formName;
					 usermailContent = "<br>Dear Sir/Madam,<br><br>" +

					"Your form have been Approved. <br><br><br>" +

					"<strong>Request Category: </strong> " + formName + "<br><br><br>" +
					"<strong> Amount: " + gtotal + "</strong><br><br><br>" +
					
					
					"Approved By: " + formBy + "<br><br>";
					if (remark != null)
					usermailContent += "<strong>Remark: </strong>" + remark + "<br><br><br>";
					usermailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					usermailContent += "*** This is an automatically generated email, please do not reply ***";
					
				}
				
				//for cash payment voucher  Payement Release
				if(requestType.equals("accept")&&(frmNmae.equalsIgnoreCase("lastHandleCashPaymentVoucherForm"))){
			
					//for user
					 subject = "Info : " + formName;
					 mailContent = "<br>Dear Sir/Madam,<br><br>" +

					"Your payment is under process. <br><br><br>" +

					"<strong>Request Category: </strong> " + formName + "<br><br><br>" +
					"<strong> Amount: " + gtotal + "</strong><br><br><br>" +
					

					"Payment Released By: " + formBy + "<br><br>";
					if (remark != null)
					mailContent += "<strong>Remark: </strong>" + remark + "<br><br><br>";
					mailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					mailContent += "*** This is an automatically generated email, please do not reply ***";
					
				}
				//for Cash Payment Reject 
				if(requestType.equals("reject")&&(frmNmae.equalsIgnoreCase("handleCashPaymentVoucherForm"))){
			
					//for user
					 subject = "Info : " + formName;
					 mailContent = "<br>Dear Sir/Madam,<br><br>" +
								"<strong> Amount: " + gtotal + "</strong><br><br><br>" +

					"Your request have been rejected for further modification. <br><br><br>" +

					"<strong>Request Category: </strong> " + formName + "<br><br><br>" +
					"<strong> Amount: " + gtotal + "</strong><br><br><br>" +
					
					

					"Rejected By: " + formBy + "<br><br>";
					if (remark != null)
					mailContent += "<strong>Remark: </strong>" + remark + "<br><br><br>";
					mailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					mailContent += "*** This is an automatically generated email, please do not reply ***";
					
				}
				//for Cash Payment Reject Release
				if(requestType.equals("reject")&&(frmNmae.equalsIgnoreCase("handleCashPaymentVoucherApproveForm"))){
			
					//for user
					 subject = "Info : " + formName;
					 mailContent = "<br>Dear Sir/Madam,<br><br>" +

					"Your request have been rejected for further modification. <br><br><br>" +

					"<strong>Request Category: </strong> " + formName + "<br><br><br>" +
					"<strong> Amount: " + gtotal + "</strong><br><br><br>" +
					
					

					"Rejected By: " + formBy + "<br><br>";
					if (remark != null)
					mailContent += "<strong>Remark: </strong>" + remark + "<br><br><br>";
					mailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					mailContent += "*** This is an automatically generated email, please do not reply ***";
					
				}
				
				
				
				
				
				
				// IOM 
				
				
				
				
				

				
				
				
				//IOM voucher

				//for IOM accept after rejection
				if(requestType.equals("accept")&&(frmNmae.equalsIgnoreCase("readjustIOMForm"))){
					//for verifier
					 subject = "Action Required : " + formName;
					 mailContent = "<br>Dear Sir/Madam,<br><br>" +

					"You have new request for Verification<br><br><br>" +
					
	"<strong>Request Category: </strong> " + formName + "<br><br><br>" +
	"<strong> Our Ref: " + ourReference+ "</strong><br>"  +
	"<strong> Your Ref: " + yourReference + "</strong><br><br><br>"  +

	
					"Resubmitted By: " + employeeID + "<br><br>";
					if (remark != null)
						mailContent += "Remark: " + remark + "<br><br><br>";
					mailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					mailContent += "*** This is an automatically generated email, please do not reply ***";
					
						
				}
				//for IOM  Verification
				if(requestType.equals("accept")&&(frmNmae.equalsIgnoreCase("handleIOMForm"))){
					//for verifier
					 subject = "Action Required : " + formName;
					 mailContent = "<br>Dear Sir/Madam,<br><br>" +

					"You have new IOM request<br><br><br>" +

	
	"<strong>Request Category: </strong> " + formName + "<br><br><br>" +
	"<strong> Our Ref: " + ourReference+ "</strong><br>"  +
	"<strong> Your Ref: " + yourReference + "</strong><br><br><br>"  +
					
					"Initiated By: " + employeeID + "<br><br>";
					if (remark != null)
						mailContent += "Remark: " + remark + "<br><br><br>";
					mailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					mailContent += "*** This is an automatically generated email, please do not reply ***";
					
					//for user
					 usersubject = "Info : " + formName;
					 usermailContent = "<br>Dear Sir/Madam,<br><br>" +

					"Your form have been Verified. <br><br><br>" +

	
	"<strong>Request Category: </strong> " + formName + "<br><br><br>" +
	"<strong> Our Ref: " + ourReference+ "</strong><br>"  +
	"<strong> Your Ref: " + yourReference + "</strong><br><br><br>"  +
					
					

					"Verified By: " + formBy + "<br><br>";
					if (remark != null)
					usermailContent += "<strong>Remark: </strong>" + remark + "<br><br><br>";
					usermailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					usermailContent += "*** This is an automatically generated email, please do not reply ***";
					
				}

				//for IOM  Approval
				if(requestType.equals("verify")&&(frmNmae.equalsIgnoreCase("handleIOMForm2"))){
					//for verifier
					 subject = "Action Required : " + formName;
					 mailContent = "<br>Dear Sir/Madam,<br><br>" +

					"You have new IOM request <br><br><br>" +

	
	"<strong>Request Category: </strong> " + formName + "<br><br><br>" +
	"<strong> Our Ref: " + ourReference+ "</strong><br>"  +
	"<strong> Your Ref: " + yourReference + "</strong><br><br><br>"  +
					
				

					"Initiated By: " + employeeID + "<br><br>";
					if (remark != null)
						mailContent += "Remark: " + remark + "<br><br><br>";
					mailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					mailContent += "*** This is an automatically generated email, please do not reply ***";
					
					//for user
					 usersubject = "Info : " + formName;
					 usermailContent = "<br>Dear Sir/Madam,<br><br>" +

					"Your IOM request have been approved & proceed <br><br><br>" +
	
					"<strong>Request Category: </strong> " + formName + "<br><br><br>" +
					"<strong> Our Ref: " + ourReference+ "</strong><br>"  +
					"<strong> Your Ref: " + yourReference + "</strong><br><br><br>"  +
					
					"Approved By: " + formBy + "<br><br>";
					if (remark != null)
					usermailContent += "<strong>Remark: </strong>" + remark + "<br><br><br>";
					usermailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					usermailContent += "*** This is an automatically generated email, please do not reply ***";
					
				}
				
				//for IOM  Payement Release
				if(requestType.equals("accept")&&(frmNmae.equalsIgnoreCase("handleIOMForm2"))){
			
					//for user
					 subject = "Info : " + formName;
					 mailContent = "<br>Dear Sir/Madam,<br><br>" +

					"Your IOM request have been Accepted and Closed. <br><br><br>" +

	
	"<strong>Request Category: </strong> " + formName + "<br><br><br>" +
	"<strong> Our Ref: " + ourReference+ "</strong><br>"  +
	"<strong> Your Ref: " + yourReference + "</strong><br><br><br>"  +
					

					"Payment Released By: " + formBy + "<br><br>";
					if (remark != null)
					mailContent += "<strong>Remark: </strong>" + remark + "<br><br><br>";
					mailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					mailContent += "*** This is an automatically generated email, please do not reply ***";
					
				}
				//for IOM Reject 
				if(requestType.equals("reject")&&(frmNmae.equalsIgnoreCase("handleIOMForm"))){
			
					//for user
					 subject = "Info : " + formName;
					 mailContent = "<br>Dear Sir/Madam,<br><br>" +
								"<strong> Amount: " + gtotal + "</strong><br><br><br>" +

					"Your IOM request have been rejected for further modification <br><br><br>" +

	
	"<strong>Request Category: </strong> " + formName + "<br><br><br>" +
	"<strong> Our Ref: " + ourReference+ "</strong><br>"  +
	"<strong> Your Ref: " + yourReference + "</strong><br><br><br>"  +

					"Rejected By: " + formBy + "<br><br>";
					if (remark != null)
					mailContent += "<strong>Remark: </strong>" + remark + "<br><br><br>";
					mailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					mailContent += "*** This is an automatically generated email, please do not reply ***";
					
				}
				//for IOM Reject Release
				if(requestType.equals("reject")&&(frmNmae.equalsIgnoreCase("handleIOMForm2"))){
			
					//for user
					 subject = "Info : " + formName;
					 mailContent = "<br>Dear Sir/Madam,<br><br>" +

					"Your IOM request have been rejected for further modification <br><br><br>" +
					
					"<strong>Request Category: </strong> " + formName + "<br><br><br>" +
					"<strong> Our Ref: " + ourReference+ "</strong><br>"  +
					"<strong> Your Ref: " + yourReference + "</strong><br><br><br>"  +
					

					"Rejected By: " + formBy + "<br><br>";
					if (remark != null)
					mailContent += "<strong>Remark: </strong>" + remark + "<br><br><br>";
					mailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					mailContent += "*** This is an automatically generated email, please do not reply ***";
					
				}
				
				
				
				
				
				
				
				//End IOM
				
				
				
				
				
				
				
				//Purchase Requisition Form
				

				//for Cash Payment Reject 
				if(requestType.equals("reject")&&(frmNmae.equalsIgnoreCase("handlePurchaseRequisitionApplicationForm")||frmNmae.equalsIgnoreCase("approvePurchaseRequisitionApplicationForm")||frmNmae.equalsIgnoreCase("handlePurchaseRequisitionApplicationFormHO")||frmNmae.equalsIgnoreCase("approvePurchaseRequisitionApplicationFormHO"))){
			
					//for user
					 subject = "Action Required : " + formName;
					 mailContent = "<br>Dear Sir/Madam,<br><br>" +

					"Your request have been rejected for further modification<br><br><br>" +


					"<strong>Request Category: </strong> " + formName + "<br><br>" +

					"<strong>Name :</strong> " + userName + "<br>" +
					"<strong>Department :</strong> " + deptName + "<br>" +
					"<strong> Purchase Requisition No :</strong> " + prNo + "<br>" + 
					"<strong>Nature of Category  :</strong> " + urgency + "<br>" +
					"<strong>Nature of Materials  :</strong> " + natureOfMaterial + "<br>" +
					"<strong>Category of Material Required  : </strong>" + natureOfCategory + "<br><br><br>" +
					"<table  width='80%'>"

					+ "<tr style='text-align:centre;'>"
					+ "<td width='5%'><strong>S.No.</strong></td>"
					+ "<td width='20%'><strong>Item Code</strong></td>"
					+ "<td width='30%'><strong>Description</strong></td>"
					+ "<td width='5%'><strong>Unit</strong></td>"
					+ "<td width='10%'><strong>Packing</strong></td>"
					+ "<td width='10%'><strong>Quantity</strong></td>"
					+ "<td width='20%'><strong>Source</strong></td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo1+"</td>"
					+ "<td>"+itemCode1+"</td>"
					+ "<td>"+itemDescription1+"</td>"
					+ "<td>"+itemUnit1+"</td>"
					+ "<td>"+itemPacking1+"</td>"
					+ "<td>"+itemQuantity1+"</td>"
					+ "<td>"+itemSource1+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo2+"</td>"
					+ "<td>"+itemCode2+"</td>"
					+ "<td>"+itemDescription2+"</td>"
					+ "<td>"+itemUnit2+"</td>"
					+ "<td>"+itemPacking2+"</td>"
					+ "<td>"+itemQuantity2+"</td>"
					+ "<td>"+itemSource2+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo3+"</td>"
					+ "<td>"+itemCode3+"</td>"
					+ "<td>"+itemDescription3+"</td>"
					+ "<td>"+itemUnit3+"</td>"
					+ "<td>"+itemPacking3+"</td>"
					+ "<td>"+itemQuantity3+"</td>"
					+ "<td>"+itemSource3+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo4+"</td>"
					+ "<td>"+itemCode4+"</td>"
					+ "<td>"+itemDescription4+"</td>"
					+ "<td>"+itemUnit4+"</td>"
					+ "<td>"+itemPacking4+"</td>"
					+ "<td>"+itemQuantity4+"</td>"
					+ "<td>"+itemSource4+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo5+"</td>"
					+ "<td>"+itemCode5+"</td>"
					+ "<td>"+itemDescription5+"</td>"
					+ "<td>"+itemUnit5+"</td>"
					+ "<td>"+itemPacking5+"</td>"
					+ "<td>"+itemQuantity5+"</td>"
					+ "<td>"+itemSource5+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo6+"</td>"
					+ "<td>"+itemCode6+"</td>"
					+ "<td>"+itemDescription6+"</td>"
					+ "<td>"+itemUnit6+"</td>"
					+ "<td>"+itemPacking6+"</td>"
					+ "<td>"+itemQuantity6+"</td>"
					+ "<td>"+itemSource6+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo7+"</td>"
					+ "<td>"+itemCode7+"</td>"
					+ "<td>"+itemDescription7+"</td>"
					+ "<td>"+itemUnit7+"</td>"
					+ "<td>"+itemPacking7+"</td>"
					+ "<td>"+itemQuantity7+"</td>"
					+ "<td>"+itemSource7+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo8+"</td>"
					+ "<td>"+itemCode8+"</td>"
					+ "<td>"+itemDescription8+"</td>"
					+ "<td>"+itemUnit8+"</td>"
					+ "<td>"+itemPacking8+"</td>"
					+ "<td>"+itemQuantity8+"</td>"
					+ "<td>"+itemSource8+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo9+"</td>"
					+ "<td>"+itemCode9+"</td>"
					+ "<td>"+itemDescription9+"</td>"
					+ "<td>"+itemUnit9+"</td>"
					+ "<td>"+itemPacking9+"</td>"
					+ "<td>"+itemQuantity9+"</td>"
					+ "<td>"+itemSource9+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo10+"</td>"
					+ "<td>"+itemCode10+"</td>"
					+ "<td>"+itemDescription10+"</td>"
					+ "<td>"+itemUnit10+"</td>"
					+ "<td>"+itemPacking10+"</td>"
					+ "<td>"+itemQuantity10+"</td>"
					+ "<td>"+itemSource10+"</td>"
					+ "</tr>"
					+ "</table><br>"+
					"Rejected By: " + formBy + "<br><br>";
					if (remark != null)
					mailContent += "Remark: " + remark + "<br><br>"+"<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					mailContent += "*** This is an automatically generated email, please do not reply ***";


					 
				}
				
				
				
				
				
				//for Purchase Requisition Form accept after rejection
				if(requestType.equals("accept")&&(frmNmae.equalsIgnoreCase("readjustPurchaseRequisitionApplicationForm")||frmNmae.equalsIgnoreCase("readjustPurchaseRequisitionApplicationFormHO"))){
					subject = "Action Required : " + formName;
					mailContent = "<br>Dear Sir/Madam,<br><br>" +

					"You have new request for Verification<br><br><br>" +


					"<strong>Request Category: </strong> " + formName + "<br><br>" +

					"<strong>Name :</strong> " + userName + "<br>" +
					"<strong>Department :</strong> " + deptName + "<br>" +
					"<strong> Purchase Requisition No :</strong> " + prNo + "<br>" + 
					"<strong>Nature of Category  :</strong> " + urgency + "<br>" +
					"<strong>Nature of Materials  :</strong> " + natureOfMaterial + "<br>" +
					"<strong>Category of Material Required  : </strong>" + natureOfCategory + "<br><br><br>" +
					"<table  width='80%'>"

					+ "<tr style='text-align:centre;'>"
					+ "<td width='5%'><strong>S.No.</strong></td>"
					+ "<td width='20%'><strong>Item Code</strong></td>"
					+ "<td width='30%'><strong>Description</strong></td>"
					+ "<td width='5%'><strong>Unit</strong></td>"
					+ "<td width='10%'><strong>Packing</strong></td>"
					+ "<td width='10%'><strong>Quantity</strong></td>"
					+ "<td width='20%'><strong>Source</strong></td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo1+"</td>"
					+ "<td>"+itemCode1+"</td>"
					+ "<td>"+itemDescription1+"</td>"
					+ "<td>"+itemUnit1+"</td>"
					+ "<td>"+itemPacking1+"</td>"
					+ "<td>"+itemQuantity1+"</td>"
					+ "<td>"+itemSource1+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo2+"</td>"
					+ "<td>"+itemCode2+"</td>"
					+ "<td>"+itemDescription2+"</td>"
					+ "<td>"+itemUnit2+"</td>"
					+ "<td>"+itemPacking2+"</td>"
					+ "<td>"+itemQuantity2+"</td>"
					+ "<td>"+itemSource2+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo3+"</td>"
					+ "<td>"+itemCode3+"</td>"
					+ "<td>"+itemDescription3+"</td>"
					+ "<td>"+itemUnit3+"</td>"
					+ "<td>"+itemPacking3+"</td>"
					+ "<td>"+itemQuantity3+"</td>"
					+ "<td>"+itemSource3+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo4+"</td>"
					+ "<td>"+itemCode4+"</td>"
					+ "<td>"+itemDescription4+"</td>"
					+ "<td>"+itemUnit4+"</td>"
					+ "<td>"+itemPacking4+"</td>"
					+ "<td>"+itemQuantity4+"</td>"
					+ "<td>"+itemSource4+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo5+"</td>"
					+ "<td>"+itemCode5+"</td>"
					+ "<td>"+itemDescription5+"</td>"
					+ "<td>"+itemUnit5+"</td>"
					+ "<td>"+itemPacking5+"</td>"
					+ "<td>"+itemQuantity5+"</td>"
					+ "<td>"+itemSource5+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo6+"</td>"
					+ "<td>"+itemCode6+"</td>"
					+ "<td>"+itemDescription6+"</td>"
					+ "<td>"+itemUnit6+"</td>"
					+ "<td>"+itemPacking6+"</td>"
					+ "<td>"+itemQuantity6+"</td>"
					+ "<td>"+itemSource6+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo7+"</td>"
					+ "<td>"+itemCode7+"</td>"
					+ "<td>"+itemDescription7+"</td>"
					+ "<td>"+itemUnit7+"</td>"
					+ "<td>"+itemPacking7+"</td>"
					+ "<td>"+itemQuantity7+"</td>"
					+ "<td>"+itemSource7+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo8+"</td>"
					+ "<td>"+itemCode8+"</td>"
					+ "<td>"+itemDescription8+"</td>"
					+ "<td>"+itemUnit8+"</td>"
					+ "<td>"+itemPacking8+"</td>"
					+ "<td>"+itemQuantity8+"</td>"
					+ "<td>"+itemSource8+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo9+"</td>"
					+ "<td>"+itemCode9+"</td>"
					+ "<td>"+itemDescription9+"</td>"
					+ "<td>"+itemUnit9+"</td>"
					+ "<td>"+itemPacking9+"</td>"
					+ "<td>"+itemQuantity9+"</td>"
					+ "<td>"+itemSource9+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo10+"</td>"
					+ "<td>"+itemCode10+"</td>"
					+ "<td>"+itemDescription10+"</td>"
					+ "<td>"+itemUnit10+"</td>"
					+ "<td>"+itemPacking10+"</td>"
					+ "<td>"+itemQuantity10+"</td>"
					+ "<td>"+itemSource10+"</td>"
					+ "</tr>"
					+ "</table><br>"+
					"Resubmitted By: " + employeeID + "<br><br>";
					if (remark != null)
					mailContent += "Remark: " + remark + "<br><br>"+"<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					mailContent += "*** This is an automatically generated email, please do not reply ***";


					
					
					
					usersubject = "Info : " + formName;
					usermailContent = "<br>Dear Sir/Madam,<br><br>" +

					"Your form have been successfully Reubmitted<br><br>" +

		

					"<strong>Request Category: </strong> " + formName + "<br><br>" +

					"<strong>Name :</strong> " + userName + "<br>" +
					"<strong>Department :</strong> " + deptName + "<br>" +
					"<strong> Purchase Requisition No :</strong> " + prNo + "<br>" + 
					"<strong>Nature of Category  :</strong> " + urgency + "<br>" +
					"<strong>Nature of Materials  :</strong> " + natureOfMaterial + "<br>" +
					"<strong>Category of Material Required  : </strong>" + natureOfCategory + "<br><br><br>" +
					"<table  width='80%'>"

					+ "<tr style='text-align:centre;'>"
					+ "<td width='5%'><strong>S.No.</strong></td>"
					+ "<td width='20%'><strong>Item Code</strong></td>"
					+ "<td width='30%'><strong>Description</strong></td>"
					+ "<td width='5%'><strong>Unit</strong></td>"
					+ "<td width='10%'><strong>Packing</strong></td>"
					+ "<td width='10%'><strong>Quantity</strong></td>"
					+ "<td width='20%'><strong>Source</strong></td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo1+"</td>"
					+ "<td>"+itemCode1+"</td>"
					+ "<td>"+itemDescription1+"</td>"
					+ "<td>"+itemUnit1+"</td>"
					+ "<td>"+itemPacking1+"</td>"
					+ "<td>"+itemQuantity1+"</td>"
					+ "<td>"+itemSource1+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo2+"</td>"
					+ "<td>"+itemCode2+"</td>"
					+ "<td>"+itemDescription2+"</td>"
					+ "<td>"+itemUnit2+"</td>"
					+ "<td>"+itemPacking2+"</td>"
					+ "<td>"+itemQuantity2+"</td>"
					+ "<td>"+itemSource2+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo3+"</td>"
					+ "<td>"+itemCode3+"</td>"
					+ "<td>"+itemDescription3+"</td>"
					+ "<td>"+itemUnit3+"</td>"
					+ "<td>"+itemPacking3+"</td>"
					+ "<td>"+itemQuantity3+"</td>"
					+ "<td>"+itemSource3+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo4+"</td>"
					+ "<td>"+itemCode4+"</td>"
					+ "<td>"+itemDescription4+"</td>"
					+ "<td>"+itemUnit4+"</td>"
					+ "<td>"+itemPacking4+"</td>"
					+ "<td>"+itemQuantity4+"</td>"
					+ "<td>"+itemSource4+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo5+"</td>"
					+ "<td>"+itemCode5+"</td>"
					+ "<td>"+itemDescription5+"</td>"
					+ "<td>"+itemUnit5+"</td>"
					+ "<td>"+itemPacking5+"</td>"
					+ "<td>"+itemQuantity5+"</td>"
					+ "<td>"+itemSource5+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo6+"</td>"
					+ "<td>"+itemCode6+"</td>"
					+ "<td>"+itemDescription6+"</td>"
					+ "<td>"+itemUnit6+"</td>"
					+ "<td>"+itemPacking6+"</td>"
					+ "<td>"+itemQuantity6+"</td>"
					+ "<td>"+itemSource6+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo7+"</td>"
					+ "<td>"+itemCode7+"</td>"
					+ "<td>"+itemDescription7+"</td>"
					+ "<td>"+itemUnit7+"</td>"
					+ "<td>"+itemPacking7+"</td>"
					+ "<td>"+itemQuantity7+"</td>"
					+ "<td>"+itemSource7+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo8+"</td>"
					+ "<td>"+itemCode8+"</td>"
					+ "<td>"+itemDescription8+"</td>"
					+ "<td>"+itemUnit8+"</td>"
					+ "<td>"+itemPacking8+"</td>"
					+ "<td>"+itemQuantity8+"</td>"
					+ "<td>"+itemSource8+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo9+"</td>"
					+ "<td>"+itemCode9+"</td>"
					+ "<td>"+itemDescription9+"</td>"
					+ "<td>"+itemUnit9+"</td>"
					+ "<td>"+itemPacking9+"</td>"
					+ "<td>"+itemQuantity9+"</td>"
					+ "<td>"+itemSource9+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo10+"</td>"
					+ "<td>"+itemCode10+"</td>"
					+ "<td>"+itemDescription10+"</td>"
					+ "<td>"+itemUnit10+"</td>"
					+ "<td>"+itemPacking10+"</td>"
					+ "<td>"+itemQuantity10+"</td>"
					+ "<td>"+itemSource10+"</td>"
					+ "</tr>"
					+ "</table><br>";


					if (remark != "" && remark != null)
					usermailContent += "Remark: " + remark + "<br><br><br>"+"<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					usermailContent += "*** This is an automatically generated email, please do not reply ***";
					}

				//for Purchase Requisition  Verification
				if(requestType.equals("accept")&&(frmNmae.equalsIgnoreCase("handlePurchaseRequisitionApplicationForm")||frmNmae.equalsIgnoreCase("handlePurchaseRequisitionApplicationFormHO"))){
					//for verifier

					subject = "Action Required : " + formName;
					mailContent = "<br>Dear Sir/Madam,<br><br>" +

					"You have new request for Approval<br><br><br>" +

					"<strong>Request Category: </strong> " + formName + "<br><br>" +

					"<strong>Name :</strong> " + userName + "<br>" +
					"<strong>Department :</strong> " + deptName + "<br>" +
					"<strong> Purchase Requisition No :</strong> " + prNo + "<br>" + 
					"<strong>Nature of Category  :</strong> " + urgency + "<br>" +
					"<strong>Nature of Materials  :</strong> " + natureOfMaterial + "<br>" +
					"<strong>Category of Material Required  : </strong>" + natureOfCategory + "<br><br><br>" +
					"<table  width='80%'>"

					+ "<tr style='text-align:centre;'>"
					+ "<td width='5%'><strong>S.No.</strong></td>"
					+ "<td width='20%'><strong>Item Code</strong></td>"
					+ "<td width='30%'><strong>Description</strong></td>"
					+ "<td width='5%'><strong>Unit</strong></td>"
					+ "<td width='10%'><strong>Packing</strong></td>"
					+ "<td width='10%'><strong>Quantity</strong></td>"
					+ "<td width='20%'><strong>Source</strong></td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo1+"</td>"
					+ "<td>"+itemCode1+"</td>"
					+ "<td>"+itemDescription1+"</td>"
					+ "<td>"+itemUnit1+"</td>"
					+ "<td>"+itemPacking1+"</td>"
					+ "<td>"+itemQuantity1+"</td>"
					+ "<td>"+itemSource1+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo2+"</td>"
					+ "<td>"+itemCode2+"</td>"
					+ "<td>"+itemDescription2+"</td>"
					+ "<td>"+itemUnit2+"</td>"
					+ "<td>"+itemPacking2+"</td>"
					+ "<td>"+itemQuantity2+"</td>"
					+ "<td>"+itemSource2+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo3+"</td>"
					+ "<td>"+itemCode3+"</td>"
					+ "<td>"+itemDescription3+"</td>"
					+ "<td>"+itemUnit3+"</td>"
					+ "<td>"+itemPacking3+"</td>"
					+ "<td>"+itemQuantity3+"</td>"
					+ "<td>"+itemSource3+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo4+"</td>"
					+ "<td>"+itemCode4+"</td>"
					+ "<td>"+itemDescription4+"</td>"
					+ "<td>"+itemUnit4+"</td>"
					+ "<td>"+itemPacking4+"</td>"
					+ "<td>"+itemQuantity4+"</td>"
					+ "<td>"+itemSource4+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo5+"</td>"
					+ "<td>"+itemCode5+"</td>"
					+ "<td>"+itemDescription5+"</td>"
					+ "<td>"+itemUnit5+"</td>"
					+ "<td>"+itemPacking5+"</td>"
					+ "<td>"+itemQuantity5+"</td>"
					+ "<td>"+itemSource5+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo6+"</td>"
					+ "<td>"+itemCode6+"</td>"
					+ "<td>"+itemDescription6+"</td>"
					+ "<td>"+itemUnit6+"</td>"
					+ "<td>"+itemPacking6+"</td>"
					+ "<td>"+itemQuantity6+"</td>"
					+ "<td>"+itemSource6+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo7+"</td>"
					+ "<td>"+itemCode7+"</td>"
					+ "<td>"+itemDescription7+"</td>"
					+ "<td>"+itemUnit7+"</td>"
					+ "<td>"+itemPacking7+"</td>"
					+ "<td>"+itemQuantity7+"</td>"
					+ "<td>"+itemSource7+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo8+"</td>"
					+ "<td>"+itemCode8+"</td>"
					+ "<td>"+itemDescription8+"</td>"
					+ "<td>"+itemUnit8+"</td>"
					+ "<td>"+itemPacking8+"</td>"
					+ "<td>"+itemQuantity8+"</td>"
					+ "<td>"+itemSource8+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo9+"</td>"
					+ "<td>"+itemCode9+"</td>"
					+ "<td>"+itemDescription9+"</td>"
					+ "<td>"+itemUnit9+"</td>"
					+ "<td>"+itemPacking9+"</td>"
					+ "<td>"+itemQuantity9+"</td>"
					+ "<td>"+itemSource9+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo10+"</td>"
					+ "<td>"+itemCode10+"</td>"
					+ "<td>"+itemDescription10+"</td>"
					+ "<td>"+itemUnit10+"</td>"
					+ "<td>"+itemPacking10+"</td>"
					+ "<td>"+itemQuantity10+"</td>"
					+ "<td>"+itemSource10+"</td>"
					+ "</tr>"
					+ "</table><br>"+
					"Initiated By: " + employeeID + "<br><br>";
					if (remark != null)
					mailContent += "Remark: " + remark + "<br><br>";
					mailContent += "<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					mailContent += "*** This is an automatically generated email, please do not reply ***";


					
					
					
					usersubject = "Info : " + formName;
					usermailContent = "<br>Dear Sir/Madam,<br><br>" +

					"Your form have been successfully Verified<br><br>" +

		

					"<strong>Request Category: </strong> " + formName + "<br><br>" +

					"<strong>Name :</strong> " + userName + "<br>" +
					"<strong>Department :</strong> " + deptName + "<br>" +
					"<strong> Purchase Requisition No :</strong> " + prNo + "<br>" + 
					"<strong>Nature of Category  :</strong> " + urgency + "<br>" +
					"<strong>Nature of Materials  :</strong> " + natureOfMaterial + "<br>" +
					"<strong>Category of Material Required  : </strong>" + natureOfCategory + "<br><br><br>" +
					"<table  width='80%'>"

					+ "<tr style='text-align:centre;'>"
					+ "<td width='5%'><strong>S.No.</strong></td>"
					+ "<td width='20%'><strong>Item Code</strong></td>"
					+ "<td width='30%'><strong>Description</strong></td>"
					+ "<td width='5%'><strong>Unit</strong></td>"
					+ "<td width='10%'><strong>Packing</strong></td>"
					+ "<td width='10%'><strong>Quantity</strong></td>"
					+ "<td width='20%'><strong>Source</strong></td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo1+"</td>"
					+ "<td>"+itemCode1+"</td>"
					+ "<td>"+itemDescription1+"</td>"
					+ "<td>"+itemUnit1+"</td>"
					+ "<td>"+itemPacking1+"</td>"
					+ "<td>"+itemQuantity1+"</td>"
					+ "<td>"+itemSource1+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo2+"</td>"
					+ "<td>"+itemCode2+"</td>"
					+ "<td>"+itemDescription2+"</td>"
					+ "<td>"+itemUnit2+"</td>"
					+ "<td>"+itemPacking2+"</td>"
					+ "<td>"+itemQuantity2+"</td>"
					+ "<td>"+itemSource2+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo3+"</td>"
					+ "<td>"+itemCode3+"</td>"
					+ "<td>"+itemDescription3+"</td>"
					+ "<td>"+itemUnit3+"</td>"
					+ "<td>"+itemPacking3+"</td>"
					+ "<td>"+itemQuantity3+"</td>"
					+ "<td>"+itemSource3+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo4+"</td>"
					+ "<td>"+itemCode4+"</td>"
					+ "<td>"+itemDescription4+"</td>"
					+ "<td>"+itemUnit4+"</td>"
					+ "<td>"+itemPacking4+"</td>"
					+ "<td>"+itemQuantity4+"</td>"
					+ "<td>"+itemSource4+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo5+"</td>"
					+ "<td>"+itemCode5+"</td>"
					+ "<td>"+itemDescription5+"</td>"
					+ "<td>"+itemUnit5+"</td>"
					+ "<td>"+itemPacking5+"</td>"
					+ "<td>"+itemQuantity5+"</td>"
					+ "<td>"+itemSource5+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo6+"</td>"
					+ "<td>"+itemCode6+"</td>"
					+ "<td>"+itemDescription6+"</td>"
					+ "<td>"+itemUnit6+"</td>"
					+ "<td>"+itemPacking6+"</td>"
					+ "<td>"+itemQuantity6+"</td>"
					+ "<td>"+itemSource6+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo7+"</td>"
					+ "<td>"+itemCode7+"</td>"
					+ "<td>"+itemDescription7+"</td>"
					+ "<td>"+itemUnit7+"</td>"
					+ "<td>"+itemPacking7+"</td>"
					+ "<td>"+itemQuantity7+"</td>"
					+ "<td>"+itemSource7+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo8+"</td>"
					+ "<td>"+itemCode8+"</td>"
					+ "<td>"+itemDescription8+"</td>"
					+ "<td>"+itemUnit8+"</td>"
					+ "<td>"+itemPacking8+"</td>"
					+ "<td>"+itemQuantity8+"</td>"
					+ "<td>"+itemSource8+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo9+"</td>"
					+ "<td>"+itemCode9+"</td>"
					+ "<td>"+itemDescription9+"</td>"
					+ "<td>"+itemUnit9+"</td>"
					+ "<td>"+itemPacking9+"</td>"
					+ "<td>"+itemQuantity9+"</td>"
					+ "<td>"+itemSource9+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo10+"</td>"
					+ "<td>"+itemCode10+"</td>"
					+ "<td>"+itemDescription10+"</td>"
					+ "<td>"+itemUnit10+"</td>"
					+ "<td>"+itemPacking10+"</td>"
					+ "<td>"+itemQuantity10+"</td>"
					+ "<td>"+itemSource10+"</td>"
					+ "</tr>"
					+ "</table><br>";

					usermailContent +="Verified By: " + formBy + "<br><br>";

					if (remark != "" && remark != null)
					usermailContent += "Remark: " + remark + "<br><br><br>"+"<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					usermailContent += "*** This is an automatically generated email, please do not reply ***";
					
				}

				//for Purchase Requisition  Approval
				if(requestType.equals("accept")&&(frmNmae.equalsIgnoreCase("approvePurchaseRequisitionApplicationForm")||frmNmae.equalsIgnoreCase("approvePurchaseRequisitionApplicationFormHO"))){
					//for verifier

					subject = "Action Required : " + formName;
					mailContent = "<br>Dear Sir/Madam,<br><br>" +

					"You have new request for Purchase<br><br><br>" +


					"<strong>Request Category: </strong> " + formName + "<br><br>" +

					"<strong>Name :</strong> " + userName + "<br>" +
					"<strong>Department :</strong> " + deptName + "<br>" +
					"<strong> Purchase Requisition No :</strong> " + prNo + "<br>" + 
					"<strong>Nature of Category  :</strong> " + urgency + "<br>" +
					"<strong>Nature of Materials  :</strong> " + natureOfMaterial + "<br>" +
					"<strong>Category of Material Required  : </strong>" + natureOfCategory + "<br><br><br>" +
					"<table  width='80%'>"

					+ "<tr style='text-align:centre;'>"
					+ "<td width='5%'><strong>S.No.</strong></td>"
					+ "<td width='20%'><strong>Item Code</strong></td>"
					+ "<td width='30%'><strong>Description</strong></td>"
					+ "<td width='5%'><strong>Unit</strong></td>"
					+ "<td width='10%'><strong>Packing</strong></td>"
					+ "<td width='10%'><strong>Quantity</strong></td>"
					+ "<td width='20%'><strong>Source</strong></td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo1+"</td>"
					+ "<td>"+itemCode1+"</td>"
					+ "<td>"+itemDescription1+"</td>"
					+ "<td>"+itemUnit1+"</td>"
					+ "<td>"+itemPacking1+"</td>"
					+ "<td>"+itemQuantity1+"</td>"
					+ "<td>"+itemSource1+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo2+"</td>"
					+ "<td>"+itemCode2+"</td>"
					+ "<td>"+itemDescription2+"</td>"
					+ "<td>"+itemUnit2+"</td>"
					+ "<td>"+itemPacking2+"</td>"
					+ "<td>"+itemQuantity2+"</td>"
					+ "<td>"+itemSource2+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo3+"</td>"
					+ "<td>"+itemCode3+"</td>"
					+ "<td>"+itemDescription3+"</td>"
					+ "<td>"+itemUnit3+"</td>"
					+ "<td>"+itemPacking3+"</td>"
					+ "<td>"+itemQuantity3+"</td>"
					+ "<td>"+itemSource3+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo4+"</td>"
					+ "<td>"+itemCode4+"</td>"
					+ "<td>"+itemDescription4+"</td>"
					+ "<td>"+itemUnit4+"</td>"
					+ "<td>"+itemPacking4+"</td>"
					+ "<td>"+itemQuantity4+"</td>"
					+ "<td>"+itemSource4+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo5+"</td>"
					+ "<td>"+itemCode5+"</td>"
					+ "<td>"+itemDescription5+"</td>"
					+ "<td>"+itemUnit5+"</td>"
					+ "<td>"+itemPacking5+"</td>"
					+ "<td>"+itemQuantity5+"</td>"
					+ "<td>"+itemSource5+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo6+"</td>"
					+ "<td>"+itemCode6+"</td>"
					+ "<td>"+itemDescription6+"</td>"
					+ "<td>"+itemUnit6+"</td>"
					+ "<td>"+itemPacking6+"</td>"
					+ "<td>"+itemQuantity6+"</td>"
					+ "<td>"+itemSource6+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo7+"</td>"
					+ "<td>"+itemCode7+"</td>"
					+ "<td>"+itemDescription7+"</td>"
					+ "<td>"+itemUnit7+"</td>"
					+ "<td>"+itemPacking7+"</td>"
					+ "<td>"+itemQuantity7+"</td>"
					+ "<td>"+itemSource7+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo8+"</td>"
					+ "<td>"+itemCode8+"</td>"
					+ "<td>"+itemDescription8+"</td>"
					+ "<td>"+itemUnit8+"</td>"
					+ "<td>"+itemPacking8+"</td>"
					+ "<td>"+itemQuantity8+"</td>"
					+ "<td>"+itemSource8+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo9+"</td>"
					+ "<td>"+itemCode9+"</td>"
					+ "<td>"+itemDescription9+"</td>"
					+ "<td>"+itemUnit9+"</td>"
					+ "<td>"+itemPacking9+"</td>"
					+ "<td>"+itemQuantity9+"</td>"
					+ "<td>"+itemSource9+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo10+"</td>"
					+ "<td>"+itemCode10+"</td>"
					+ "<td>"+itemDescription10+"</td>"
					+ "<td>"+itemUnit10+"</td>"
					+ "<td>"+itemPacking10+"</td>"
					+ "<td>"+itemQuantity10+"</td>"
					+ "<td>"+itemSource10+"</td>"
					+ "</tr>"
					+ "</table><br>"+
					"Initiated By: " + employeeID + "<br><br>";
					if (remark != null)
					mailContent += "Remark: " + remark + "<br><br>"+"<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					mailContent += "*** This is an automatically generated email, please do not reply ***";


					
					
					
					usersubject = "Info : " + formName;
					usermailContent = "<br>Dear Sir/Madam,<br><br>" +

					"Your form have been successfully Approved<br><br>" +

		

					"<strong>Request Category: </strong> " + formName + "<br><br>" +

					"<strong>Name :</strong> " + userName + "<br>" +
					"<strong>Department :</strong> " + deptName + "<br>" +
					"<strong> Purchase Requisition No :</strong> " + prNo + "<br>" + 
					"<strong>Nature of Category  :</strong> " + urgency + "<br>" +
					"<strong>Nature of Materials  :</strong> " + natureOfMaterial + "<br>" +
					"<strong>Category of Material Required  : </strong>" + natureOfCategory + "<br><br><br>" +
					"<table  width='80%'>"

					+ "<tr style='text-align:centre;'>"
					+ "<td width='5%'><strong>S.No.</strong></td>"
					+ "<td width='20%'><strong>Item Code</strong></td>"
					+ "<td width='30%'><strong>Description</strong></td>"
					+ "<td width='5%'><strong>Unit</strong></td>"
					+ "<td width='10%'><strong>Packing</strong></td>"
					+ "<td width='10%'><strong>Quantity</strong></td>"
					+ "<td width='20%'><strong>Source</strong></td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo1+"</td>"
					+ "<td>"+itemCode1+"</td>"
					+ "<td>"+itemDescription1+"</td>"
					+ "<td>"+itemUnit1+"</td>"
					+ "<td>"+itemPacking1+"</td>"
					+ "<td>"+itemQuantity1+"</td>"
					+ "<td>"+itemSource1+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo2+"</td>"
					+ "<td>"+itemCode2+"</td>"
					+ "<td>"+itemDescription2+"</td>"
					+ "<td>"+itemUnit2+"</td>"
					+ "<td>"+itemPacking2+"</td>"
					+ "<td>"+itemQuantity2+"</td>"
					+ "<td>"+itemSource2+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo3+"</td>"
					+ "<td>"+itemCode3+"</td>"
					+ "<td>"+itemDescription3+"</td>"
					+ "<td>"+itemUnit3+"</td>"
					+ "<td>"+itemPacking3+"</td>"
					+ "<td>"+itemQuantity3+"</td>"
					+ "<td>"+itemSource3+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo4+"</td>"
					+ "<td>"+itemCode4+"</td>"
					+ "<td>"+itemDescription4+"</td>"
					+ "<td>"+itemUnit4+"</td>"
					+ "<td>"+itemPacking4+"</td>"
					+ "<td>"+itemQuantity4+"</td>"
					+ "<td>"+itemSource4+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo5+"</td>"
					+ "<td>"+itemCode5+"</td>"
					+ "<td>"+itemDescription5+"</td>"
					+ "<td>"+itemUnit5+"</td>"
					+ "<td>"+itemPacking5+"</td>"
					+ "<td>"+itemQuantity5+"</td>"
					+ "<td>"+itemSource5+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo6+"</td>"
					+ "<td>"+itemCode6+"</td>"
					+ "<td>"+itemDescription6+"</td>"
					+ "<td>"+itemUnit6+"</td>"
					+ "<td>"+itemPacking6+"</td>"
					+ "<td>"+itemQuantity6+"</td>"
					+ "<td>"+itemSource6+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo7+"</td>"
					+ "<td>"+itemCode7+"</td>"
					+ "<td>"+itemDescription7+"</td>"
					+ "<td>"+itemUnit7+"</td>"
					+ "<td>"+itemPacking7+"</td>"
					+ "<td>"+itemQuantity7+"</td>"
					+ "<td>"+itemSource7+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo8+"</td>"
					+ "<td>"+itemCode8+"</td>"
					+ "<td>"+itemDescription8+"</td>"
					+ "<td>"+itemUnit8+"</td>"
					+ "<td>"+itemPacking8+"</td>"
					+ "<td>"+itemQuantity8+"</td>"
					+ "<td>"+itemSource8+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo9+"</td>"
					+ "<td>"+itemCode9+"</td>"
					+ "<td>"+itemDescription9+"</td>"
					+ "<td>"+itemUnit9+"</td>"
					+ "<td>"+itemPacking9+"</td>"
					+ "<td>"+itemQuantity9+"</td>"
					+ "<td>"+itemSource9+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo10+"</td>"
					+ "<td>"+itemCode10+"</td>"
					+ "<td>"+itemDescription10+"</td>"
					+ "<td>"+itemUnit10+"</td>"
					+ "<td>"+itemPacking10+"</td>"
					+ "<td>"+itemQuantity10+"</td>"
					+ "<td>"+itemSource10+"</td>"
					+ "</tr>"
					+ "</table><br>";

					usermailContent +="Approved By: " + formBy + "<br><br>";

					if (remark != "" && remark != null)
					usermailContent += "Remark: " + remark + "<br><br><br>"+"<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					usermailContent += "*** This is an automatically generated email, please do not reply ***";
					
				}
				//for Purchase Requisition  Authorization
				if(requestType.equals("accept")&&(frmNmae.equalsIgnoreCase("lastHandlePurchaseRequisitionApplicationForm")||frmNmae.equalsIgnoreCase("lastHandlePurchaseRequisitionApplicationFormHO"))){
					
					subject = "Info : " + formName;
					mailContent = "<br>Dear Sir/Madam,<br><br>" +

					"Your form has been received by Purchase<br><br>" +

		

					"<strong>Request Category: </strong> " + formName + "<br><br>" +

					"<strong>Name :</strong> " + userName + "<br>" +
					"<strong>Department :</strong> " + deptName + "<br>" +
					"<strong> Purchase Requisition No :</strong> " + prNo + "<br>" + 
					"<strong>Nature of Category  :</strong> " + urgency + "<br>" +
					"<strong>Nature of Materials  :</strong> " + natureOfMaterial + "<br>" +
					"<strong>Category of Material Required  : </strong>" + natureOfCategory + "<br><br><br>" +
					"<table  width='80%'>"

					+ "<tr style='text-align:centre;'>"
					+ "<td width='5%'><strong>S.No.</strong></td>"
					+ "<td width='20%'><strong>Item Code</strong></td>"
					+ "<td width='30%'><strong>Description</strong></td>"
					+ "<td width='5%'><strong>Unit</strong></td>"
					+ "<td width='10%'><strong>Packing</strong></td>"
					+ "<td width='10%'><strong>Quantity</strong></td>"
					+ "<td width='20%'><strong>Source</strong></td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo1+"</td>"
					+ "<td>"+itemCode1+"</td>"
					+ "<td>"+itemDescription1+"</td>"
					+ "<td>"+itemUnit1+"</td>"
					+ "<td>"+itemPacking1+"</td>"
					+ "<td>"+itemQuantity1+"</td>"
					+ "<td>"+itemSource1+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo2+"</td>"
					+ "<td>"+itemCode2+"</td>"
					+ "<td>"+itemDescription2+"</td>"
					+ "<td>"+itemUnit2+"</td>"
					+ "<td>"+itemPacking2+"</td>"
					+ "<td>"+itemQuantity2+"</td>"
					+ "<td>"+itemSource2+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo3+"</td>"
					+ "<td>"+itemCode3+"</td>"
					+ "<td>"+itemDescription3+"</td>"
					+ "<td>"+itemUnit3+"</td>"
					+ "<td>"+itemPacking3+"</td>"
					+ "<td>"+itemQuantity3+"</td>"
					+ "<td>"+itemSource3+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo4+"</td>"
					+ "<td>"+itemCode4+"</td>"
					+ "<td>"+itemDescription4+"</td>"
					+ "<td>"+itemUnit4+"</td>"
					+ "<td>"+itemPacking4+"</td>"
					+ "<td>"+itemQuantity4+"</td>"
					+ "<td>"+itemSource4+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo5+"</td>"
					+ "<td>"+itemCode5+"</td>"
					+ "<td>"+itemDescription5+"</td>"
					+ "<td>"+itemUnit5+"</td>"
					+ "<td>"+itemPacking5+"</td>"
					+ "<td>"+itemQuantity5+"</td>"
					+ "<td>"+itemSource5+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo6+"</td>"
					+ "<td>"+itemCode6+"</td>"
					+ "<td>"+itemDescription6+"</td>"
					+ "<td>"+itemUnit6+"</td>"
					+ "<td>"+itemPacking6+"</td>"
					+ "<td>"+itemQuantity6+"</td>"
					+ "<td>"+itemSource6+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo7+"</td>"
					+ "<td>"+itemCode7+"</td>"
					+ "<td>"+itemDescription7+"</td>"
					+ "<td>"+itemUnit7+"</td>"
					+ "<td>"+itemPacking7+"</td>"
					+ "<td>"+itemQuantity7+"</td>"
					+ "<td>"+itemSource7+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo8+"</td>"
					+ "<td>"+itemCode8+"</td>"
					+ "<td>"+itemDescription8+"</td>"
					+ "<td>"+itemUnit8+"</td>"
					+ "<td>"+itemPacking8+"</td>"
					+ "<td>"+itemQuantity8+"</td>"
					+ "<td>"+itemSource8+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo9+"</td>"
					+ "<td>"+itemCode9+"</td>"
					+ "<td>"+itemDescription9+"</td>"
					+ "<td>"+itemUnit9+"</td>"
					+ "<td>"+itemPacking9+"</td>"
					+ "<td>"+itemQuantity9+"</td>"
					+ "<td>"+itemSource9+"</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>"+serialNo10+"</td>"
					+ "<td>"+itemCode10+"</td>"
					+ "<td>"+itemDescription10+"</td>"
					+ "<td>"+itemUnit10+"</td>"
					+ "<td>"+itemPacking10+"</td>"
					+ "<td>"+itemQuantity10+"</td>"
					+ "<td>"+itemSource10+"</td>"
					+ "</tr>"
					+ "</table><br>";

					mailContent +="Request Received By: " + formBy + "<br><br>";

					if (remark != "" && remark != null)
					mailContent += "Remark: " + remark + "<br><br><br>"+"<strong>EDMS Workflow ID:</strong> " + processInstId + "<br><br><br>";
					mailContent += "*** This is an automatically generated email, please do not reply ***";
					
				}

				

				

				for(Map.Entry<Integer,HashMap> entry : hmpset.entrySet()) {
					  Integer key = entry.getKey();
					  HashMap value = entry.getValue();
					  workflowClient.getAuthorizeUserRequest((String)value.getValue());
					  taskVariables.add(value);
					}
				
				
				
				
				workflowClient.getAuthorizeUserRequest(subject);
				HashMap hmp = new HashMap();
				hmp.setKey("subject");
				hmp.setValue(subject);
				taskVariables.add(hmp);

				workflowClient.getAuthorizeUserRequest(mailContent);
				hmp = new HashMap();
				hmp.setKey("mailContent");
				hmp.setValue(mailContent);
				taskVariables.add(hmp);

				workflowClient.getAuthorizeUserRequest(usersubject);
				hmp = new HashMap();
				hmp.setKey("usersubject");
				hmp.setValue(usersubject);
				taskVariables.add(hmp);

				workflowClient.getAuthorizeUserRequest(usermailContent);
				hmp = new HashMap();
				hmp.setKey("usermailContent");
				hmp.setValue(usermailContent);
				taskVariables.add(hmp);

				TransformerFactory transformerFactory = TransformerFactory.newInstance();
				Transformer transformer = transformerFactory.newTransformer();
				transformer.setOutputProperty(OutputKeys.INDENT, "yes");
				DOMSource source = new DOMSource(doc);

				// initialize StreamResult with File object to save to file
				StreamResult result = new StreamResult(new StringWriter());
				transformer.transform(source, result);
				String xmlFormString = result.getWriter().toString();

				byte[] compressedXml = stringOperationService.compressString(xmlFormString);

				hmp = new HashMap();
				hmp.setKey(taskFormData.getTaskFormProperties().get(0).getId());
				hmp.setValue(xmlFormString);
				taskVariables.add(hmp);
				if (requestType.equals("reject")) {
					HashMap hmp1 = new HashMap();
					hmp1.setKey(taskFormData.getTaskFormProperties().get(1).getId());
					hmp1.setValue("false");
					taskVariables.add(hmp1);
				}
				if (requestType.equals("accept")) {
					HashMap hmp2 = new HashMap();
					hmp2.setKey(taskFormData.getTaskFormProperties().get(1).getId());
					hmp2.setValue("true");
					taskVariables.add(hmp2);
				}
				if (requestType.equals("verify")) {
					HashMap hmp3 = new HashMap();
					hmp3.setKey(taskFormData.getTaskFormProperties().get(1).getId());
					hmp3.setValue("verify");
					taskVariables.add(hmp3);
				}

				if (requestType.equals("reject") && frmNmae.equals("authorizeTravelExpensesReimbursement")) {
					HashMap hmp1 = new HashMap();
					hmp1.setKey(taskFormData.getTaskFormProperties().get(1).getId());
					hmp1.setValue("true");
					taskVariables.add(hmp1);
				}
				if (requestType.equals("accept") && frmNmae.equals("authorizeTravelExpensesReimbursement")) {
					HashMap hmp2 = new HashMap();
					hmp2.setKey(taskFormData.getTaskFormProperties().get(1).getId());
					hmp2.setValue("false");
					taskVariables.add(hmp2);
				}
				// if(flag)
				workflowClient.getContinueTaskRequest(taskVariables, taskid);
			} catch (ParserConfigurationException pce) {
				pce.printStackTrace();
			} catch (TransformerException tfe) {
				tfe.printStackTrace();
			}

			return "successfully submitted!";
		}

	}

}
