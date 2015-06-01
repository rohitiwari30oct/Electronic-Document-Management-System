package edms.controller;

import java.io.StringWriter;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

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
public class StartLeaveApplicationForm {

	@Autowired
	private WorkflowClient workflowClient;
	@Autowired
	private WorkflowHistoryClient workflowHistoryClient;
	@Autowired
	private StringOperationsService stringOperationService;

	@RequestMapping(value = "/startLeaveApplicationForm_submitLeave", method = RequestMethod.POST, headers = "Accept=text/json")
	public @ResponseBody String submitLeaveForm(HttpServletRequest request,Principal principal) {
		if(principal!=null){
		System.out.println("in submit form");
		String json = request.getParameter("json");
		System.out.println(" json = " + json);

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
			int id = 1;
			while (it.hasNext()) {
				String key = (String) it.next();
				// loop to get the dynamic key
				String value = (String) jsonFormObj.get(key);
				System.out.print("key : " + key);
				System.out.println(" value :" + value);
				if (key.equals("employeeID")) {
					workflowClient.getAuthorizeUserRequest(value);
					HashMap hmp = new HashMap();
					hmp.setKey(key);
					hmp.setValue(value);
					workflowVariables.add(hmp);
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
			workflowClient.getStartWorkflowRequest(workflowVariables,
					processKey, processName);
			System.out
					.println("after end %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ");
		} catch (ParserConfigurationException pce) {
			pce.printStackTrace();
		} catch (TransformerException tfe) {
			tfe.printStackTrace();
		}
		return "redirect:/leftActiviti_toDoTasks";}
		else{
			return "true";
		}
	}

}
