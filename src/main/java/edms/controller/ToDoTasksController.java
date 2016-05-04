package edms.controller;

import edms.core.Principal;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
import edms.wsdl.GetTaskFormDataFromHistoryResponse;
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
	public String getCommonWorkflowForm(HttpServletRequest request,Principal principal,@RequestParam Map<String, String> requestParams, ModelMap map)throws Exception{
		if(principal!=null){
			HttpSession hs=request.getSession(false);
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
		String compressedForm = (String)historicVariableUpdate.getValue();
		hs.setAttribute("processInstId", processInstId);
		map.addAttribute("processInstId", processInstId);
		map.addAttribute("xmlForm", compressedForm);
		map.addAttribute("stringOperationsService", stringOperationsService);
		map.addAttribute("htmlWorkflowPage", completeTaskPage);
		return "workflowForms";
		}else{
			return "ajaxTrue";
		}
	}
	@RequestMapping(value="/toDoTasks_getCommonWorkflowFormHitory", method=RequestMethod.GET)
	public String getCommonWorkflowFormHitory(HttpServletRequest request,Principal principal,@RequestParam Map<String, String> requestParams, ModelMap map)throws Exception{
		if(principal!=null){
			HttpSession hs=request.getSession(false);
		String taskId=requestParams.get("tid");
		GetTaskFormDataFromHistoryResponse respTaskFormData = workflowClient.getTaskFormDataFromHistoryRequest(taskId);
		TaskFormData taskFormData = respTaskFormData.getTaskFormData();
		String completeTaskPage = taskFormData.getFormKey();
		map.addAttribute("taskid", taskId);
		GetHistoryTaskInstanceResponse respHistTaskInstt = workflowHistoryClient.getHistoryTaskInstanceRequest(taskId);
		String processInstId =taskId;
		GetProcessVariablesResponse respProcessVariables = workflowHistoryClient.getProcessVariablesRequest(processInstId);
	    HistDetVrblInstUpdateEntityReturn variableUpdateReturn = respProcessVariables.getHistDetVrblInstUpdateEntityReturn();
	    HistDetVrblInstUpdateEntity historicVariableUpdate = variableUpdateReturn.getHistDetVrblInstUpdateEntity();
		String compressedForm = (String)historicVariableUpdate.getValue();
		hs.setAttribute("processInstId", processInstId);
		map.addAttribute("processInstId", processInstId);
		map.addAttribute("xmlForm", compressedForm);
		map.addAttribute("stringOperationsService", stringOperationsService);
		if(compressedForm.indexOf("Purchase Requisition (HO)")>=0){
			completeTaskPage="handlePurchaseRequisitionApplicationFormHOHistory";
		}
		if(compressedForm.indexOf("Purchase Requisition (Plant)")>=0){
			completeTaskPage="handlePurchaseRequisitionApplicationFormHistory";
		}
		map.addAttribute("htmlWorkflowPage", completeTaskPage);
		return "workflowForms";
		}else{
			return "ajaxTrue";
		}
	}
	

	@RequestMapping(value="/toDoTasks_claimTask", method=RequestMethod.POST)
	public String claimTask(@RequestParam Map<String, String> requestParams,Principal principal){
		if(principal!=null){
		String taskId=requestParams.get("tid");
		String userId=requestParams.get("uid");
		workflowClient.getClaimTaskRequest(taskId, userId);
		return "redirect:/leftActiviti_toDoTasks";}else{
			return "ajaxTrue";
		}
	}
}
