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
import edms.wsdl.GetWorkFlowSnResponse;
import edms.wsdl.HashMap;
import edms.wsdl.StartFormData;
import edms.wsdl.StartFormProperty;

@Controller
public class StartPurchaseRequisitionForm {

	@Autowired
	private WorkflowClient workflowClient;
	@Autowired
	private WorkflowHistoryClient workflowHistoryClient;
	@Autowired
	private StringOperationsService stringOperationService;

	@RequestMapping(value = "/startPurchaseRequisitionForm_submit", method = RequestMethod.POST, headers = "Accept=text/json")
	public @ResponseBody String submitLeaveForm(HttpServletRequest request,Principal principal) {
		if (principal == null) {
			return "ajaxTrue";
		} else {
			boolean flag=true;
		System.out.println("in submit form");
		String json = request.getParameter("json");
		System.out.println(" json = " + json);
		String userName="";
		String remark="";
		String deptName="";
		String prNo = "";
		String natureOfCategory="";
		String natureOfMaterial="";
		String itemCode1="";
		String itemDescription1="";
		String itemQuantity1="";

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
		

		String urgency="";
		
		
		
		
		
		JSONObject jsonDataObject = (JSONObject) JSONValue.parse(json);

		// get an array from the JSON object
		JSONArray jsonArr = (JSONArray) jsonDataObject.get("workflowForm");

		System.out.println("jsonDataObject size= " + jsonDataObject.size());
		System.out.println("json array size= " + jsonArr.size());
		String formType = request.getParameter("formType");
		String processKey = request.getParameter("pkey");
		String processName = request.getParameter("pname");

		GetStartFormDataResponse respStartFormData = workflowClient
				.getStartFormDataRequest(processKey);
		StartFormData startFormData = respStartFormData.getStartFormData();
		StartFormProperty formProperty = startFormData.getStartFormProperties()
				.get(0);
		String formPropertyId = formProperty.getId();

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
					//System.out.print("key : " + key);
					//System.out.println(" value :" + value);
				if (key.equals("employeeID")) {
					//	workflowClient.getAuthorizeUserRequest(value);
					HashMap hmp = new HashMap();
					hmp.setKey(key);
					hmp.setValue(value);
					//	workflowVariables.add(hmp);
					hmpset.put(1, hmp);
				}
				if (key.equals("empName")) {
					//	workflowClient.getAuthorizeUserRequest(value);
					HashMap hmp = new HashMap();
					hmp.setKey(key);
					hmp.setValue(value);
					userName=value;
					//	workflowVariables.add(hmp);
					hmpset.put(5, hmp);
				}
				if (key.equals("prNo")) {
					//	workflowClient.getAuthorizeUserRequest(value);
					HashMap hmp = new HashMap();
					hmp.setKey(key);
					hmp.setValue(value);
					prNo=value;
					//	workflowVariables.add(hmp);
					hmpset.put(6, hmp);
				}
				if (key.equals("formName")) {
					//	workflowClient.getAuthorizeUserRequest(value);
					HashMap hmp = new HashMap();
					hmp.setKey(key);
					hmp.setValue(value);
					//userName=value;
					//	workflowVariables.add(hmp);
					hmpset.put(7, hmp);
				}
				

				if (key.equals("filledDaete")) {
					//	workflowClient.getAuthorizeUserRequest(value);
					HashMap hmp = new HashMap();
					hmp.setKey(key);
					hmp.setValue(value);
					//	workflowVariables.add(hmp);
					hmpset.put(4, hmp);
				
				}
				if (key.equals("formTo")) {
					if(value.indexOf(Config.EDMS_DOMAIN)<0)
						flag=false;
					//	workflowClient.getAuthorizeUserRequest(value);
					HashMap hmp = new HashMap();
					hmp.setKey(key);
					hmp.setValue(value);
					//	workflowVariables.add(hmp);
					hmpset.put(2, hmp);
				}
				if (key.equals("voucherRemark")) {
					remark=value;
				}

				if (key.equals("formSStatus")) {
					//	workflowClient.getAuthorizeUserRequest(value);
					HashMap hmp = new HashMap();
					hmp.setKey(key);
					hmp.setValue(value);
					//	workflowVariables.add(hmp);
					hmpset.put(3, hmp);
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
				if(key.equalsIgnoreCase("prNo"))
				{
					GetWorkFlowSnResponse resp= workflowClient.getWorkFlowSnRequest("PurchaseRequistionPlant");
					String sn=resp.getWorkFlowSN();
					if(sn!=null){
						int val=Integer.parseInt(sn);
						if((val/1000)>0){
						sn=""+val;
					}else if(val/100>0){
						sn="0"+val;
					}else if(val/10>0){
						sn="00"+val;
					}else{
						sn="000"+val;
					}
					Element attvalue = doc.createElement("attributeValue");
					attvalue.appendChild(doc.createTextNode("PR/PL/1617/"+sn));
					attribute.appendChild(attvalue);
					prNo="PR/PL/1617/"+sn;
					}
					else
					{
						prNo="PR/PL/1617/"+"0000";
					}
				}
				else 
				{
				Element attvalue = doc.createElement("attributeValue");
				attvalue.appendChild(doc.createTextNode(value.trim()));
				attribute.appendChild(attvalue);
				}


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


					"<strong>Request Category: </strong> " + processName + "<br><br>" +

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
			"Initiated By: " + userName + "<br><br>";
			if (remark != null)
			mailContent += "Remark: " + remark + "<br><br>";
			mailContent += "*** This is an automatically generated email, please do not reply ***";

			
			
			
			
			String usersubject = "Info : " + processName;
			String usermailContent = "<br>Dear Sir/Madam,<br><br>" +

			"Your form have been successfully submitted<br><br>" +



					"<strong>Request Category: </strong> " + processName + "<br><br>" +

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
			usermailContent += "Remark: " + remark + "<br><br><br>";
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

	
	@RequestMapping(value = "/startPurchaseRequisitionForm_submitHO", method = RequestMethod.POST, headers = "Accept=text/json")
	public @ResponseBody String submitLeaveFormHO(HttpServletRequest request,Principal principal) {
		if (principal == null) {
			return "ajaxTrue";
		} else {
		System.out.println("in submit form");
		String json = request.getParameter("json");
		System.out.println(" json = " + json);
		String userName="";
		String remark="";
		String deptName="";
		String prNo="";
		String natureOfCategory="";
		String natureOfMaterial="";
		String itemCode1="";
		String itemDescription1="";
		String itemQuantity1="";

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
		
		String urgency="";
		
		
		JSONObject jsonDataObject = (JSONObject) JSONValue.parse(json);
		boolean flag=true;
		// get an array from the JSON object
		JSONArray jsonArr = (JSONArray) jsonDataObject.get("workflowForm");

		System.out.println("jsonDataObject size= " + jsonDataObject.size());
		System.out.println("json array size= " + jsonArr.size());
		String formType = request.getParameter("formType");
		String processKey = request.getParameter("pkey");
		String processName = request.getParameter("pname");

		GetStartFormDataResponse respStartFormData = workflowClient
				.getStartFormDataRequest(processKey);
		StartFormData startFormData = respStartFormData.getStartFormData();
		StartFormProperty formProperty = startFormData.getStartFormProperties()
				.get(0);
		String formPropertyId = formProperty.getId();

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
				System.out.print("key : " + key);
				System.out.println(" value :" + value);
				if (key.equals("employeeID")) {
					//workflowClient.getAuthorizeUserRequest(value);
					HashMap hmp = new HashMap();
					hmp.setKey(key);
					hmp.setValue(value);
					//workflowVariables.add(hmp);
					hmpset.put(1, hmp);
				}
				if (key.equals("empName")) {
					//workflowClient.getAuthorizeUserRequest(value);
					HashMap hmp = new HashMap();
					hmp.setKey(key);
					hmp.setValue(value);
					userName=value;
					//workflowVariables.add(hmp);
					hmpset.put(5, hmp);
				}
				if (key.equals("prNo")) {
					//workflowClient.getAuthorizeUserRequest(value);
					HashMap hmp = new HashMap();
					hmp.setKey(key);
					hmp.setValue(value);
					prNo=value;
					//workflowVariables.add(hmp);
					hmpset.put(6, hmp);
				}
				if (key.equals("formName")) {
					//workflowClient.getAuthorizeUserRequest(value);
					HashMap hmp = new HashMap();
					hmp.setKey(key);
					hmp.setValue(value);
					//userName=value;
					//workflowVariables.add(hmp);
					hmpset.put(7, hmp);
				}
				

				if (key.equals("formSStatus")) {
					
					//workflowClient.getAuthorizeUserRequest(value);
					HashMap hmp = new HashMap();
					hmp.setKey(key);
					hmp.setValue(value);
					//workflowVariables.add(hmp);
					hmpset.put(3, hmp);
				}
				if (key.equals("filledDaete")) {
					//workflowClient.getAuthorizeUserRequest(value);
					HashMap hmp = new HashMap();
					hmp.setKey(key);
					hmp.setValue(value);
					//workflowVariables.add(hmp);
					hmpset.put(4, hmp);
				
				}
				if (key.equals("formTo")) {
					if(value.indexOf(Config.EDMS_DOMAIN)<0)
						flag=false;
					//workflowClient.getAuthorizeUserRequest(value);
					HashMap hmp = new HashMap();
					hmp.setKey(key);
					hmp.setValue(value);
					//workflowVariables.add(hmp);
					hmpset.put(2, hmp);
				}if (key.equals("voucherRemark")) {
					remark=value;
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
				if(key.equalsIgnoreCase("prNo"))
				{
					GetWorkFlowSnResponse resp= workflowClient.getWorkFlowSnRequest("PurchaseRequistionHO");
					String sn=resp.getWorkFlowSN();
					

					
						if(sn!=null){
							int val=Integer.parseInt(sn);
							if((val/1000)>0){
							sn=""+val;
						}else if(val/100>0){
							sn="0"+val;
						}else if(val/10>0){
							sn="00"+val;
						}else{
							sn="000"+val;
						}
						Element attvalue = doc.createElement("attributeValue");
						attvalue.appendChild(doc.createTextNode("PR/HO/1617/"+sn));
						attribute.appendChild(attvalue);
						prNo="PR/PL/1617/"+sn;
						}
						else
						{
							prNo="PR/HO/1617/"+"0000";
						}
					
					
				}
				else 
				{
				Element attvalue = doc.createElement("attributeValue");
				attvalue.appendChild(doc.createTextNode(value.trim()));
				attribute.appendChild(attvalue);
				}


				JSONObject jsonFormObj1 = (JSONObject) jsonArr.get(1);
				System.out.println("slide 2 ******************* "
						+ jsonFormObj1);
				Set<String> keys1 = jsonFormObj1.keySet();
				Iterator<String> it1 = keys1.iterator();
				while (it1.hasNext()) {
					String key1 = (String) it1.next();
					// loop to get the dynamic key
					String value1 = (String) jsonFormObj1.get(key1);
					System.out.println("key = " + key + "key 1 = " + key1);
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


					"<strong>Request Category: </strong> " + processName + "<br><br>" +

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
			"Initiated By: " + userName + "<br><br>";
			if (remark != null)
			mailContent += "Remark: " + remark + "<br><br>";
			mailContent += "*** This is an automatically generated email, please do not reply ***";

			
			
			
			
			String usersubject = "Info : " + processName;
			String usermailContent = "<br>Dear Sir/Madam,<br><br>" +

			"Your form have been successfully submitted<br><br>" +



					"<strong>Request Category: </strong> " + processName + "<br><br>" +

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
			usermailContent += "Remark: " + remark + "<br><br><br>";
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
