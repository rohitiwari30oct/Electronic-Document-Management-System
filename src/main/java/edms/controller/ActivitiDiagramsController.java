package edms.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edms.service.DemoUserService;
import edms.service.DemoUserServiceImpl;
import edms.webservice.client.WorkflowClient;
import edms.wsdl.GetGenerateProcessImageResponse;
import edms.wsdl.GetStartFormDataResponse;
import edms.wsdl.StartFormData;

@Controller
public class ActivitiDiagramsController {
	
	@Autowired private WorkflowClient workflowClient;
	
	@RequestMapping(value="/activitiDiagram_getStartWorkflowPage", method=RequestMethod.POST)
	public @ResponseBody String getStartWorkflowPage(ModelMap map, HttpServletRequest request){
		String startFormData = request.getParameter("sfk");
		//DemoUserService demoUserService = new DemoUserServiceImpl();
		//map.addAttribute("demoUserService", demoUserService);
		return startFormData;
	}
	
	@RequestMapping(value="/activitiDiagram_getActivitiDiagram", method=RequestMethod.POST)
	public @ResponseBody String changeConfiguration(HttpServletRequest request){
		System.out.println("in activityDiagram_getActivit");
		String value = request.getParameter("tv");
		String [] values = value.split(":");
		String workflowKey = values[0];
		String divid = values[1];
		GetGenerateProcessImageResponse responseimg = workflowClient.getGenerateProcessImageRequest(workflowKey);
		String processImage = responseimg.getImage();
		GetStartFormDataResponse respStartFormData = workflowClient.getStartFormDataRequest(workflowKey);
		StartFormData startFormData = respStartFormData.getStartFormData();
		String startFormKey = startFormData.getFormKey();
		//StartFormData startFormData = workflow.getStartFormData(workflowKey);
		//String startFormKey = startFormData.getFormKey();
		String passArg = startFormKey+":"+divid;
		String diagData = "<div class='form_scolling_project'><div class='from_main_leave'><table><tbody><tr>"
				+ "<img alt='' src='"+processImage+"' /></tr><tr>"
						+ "<a href='#' onclick=\"getStartWorkflowForm('"+passArg+"')\">Begin Process</a></tr></tbody></table>";
		return diagData;
	}
	
	

}
