package edms.controller;

import edms.core.Config;
import edms.core.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edms.service.StringOperationsService;
import edms.webservice.client.WorkflowClient;
import edms.webservice.client.WorkflowHistoryClient;

@Controller
public class LeftActivitiController {

	@Autowired
	private WorkflowClient workflowClient;
	@Autowired
	private WorkflowHistoryClient workflowHistoryClient;
	@Autowired
	private StringOperationsService stringOperationsService;

	@RequestMapping(value = "/leftActiviti_toDoTasks", method = RequestMethod.GET)
	public String getActivitiForms(ModelMap map,Principal principal) throws Exception {
		if(principal==null){return "ajaxTrue";}else{
			String userid="";
			if(principal.getName().contains("@")){
				userid=principal.getName();
				}else{
					userid=principal.getName()+Config.EDMS_DOMAIN;
				}
		System.out.println("in leftActiviti_toDoTasks..........");
		map.addAttribute("workflow", workflowClient);
		//DemoUserService demoUserService = new DemoUser1ServiceImpl();
		//map.addAttribute("demoUserService", demoUserService);
		map.addAttribute("userid", userid);
		return "toDoTasks";}
	}
	@RequestMapping(value = "/activity_history", method = RequestMethod.GET)
	public String getActivitiFormsFromHistory(ModelMap map,Principal principal) throws Exception {
		if(principal==null){return "ajaxTrue";}else{
			String userid="";
			if(principal.getName().contains("@")){
				userid=principal.getName();
				}else{
					userid=principal.getName()+Config.EDMS_DOMAIN;
				}
		System.out.println("in leftActiviti_toDoTasks..........");
		map.addAttribute("workflow", workflowClient);
		//DemoUserService demoUserService = new DemoUser1ServiceImpl();
		//map.addAttribute("demoUserService", demoUserService);
		map.addAttribute("userid", userid);
		return "activity_history";}
	}
}
