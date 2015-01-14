package edms.webservice.client;

import java.text.SimpleDateFormat;

import org.springframework.ws.client.core.support.WebServiceGatewaySupport;
import org.springframework.ws.soap.client.core.SoapActionCallback;

import edms.wsdl.AssignSinglePermissionRequest;
import edms.wsdl.AssignSinglePermissionResponse;
import edms.wsdl.CreateFolderRequest;
import edms.wsdl.CreateFolderResponse;
import edms.wsdl.DeleteFolderRequest;
import edms.wsdl.DeleteFolderResponse;
import edms.wsdl.FolderListReturn;
import edms.wsdl.GetFolderByPathRequest;
import edms.wsdl.GetFolderByPathResponse;
import edms.wsdl.GetFolderRequest;
import edms.wsdl.GetFolderResponse;
import edms.wsdl.GetRecycledDocsRequest;
import edms.wsdl.GetRecycledDocsResponse;
import edms.wsdl.GetSharedFoldersByPathRequest;
import edms.wsdl.GetSharedFoldersByPathResponse;
import edms.wsdl.GetSharedFoldersRequest;
import edms.wsdl.GetSharedFoldersResponse;
import edms.wsdl.HasChildRequest;
import edms.wsdl.HasChildResponse;
import edms.wsdl.RecycleFolderRequest;
import edms.wsdl.RecycleFolderResponse;
import edms.wsdl.RenameFolderRequest;
import edms.wsdl.RenameFolderResponse;
import edms.wsdl.RestoreFolderRequest;
import edms.wsdl.RestoreFolderResponse;
import edms.wsdl.RestoreVersionRequest;
import edms.wsdl.RestoreVersionResponse;
import edms.wsdl.ShareFolderByPathRequest;
import edms.wsdl.ShareFolderByPathResponse;

public class FolderClient extends WebServiceGatewaySupport {

