package edms.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edms.service.StringOperationsService;
import edms.webservice.client.WorkflowClient;
import edms.webservice.client.WorkflowHistoryClient;
import edms.wsdl.GetHistoryTaskInstanceResponse;
import edms.wsdl.GetProcessVariablesResponse;
import edms.wsdl.GetTaskFormDataResponse;
import edms.wsdl.HistDetVrblInstUpdateEntity;
import edms.wsdl.HistDetVrblInstUpdateEntityReturn;
import edms.wsdl.HistTaskInstList;
import edms.wsdl.HistTaskInstListReturn;
import edms.wsdl.TaskFormData;

@Controller
public class ToDoTasksController {
	
	@Autowired private WorkflowClient workflowClient;
	@Autowired private WorkflowHistoryClient workflowHistoryClient;
	@Autowired private StringOperationsService stringOperationsService;
	
	@RequestMapping(value="/toDoTasks_getCommonWorkflowForm", method=RequestMethod.GET)
	public String getCommonWorkflowForm(@RequestParam Map<String, String> requestParams, ModelMap map)throws Exception{
		System.out.println(" in toDoTasks_getCompleteTaskForm");
		String taskId=requestParams.get("tid");
		GetTaskFormDataResponse respTaskFormData = workflowClient.getTaskFormDataRequest(taskId);
		TaskFormData taskFormData = respTaskFormData.getTaskFormData();
		
		String completeTaskPage = taskFormData.getFormKey();
		map.addAttribute("taskid", taskId);
		
		GetHistoryTaskInstanceResponse respHistTaskInstt = workflowHistoryClient.getHistoryTaskInstanceRequest(taskId);
		HistTaskInstListReturn historicTaskListReturn = respHistTaskInstt.getHistTaskInstListReturn();
		List<HistTaskInstList> historicTaskInstance = historicTaskListReturn.getHistTaskInstList();
		String processInstId = historicTaskInstance.get(0).getProcessInstanceId();
		
		GetProcessVariablesResponse respProcessVariables = workflowHistoryClient.getProcessVariablesRequest(processInstId);
	    HistDetVrblInstUpdateEntityReturn variableUpdateReturn = respProcessVariables.getHistDetVrblInstUpdateEntityReturn();
	    HistDetVrblInstUpdateEntity historicVariableUpdate = variableUpdateReturn.getHistDetVrblInstUpdateEntity();
		System.out.println("variable update name ======== "+historicVariableUpdate.getName());
		String compressedForm = (String)historicVariableUpdate.getValue();
		map.addAttribute("xmlForm", compressedForm);
		map.addAttribute("stringOperationsService", stringOperationsService);
		map.addAttribute("htmlWorkflowPage", completeTaskPage);
		return "workflowForms";
	}
	
	@RequestMapping(value="/toDoTasks_claimTask", method=RequestMethod.POST)
	public String claimTask(@RequestParam Map<String, String> requestParams){
		System.out.println("in toDoTasks_claimTask ******************************");
		String taskId=requestParams.get("tid");
		String userId=requestParams.get("uid");
		workflowClient.getClaimTaskRequest(taskId, userId);
		return "redirect:/leftActiviti_toDoTasks";
	}
}
