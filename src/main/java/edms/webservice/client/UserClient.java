package edms.webservice.client;

import org.springframework.ws.client.core.support.WebServiceGatewaySupport;
import org.springframework.ws.soap.client.core.SoapActionCallback;

import edms.wsdl.GetRecycledDocsResponse;
import edms.wsdl.GetUsersListRequest;
import edms.wsdl.GetUsersListResponse;
import edms.wsdl.LoginRequest;
import edms.wsdl.LoginResponse;

public class UserClient extends WebServiceGatewaySupport {


	/*public LoginResponse loginRequest(String userId,String password) {
		LoginRequest request = new LoginRequest();
		request.setUserid(userId);
		request.setPassword(password);
		LoginResponse response = (LoginResponse) 	getWebServiceTemplate().marshalSendAndReceive(
				request,
				new SoapActionCallback(
						"http://localhost:8080/ws/loginRequest"));
		return response;
	}*/

	public GetUsersListResponse getUsersListRequest(String userId,String password) {
		GetUsersListRequest request = new GetUsersListRequest();
		request.setUserid(userId);
		request.setPassword(password);
		GetUsersListResponse response = (GetUsersListResponse) 	getWebServiceTemplate().marshalSendAndReceive(
				request,
				new SoapActionCallback(
						"http://localhost:8080/ws/getUsersListRequest"));
		return response;
	}

}
