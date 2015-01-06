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
import edms.configuration.WeatherClient;
import edms.webservice.client.FolderClient;
import edms.wsdl.AssignSinglePermissionResponse;
import edms.wsdl.CreateFolderResponse;
import edms.wsdl.DeleteFolderResponse;
import edms.wsdl.Folder;
import edms.wsdl.GetCountryResponse;
import edms.wsdl.GetFolderByPathResponse;
import edms.wsdl.GetFolderResponse;
import edms.wsdl.GetRecycledDocsResponse;
import edms.wsdl.GetSharedFoldersByPathResponse;
import edms.wsdl.GetSharedFoldersResponse;
import edms.wsdl.HasChildResponse;
import edms.wsdl.RecycleFolderResponse;
import edms.wsdl.RestoreFolderResponse;
import edms.wsdl.ShareFolderByPathResponse;

@Controller
public class FolderController {

	@Autowired
	private LdapTemplate ldapTemplate;
	
	
	@Autowired
	private FolderClient folderClient;
	
	

	@RequestMapping(value = "/shared", method = RequestMethod.GET)
	public String getShared(ModelMap map,Principal principal,HttpServletRequest request) {
		String calcPath="/"+principal.getName()+"@avi-oil.com";
		HttpSession hs = request.getSession(false);
		hs.setAttribute("currentFolder", calcPath);
		GetSharedFoldersResponse folderResponse = folderClient.getSharedFoldersRequest(principal.getName()+"@avi-oil.com");
		GetFolderByPathResponse folderByPath=folderClient.getFolderByPath(calcPath,principal.getName()+"@avi-oil.com");
		Folder folderNode=folderByPath.getFolder();
		List<Folder> folderList = folderResponse.getGetSharedFolders()
				.getFolderListResult().getFolderList();
		map.addAttribute("currentFolder",folderNode);
		map.addAttribute("breadcum",calcPath);
		map.addAttribute("folderList", folderList);
		map.addAttribute("userid",principal.getName()+"@avi-oil.com");
		return "shared";
	}

	@RequestMapping(value = "/getSharedFileSystem", method = RequestMethod.GET)
	public String getSharedFileSystem(ModelMap map,Principal principal,@RequestParam String path,HttpServletRequest request) {
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
		GetSharedFoldersByPathResponse folderResponse = folderClient.getSharedFoldersByPathRequest(principal.getName()+"@avi-oil.com", path);
		GetFolderByPathResponse folderByPath=folderClient.getFolderByPath(path,principal.getName()+"@avi-oil.com");
		Folder folderNode=folderByPath.getFolder();
		List<Folder> folderList = folderResponse.getGetSharedFoldersByPath().getFolderListResult().getFolderList();
		map.addAttribute("currentFolder",folderNode);
		map.addAttribute("breadcum",path);
		map.addAttribute("folderList", folderList);
		map.addAttribute("userid",principal.getName()+"@avi-oil.com");
		return "shared";
	}

	

	@RequestMapping(value="/myDocument", method=RequestMethod.GET)
	public String getActivitiLeft(ModelMap map, Principal principal,
			HttpServletRequest request){

		String calcPath="/"+principal.getName()+"@avi-oil.com";
		GetFolderResponse folderResponse = folderClient.getFolderRequest(calcPath,principal.getName()+"@avi-oil.com");
		GetFolderByPathResponse folderByPath=folderClient.getFolderByPath(calcPath,principal.getName()+"@avi-oil.com");
		Folder folderNode=folderByPath.getFolder();
		List<Folder> folderList = folderResponse.getGetFoldersByParentFolder()
				.getFolderListResult().getFolderList();
		map.addAttribute("currentFolder",folderNode);
		map.addAttribute("breadcum",calcPath);
		map.addAttribute("folderList", folderList);
		map.addAttribute("userid",principal.getName()+"@avi-oil.com");
		return "myDocument";
	}

	
	@RequestMapping(value = "/fileSystem", method = RequestMethod.GET)
	public String listFolder(ModelMap map, Principal principal,
			HttpServletRequest request) {
		String calcPath="/"+principal.getName()+"@avi-oil.com";
		GetFolderResponse folderResponse = folderClient.getFolderRequest(calcPath,principal.getName()+"@avi-oil.com");
		GetFolderByPathResponse folderByPath=folderClient.getFolderByPath(calcPath,principal.getName()+"@avi-oil.com");
		Folder folderNode=folderByPath.getFolder();
		List<Folder> folderList = folderResponse.getGetFoldersByParentFolder()
				.getFolderListResult().getFolderList();
		map.addAttribute("currentFolder",folderNode);
		map.addAttribute("breadcum",calcPath);
		map.addAttribute("folderList", folderList);
		map.addAttribute("userid",principal.getName()+"@avi-oil.com");
		return "fileSystem";
	}
	
	

