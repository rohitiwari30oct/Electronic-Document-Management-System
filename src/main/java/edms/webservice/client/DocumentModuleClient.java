package edms.webservice.client;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;

import org.apache.commons.io.IOUtils;
import org.mockito.internal.creation.jmock.SearchingClassLoader;
import org.springframework.ws.client.core.support.WebServiceGatewaySupport;
import org.springframework.ws.soap.client.core.SoapActionCallback;

import edms.wsdl.AddKeywordRequest;
import edms.wsdl.AddKeywordResponse;
import edms.wsdl.AddNotesRequest;
import edms.wsdl.AddNotesResponse;
import edms.wsdl.AssignSinglePermissionRequest;
import edms.wsdl.AssignSinglePermissionResponse;
import edms.wsdl.CopyDocRequest;
import edms.wsdl.CopyDocResponse;
import edms.wsdl.CreateFileRequest;
import edms.wsdl.CreateFileResponse;
import edms.wsdl.CreateFolderRequest;
import edms.wsdl.CreateFolderResponse;
import edms.wsdl.DeleteFileRequest;
import edms.wsdl.DeleteFileResponse;
import edms.wsdl.DeleteFolderRequest;
import edms.wsdl.DeleteFolderResponse;
import edms.wsdl.EditKeywordRequest;
import edms.wsdl.EditKeywordResponse;
import edms.wsdl.FileListReturn;
import edms.wsdl.FolderListReturn;
import edms.wsdl.GetFileByPathRequest;
import edms.wsdl.GetFileByPathResponse;
import edms.wsdl.GetFileByPathWithOutStreamRequest;
import edms.wsdl.GetFileByPathWithOutStreamResponse;
import edms.wsdl.GetFileRequest;
import edms.wsdl.GetFileResponse;
import edms.wsdl.GetFileWithOutStreamRequest;
import edms.wsdl.GetFileWithOutStreamResponse;
import edms.wsdl.GetFolderByPathRequest;
import edms.wsdl.GetFolderByPathResponse;
import edms.wsdl.GetFolderRequest;
import edms.wsdl.GetFolderResponse;
import edms.wsdl.GetRecycledDocsRequest;
import edms.wsdl.GetRecycledDocsResponse;
import edms.wsdl.GetSharedFilesByPathRequest;
import edms.wsdl.GetSharedFilesByPathResponse;
import edms.wsdl.GetSharedFilesByPathWithOutStreamRequest;
import edms.wsdl.GetSharedFilesByPathWithOutStreamResponse;
import edms.wsdl.GetSharedFilesRequest;
import edms.wsdl.GetSharedFilesResponse;
import edms.wsdl.GetSharedFilesWithOutStreamRequest;
import edms.wsdl.GetSharedFilesWithOutStreamResponse;
import edms.wsdl.GetSharedFoldersByPathRequest;
import edms.wsdl.GetSharedFoldersByPathResponse;
import edms.wsdl.GetSharedFoldersRequest;
import edms.wsdl.GetSharedFoldersResponse;
import edms.wsdl.HasChildRequest;
import edms.wsdl.HasChildResponse;
import edms.wsdl.MoveDocRequest;
import edms.wsdl.MoveDocResponse;
import edms.wsdl.RecentlyModifiedRequest;
import edms.wsdl.RecentlyModifiedResponse;
import edms.wsdl.RecycleFileRequest;
import edms.wsdl.RecycleFileResponse;
import edms.wsdl.RecycleFolderRequest;
import edms.wsdl.RecycleFolderResponse;
import edms.wsdl.RemoveKeywordRequest;
import edms.wsdl.RemoveKeywordResponse;
import edms.wsdl.RenameFileRequest;
import edms.wsdl.RenameFileResponse;
import edms.wsdl.RenameFolderRequest;
import edms.wsdl.RenameFolderResponse;
import edms.wsdl.RestoreFileRequest;
import edms.wsdl.RestoreFileResponse;
import edms.wsdl.RestoreFolderRequest;
import edms.wsdl.RestoreFolderResponse;
import edms.wsdl.RestoreVersionRequest;
import edms.wsdl.RestoreVersionResponse;
import edms.wsdl.SearchDocByDateRequest;
import edms.wsdl.SearchDocByDateResponse;
import edms.wsdl.SearchDocByLikeRequest;
import edms.wsdl.SearchDocByLikeResponse;
import edms.wsdl.ShareFileByPathRequest;
import edms.wsdl.ShareFileByPathResponse;
import edms.wsdl.ShareFolderByPathRequest;
import edms.wsdl.ShareFolderByPathResponse;

public class DocumentModuleClient extends WebServiceGatewaySupport {

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

	// onfile processing
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

