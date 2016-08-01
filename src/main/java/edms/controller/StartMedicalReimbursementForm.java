package edms.controller;

import java.io.StringWriter;

import edms.core.Config;
import edms.core.Principal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;
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
import edms.wsdl.GetStartFormDataResponse;
import edms.wsdl.HashMap;
import edms.wsdl.StartFormData;
import edms.wsdl.StartFormProperty;

@Controller
public class StartMedicalReimbursementForm {

	@Autowired
	private WorkflowClient workflowClient;
	@Autowired
	private WorkflowHistoryClient workflowHistoryClient;
	@Autowired
	private StringOperationsService stringOperationService;

	@RequestMapping(value = "/medicalExpensesReimbursement_submit", method = RequestMethod.POST, headers = "Accept=text/json")
	public @ResponseBody String submitLeaveForm(HttpServletRequest request,Principal principal) {
		if (principal == null) {
			return "ajaxTrue";
		} else {
		System.out.println("in submit form");
		String json = request.getParameter("json");
		System.out.println(" json = " + json);
		String remark="";
		String gtotal="";
		String empName="";
		String empNo="";
		String empDesig="";
		String deptName="";
		JSONObject jsonDataObject = (JSONObject) JSONValue.parse(json);

		// get an array from the JSON object
		JSONArray jsonArr = (JSONArray) jsonDataObject.get("workflowForm");

		System.out.println("jsonDataObject size= " + jsonDataObject.size());
		System.out.println("json array size= " + jsonArr.size());
		String formType = request.getParameter("formType");
		String processKey = request.getParameter("pkey");
		String processName = request.getParameter("pname");
boolean flag=true;
		GetStartFormDataResponse respStartFormData = workflowClient
				.getStartFormDataRequest(processKey);
		StartFormData startFormData = respStartFormData.getStartFormData();
		StartFormProperty formProperty = startFormData.getStartFormProperties()
				.get(0);
		String formPropertyId = formProperty.getId();
		String username="";
		// Map<String, Object> workflowVariables = new HashMap<String,
		// Object>();
		List<edms.wsdl.HashMap> workflowVariables = new ArrayList<edms.wsdl.HashMap>();
		DocumentBuilderFactory docFactory = DocumentBuilderFactory
				.newInstance();
		try {
			DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
			// root element
			Document doc = docBuilder.newDocument();
			Element rootElement = doc.createElement(formType);
			doc.appendChild(rootElement);

			// take each value from the json array separately
			JSONObject jsonFormObj = (JSONObject) jsonArr.get(0);
			System.out.println("slide ******************* " + jsonFormObj);
			Set<String> keys = jsonFormObj.keySet();
			Iterator<String> it = keys.iterator();
			Map<Integer,HashMap> hmpset=new TreeMap<Integer,HashMap>();
			int id = 1;
			while (it.hasNext()) {
				String key = (String) it.next();
				// loop to get the dynamic key
				String value = (String) jsonFormObj.get(key);
			//	System.out.print("key : " + key);
			//	System.out.println(" value :" + value);
				if (key.equals("employeeID")) {
					//workflowClient.getAuthorizeUserRequest(value);
					HashMap hmp = new HashMap();
					hmp.setKey(key);
					hmp.setValue(value);
					workflowVariables.add(hmp);
				//	username=value;
					hmpset.put(1, hmp);
				}
				if (key.equals("authorizationStep")) {
				//	workflowClient.getAuthorizeUserRequest(value);
					HashMap hmp = new HashMap();
					hmp.setKey(key);
					hmp.setValue(value);
				//	workflowVariables.add(hmp);
					hmpset.put(4, hmp);
				}
				

				if (key.equals("formSStatus")) {
					
				//	workflowClient.getAuthorizeUserRequest(value);
					HashMap hmp = new HashMap();
					hmp.setKey(key);
					hmp.setValue(value);
				//	workflowVariables.add(hmp);
					hmpset.put(5, hmp);
				}
				if (key.equals("filledDaete")) {
				//	workflowClient.getAuthorizeUserRequest(value);
					HashMap hmp = new HashMap();
					hmp.setKey(key);
					hmp.setValue(value);
				//	workflowVariables.add(hmp);
					hmpset.put(6, hmp);
				
				}
				if (key.equals("gtotal")) {
					gtotal=value;
				}
				if (key.equals("empName")) {
					empName=value;
				}
				if (key.equals("empNo")) {
					empNo=value;
				}
				if (key.equals("empDesig")) {
					empDesig=value;
				}
				if (key.equals("deptName")) {
					deptName=value;
				}
				if (key.equals("verificationStep")) {
					if(value.indexOf(Config.EDMS_DOMAIN)<0)
						flag=false;
				//	workflowClient.getAuthorizeUserRequest(value);
					HashMap hmp = new HashMap();
					hmp.setKey(key);
					hmp.setValue(value);
				//	workflowVariables.add(hmp);
					hmpset.put(2, hmp);
				}
				if (key.equals("approvalStep")) {
					if(value.indexOf(Config.EDMS_DOMAIN)<0)
						flag=false;
				//	workflowClient.getAuthorizeUserRequest(value);
					HashMap hmp = new HashMap();
					hmp.setKey(key);
					hmp.setValue(value);
				//	workflowVariables.add(hmp);
					hmpset.put(3, hmp);
				}
				if (key.equals("voucherRemark")) {
					remark=value;
				}
				// attribute elements
				Element attribute = doc.createElement("field");
				rootElement.appendChild(attribute);
				// set attribute to staff element
				Attr attr = doc.createAttribute("id");
				attr.setValue(String.valueOf(id));
				attribute.setAttributeNode(attr);

				// attribute id elements
				Element newElement = doc.createElement("attributeId");
				newElement.appendChild(doc.createTextNode(key.trim()));
				attribute.appendChild(newElement);

				// attribute value elements
				Element attvalue = doc.createElement("attributeValue");
				attvalue.appendChild(doc.createTextNode(value.trim()));
				attribute.appendChild(attvalue);

				JSONObject jsonFormObj1 = (JSONObject) jsonArr.get(1);
				System.out.println("slide 2 ******************* "
						+ jsonFormObj1);
				Set<String> keys1 = jsonFormObj1.keySet();
				Iterator<String> it1 = keys1.iterator();
				while (it1.hasNext()) {
					String key1 = (String) it1.next();
					// loop to get the dynamic key
					String value1 = (String) jsonFormObj1.get(key1);
				//	System.out.println("key = " + key + "key 1 = " + key1);
					if (key1.equals(key)) {
						// attribute type elements
						Element attType = doc.createElement("attributeType");
						attType.appendChild(doc.createTextNode(value1.trim()));
						attribute.appendChild(attType);
						break;
					}
				}
				id++;
			}

				String subject = "Action Required : " + processName;
				String mailContent = "<br>Dear Sir/Madam,<br><br>" +

				"You have new request for Verification<br><br><br>" +

				"<strong>Request Category: </strong> " + processName + "<br>" +
				"<strong> Amount: " + gtotal + "</strong><br><br><br>" +
				
				"<strong>Name : " + empName + "</strong><br>" +
				"<strong>Emp. Code : " + empNo + "</strong><br>" +
				"<strong>Designation : " + empDesig + "</strong><br>" +
				"<strong>Department : " + deptName + "</strong><br><br><br><br>" +

				"Initiated By: " + username + "<br><br>";
				if (remark != null)
				mailContent += "Remark: " + remark + "<br><br><br>";
				mailContent += "*** This is an automatically generated email, please do not reply ***";

				
				
				
				
				String usersubject = "Info : " + processName;
				String usermailContent = "<br>Dear Sir/Madam,<br><br>" +

				"Your form have been successfully submitted<br><br<br>>" +

				"<strong>Request Category: </strong> " + processName + "<br>" +
				"<strong> Amount: " + gtotal + "</strong><br><br><br>" +
				
				"<strong>Name : " + empName + "</strong><br>" +
				"<strong>Emp. Code : " + empNo + "</strong><br>" +
				"<strong>Designation : " + empDesig + "</strong><br>" +
				"<strong>Department : " + deptName + "</strong><br><br><br><br>" ;



				if (remark != "" && remark != null)
				usermailContent += "Remark: " + remark + "<br><br><br><br>";
				usermailContent += "*** This is an automatically generated email, please do not reply ***";

				
				for(Map.Entry<Integer,HashMap> entry : hmpset.entrySet()) {
					  Integer key = entry.getKey();
					  HashMap value = entry.getValue();
					  workflowClient.getAuthorizeUserRequest((String)value.getValue());
					  workflowVariables.add(value);
					  System.out.println(key + " => " + value);
					}
				
				
				
				workflowClient.getAuthorizeUserRequest(subject);
				HashMap hmp = new HashMap();
				hmp.setKey("subject");
				hmp.setValue(subject);
				workflowVariables.add(hmp);
				workflowClient.getAuthorizeUserRequest(mailContent);
				hmp = new HashMap();
				hmp.setKey("mailContent");
				hmp.setValue(mailContent);
				workflowVariables.add(hmp);
				
				workflowClient.getAuthorizeUserRequest(usersubject);
				HashMap hmpu = new HashMap();
				hmpu.setKey("usersubject");
				hmpu.setValue(usersubject);
				workflowVariables.add(hmpu);
				workflowClient.getAuthorizeUserRequest(usermailContent);
				hmpu = new HashMap();
				hmpu.setKey("usermailContent");
				hmpu.setValue(usermailContent);
				workflowVariables.add(hmpu);
			// write the content into xml file
			TransformerFactory transformerFactory = TransformerFactory
					.newInstance();
			Transformer transformer = transformerFactory.newTransformer();
			transformer.setOutputProperty(OutputKeys.INDENT, "yes");
			DOMSource source = new DOMSource(doc);
			// initialize StreamResult with File object to save to file
			StreamResult result = new StreamResult(new StringWriter());
			transformer.transform(source, result);
			String xmlFormString = result.getWriter().toString();
			System.out.println("xmlstring = " + xmlFormString);
			System.out.println("File saved!");
			// byte[] compressedXml = stringOperationService.compressString(xmlFormString);
			HashMap hmp1 = new HashMap();
			hmp1.setKey(formPropertyId);
			hmp1.setValue(xmlFormString);
			workflowVariables.add(hmp1);
			//if(flag)
			workflowClient.getStartWorkflowRequest(workflowVariables,
					processKey, processName);
			System.out.println("after end %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ");
		} catch (ParserConfigurationException pce) {
			pce.printStackTrace();
		} catch (TransformerException tfe) {
			tfe.printStackTrace();
		}
		return "redirect:/leftActiviti_toDoTasks";
		}
		
	}

}
