package edms.webservice.client;

import java.text.SimpleDateFormat;

import org.springframework.ws.client.core.support.WebServiceGatewaySupport;
import org.springframework.ws.soap.client.core.SoapActionCallback;

import scala.annotation.meta.setter;
import edms.wsdl.AssignSinglePermissionRequest;
import edms.wsdl.AssignSinglePermissionResponse;
import edms.wsdl.CreateFileRequest;
import edms.wsdl.CreateFileResponse;
import edms.wsdl.DeleteFileRequest;
import edms.wsdl.DeleteFileResponse;
import edms.wsdl.FileListReturn;
import edms.wsdl.GetFileByPathRequest;
import edms.wsdl.GetFileByPathResponse;
import edms.wsdl.GetFileRequest;
import edms.wsdl.GetFileResponse;
import edms.wsdl.GetRecycledDocsRequest;
import edms.wsdl.GetRecycledDocsResponse;
import edms.wsdl.GetSharedFilesByPathRequest;
import edms.wsdl.GetSharedFilesByPathResponse;
import edms.wsdl.GetSharedFilesRequest;
import edms.wsdl.GetSharedFilesResponse;
import edms.wsdl.HasChildRequest;
import edms.wsdl.HasChildResponse;
import edms.wsdl.RecycleFileRequest;
import edms.wsdl.RecycleFileResponse;
import edms.wsdl.RenameFileRequest;
import edms.wsdl.RenameFileResponse;
import edms.wsdl.RestoreFileRequest;
import edms.wsdl.RestoreFileResponse;
import edms.wsdl.RestoreVersionRequest;
import edms.wsdl.RestoreVersionResponse;
import edms.wsdl.ShareFileByPathRequest;
import edms.wsdl.ShareFileByPathResponse;

public class FileClient extends WebServiceGatewaySupport {

	public GetFileResponse getFileRequest(String path, String userid) {
		GetFileRequest request = new GetFileRequest();
		request.setFilePath(path);
		request.setUserid(userid);
		GetFileResponse response = (GetFileResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/GetFileRequest"));

		return response;
	}

	public GetSharedFilesResponse getSharedFilesRequest(String userid) {
		GetSharedFilesRequest request = new GetSharedFilesRequest();
		request.setUserid(userid);
		GetSharedFilesResponse response = (GetSharedFilesResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/GetSharedFilesRequest"));

		return response;
	}

	public GetSharedFilesByPathResponse getSharedFilesByPathRequest(
			String userid, String path) {
		GetSharedFilesByPathRequest request = new GetSharedFilesByPathRequest();
		request.setUserid(userid);
		request.setPath(path);
		GetSharedFilesByPathResponse response = (GetSharedFilesByPathResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/GetSharedFilesByPathRequest"));

		return response;
	}

	public void printResponse(GetFileResponse response) {
		FileListReturn country = response.getGetFilesByParentFile();

		System.out.println();
		System.out.println("Forecast for " + ", "
				+ country.getFileListResult().getFileList().size());

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

	

	public CreateFileResponse createFile(String fileName,
			String parentFile, String userid, String keywords, String notes,String fileContent) {
		CreateFileRequest request = new CreateFileRequest();
		request.setFileName(fileName);
		request.setParentFile(parentFile);
		request.setUserid(userid);
		request.setKeywords(keywords);
		request.setNotes(notes);
		request.setFileContent(fileContent);
		System.out.println(fileName + " " + parentFile + " " + userid);
		CreateFileResponse response = (CreateFileResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/CreateFileRequest"));
		return response;
	}

	public GetFileByPathResponse getFileByPath(String filePath,
			String userid) {
		GetFileByPathRequest request = new GetFileByPathRequest();
		request.setFilePath(filePath);
		request.setUserid(userid);

		GetFileByPathResponse response = (GetFileByPathResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/GetFileByPathRequest"));

		return response;
	}

	public ShareFileByPathResponse shareFileByPath(String filePath,
			String userid, String users, String groups, String userpermissions,
			String grouppermissions) {
		ShareFileByPathRequest request = new ShareFileByPathRequest();
		request.setFilePath(filePath);
		request.setUserid(userid);
		request.setUsers(users);
		request.setGroups(groups);
		request.setUserpermissions(userpermissions);
		request.setGrouppermissions(grouppermissions);

		ShareFileByPathResponse response = (ShareFileByPathResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/ShareFileByPathRequest"));

		return response;
	}

	

	public DeleteFileResponse deleteFile(String fileName, String userid) {
		DeleteFileRequest request = new DeleteFileRequest();
		request.setUserid(userid);
		request.setFilePath(fileName);
		DeleteFileResponse deleteResponse = (DeleteFileResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/deleteFileRequest"));
		return deleteResponse;
	}

	public RecycleFileResponse recycleFile(String fileName, String userid) {
		RecycleFileRequest request = new RecycleFileRequest();
		request.setUserid(userid);
		request.setFilePath(fileName);
		RecycleFileResponse deleteResponse = (RecycleFileResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/recycleFileRequest"));
		return deleteResponse;
	}

	public RestoreFileResponse restoreFile(String fileName, String userid) {
		RestoreFileRequest request = new RestoreFileRequest();
		request.setUserid(userid);
		request.setFilePath(fileName);
		RestoreFileResponse deleteResponse = (RestoreFileResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/restoreFileRequest"));
		return deleteResponse;
	}

	public GetRecycledDocsResponse getRecycledDoc(String userid,
			String fileName) {
		GetRecycledDocsRequest request = new GetRecycledDocsRequest();
		request.setUserid(userid);
		request.setPath(fileName);
		GetRecycledDocsResponse deleteResponse = (GetRecycledDocsResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/getRecycledDocsRequest"));
		return deleteResponse;
	}

	public RenameFileResponse renameFile(String oldFileName,
			String newFileName, String userid) {
		RenameFileRequest request = new RenameFileRequest();
		request.setOldName(oldFileName);
		request.setNewName(newFileName);
		request.setUserid(userid);
		RenameFileResponse renameResponse = (RenameFileResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/renameFileRequest"));
		return renameResponse;
	}

	

}
