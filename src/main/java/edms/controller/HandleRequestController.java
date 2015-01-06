package edms.controller;

import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
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
import edms.wsdl.GetTaskFormDataResponse;
import edms.wsdl.HashMap;
import edms.wsdl.TaskFormData;
import edms.wsdl.TaskFormProperty;

@Controller
public class HandleRequestController {

	@Autowired
	private WorkflowClient workflowClient;
	@Autowired
	private StringOperationsService stringOperationService;

	@RequestMapping(value = "/handleRequest_formDecision", method = RequestMethod.POST)
	public @ResponseBody String requestResponseNo(HttpServletRequest request) {
		String taskid = request.getParameter("taskid");
		String json = request.getParameter("json");
		String formType = request.getParameter("formType");
		String requestType = request.getParameter("reqtype");
		JSONObject jsonDataObject = (JSONObject) JSONValue.parse(json);
		// get an array from the JSON object
		JSONArray jsonArr = (JSONArray) jsonDataObject.get("workflowForm");

		System.out.println("jsonDataObject size= " + jsonDataObject.size());
		System.out.println("json array size= " + jsonArr.size() + " taskid = "
				+ taskid);

		GetTaskFormDataResponse respTaskFormData = workflowClient
				.getTaskFormDataRequest(taskid);
		TaskFormData taskFormData = respTaskFormData.getTaskFormData();
		// TaskFormData taskFormData = workflow.getTaskFormData(taskid);
		System.out.println("task form data ========================= "
				+ taskFormData);
		List<TaskFormProperty> formProperties = taskFormData
				.getTaskFormProperties();
		// List<FormProperty> formProperties = taskFormData.getFormProperties();
		for (TaskFormProperty tf : formProperties) {
			System.out.println("id iiiiiiiiiiid " + tf.getId());
		}
		List<edms.wsdl.HashMap> taskVariables = new ArrayList<edms.wsdl.HashMap>();
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
				Set<String> keys1 = jsonFormObj1.keySet();
				Iterator<String> it1 = keys1.iterator();
				while (it1.hasNext()) {
					String key1 = (String) it1.next();
					// loop to get the dynamic key
					String value1 = (String) jsonFormObj1.get(key1);
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

			byte[] compressedXml = stringOperationService
					.compressString(xmlFormString);

			HashMap hmp = new HashMap();
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
			workflowClient.getContinueTaskRequest(taskVariables, taskid);
		} catch (ParserConfigurationException pce) {
			pce.printStackTrace();
		} catch (TransformerException tfe) {
			tfe.printStackTrace();
		}

		return "successfully submitted!";
	}

}
