package edms.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.Iterator;
import java.util.List;

import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.directory.Attributes;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ldap.core.DirContextOperations;
import org.springframework.ldap.core.LdapTemplate;
import org.springframework.ldap.core.support.AbstractContextMapper;
import org.springframework.ldap.core.support.LdapContextSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import static org.springframework.ldap.query.LdapQueryBuilder.query;
import edms.core.Config;
import edms.core.MailUtils;
import edms.webservice.client.DocumentModuleClient;
import edms.wsdl.AddKeywordResponse;
import edms.wsdl.AddNotesResponse;
import edms.wsdl.AssignSinglePermissionResponse;
import edms.wsdl.CopyDocResponse;
import edms.wsdl.CreateFolderResponse;
import edms.wsdl.DeleteFolderResponse;
import edms.wsdl.EditKeywordResponse;
import edms.wsdl.Folder;
import edms.wsdl.GetFileResponse;
import edms.wsdl.GetFileWithOutStreamResponse;
import edms.wsdl.GetFolderByPathResponse;
import edms.wsdl.GetFolderResponse;
import edms.wsdl.GetSharedFilesByPathResponse;
import edms.wsdl.GetSharedFilesByPathWithOutStreamResponse;
import edms.wsdl.GetSharedFilesResponse;
import edms.wsdl.GetSharedFilesWithOutStreamResponse;
import edms.wsdl.GetSharedFoldersByPathResponse;
import edms.wsdl.GetSharedFoldersResponse;
import edms.wsdl.MoveDocResponse;
import edms.wsdl.RecycleFolderResponse;
import edms.wsdl.RemoveKeywordResponse;
import edms.wsdl.RenameFolderRes;
import edms.wsdl.RenameFolderResponse;
import edms.wsdl.RestoreFolderResponse;
import edms.wsdl.RestoreVersionResponse;
import edms.wsdl.ShareFolderByPathResponse;

@Controller
public class FolderController {

	/*@Autowired
	private LdapTemplate ldapTemplate;
*/
	@Autowired
	private DocumentModuleClient documentModuleClient;

