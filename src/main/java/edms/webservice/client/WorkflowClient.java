package edms.webservice.client;

import java.util.List;

import org.springframework.ws.client.core.support.WebServiceGatewaySupport;
import org.springframework.ws.soap.client.core.SoapActionCallback;

import edms.wsdl.GetAuthorizeUserRequest;
import edms.wsdl.GetClaimTaskRequest;
import edms.wsdl.GetContinueTaskRequest;
import edms.wsdl.GetFetchGroupTaskRequest;
import edms.wsdl.GetFetchGroupTaskResponse;
import edms.wsdl.GetFetchUserTaskRequest;
import edms.wsdl.GetFetchUserTaskResponse;
import edms.wsdl.GetGenerateProcessImageRequest;
import edms.wsdl.GetGenerateProcessImageResponse;
import edms.wsdl.GetStartFormDataRequest;
import edms.wsdl.GetStartFormDataResponse;
import edms.wsdl.GetStartWorkflowRequest;
import edms.wsdl.GetTaskFormDataRequest;
import edms.wsdl.GetTaskFormDataResponse;
import edms.wsdl.HashMap;

public class WorkflowClient extends WebServiceGatewaySupport {

	public void getAuthorizeUserRequest(String userId) {
		GetAuthorizeUserRequest request = new GetAuthorizeUserRequest();
		request.setUserId(userId);
		getWebServiceTemplate().marshalSendAndReceive(
				request,
				new SoapActionCallback(
						"http://localhost:8080/ws/GetAuthorizeUserRequest"));
	}

	public void getStartWorkflowRequest(List<HashMap> hashMap, String processKey,
			String processName){
		GetStartWorkflowRequest request = new GetStartWorkflowRequest();
		request.setProcessKey(processKey);
		request.setProcessName(processName);
		for(HashMap hm:hashMap){
			request.getVariables().add(hm);
		}
		getWebServiceTemplate().marshalSendAndReceive(
				request,
				new SoapActionCallback(
						"http://localhost:8080/ws/GetStartWorkflowRequest"));
	}

	public GetGenerateProcessImageResponse getGenerateProcessImageRequest(
			String processKey) {
		GetGenerateProcessImageRequest request = new GetGenerateProcessImageRequest();
		request.setProcessKey(processKey);
		GetGenerateProcessImageResponse response = (GetGenerateProcessImageResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/GetGenerateProcessImageRequest"));
		return response;
	}

	public GetFetchUserTaskResponse getFetchUserTaskRequest(String empid) {
		GetFetchUserTaskRequest request = new GetFetchUserTaskRequest();
		request.setEmployeeId(empid);
		GetFetchUserTaskResponse response = (GetFetchUserTaskResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/GetFetchUserTaskRequest"));
		return response;
	}

	public GetFetchGroupTaskResponse getFetchGroupTaskRequest(String deptid) {
		GetFetchGroupTaskRequest request = new GetFetchGroupTaskRequest();
		request.setDepartmentId(deptid);
		GetFetchGroupTaskResponse response = (GetFetchGroupTaskResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/GetFetchGroupTaskRequest"));
		return response;
	}

	public void getContinueTaskRequest(List<HashMap> hashMap, String taskid){
		GetContinueTaskRequest request = new GetContinueTaskRequest();
		request.setTaskId(taskid);
		for(HashMap hm:hashMap){
			request.getTaskVariables().add(hm);
		}
		getWebServiceTemplate()
		.marshalSendAndReceive(
				request,
				new SoapActionCallback(
						"http://localhost:8080/ws/GetContinueTaskRequest"));
	}

	public GetTaskFormDataResponse getTaskFormDataRequest(String taskId) {
		GetTaskFormDataRequest request = new GetTaskFormDataRequest();
		request.setTaskId(taskId);
		GetTaskFormDataResponse response = (GetTaskFormDataResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/GetTaskFormDataRequest"));
		return response;
	}

	public GetStartFormDataResponse getStartFormDataRequest(String processKey) {
		GetStartFormDataRequest request = new GetStartFormDataRequest();
		request.setProcessKey(processKey);
		GetStartFormDataResponse response = (GetStartFormDataResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/GetStartFormDataRequest"));
		return response;
	}

	public void getClaimTaskRequest(String taskId, String userId) {
		GetClaimTaskRequest request = new GetClaimTaskRequest();
		request.setTaskId(taskId);
		request.setUserId(userId);
		getWebServiceTemplate().marshalSendAndReceive(
				request,
				new SoapActionCallback(
						"http://localhost:8080/ws/GetClaimTaskRequest"));
	}

}
