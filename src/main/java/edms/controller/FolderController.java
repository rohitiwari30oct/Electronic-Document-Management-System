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
import edms.webservice.client.DocumentModuleClient;
import edms.wsdl.AddKeywordResponse;
import edms.wsdl.AssignSinglePermissionResponse;
import edms.wsdl.CreateFolderResponse;
import edms.wsdl.DeleteFolderResponse;
import edms.wsdl.Folder;
import edms.wsdl.GetFileResponse;
import edms.wsdl.GetFolderByPathResponse;
import edms.wsdl.GetFolderResponse;
import edms.wsdl.GetSharedFilesByPathResponse;
import edms.wsdl.GetSharedFilesResponse;
import edms.wsdl.GetSharedFoldersByPathResponse;
import edms.wsdl.GetSharedFoldersResponse;
import edms.wsdl.RecycleFolderResponse;
import edms.wsdl.RemoveKeywordResponse;
import edms.wsdl.RenameFolderRes;
import edms.wsdl.RenameFolderResponse;
import edms.wsdl.RestoreFolderResponse;
import edms.wsdl.RestoreVersionResponse;
import edms.wsdl.ShareFolderByPathResponse;

@Controller
public class FolderController {

	@Autowired
	private LdapTemplate ldapTemplate;

	@Autowired
	private DocumentModuleClient documentModuleClient;

	@RequestMapping(value = "/shared", method = RequestMethod.GET)
	public String getShared(ModelMap map, Principal principal,
			HttpServletRequest request) {
		String calcPath = "/" + principal.getName() + Config.EDMS_DOMAIN;
		HttpSession hs = request.getSession(false);
		hs.setAttribute("currentFolder", calcPath);

		hs.setAttribute("currentFile", "");
		GetSharedFoldersResponse folderResponse = documentModuleClient
				.getSharedFoldersRequest(principal.getName()
						+ Config.EDMS_DOMAIN);
		GetFolderByPathResponse folderByPath = documentModuleClient
				.getFolderByPath(calcPath, principal.getName()
						+ Config.EDMS_DOMAIN);
		Folder folderNode = folderByPath.getFolder();

		if(folderResponse.getGetSharedFolders().getFolderListResult()!=null){
		List<Folder> folderList = folderResponse.getGetSharedFolders()
				.getFolderListResult().getFolderList();
		map.addAttribute("folderList", folderList);}
		GetSharedFilesResponse fileResponse = documentModuleClient
				.getSharedFilesRequest(principal.getName() + Config.EDMS_DOMAIN);
		if(fileResponse.getGetSharedFiles().getFileListResult()!=null){
		List<edms.wsdl.File> fileList = fileResponse.getGetSharedFiles().getFileListResult().getFileList();
		map.addAttribute("fileList", fileList);}
		map.addAttribute("currentFolder", folderNode);
		map.addAttribute("breadcum", calcPath);
		map.addAttribute("userid", principal.getName() + Config.EDMS_DOMAIN);
		return "shared";
	}

	@RequestMapping(value = "/getSharedFileSystem", method = RequestMethod.GET)
	public String getSharedFileSystem(ModelMap map, Principal principal,
			@RequestParam String path, HttpServletRequest request) {
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

		hs.setAttribute("currentFile", "");
		GetSharedFoldersByPathResponse folderResponse = documentModuleClient
				.getSharedFoldersByPathRequest(principal.getName()
						+ Config.EDMS_DOMAIN, path);
		GetSharedFilesByPathResponse fileResponse = documentModuleClient
				.getSharedFilesByPathRequest(principal.getName()
						+ Config.EDMS_DOMAIN, path);
		GetFolderByPathResponse folderByPath = documentModuleClient
				.getFolderByPath(path, principal.getName() + Config.EDMS_DOMAIN);
		Folder folderNode = folderByPath.getFolder();
		if(folderResponse.getGetSharedFoldersByPath().getFolderListResult()!=null){
			List<Folder> folderList = folderResponse.getGetSharedFoldersByPath()
					.getFolderListResult().getFolderList();
			map.addAttribute("folderList", folderList);}
			map.addAttribute("currentFolder", folderNode);
			map.addAttribute("breadcum", calcPath);
			map.addAttribute("userid", principal.getName() + Config.EDMS_DOMAIN);
		return "shared";
	}