	public GetFolderResponse getFolderRequest(String path, String userid) {
		GetFolderRequest request = new GetFolderRequest();
		request.setFolderPath(path);
		request.setUserid(userid);
		GetFolderResponse response = (GetFolderResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/GetFolderRequest"));

		return response;
	}

	public GetSharedFoldersResponse getSharedFoldersRequest(String userid) {
		GetSharedFoldersRequest request = new GetSharedFoldersRequest();
		request.setUserid(userid);
		GetSharedFoldersResponse response = (GetSharedFoldersResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/GetSharedFoldersRequest"));

		return response;
	}

	public GetSharedFoldersByPathResponse getSharedFoldersByPathRequest(
			String userid, String path) {
		GetSharedFoldersByPathRequest request = new GetSharedFoldersByPathRequest();
		request.setUserid(userid);
		request.setPath(path);
		GetSharedFoldersByPathResponse response = (GetSharedFoldersByPathResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/GetSharedFoldersByPathRequest"));

		return response;
	}

	public void printResponse(GetFolderResponse response) {
		FolderListReturn country = response.getGetFoldersByParentFolder();

		System.out.println();
		System.out.println("Forecast for " + ", "
				+ country.getFolderListResult().getFolderList().size());

		/*
		 * SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		 * System.out
		 * .print(format.format(forecast.getDate().toGregorianCalendar(
		 * ).getTime())); System.out.print(" ");
		 * System.out.print(forecast.getDesciption()); System.out.print(" ");
		 * Temp temperature = forecast.getTemperatures();
		 * System.out.print(temperature.getMorningLow() + "\u00b0-" +
		 * temperature.getDaytimeHigh() + "\u00b0 "); System.out.println(); } }
		 * else { System.out.println("No forecast received"); }
		 */
	}

	public HasChildResponse hasChild(String path, String userid) {
		HasChildRequest request = new HasChildRequest();
		request.setFolderPath(path);
		request.setUserid(userid);
		HasChildResponse response = (HasChildResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/HasChildRequest"));
		return response;
	}

	public CreateFolderResponse createFolder(String folderName,
			String parentFolder, String userid, String keywords, String notes) {
		CreateFolderRequest request = new CreateFolderRequest();
		request.setFolderName(folderName);
		request.setParentFolder(parentFolder);
		request.setUserid(userid);
		request.setKeywords(keywords);
		request.setNotes(notes);
		CreateFolderResponse response = (CreateFolderResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/CreateFolderRequest"));
		return response;
	}

	public GetFolderByPathResponse getFolderByPath(String folderPath,
			String userid) {
		GetFolderByPathRequest request = new GetFolderByPathRequest();
		request.setFolderPath(folderPath);
		request.setUserid(userid);

		GetFolderByPathResponse response = (GetFolderByPathResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/GetFolderByPathRequest"));

		return response;
	}

	public ShareFolderByPathResponse shareFolderByPath(String folderPath,
			String userid, String users, String groups, String userpermissions,
			String grouppermissions) {
		ShareFolderByPathRequest request = new ShareFolderByPathRequest();
		request.setFolderPath(folderPath);
		request.setUserid(userid);
		request.setUsers(users);
		request.setGroups(groups);
		request.setUserpermissions(userpermissions);
		request.setGrouppermissions(grouppermissions);

		ShareFolderByPathResponse response = (ShareFolderByPathResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/ShareFolderByPathRequest"));

		return response;
	}

	public AssignSinglePermissionResponse assignSinglePermission(
			String folderName, String userid, String user, String value) {
		AssignSinglePermissionRequest request = new AssignSinglePermissionRequest();
		request.setFolderPath(folderName);
		request.setUser(user);
		request.setValue(value);
		request.setUserid(userid);

		AssignSinglePermissionResponse response = (AssignSinglePermissionResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/AssignSinglePermissionRequest"));

		return response;
	}

	public DeleteFolderResponse deleteFolder(String folderName, String userid) {
		DeleteFolderRequest request = new DeleteFolderRequest();
		request.setUserid(userid);
		request.setFolderPath(folderName);
		DeleteFolderResponse deleteResponse = (DeleteFolderResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/deleteFolderRequest"));
		return deleteResponse;
	}

	public RecycleFolderResponse recycleFolder(String folderName, String userid) {
		RecycleFolderRequest request = new RecycleFolderRequest();
		request.setUserid(userid);
		request.setFolderPath(folderName);
		RecycleFolderResponse deleteResponse = (RecycleFolderResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/recycleFolderRequest"));
		return deleteResponse;
	}

	public RestoreFolderResponse restoreFolder(String folderName, String userid) {
		RestoreFolderRequest request = new RestoreFolderRequest();
		request.setUserid(userid);
		request.setFolderPath(folderName);
		RestoreFolderResponse deleteResponse = (RestoreFolderResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/restoreFolderRequest"));
		return deleteResponse;
	}

	public GetRecycledDocsResponse getRecycledDoc(String userid,
			String folderName) {
		GetRecycledDocsRequest request = new GetRecycledDocsRequest();
		request.setUserid(userid);
		request.setPath(folderName);
		GetRecycledDocsResponse deleteResponse = (GetRecycledDocsResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/getRecycledDocsRequest"));
		return deleteResponse;
	}

	public RenameFolderResponse renameFolder(String oldFolderName,
			String newFolderName, String userid) {
		RenameFolderRequest request = new RenameFolderRequest();
		request.setOldName(oldFolderName);
		request.setNewName(newFolderName);
		request.setUserid(userid);
		RenameFolderResponse renameResponse = (RenameFolderResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/renameFolderRequest"));
		return renameResponse;
	}

	public RestoreVersionResponse restoreVersion(String folderPath,
			String versionName, String userid) {
		RestoreVersionRequest restoreRequest = new RestoreVersionRequest();
		restoreRequest.setFolderPath(folderPath);
		restoreRequest.setUserid(userid);
		restoreRequest.setVersionName(versionName);
		RestoreVersionResponse restoreResponse = (RestoreVersionResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						restoreRequest,
						new SoapActionCallback(
								"http://localhost:8080/ws/restoreVersionRequest"));
		return restoreResponse;
	}

}
