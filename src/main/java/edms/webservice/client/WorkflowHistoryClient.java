package edms.webservice.client;

import org.springframework.ws.client.core.support.WebServiceGatewaySupport;
import org.springframework.ws.soap.client.core.SoapActionCallback;

import edms.wsdl.GetHistoryTaskInstanceRequest;
import edms.wsdl.GetHistoryTaskInstanceResponse;
import edms.wsdl.GetProcessVariablesRequest;
import edms.wsdl.GetProcessVariablesResponse;

public class WorkflowHistoryClient extends WebServiceGatewaySupport {

	public GetProcessVariablesResponse getProcessVariablesRequest(
			String processInstId) {
		GetProcessVariablesRequest request = new GetProcessVariablesRequest();
		request.setProcessInstId(processInstId);
		GetProcessVariablesResponse response = (GetProcessVariablesResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/GetProcessVariablesRequest"));
		return response;
	}

	public GetHistoryTaskInstanceResponse getHistoryTaskInstanceRequest(
			String taskId) {
		GetHistoryTaskInstanceRequest request = new GetHistoryTaskInstanceRequest();
		request.setTaskId(taskId);
		GetHistoryTaskInstanceResponse response = (GetHistoryTaskInstanceResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/GetHistoryTaskInstanceRequest"));
		return response;

	}
}