	@RequestMapping(value = "/myDocument", method = RequestMethod.GET)
	public String getActivitiLeft(ModelMap map, Principal principal,
			HttpServletRequest request) {

		String calcPath = "/" + principal.getName() + Config.EDMS_DOMAIN;
		GetFolderResponse folderResponse = documentModuleClient
				.getFolderRequest(calcPath, principal.getName()
						+ Config.EDMS_DOMAIN);
		GetFolderByPathResponse folderByPath = documentModuleClient
				.getFolderByPath(calcPath, principal.getName()
						+ Config.EDMS_DOMAIN);
		Folder folderNode = folderByPath.getFolder();
		List<Folder> folderList = folderResponse.getGetFoldersByParentFolder()
				.getFolderListResult().getFolderList();
		GetFileResponse fileResponse = documentModuleClient.getFileRequest(
				calcPath, principal.getName() + Config.EDMS_DOMAIN);
		List<edms.wsdl.File> fileList = fileResponse.getGetFilesByParentFile()
				.getFileListResult().getFileList();

		map.addAttribute("fileList", fileList);
		map.addAttribute("currentFolder", folderNode);
		map.addAttribute("breadcum", calcPath);
		map.addAttribute("folderList", folderList);
		map.addAttribute("userid", principal.getName() + Config.EDMS_DOMAIN);
		return "myDocument";
	}

	@RequestMapping(value = "/fileSystem", method = RequestMethod.GET)
	public String listFolder(ModelMap map, Principal principal,
			HttpServletRequest request) {
		String calcPath = "/" + principal.getName() + Config.EDMS_DOMAIN;
		
		
		HttpSession hs = request.getSession(false);
		if (hs != null) {
			hs.setAttribute("currentFolder",calcPath);

			hs.setAttribute("currentFile", "");
		}
		GetFolderResponse folderResponse = documentModuleClient
				.getFolderRequest(calcPath, principal.getName()
						+ Config.EDMS_DOMAIN);
		GetFolderByPathResponse folderByPath = documentModuleClient
				.getFolderByPath(calcPath, principal.getName()
						+ Config.EDMS_DOMAIN);
		Folder folderNode = folderByPath.getFolder();
		List<Folder> folderList = folderResponse.getGetFoldersByParentFolder()
				.getFolderListResult().getFolderList();
		
		GetFileResponse fileResponse = documentModuleClient.getFileRequest(
				calcPath, principal.getName() + Config.EDMS_DOMAIN);
		List<edms.wsdl.File> fileList = fileResponse.getGetFilesByParentFile()
				.getFileListResult().getFileList();

		map.addAttribute("folderList", folderList);
		map.addAttribute("currentFolder", folderNode);
		map.addAttribute("breadcum", calcPath);
		map.addAttribute("fileList", fileList);
		map.addAttribute("userid", principal.getName() + Config.EDMS_DOMAIN);
		return "fileSystem";
	}

	@RequestMapping(value = "/getDocProperties", method = RequestMethod.GET)
	public String getDocProperties(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String path) {
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
		hs.setAttribute("currentFolder", calcPath);
		hs.setAttribute("currentFile", "");
		GetFolderResponse folderResponse = documentModuleClient
				.getFolderRequest(calcPath, principal.getName()
						+ Config.EDMS_DOMAIN);
		GetFolderByPathResponse folderByPath = documentModuleClient
				.getFolderByPath(calcPath, principal.getName()
						+ Config.EDMS_DOMAIN);
		Folder folderNode = folderByPath.getFolder();
		List<Folder> folderList = folderResponse.getGetFoldersByParentFolder()
				.getFolderListResult().getFolderList();
		GetFileResponse fileResponse = documentModuleClient.getFileRequest(
				calcPath, principal.getName() + Config.EDMS_DOMAIN);
		List<edms.wsdl.File> fileList = fileResponse.getGetFilesByParentFile()
				.getFileListResult().getFileList();

		map.addAttribute("fileList", fileList);
		map.addAttribute("currentFolder", folderNode);
		map.addAttribute("breadcum", calcPath);
		map.addAttribute("folderList", folderList);
		map.addAttribute("userid", principal.getName() + Config.EDMS_DOMAIN);
		return "getDocProperties";
	}

	@RequestMapping(value = "/setCurrentFolder", method = RequestMethod.POST)
	@ResponseBody
	public String setCurrentFolder(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String path) {
		HttpSession hs = request.getSession(false);
		hs.setAttribute("currentFolder", path);
		hs.setAttribute("currentFile", "");
		return "";
	}


