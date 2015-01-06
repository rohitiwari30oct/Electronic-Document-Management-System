package edms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edms.webservice.client.WorkflowClient;

@Controller
public class HeaderController {
	
	@Autowired private WorkflowClient workflowClient;
	
	@RequestMapping(value="/header_activity", method=RequestMethod.GET)
	public String getActivitiLeft(){
		System.out.println("in header_activity..........");
		return "leftActiviti";
	}
	
	@RequestMapping(value="/header_activitydiagrams", method=RequestMethod.GET)
	public String getActivitiForms(ModelMap map){
		System.out.println("in header_activitydiagrams..........");
		map.addAttribute("workflow", workflowClient);
		return "activitiDiagrams";
	}


}