	@RequestMapping(value = "/getDocProperties", method = RequestMethod.GET)
	public String getDocProperties(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String path) {
	//listLdapUsersDetails(principal.getName()+"@avi-oil.com");
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
	GetFolderResponse folderResponse = folderClient.getFolderRequest(calcPath,principal.getName()+"@avi-oil.com");
	GetFolderByPathResponse folderByPath=folderClient.getFolderByPath(calcPath,principal.getName()+"@avi-oil.com");
	Folder folderNode=folderByPath.getFolder();
	List<Folder> folderList = folderResponse.getGetFoldersByParentFolder()
			.getFolderListResult().getFolderList();
	map.addAttribute("currentFolder",folderNode);
	map.addAttribute("breadcum",calcPath);
	map.addAttribute("folderList", folderList);
	map.addAttribute("userid",principal.getName()+"@avi-oil.com");
	return "getDocProperties";
}
	@RequestMapping(value = "/getFileSystem", method = RequestMethod.GET)
	public String listFolder(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String path) {
	//listLdapUsersDetails(principal.getName()+"@avi-oil.com");
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
	GetFolderResponse folderResponse = folderClient.getFolderRequest(calcPath,principal.getName()+"@avi-oil.com");
	GetFolderByPathResponse folderByPath=folderClient.getFolderByPath(calcPath,principal.getName()+"@avi-oil.com");
	Folder folderNode=folderByPath.getFolder();
	List<Folder> folderList = folderResponse.getGetFoldersByParentFolder()
			.getFolderListResult().getFolderList();
	map.addAttribute("currentFolder",folderNode);
	map.addAttribute("breadcum",calcPath);
	map.addAttribute("folderList", folderList);
	map.addAttribute("userid",principal.getName()+"@avi-oil.com");
	return "fileSystem";
}