	// onfile processing
	public GetFileWithOutStreamResponse getFileWithOutStreamRequest(String path, String userid) {
		GetFileWithOutStreamRequest request = new GetFileWithOutStreamRequest();
		request.setFilePath(path);
		request.setUserid(userid);
		GetFileWithOutStreamResponse response = (GetFileWithOutStreamResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/GetFileWithOutStreamRequest"));

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
	public GetSharedFilesWithOutStreamResponse getSharedFilesWithOutStreamRequest(String userid) {
		GetSharedFilesWithOutStreamRequest request = new GetSharedFilesWithOutStreamRequest();
		request.setUserid(userid);
		GetSharedFilesWithOutStreamResponse response = (GetSharedFilesWithOutStreamResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/GetSharedFilesWithOutStreamRequest"));

		return response;
	}
	
	public GetSharedFilesByPathWithOutStreamResponse getSharedFilesByPathWithOutStreamRequest(
			String userid, String path) {
		GetSharedFilesByPathWithOutStreamRequest request = new GetSharedFilesByPathWithOutStreamRequest();
		request.setUserid(userid);
		request.setPath(path);
		GetSharedFilesByPathWithOutStreamResponse response = (GetSharedFilesByPathWithOutStreamResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/GetSharedFilesByPathWithOutStreamRequest"));

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

	

	public GetFileByPathResponse getFileByPath(String filePath, String userid) {
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
	public GetFileByPathWithOutStreamResponse getFileByPathWithOutStream(String filePath, String userid) {
		GetFileByPathWithOutStreamRequest request = new GetFileByPathWithOutStreamRequest();
		request.setFilePath(filePath);
		request.setUserid(userid);

		GetFileByPathWithOutStreamResponse response = (GetFileByPathWithOutStreamResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/GetFileByPathWithOutStreamRequest"));

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

	/*
	 * public GetRecycledDocsResponse getRecycledDoc(String userid, String
	 * fileName) { GetRecycledDocsRequest request = new
	 * GetRecycledDocsRequest(); request.setUserid(userid);
	 * request.setPath(fileName); GetRecycledDocsResponse deleteResponse =
	 * (GetRecycledDocsResponse) getWebServiceTemplate() .marshalSendAndReceive(
	 * request, new SoapActionCallback(
	 * "http://localhost:8080/ws/getRecycledDocsRequest")); return
	 * deleteResponse; }
	 */

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

	public RecentlyModifiedResponse getRecentlyModified(String path,
			String userid) {
		RecentlyModifiedRequest req = new RecentlyModifiedRequest();
		req.setFolderPath(path);
		req.setUserid(userid);
		RecentlyModifiedResponse response = (RecentlyModifiedResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						req,
						new SoapActionCallback(
								"http://localhost:8080/ws/recentlyModifiedRequest"));
		return response;
	}

	public SearchDocByLikeResponse searchDocByLike(String searchParamValue,
			String folderPath, String searchParam,String userid) {
		SearchDocByLikeRequest request=new SearchDocByLikeRequest();
		request.setSearchParamValue(searchParamValue);
		request.setFolderPath(folderPath);
		request.setSearchParam(searchParam);
		request.setUserid(userid);
		SearchDocByLikeResponse response=(SearchDocByLikeResponse)getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/searchDocByLikeRequest"));
		
		return response;
	}

	public SearchDocByDateResponse searchDocByDate(String searchParamValue,
			String folderPath, String searchParam, String userid) {
		SearchDocByDateRequest request=new SearchDocByDateRequest();
		request.setSearchParamValue(searchParamValue);
		request.setFolderPath(folderPath);
		request.setSearchParam(searchParam);
		request.setUserid(userid);
		SearchDocByDateResponse response=(SearchDocByDateResponse)getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/searchDocByDateRequest"));
		return response;
	}


	public CreateFileResponse createFile(String filename, String parentFolder,
			String userid, String keywords, String notes, byte[] fileContent,long filesize) {

		CreateFileRequest request = new CreateFileRequest();
		request.setFileName(filename);
		request.setParentFile(parentFolder);
		request.setUserid(userid);
		request.setKeywords(keywords);
		request.setFileSize(filesize);
//		String fileContent=IOUtils.toString(is);
		//System.out.println(fileContent);
		request.setNotes(notes);
		request.setFileContent(fileContent);
		CreateFileResponse response = (CreateFileResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/CreateFileRequest"));
		return response;
	
	}

	public AddKeywordResponse addKeyword(String parentFolder, String userid,
			String keyword) {
		AddKeywordRequest request=new AddKeywordRequest();
		request.setFolderPath(parentFolder);
		request.setKeyword(keyword);
		request.setUserid(userid);
		AddKeywordResponse response = (AddKeywordResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/addKeywordRequest"));
		return response;
	}
	public RemoveKeywordResponse removeKeyword(String parentFolder, String userid,
			String keyword) {
		RemoveKeywordRequest request=new RemoveKeywordRequest();
		request.setFolderPath(parentFolder);
		request.setKeyword(keyword);
		request.setUserid(userid);
		RemoveKeywordResponse response = (RemoveKeywordResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/removeKeywordRequest"));
		return response;
	}
	public EditKeywordResponse editKeyword(String parentFolder, String userid,
			String keyword,String editedKeyword) {
		EditKeywordRequest request=new EditKeywordRequest();
		request.setFolderPath(parentFolder);
		request.setKeyword(keyword);
		request.setUserid(userid);
		request.setEditedKeyword(editedKeyword);
		EditKeywordResponse response = (EditKeywordResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/editKeywordRequest"));
		return response;
	}

	public MoveDocResponse moveDoc(String sourcePath, String destPath,
			String userid) {
		MoveDocRequest request=new MoveDocRequest();
		request.setSrcDocPath(sourcePath);
		request.setDestDocPath(destPath);
		request.setUserid(userid);
		MoveDocResponse response = (MoveDocResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/moveDocRequest"));
		return response;
	}

	public CopyDocResponse copyDoc(String sourcePath, String destPath,
			String userid) {
		CopyDocRequest request=new CopyDocRequest();
		request.setSrcDocPath(sourcePath);
		request.setDestDocPath(destPath);
		request.setUserid(userid);
		System.out.println(destPath);
		CopyDocResponse response = (CopyDocResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/copyDocRequest"));
		return response;
	}

	public AddNotesResponse addNotes(String folderName, String userid,
			String note) {
		AddNotesRequest request=new AddNotesRequest();
		request.setFolderPath(folderName);
		request.setNote(note);
		request.setUserid(userid);
		AddNotesResponse response = (AddNotesResponse) getWebServiceTemplate()
				.marshalSendAndReceive(
						request,
						new SoapActionCallback(
								"http://localhost:8080/ws/addNotesRequest"));
		return response;
	}

	

}