	@RequestMapping(value = "/getFileSystem", method = RequestMethod.GET)
	public String listFolder(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String path) {
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
		hs.setAttribute("currentFolder", calcPath);
		hs.setAttribute("currentFile", "");
		GetFolderResponse folderResponse = documentModuleClient
				.getFolderRequest(calcPath, principal.getName()
						+ Config.EDMS_DOMAIN);
		GetFolderByPathResponse folderByPath = documentModuleClient
				.getFolderByPath(calcPath, principal.getName()
						+ Config.EDMS_DOMAIN);
		Folder folderNode = folderByPath.getFolder();
		boolean success = folderResponse.getGetFoldersByParentFolder()
				.isSuccess();
		if (success) {
			List<Folder> folderList = folderResponse
					.getGetFoldersByParentFolder().getFolderListResult()
					.getFolderList();
			map.addAttribute("currentFolder", folderNode);

			GetFileResponse fileResponse = documentModuleClient.getFileRequest(
					calcPath, principal.getName() + Config.EDMS_DOMAIN);
			List<edms.wsdl.File> fileList = fileResponse
					.getGetFilesByParentFile().getFileListResult()
					.getFileList();

			map.addAttribute("fileList", fileList);
			map.addAttribute("breadcum", calcPath);
			map.addAttribute("folderList", folderList);
			map.addAttribute("userid", principal.getName() + Config.EDMS_DOMAIN);
		}
		return "fileSystem";
	}