	private void listLdapUsersDetails(String userid) {
			// TODO Auto-generated method stub
		List<String> result = ldapTemplate.search(query().where("mail").is(userid),
			      new AbstractContextMapper() {
			         protected String doMapFromContext(DirContextOperations ctx) {
			        	 Attributes attributes=ctx.getAttributes();
			        	 NamingEnumeration results=	  attributes.getAll();
			        	int i=0;
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

			  if(result.size() != 1) {
			    throw new RuntimeException("User not found or not unique");
			  }

		// System.out.println("folder service object : "+folderService);
		System.out.println(result.get(0)+" size = "+result.size());
		}

	@RequestMapping(value = "/getSubFolders", method = RequestMethod.GET)
	public String getSubFolders(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String path) {
		path = path.substring(6);
		path=path.replaceFirst("_avi", "@avi");
		path=path.replaceFirst("_com", ".com");
		path = path.replace('_', '/');
		path = path.replace('*', ' ');
		GetFolderResponse folderResponse = folderClient.getFolderRequest(path,principal.getName()+"@avi-oil.com");
		List<Folder> folderList = folderResponse.getGetFoldersByParentFolder()
				.getFolderListResult().getFolderList();
		map.addAttribute("folderClient", folderClient);
		map.addAttribute("folderList", folderList);
		map.addAttribute("principal", principal);
		return "myDocument";
	}

	@RequestMapping("/createFolder")
	@ResponseBody
	public String createFolder(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String folderName)
			  {
		HttpSession hs = request.getSession(false);
		String notes="this folder is testing folder";
		String keywords="this,folder,is,testing,folder";
		String parentFolder = (String) hs.getAttribute("currentFolder");
		CreateFolderResponse createFolderResponse = folderClient.createFolder(
				folderName, parentFolder, principal.getName()+"@avi-oil.com",keywords,notes);
		Folder folder = createFolderResponse.getFolder();
		String newFolder="";
		if(folder!=null){
		newFolder = "<li id='"
				+ folder.getFolderPath()
				+ "' ondblclick='getFileSystem(this.id)' >"
				+ "<div class='folder_icon'></div>  <span>"
				+ folder.getFolderPath().substring(folder.getFolderPath().lastIndexOf('/') + 1)
				+ "</span>" 
				+ "</li>";
		}else{
			return "access denied"; 
		}
		return newFolder;
	}

	@RequestMapping("/createSharedFolder")
	@ResponseBody
	public String createSharedFolder(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String folderName)
			  {
		HttpSession hs = request.getSession(false);
		String notes="this folder is testing folder";
		String keywords="this,folder,is,testing,folder";
		String parentFolder = (String) hs.getAttribute("currentFolder");
		CreateFolderResponse createFolderResponse = folderClient.createFolder(
				folderName, parentFolder, principal.getName()+"@avi-oil.com",keywords,notes);
		Folder folder = createFolderResponse.getFolder();
		String newFolder="";
		if(folder!=null){
			newFolder =	"<div class='shared_row_1'>"+
						"<div ondblclick='getSharedFileSystem(this.id)'  "+
						"style='cursor: pointer;/* width: 100%; */height: 32px;' "+
						"id='"+folder.getFolderPath()+"' >"+
						"<div class='shared_title_1' >"+
						"<img src='images/folder.png'>"+
						"<span>"+folder.getFolderName() +"</span>"+
						"</div>"+
						"<div class='shared_date'>"+
						"<div class='shared_person_name'>"+
						"<img src='images/missing_avatar.png'>"+folder.getCreatedBy()+"</div>"+
						"</div>"+
						"<div class='claer'></div></div>"+
						"</div>";
		}else{
			return "access denied"; 
		}
		return newFolder;
	}
	@RequestMapping("/shareFolder")
	@ResponseBody
	public String shareFolder(ModelMap map,Principal principal, @RequestParam String users, @RequestParam String groups
			, @RequestParam String userpermissions, @RequestParam String grouppermissions,HttpServletRequest request){
		String userid=principal.getName()+"@avi-oil.com";
		HttpSession hs = request.getSession(false);
		String folderName=(String)hs.getAttribute("currentFolder");
		ShareFolderByPathResponse shareFolderByPathResponse = folderClient.shareFolderByPath(folderName, userid, users, groups, userpermissions, grouppermissions);
		String resp=shareFolderByPathResponse.getShareResponse();
		
		return resp;
	}
	@RequestMapping("/recycleDoc")
	@ResponseBody
	public String recycleDoc(ModelMap map,Principal principal,HttpServletRequest request){
		String userid=principal.getName()+"@avi-oil.com";
		HttpSession hs = request.getSession(false);
		String folderName=(String)hs.getAttribute("currentFolder");
		RecycleFolderResponse recycleFolderResponse = folderClient.recycleFolder(folderName,userid);
		String resp=recycleFolderResponse.getRecycleFolderResponse();
		System.out.println(folderName.substring(0,folderName.lastIndexOf("/")));
		return folderName.substring(0,folderName.lastIndexOf("/"));
	}
	@RequestMapping("/deleteDoc")
	@ResponseBody
	public String deleteDoc(ModelMap map,Principal principal,HttpServletRequest request,@RequestParam String folderPath){
		String userid=principal.getName()+"@avi-oil.com";
		String folderName=folderPath;
		DeleteFolderResponse deleteFolderResponse = folderClient.deleteFolder(folderName,userid);
		String resp=deleteFolderResponse.getDeleteFolderResponse();
		return resp;
	}
	@RequestMapping("/restoreDoc")
	@ResponseBody
	public String restoreDoc(ModelMap map,Principal principal,HttpServletRequest request,@RequestParam String folderPath){
		String userid=principal.getName()+"@avi-oil.com";
		String folderName=folderPath;
		System.out.println(folderName+"sddddddddddddddddd");
		RestoreFolderResponse restoreFolderResponse = folderClient.restoreFolder(folderName,userid);
		String resp=restoreFolderResponse.getRestoreFolderResponse();
		return resp;
	}
	@RequestMapping("/assignSinglePermission")
	@ResponseBody
	public String assignSinglePermission(ModelMap map,Principal principal, @RequestParam String user, @RequestParam String value
			, HttpServletRequest request){
		String userid=principal.getName()+"@avi-oil.com";
		HttpSession hs = request.getSession(false);
		String folderName=(String)hs.getAttribute("currentFolder");
		AssignSinglePermissionResponse response = folderClient.assignSinglePermission(folderName, userid, user,value);
		String resp=response.getAssignSinglePermissionResponse();
		return resp;
	}
	}