	@RequestMapping(value = "/shared", method = RequestMethod.GET)
	public String getShared(ModelMap map, Principal principal,
			HttpServletRequest request) {

		if(principal!=null){
		String path="";
		if(principal.getName().contains("@")){
			path = "/"+principal.getName();	
		}else{
		path = "/"+principal.getName()+Config.EDMS_DOMAIN;
		}
		String calcPath = path;
		String userid="";
		if(principal.getName().contains("@")){
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		HttpSession hs = request.getSession(false);
		hs.setAttribute("currentFolder", calcPath);
		hs.setAttribute("currentDoc", calcPath);

	//	hs.setAttribute("currentFile", "");
		GetSharedFoldersResponse folderResponse = documentModuleClient
				.getSharedFoldersRequest(userid);
		GetFolderByPathResponse folderByPath = documentModuleClient
				.getFolderByPath(calcPath, userid);
		Folder folderNode = folderByPath.getFolder();

		if(folderResponse.getGetSharedFolders().getFolderListResult()!=null){
		List<Folder> folderList = folderResponse.getGetSharedFolders()
				.getFolderListResult().getFolderList();
		map.addAttribute("folderList", folderList);}
		GetSharedFilesWithOutStreamResponse fileResponse = documentModuleClient
				.getSharedFilesWithOutStreamRequest(userid);
		if(fileResponse.getGetSharedFiles().getFileListResult()!=null){
		List<edms.wsdl.File> fileList = fileResponse.getGetSharedFiles().getFileListResult().getFileList();
		map.addAttribute("fileList", fileList);}
		map.addAttribute("currentFolder", folderNode);
		map.addAttribute("breadcum", calcPath);
		map.addAttribute("userid", userid);
		return "fileSystem";
		}else{
			return "ajaxTrue";
		}
	}

	@RequestMapping(value = "/getSharedFileSystem", method = RequestMethod.GET)
	public String getSharedFileSystem(ModelMap map, Principal principal,
			@RequestParam String path, HttpServletRequest request) {

		if(principal!=null){
		HttpSession hs = request.getSession(false);
		if (hs != null) {
			System.out.println((String) hs.getAttribute("currentFolder"));
		}
		String[] str = path.split("/");
		String calcPath = "";
		for (int i = 1; i < str.length; i++) {
			calcPath += "/" + str[i];
		}
		hs.setAttribute("currentFolder", calcPath);
		hs.setAttribute("currentDoc", calcPath);
		String userid="";
		if(principal.getName().contains("@")){
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
	//	hs.setAttribute("currentFile", "");
		GetSharedFoldersByPathResponse folderResponse = documentModuleClient
				.getSharedFoldersByPathRequest(userid, path);
		GetSharedFilesByPathWithOutStreamResponse fileResponse = documentModuleClient
				.getSharedFilesByPathWithOutStreamRequest(userid, path);
		GetFolderByPathResponse folderByPath = documentModuleClient
				.getFolderByPath(path, userid);
		Folder folderNode = folderByPath.getFolder();
		if(folderResponse.getGetSharedFoldersByPath().getFolderListResult()!=null){
			List<Folder> folderList = folderResponse.getGetSharedFoldersByPath()
					.getFolderListResult().getFolderList();
			map.addAttribute("folderList", folderList);}
		if(fileResponse.getGetSharedFilesByPath().getFileListResult()!=null){
			List<edms.wsdl.File> fileList = fileResponse.getGetSharedFilesByPath()
					.getFileListResult().getFileList();
			map.addAttribute("fileList", fileList);}
			map.addAttribute("currentFolder", folderNode);
			map.addAttribute("breadcum", calcPath);
			map.addAttribute("userid", userid);
		return "shared";
		}else{
			return "ajaxTrue";
		}
	}

	@RequestMapping(value = "/myDocument", method = RequestMethod.GET)
	public String getActivitiLeft(ModelMap map, Principal principal,
			HttpServletRequest request) {

		if(principal!=null){
		String path="";
		if(principal.getName().contains("@")){
			path = "/"+principal.getName();	
		}else{
		path = "/"+principal.getName()+Config.EDMS_DOMAIN;
		}
		String calcPath = path;
		String userid="";
		if(principal.getName().contains("@")){
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		GetFolderResponse folderResponse = documentModuleClient
				.getFolderRequest(calcPath, userid);
		GetFolderByPathResponse folderByPath = documentModuleClient
				.getFolderByPath(calcPath, userid);
		Folder folderNode = folderByPath.getFolder();
		List<Folder> folderList = folderResponse.getGetFoldersByParentFolder()
				.getFolderListResult().getFolderList();
		GetFileWithOutStreamResponse fileResponse = documentModuleClient.getFileWithOutStreamRequest(
				calcPath, userid);
		List<edms.wsdl.File> fileList = fileResponse.getGetFilesByParentFile()
				.getFileListResult().getFileList();

		map.addAttribute("fileList", fileList);
		map.addAttribute("currentFolder", folderNode);
		map.addAttribute("breadcum", calcPath);
		map.addAttribute("folderList", folderList);
		map.addAttribute("userid", userid);
		return "myDocument";
		}else{
			return "ajaxTrue";
		}
	}

	@RequestMapping(value = "/fileSystem", method = RequestMethod.GET)
	public String listFolder(ModelMap map, Principal principal,
			HttpServletRequest request,HttpServletResponse response) {
		if(principal!=null){
		String path="";
		if(principal.getName().contains("@")){
			path = "/"+principal.getName();	
		}else{
		path = "/"+principal.getName()+Config.EDMS_DOMAIN;
		}
		HttpSession hs = request.getSession(false);
		if (hs != null) {
			hs.setAttribute("currentFolder",path);
			hs.setAttribute("currentDoc", path);
		//	hs.setAttribute("currentFile", "");
		}
		String userid="";
		if(principal.getName().contains("@")){
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		GetFolderResponse folderResponse = documentModuleClient
				.getFolderRequest(path, userid);
		GetFolderByPathResponse folderByPath = documentModuleClient
				.getFolderByPath(path, userid);
		Folder folderNode = folderByPath.getFolder();
		List<Folder> folderList = folderResponse.getGetFoldersByParentFolder()
				.getFolderListResult().getFolderList();
		System.out.println("length of folderlist "+folderList.size());
		GetFileWithOutStreamResponse fileResponse = documentModuleClient.getFileWithOutStreamRequest(
				path, userid);
		List<edms.wsdl.File> fileList = fileResponse.getGetFilesByParentFile()
				.getFileListResult().getFileList();

		map.addAttribute("folderList", folderList);
		map.addAttribute("currentFolder", folderNode);
		map.addAttribute("breadcum", path);
		map.addAttribute("fileList", fileList);
		map.addAttribute("userid", userid);
		return "fileSystem";
		}else{
			return "ajaxTrue";
		}
	}

	@RequestMapping(value = "/getDocProperties", method = RequestMethod.GET)
	public String getDocProperties(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String path) {

		if(principal!=null){
		// listLdapUsersDetails(principal.getName()+Config.EDMS_DOMAIN);
		HttpSession hs = request.getSession(false);
		if (hs != null) {
			System.out.println((String) hs.getAttribute("currentFolder"));
		}
		String[] str = path.split("/");
		String calcPath = "";
		for (int i = 1; i < str.length; i++) {
			calcPath += "/" + str[i];
		}
		String userid="";
		if(principal.getName().contains("@")){
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		hs.setAttribute("currentFolder", calcPath);
	//	hs.setAttribute("currentFile", "");
		GetFolderResponse folderResponse = documentModuleClient
				.getFolderRequest(calcPath, userid);
		GetFolderByPathResponse folderByPath = documentModuleClient
				.getFolderByPath(calcPath, userid);
		Folder folderNode = folderByPath.getFolder();
		List<Folder> folderList = folderResponse.getGetFoldersByParentFolder()
				.getFolderListResult().getFolderList();
		GetFileWithOutStreamResponse fileResponse = documentModuleClient.getFileWithOutStreamRequest(
				calcPath, userid);
		List<edms.wsdl.File> fileList = fileResponse.getGetFilesByParentFile()
				.getFileListResult().getFileList();

		map.addAttribute("fileList", fileList);
		map.addAttribute("currentFolder", folderNode);
		map.addAttribute("breadcum", calcPath);
		map.addAttribute("folderList", folderList);
		map.addAttribute("userid", userid);
		return "getDocProperties";
		}else{
			return "ajaxTrue";
		}
	}

	@RequestMapping(value = "/setCurrentFolder", method = RequestMethod.POST)
	@ResponseBody
	public String setCurrentFolder(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String path) {
		if(principal!=null){
		HttpSession hs = request.getSession(false);
		hs.setAttribute("currentFolder", path);
		hs.setAttribute("currentDoc", path);
	//	hs.setAttribute("currentFile", "");
		return "";}else{
			return "true";
		}
	}


	@RequestMapping(value = "/getFileSystem", method = RequestMethod.POST)
	public String listFolder(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String path) {
		if(principal!=null){
		// listLdapUsersDetails(principal.getName()+Config.EDMS_DOMAIN);
		HttpSession hs = request.getSession(false);
		if (hs != null) {
			System.out.println((String) hs.getAttribute("currentFolder"));
		}
		String[] str = path.split("/");
		String calcPath = "";
		for (int i = 1; i < str.length; i++) {
			calcPath += "/" + str[i];
		}
		String userid="";
		if(principal.getName().contains("@")){
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		hs.setAttribute("currentFolder", calcPath);
		hs.setAttribute("currentDoc", calcPath);
	//	hs.setAttribute("currentFile", "");
		GetFolderResponse folderResponse = documentModuleClient
				.getFolderRequest(calcPath, userid);
		GetFolderByPathResponse folderByPath = documentModuleClient
				.getFolderByPath(calcPath, userid);
		Folder folderNode = folderByPath.getFolder();
		boolean success = folderResponse.getGetFoldersByParentFolder()
				.isSuccess();
		System.out.println("response of list folder "+ success);
		if (success) {
			List<Folder> folderList = folderResponse
					.getGetFoldersByParentFolder().getFolderListResult()
					.getFolderList();
			System.out.println("size of folder List "+folderList.size());
			map.addAttribute("currentFolder", folderNode);

			GetFileWithOutStreamResponse fileResponse = documentModuleClient.getFileWithOutStreamRequest(
					calcPath, userid);
			List<edms.wsdl.File> fileList = fileResponse
					.getGetFilesByParentFile().getFileListResult()
					.getFileList();

			map.addAttribute("fileList", fileList);
			map.addAttribute("breadcum", calcPath);
			map.addAttribute("folderList", folderList);
			map.addAttribute("userid", userid);
		}
		return "fileSystem";
		}else{
			return "ajaxTrue";
		}
	}

/*	private void listLdapUsersDetails(String userid) {
		// TODO Auto-generated method stub
		List<String> result = ldapTemplate.search(
				query().where("mail").is(userid), new AbstractContextMapper() {
					protected String doMapFromContext(DirContextOperations ctx) {
						Attributes attributes = ctx.getAttributes();
						NamingEnumeration results = attributes.getAll();
						int i = 0;
						try {
							while (results.hasMore()) {

								System.out.println(results.next());
							}
						} catch (NamingException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}

						System.out.println(attributes);

						return ctx.getStringAttribute("sn");
					}
				});

		if (result.size() != 1) {
			throw new RuntimeException("User not found or not unique");
		}

		// System.out.println("folder service object : "+folderService);
		System.out.println(result.get(0) + " size = " + result.size());
	}
*/
	@RequestMapping(value = "/getSubFolders", method = RequestMethod.GET)
	public String getSubFolders(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String path) {
		if(principal!=null){
		path = path.substring(6);
		path = path.replaceFirst("_avi", "@avi");
		path = path.replaceFirst("_com", ".com");
		path = path.replaceFirst("_in", ".in");
		path = path.replaceAll("_spc_spc_", " ");
		path = path.replaceAll("_", "/");
		path = path.replaceAll("pahlesetha", "_");
		//System.out.println(path);
		String userid="";
		if(principal.getName().contains("@")){
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		GetFolderResponse folderResponse = documentModuleClient
				.getFolderRequest(path, userid);
		List<Folder> folderList = folderResponse.getGetFoldersByParentFolder()
				.getFolderListResult().getFolderList();
		GetFileWithOutStreamResponse fileResponse = documentModuleClient.getFileWithOutStreamRequest(
				path, userid);
		List<edms.wsdl.File> fileList = fileResponse.getGetFilesByParentFile()
				.getFileListResult().getFileList();
		map.addAttribute("fileList", fileList);
		map.addAttribute("folderClient", documentModuleClient);
		map.addAttribute("folderList", folderList);
		map.addAttribute("principal", principal);
		return "myDocument";
		}else{
			return "ajaxTrue";
		}
	}

	@RequestMapping("/createFolder")
	@ResponseBody
	public String createFolder(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String folderName) {
		if(principal!=null){
		HttpSession hs = request.getSession(false);
		String notes = "";
		String keywords = "";
		String parentFolder = (String) hs.getAttribute("currentFolder");
		String userid="";
		if(principal.getName().contains("@")){
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		CreateFolderResponse createFolderResponse = documentModuleClient
				.createFolder(folderName, parentFolder, userid, keywords, notes);
		Folder folder = createFolderResponse.getFolder();
		System.out.println(folder.getFolderPath());
		
		String newFolder = "";
		if (folder != null) {
			newFolder = "<li   class='select_box target' id='"
					+ folder.getFolderPath()
					+ "' onclick='getDocProperties(this.id)'   ondblclick='getFileSystem(this.id)' >"
					+ "<div class='folder_icon'></div>  <span>"
					+ folder.getFolderPath().substring(
							folder.getFolderPath().lastIndexOf('/') + 1)
					+ "</span>" + "</li>";
		} else {
			return "access denied";
		}
		return parentFolder;
		}else{
			return "true";
		}
	}
	@RequestMapping(value = "/addKeyword", method = RequestMethod.GET)
	@ResponseBody
	public String addKeyword(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String keyword) {

		if(principal!=null){
		HttpSession hs = request.getSession(false);
		String folderName = (String) hs.getAttribute("currentFolder");
		String userid="";
		if(principal.getName().contains("@")){
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		if(folderName!=""){
		}else{
			folderName=(String) hs.getAttribute("currentFile");
		}
		folderName=(String) hs.getAttribute("currentDoc");
		AddKeywordResponse addKeywordResponse = documentModuleClient
				.addKeyword(folderName,  userid, keyword);
		return "";
		}else{
			return "true";
		}
	}

	@RequestMapping(value = "/addNotes", method = RequestMethod.GET)
	@ResponseBody
	public String addNotes(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String note) {
		if(principal!=null){
		HttpSession hs = request.getSession(false);
		String folderName = (String) hs.getAttribute("currentFolder");
		String userid="";
		if(principal.getName().contains("@")){
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		if(folderName!=""){
		}else{
			folderName=(String) hs.getAttribute("currentFile");
		}
		folderName=(String) hs.getAttribute("currentDoc");
		AddNotesResponse addNotesResponse = documentModuleClient
				.addNotes(folderName,  userid, note);
		return "Saved Successfully";
		}else{
			return "true";
		}
	}

	@RequestMapping(value = "/removeKeyword", method = RequestMethod.GET)
	@ResponseBody
	public String removeKeyword(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String keyword) {
		if(principal!=null){
		HttpSession hs = request.getSession(false);
		String folderName = (String) hs.getAttribute("currentFolder");
		String userid="";
		if(principal.getName().contains("@")){
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		if(folderName!=""){
			
		}else{
			folderName=(String) hs.getAttribute("currentFile");
		}
		folderName=(String) hs.getAttribute("currentDoc");
		RemoveKeywordResponse removeKeywordResponse = documentModuleClient.removeKeyword(folderName,  userid, keyword);
		return "";
		}else{
			return "true";
		}
	}
	@RequestMapping(value = "/editKeyword", method = RequestMethod.GET)
	@ResponseBody
	public String removeKeyword(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String keyword, @RequestParam String editedKeyword) {
		if(principal!=null){
		HttpSession hs = request.getSession(false);
		String folderName = (String) hs.getAttribute("currentFolder");
		String userid="";
		if(principal.getName().contains("@")){
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		if(folderName!=""){
		}else{
			folderName=(String) hs.getAttribute("currentFile");
		}
		folderName=(String) hs.getAttribute("currentDoc");
		EditKeywordResponse editKeywordResponse = documentModuleClient
				.editKeyword(folderName,  userid, keyword,editedKeyword);
		return "";
		}else{
			return "true";
		}
	}

	@RequestMapping("/createSharedFolder")
	public String createSharedFolder(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String folderName) {
		if(principal!=null){
		HttpSession hs = request.getSession(false);
		String userid="";
		if(principal.getName().contains("@")){
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		String notes = "";
		String keywords = "";
		String parentFolder = (String) hs.getAttribute("currentFolder");
		CreateFolderResponse createFolderResponse = documentModuleClient
				.createFolder(folderName, parentFolder,  userid, keywords, notes);
		Folder folder = createFolderResponse.getFolder();
		String newFolder = "";
		if (folder != null) {
			newFolder = "<div class='shared_row_1'>"
					+ "<div ondblclick='getSharedFileSystem(this.id)'  "
					+ "style='cursor: pointer;/* width: 100%; */height: 32px;' "
					+ "id='" + folder.getFolderPath() + "' >"
					+ "<div class='shared_title_1' >"
					+ "<img src='images/folder.png'>" + "<span>"
					+ folder.getFolderName() + "</span>" + "</div>"
					+ "<div class='shared_date'>"
					+ "<div class='shared_person_name'>"
					+ "<img src='images/missing_avatar.png'>"
					+ folder.getCreatedBy() + "</div>" + "</div>"
					+ "<div class='claer'></div></div>" + "</div>";
		} else {
			return "access denied";
		}
		return newFolder;
		}else{
			return "ajaxTrue";
		}
	}

	/*@RequestMapping("/shareFolder")
	@ResponseBody
	public String shareFolder(ModelMap map, Principal principal,
			@RequestParam String users, @RequestParam String groups,
			@RequestParam String userpermissions,
			@RequestParam String grouppermissions, HttpServletRequest request) {
		String userid = principal.getName() + Config.EDMS_DOMAIN;
		HttpSession hs = request.getSession(false);
		String folderName = (String) hs.getAttribute("currentFolder");
		if(folderName!=""){
			
		}else{
			folderName=(String) hs.getAttribute("currentFile");
		}

		System.out.println("current folder or file value is : "+folderName);
		ShareFolderByPathResponse shareFolderByPathResponse = documentModuleClient
				.shareFolderByPath(folderName, userid, users, groups,
						userpermissions, grouppermissions);
		String resp = shareFolderByPathResponse.getShareResponse();

		return resp;
	}
*/
	@RequestMapping("/renameFolder")
	@ResponseBody
	public String renameFolder(ModelMap map, Principal principal,
			@RequestParam String oldFolderName,
			@RequestParam String newFolderName, HttpServletRequest request) {
		if(principal!=null){
		String userid="";
		if(principal.getName().contains("@")){
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		HttpSession hs = request.getSession(false);
		String folderName = (String) hs.getAttribute("currentFolder");
	/*	if(folderName!=""){
		}else{
			folderName=(String) hs.getAttribute("currentFile");
		}*/
		RenameFolderResponse renameResponse = documentModuleClient
				.renameFolder(oldFolderName, newFolderName, userid);
		RenameFolderRes resp = renameResponse.getRenameFolderRes();
		if (resp.isSuccess()) {
			if(oldFolderName.lastIndexOf("/")>0)
			return oldFolderName.substring(0, oldFolderName.lastIndexOf("/"));
			else
				return oldFolderName;
		} else {
			return "Access Denied";
		}
		}else{
			return "true";
		}
	}
	
	@RequestMapping("/restoreVersion")
	@ResponseBody
	public String restoreVersion(ModelMap map, Principal principal,
			@RequestParam String folderPath, @RequestParam String versionName,
			HttpServletRequest request) {
		if (principal != null) {
			String userid = "";
			if (principal.getName().contains("@")) {
				userid = principal.getName();
			} else {
				userid = principal.getName() + Config.EDMS_DOMAIN;
			}
			RestoreVersionResponse restoreResponse = documentModuleClient
					.restoreVersion(folderPath, versionName, userid);
			return restoreResponse.getRestoreVersionResponse();
		} else {
			return "true";
		}
	}

	@RequestMapping("/recycleDoc")
	@ResponseBody
	public String recycleDoc(ModelMap map, Principal principal,
			HttpServletRequest request,@RequestParam String docPath) {
		String folderName ="";
		boolean res =false;
		if(principal!=null){
			String[] str=docPath.split(",");
			for (int i = 0; i < str.length; i++) {
			String userid = "";
			if (principal.getName().contains("@")) {
				userid = principal.getName();
			} else {
				userid = principal.getName() + Config.EDMS_DOMAIN;
			}
			HttpSession hs = request.getSession(false);
			 folderName = str[i];
			if (folderName != "") {

			} else {
				folderName =(String) hs.getAttribute("currentFile");
			}
			RecycleFolderResponse recycleFolderResponse = documentModuleClient
					.recycleFolder(str[i], userid);
			String resp = recycleFolderResponse.getRecycleFolderResponse();
			//System.out.println(resp);
			//System.out.println(Boolean.getBoolean(resp)					+ folderName.substring(0, folderName.lastIndexOf("/")));
			 res = Boolean.parseBoolean(resp);
		
		}
				if (res) {
				return folderName.substring(0, folderName.lastIndexOf("/"));
			} else {
				System.out.println("response after recycle doc fails"+ folderName);
				return folderName;
			}
		} else {
			return "true";
		}
	}

	@RequestMapping("/deleteDoc")
	@ResponseBody
	public String deleteDoc(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String folderPath) {
		String resp="";
		if(principal!=null){
			String[] str=folderPath.split(",");
			for(int i=0;i<str.length;i++){
		String userid="";
		if(principal.getName().contains("@")){
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		String folderName = str[i];
		DeleteFolderResponse deleteFolderResponse = documentModuleClient
				.deleteFolder(folderName, userid);
		resp = deleteFolderResponse.getDeleteFolderResponse();
			}
			return resp;
		}else{
			return "true";
		}
	}

	@RequestMapping("/restoreDoc")
	@ResponseBody
	public String restoreDoc(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String folderPath) {
		String resp="";
		if(principal!=null){
			String[] str=folderPath.split(",");
			for (int i = 0; i < str.length; i++) {
		String userid="";
		if(principal.getName().contains("@")){
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		String folderName = str[i];
		RestoreFolderResponse restoreFolderResponse = documentModuleClient
				.restoreFolder(folderName, userid);
		 resp = restoreFolderResponse.getRestoreFolderResponse();
		}
		return resp;
		}else{
			return "true";
		}
	}

	@RequestMapping("/assignSinglePermission")
	@ResponseBody
	public String assignSinglePermission(ModelMap map, Principal principal,
			@RequestParam String user, @RequestParam String value,@RequestParam String doctype,
			HttpServletRequest request) {

		if(principal!=null){
		String userid="";
		if(principal.getName().contains("@")){
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		HttpSession hs = request.getSession(false);
		String folderName = (String) hs.getAttribute(doctype);
		//System.out.println("current folder or file value is : "+folderName);
		AssignSinglePermissionResponse response = documentModuleClient
				.assignSinglePermission(folderName, userid, user, value);
		String resp = response.getAssignSinglePermissionResponse();
		MailUtils.sendComposeMail("mail.silvereye.in", "25", "rohit@silvereye.in", "yahoo@2009", "nirbhay@silvereye.in", "Shared with me", "This is mail to inform you that someone have shared document with you.");
		//MailUtils.sendComposeMail("192.168.0.53", "25", "edms@avi-oil.com", "google@2009", userid, "Shared with me", "dsdd");
		return resp;
		}else{
			return "true";
		}
	}
	

	@RequestMapping(value = "/moveDoc", method = RequestMethod.GET)
	@ResponseBody
	public String moveDoc(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String sourcePath,@RequestParam String destPath) {
		if(principal!=null){
			String[] str=sourcePath.split(",");
			for (int i = 0; i < str.length; i++) {
		HttpSession hs = request.getSession(false);
		String folderName = (String) hs.getAttribute("currentFolder");
		String userid="";
		if(principal.getName().contains("@")){
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		if(folderName!=""){
			
		}else{
			folderName=(String) hs.getAttribute("currentFile");
		}
		MoveDocResponse response = documentModuleClient.moveDoc(str[i],  destPath,userid);
			}return destPath;
		}else{
			return "true";
		}
	}

	@RequestMapping(value = "/copyDoc", method = RequestMethod.GET)
	@ResponseBody
	public String copyDoc(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String sourcePath,@RequestParam String destPath) {
		if(principal!=null){
		String[] str=sourcePath.split(",");
		for (int i = 0; i < str.length; i++) {
		HttpSession hs = request.getSession(false);
		String folderName = (String) hs.getAttribute("currentFolder");
		String userid="";
		if(principal.getName().contains("@")){
				userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		if(folderName!=""){
			
		}else{
			folderName=(String) hs.getAttribute("currentFile");
		}
		//	System.out.println("destination path is : "+destPath);
		CopyDocResponse response = documentModuleClient.copyDoc(str[i],  destPath,userid);
		}
		return destPath;
		}else{
			return "true";
		}
	}
	/*@RequestMapping(value = "/multipleCopy", method = RequestMethod.POST)
	@ResponseBody
	public String multipleCopy(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String path, @RequestParam String sourcePath,@RequestParam String destPath) {
		String[] str=sourcePath.split(",");
		for (int i = 0; i < str.length; i++) {
		if(principal!=null){
		HttpSession hs = request.getSession(false);
		String folderName = (String) hs.getAttribute("currentFolder");
		String userid="";
		if(principal.getName().contains("@"))
			{
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		if(folderName!=""){
		}else{
			folderName=(String) hs.getAttribute("currentFile");
		}
		System.out.println(destPath);
		CopyDocResponse response = documentModuleClient.copyDoc(str[i],destPath,userid);
		return destPath;
		}else{
			return "true";
		}
		}
return "true";
}*/
	
}