	private void listLdapUsersDetails(String userid) {
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

	@RequestMapping(value = "/getSubFolders", method = RequestMethod.GET)
	public String getSubFolders(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String path) {
		path = path.substring(6);
		path = path.replaceFirst("_avi", "@avi");
		path = path.replaceFirst("_com", ".com");
		path = path.replaceFirst("_spc_spc_", " ");
		path = path.replace('_', '/');
		path = path.replace('*', ' ');
		System.out.println(path);
		GetFolderResponse folderResponse = documentModuleClient
				.getFolderRequest(path, principal.getName()
						+ Config.EDMS_DOMAIN);
		List<Folder> folderList = folderResponse.getGetFoldersByParentFolder()
				.getFolderListResult().getFolderList();
		GetFileResponse fileResponse = documentModuleClient.getFileRequest(
				path, principal.getName() + Config.EDMS_DOMAIN);
		List<edms.wsdl.File> fileList = fileResponse.getGetFilesByParentFile()
				.getFileListResult().getFileList();
		map.addAttribute("fileList", fileList);
		map.addAttribute("folderClient", documentModuleClient);
		map.addAttribute("folderList", folderList);
		map.addAttribute("principal", principal);
		return "myDocument";
	}

	@RequestMapping("/createFolder")
	@ResponseBody
	public String createFolder(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String folderName) {
		HttpSession hs = request.getSession(false);
		String notes = "this folder is testing folder";
		String keywords = "this,folder,is,testing,folder";
		String parentFolder = (String) hs.getAttribute("currentFolder");
		CreateFolderResponse createFolderResponse = documentModuleClient
				.createFolder(folderName, parentFolder, principal.getName()
						+ Config.EDMS_DOMAIN, keywords, notes);
		Folder folder = createFolderResponse.getFolder();
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
		return newFolder;
	}
	@RequestMapping(value = "/addKeyword", method = RequestMethod.GET)
	@ResponseBody
	public String addKeyword(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String keyword) {
		HttpSession hs = request.getSession(false);
		String folderName = (String) hs.getAttribute("currentFolder");
		if(folderName!=""){
			
		}else{
			folderName=(String) hs.getAttribute("currentFile");
		}
		AddKeywordResponse addKeywordResponse = documentModuleClient
				.addKeyword(folderName,  principal.getName()+ Config.EDMS_DOMAIN, keyword);
		
	
		return "";
	}

	@RequestMapping(value = "/removeKeyword", method = RequestMethod.GET)
	@ResponseBody
	public String removeKeyword(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String keyword) {
		HttpSession hs = request.getSession(false);
		String folderName = (String) hs.getAttribute("currentFolder");
		if(folderName!=""){
			
		}else{
			folderName=(String) hs.getAttribute("currentFile");
		}
		RemoveKeywordResponse removeKeywordResponse = documentModuleClient
				.removeKeyword(folderName,  principal.getName()+ Config.EDMS_DOMAIN, keyword);
		
	
		return "";
	}

	@RequestMapping("/createSharedFolder")
	public String createSharedFolder(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String folderName) {
		HttpSession hs = request.getSession(false);
		String notes = "this folder is testing folder";
		String keywords = "this,folder,is,testing,folder";
		String parentFolder = (String) hs.getAttribute("currentFolder");
		CreateFolderResponse createFolderResponse = documentModuleClient
				.createFolder(folderName, parentFolder, principal.getName()
						+ Config.EDMS_DOMAIN, keywords, notes);
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
	}

	@RequestMapping("/shareFolder")
	@ResponseBody
	public String shareFolder(ModelMap map, Principal principal,
			@RequestParam String users, @RequestParam String groups,
			@RequestParam String userpermissions,
			@RequestParam String grouppermissions, HttpServletRequest request) {
		String userid = principal.getName() + Config.EDMS_DOMAIN;
		HttpSession hs = request.getSession(false);
		String folderName = (String) hs.getAttribute("currentFolder");
		ShareFolderByPathResponse shareFolderByPathResponse = documentModuleClient
				.shareFolderByPath(folderName, userid, users, groups,
						userpermissions, grouppermissions);
		String resp = shareFolderByPathResponse.getShareResponse();

		return resp;
	}

	@RequestMapping("/renameDoc")
	@ResponseBody
	public String renameDoc(ModelMap map, Principal principal,
			@RequestParam String oldFolderName,
			@RequestParam String newFolderName, HttpServletRequest request) {
		String userid = principal.getName() + Config.EDMS_DOMAIN;
		HttpSession hs = request.getSession(false);
		String folderName = (String) hs.getAttribute("currentFolder");
		if(folderName!=""){
			
		}else{
			folderName=(String) hs.getAttribute("currentFile");
		}
		RenameFolderResponse renameResponse = documentModuleClient
				.renameFolder(oldFolderName, newFolderName, userid);
		RenameFolderRes resp = renameResponse.getRenameFolderRes();
		if (resp.isSuccess()) {
			return folderName.substring(0, folderName.lastIndexOf("/"));
		} else {
			return "Access Denied";
		}
	}
	
	@RequestMapping("/restoreVersion")
	@ResponseBody
	public String restoreVersion(ModelMap map, Principal principal,
			@RequestParam String folderPath, @RequestParam String versionName,
			HttpServletRequest request) {
		String userid = principal.getName() + Config.EDMS_DOMAIN;
		RestoreVersionResponse restoreResponse = documentModuleClient
				.restoreVersion(folderPath, versionName, userid);
		return restoreResponse.getRestoreVersionResponse();
	}

	@RequestMapping("/recycleDoc")
	@ResponseBody
	public String recycleDoc(ModelMap map, Principal principal,
			HttpServletRequest request) {
		String userid = principal.getName() + Config.EDMS_DOMAIN;
		HttpSession hs = request.getSession(false);
		String folderName = (String) hs.getAttribute("currentFolder");
		if(folderName!=""){
			
		}else{
			folderName=(String) hs.getAttribute("currentFile");
		}
		RecycleFolderResponse recycleFolderResponse = documentModuleClient
				.recycleFolder(folderName, userid);
		String resp = recycleFolderResponse.getRecycleFolderResponse();
		System.out.println(resp);
		System.out.println(Boolean.getBoolean(resp)
				+ folderName.substring(0, folderName.lastIndexOf("/")));
		boolean res = Boolean.parseBoolean(resp);
		if (res) {
			return folderName.substring(0, folderName.lastIndexOf("/"));
		} else {
			System.out
					.println("response after recycle doc fails " + folderName);
			return folderName;
		}
	}

	@RequestMapping("/deleteDoc")
	@ResponseBody
	public String deleteDoc(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String folderPath) {
		String userid = principal.getName() + Config.EDMS_DOMAIN;
		String folderName = folderPath;
		DeleteFolderResponse deleteFolderResponse = documentModuleClient
				.deleteFolder(folderName, userid);
		String resp = deleteFolderResponse.getDeleteFolderResponse();
		return resp;
	}

	@RequestMapping("/restoreDoc")
	@ResponseBody
	public String restoreDoc(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String folderPath) {
		String userid = principal.getName() + Config.EDMS_DOMAIN;
		String folderName = folderPath;
		RestoreFolderResponse restoreFolderResponse = documentModuleClient
				.restoreFolder(folderName, userid);
		String resp = restoreFolderResponse.getRestoreFolderResponse();
		return resp;
	}

	@RequestMapping("/assignSinglePermission")
	@ResponseBody
	public String assignSinglePermission(ModelMap map, Principal principal,
			@RequestParam String user, @RequestParam String value,
			HttpServletRequest request) {
		String userid = principal.getName() + Config.EDMS_DOMAIN;
		HttpSession hs = request.getSession(false);
		String folderName = (String) hs.getAttribute("currentFolder");
		AssignSinglePermissionResponse response = documentModuleClient
				.assignSinglePermission(folderName, userid, user, value);
		String resp = response.getAssignSinglePermissionResponse();
		return resp;
	}
}
