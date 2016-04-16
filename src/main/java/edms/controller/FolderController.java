package edms.controller;

import edms.core.Principal;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jackrabbit.core.util.db.DbUtility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.HtmlUtils;

import edms.core.Config;
import edms.core.MailUtils;
import edms.webservice.client.DocumentModuleClient;
import edms.webservice.client.UserClient;
import edms.wsdl.AddKeywordResponse;
import edms.wsdl.AddNotesResponse;
import edms.wsdl.ArrayOfFiles;
import edms.wsdl.ArrayOfFolders;
import edms.wsdl.AssignSinglePermissionResponse;
import edms.wsdl.CheckDocExistResponse;
import edms.wsdl.CopyDocResponse;
import edms.wsdl.CreateFolderResponse;
import edms.wsdl.CreateWorkspaceResponse;
import edms.wsdl.DeleteFolderResponse;
import edms.wsdl.EditKeywordResponse;
import edms.wsdl.Folder;
import edms.wsdl.GetFileWithOutStreamResponse;
import edms.wsdl.GetFolderByPathResponse;
import edms.wsdl.GetFolderResponse;
import edms.wsdl.GetSharedFilesByPathWithOutStreamResponse;
import edms.wsdl.GetSharedFilesWithOutStreamResponse;
import edms.wsdl.GetSharedFoldersByPathResponse;
import edms.wsdl.GetSharedFoldersResponse;
import edms.wsdl.GetUsersListResponse;
import edms.wsdl.MoveDocResponse;
import edms.wsdl.RecycleFolderResponse;
import edms.wsdl.RemoveAssignedPermissionResponse;
import edms.wsdl.RemoveKeywordResponse;
import edms.wsdl.RenameFolderRes;
import edms.wsdl.RenameFolderResponse;
import edms.wsdl.RestoreFolderResponse;
import edms.wsdl.RestoreVersionResponse;

@Controller
public class FolderController {

	@Autowired UserClient userClient;
	/*@Autowired
	private LdapTemplate ldapTemplate;
*/
	@Autowired
	private DocumentModuleClient documentModuleClient;

	@RequestMapping(value = "/shared", method = RequestMethod.GET)
	public String getShared(ModelMap map, Principal principal,
			HttpServletRequest request) {
		try{

		if(principal==null){return "ajaxTrue";}else{
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
		GetSharedFoldersResponse folderResponse = documentModuleClient
				.getSharedFoldersRequest(userid,principal.getPassword());
		GetFolderByPathResponse folderByPath = documentModuleClient
				.getFolderByPath(calcPath, userid,principal.getPassword());
		Folder folderNode = folderByPath.getFolder();
		if(folderResponse.getGetSharedFolders().getFolderListResult()!=null){
		List<Folder> folderList = folderResponse.getGetSharedFolders()
				.getFolderListResult().getFolderList();
		map.addAttribute("folderList", folderList);}
		GetSharedFilesWithOutStreamResponse fileResponse = documentModuleClient
				.getSharedFilesWithOutStreamRequest(userid,principal.getPassword());
		if(fileResponse.getGetSharedFiles().getFileListResult()!=null){
		List<edms.wsdl.File> fileList = fileResponse.getGetSharedFiles().getFileListResult().getFileList();
		map.addAttribute("fileList", fileList);}
		map.addAttribute("currentFolder", folderNode);
		map.addAttribute("breadcum", calcPath);
		map.addAttribute("userid", userid);
		return "fileSystem";
		} 
	}catch(Exception e){

		return "ajaxTrue";
	}
	}

	@RequestMapping(value = "/getSharedFileSystem", method = RequestMethod.GET)
	public String getSharedFileSystem(ModelMap map, Principal principal,
			@RequestParam String path,@RequestParam String breadcumPath, HttpServletRequest request) {
		try{
		if(principal==null)
		{
			return "ajaxTrue";
		}
		else{
			HttpSession hs = request.getSession(false);
			if (hs != null) {
				System.out.println((String) hs.getAttribute("currentFolder"));
			}
			path=path.replace("//", "/");
			breadcumPath=breadcumPath.replace("//", "/");
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
		GetSharedFoldersByPathResponse folderResponse = documentModuleClient
				.getSharedFoldersByPathRequest(userid,principal.getPassword(), path);
		GetSharedFilesByPathWithOutStreamResponse fileResponse = documentModuleClient
				.getSharedFilesByPathWithOutStreamRequest(userid,principal.getPassword(), path);
		GetFolderByPathResponse folderByPath = documentModuleClient
				.getFolderByPath(path, userid,principal.getPassword());
		Folder folderNode = folderByPath.getFolder();
		ArrayOfFolders arrayOfFolders=folderResponse.getGetSharedFoldersByPath().getFolderListResult();
		if(arrayOfFolders!=null){
			List<Folder> folderList = arrayOfFolders.getFolderList();
			map.addAttribute("folderList", folderList);}
			
		ArrayOfFiles arrayOfFiles=fileResponse.getGetSharedFilesByPath().getFileListResult();
		if(arrayOfFiles!=null){
			if (folderNode != null) {
				if (folderNode.getFolderName() != null) {
					int indexOfPath = breadcumPath.lastIndexOf("/" + folderNode.getFolderName()+"/");
					if (indexOfPath >= 0 && folderNode.getFolderPath().length() < breadcumPath.length()) {
						breadcumPath = breadcumPath.substring(0, indexOfPath) + "/"
								+ folderNode.getFolderName();
					} else {
						if(!(folderNode.getFolderPath().indexOf(userid)>=0)){
							
							String l1=breadcumPath.replace("/"+userid, "");
							String l2="";
							if(folderNode.getFolderPath().indexOf(l1)>=0)
							 l2=folderNode.getFolderPath().substring(folderNode.getFolderPath().indexOf(l1));
							
							
							
							if(l2.length()<=l1.length()){
								
							}else{
								
								breadcumPath += "/" + folderNode.getFolderName();
							}
						}
						else if(!breadcumPath.equalsIgnoreCase(folderNode.getFolderPath()))
						breadcumPath += "/" + folderNode.getFolderName();
						
					}
				}
			}
			List<edms.wsdl.File> fileList = arrayOfFiles.getFileList();
			map.addAttribute("fileList", fileList);}
			map.addAttribute("currentFolder", folderNode);
			map.addAttribute("breadcum", calcPath);
			map.addAttribute("userid", userid);
			map.addAttribute("breadcumPath",folderNode.getFolderPath());
		return "shared";
		}
	}catch(Exception e){

		return "ajaxTrue";
	}
	}

	@RequestMapping(value = "/myDocument", method = RequestMethod.GET)
	public String getActivitiLeft(ModelMap map, Principal principal,
			HttpServletRequest request) {
		try{
		if(principal==null){return "ajaxTrue";}else{
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
				.getFolderRequest(calcPath, userid,principal.getPassword());
		GetFolderByPathResponse folderByPath = documentModuleClient
				.getFolderByPath(calcPath, userid,principal.getPassword());
		Folder folderNode = folderByPath.getFolder();
		List<Folder> folderList = folderResponse.getGetFoldersByParentFolder()
				.getFolderListResult().getFolderList();
		GetFileWithOutStreamResponse fileResponse = documentModuleClient.getFileWithOutStreamRequest(
				calcPath, userid,principal.getPassword());
		List<edms.wsdl.File> fileList = fileResponse.getGetFilesByParentFile()
				.getFileListResult().getFileList();
		map.addAttribute("fileList", fileList);
		map.addAttribute("currentFolder", folderNode);
		map.addAttribute("breadcum", calcPath);
		map.addAttribute("folderList", folderList);
		map.addAttribute("userid", userid);
		return "myDocument";
		}
	}catch(Exception e){

		return "ajaxTrue";
	}
	}

	@RequestMapping(value = "/fileSystem", method = RequestMethod.GET)
	public String listFolder(ModelMap map, Principal principal,
			HttpServletRequest request,HttpServletResponse response) {
		try{
		if(principal==null){
			return "ajaxTrue";
		}else{
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
			//hs.setAttribute("currentFile", "");
		}
		String userid="";
		if(principal.getName().contains("@")){
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		GetFolderResponse folderResponse = documentModuleClient
				.getFolderRequest(path, userid,principal.getPassword());
		GetFolderByPathResponse folderByPath = documentModuleClient
				.getFolderByPath(path, userid,principal.getPassword());
		Folder folderNode = folderByPath.getFolder();
		List<Folder> folderList = folderResponse.getGetFoldersByParentFolder()
				.getFolderListResult().getFolderList();
		System.out.println("length of folderlist "+folderList.size());
		GetFileWithOutStreamResponse fileResponse = documentModuleClient.getFileWithOutStreamRequest(
				path, userid,principal.getPassword());
		List<edms.wsdl.File> fileList = fileResponse.getGetFilesByParentFile()
				.getFileListResult().getFileList();
		map.addAttribute("folderList", folderList);
		map.addAttribute("currentFolder", folderNode);
		map.addAttribute("breadcum", path);
		map.addAttribute("fileList", fileList);
		map.addAttribute("userid", userid);
		map.addAttribute("breadcumPath","/"+userid);
		return "fileSystem";
		}
}catch(Exception e){

			return "ajaxTrue";
		}
	}

	@RequestMapping(value = "/getDocProperties", method = RequestMethod.GET)
	public String getDocProperties(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String path) {
try{
		if(principal==null){
			return "ajaxTrue";
		}else{
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
		//hs.setAttribute("currentFile", "");
	/*	GetFolderResponse folderResponse = documentModuleClient
				.getFolderRequest(calcPath, userid,principal.getPassword());*/
		GetFolderByPathResponse folderByPath = documentModuleClient
				.getFolderByPath(calcPath, userid,principal.getPassword());
		Folder folderNode = folderByPath.getFolder();
	/*	List<Folder> folderList = folderResponse.getGetFoldersByParentFolder()
				.getFolderListResult().getFolderList();*/
		/*GetFileWithOutStreamResponse fileResponse = documentModuleClient.getFileWithOutStreamRequest(
				calcPath, userid,principal.getPassword());*/
		/*List<edms.wsdl.File> fileList = fileResponse.getGetFilesByParentFile()
				.getFileListResult().getFileList();*/
/*folderNode.setNoOfFolders(""+folderList.size());
folderNode.setNoOfDocuments(""+fileList.size());*/
		//map.addAttribute("fileList", fileList);
		map.addAttribute("currentFolder", folderNode);
		map.addAttribute("breadcum", calcPath);
		//map.addAttribute("folderList", folderList);
		map.addAttribute("userid", userid);
		return "getDocProperties";
		}
}catch(Exception e){
			return "ajaxTrue";
		}
	}

	@RequestMapping(value = "/setCurrentFolder", method = RequestMethod.POST)
	@ResponseBody
	public String setCurrentFolder(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String path) {
		try{
		if(principal==null){return "ajaxTrue";}else{
		HttpSession hs = request.getSession(false);
		hs.setAttribute("currentFolder", path);
		hs.setAttribute("currentDoc", path);
	//	hs.setAttribute("currentFile", "");
		return "";}
	}catch(Exception e){

		return "ajaxTrue";
	}
	}


	@RequestMapping(value = "/getFileSystem", method = RequestMethod.POST)
	public String listFolder(ModelMap map, Principal principal, HttpServletRequest request, @RequestParam String path,
			@RequestParam String breadcumPath) {
		try {
			if (principal == null) {
				return "ajaxTrue";
			} else {
				// listLdapUsersDetails(principal.getName()+Config.EDMS_DOMAIN);
				HttpSession hs = request.getSession(false);
				if (hs != null) {
					System.out.println((String) hs.getAttribute("currentFolder"));
				}
				breadcumPath = breadcumPath.replace("//", "/");
				String[] str = path.split("/");
				String calcPath = "";
				for (int i = 1; i < str.length; i++) {
					calcPath += "/" + str[i];
				}
				String userid = "";
				if (principal.getName().contains("@")) {
					userid = principal.getName();
				} else {
					userid = principal.getName() + Config.EDMS_DOMAIN;
				}
				hs.setAttribute("currentFolder", calcPath);
				hs.setAttribute("currentDoc", calcPath);
				// hs.setAttribute("currentFile", "");
				GetFolderResponse folderResponse = documentModuleClient.getFolderRequest(calcPath, userid,principal.getPassword());
				GetFolderByPathResponse folderByPath = documentModuleClient.getFolderByPath(calcPath, userid,principal.getPassword());
				Folder folderNode = folderByPath.getFolder();
				boolean success = folderResponse.getGetFoldersByParentFolder().isSuccess();
				System.out.println("response of list folder " + success);
				if (success) {
					List<Folder> folderList = folderResponse.getGetFoldersByParentFolder().getFolderListResult()
							.getFolderList();
					System.out.println("size of folder List " + folderList.size());
					map.addAttribute("currentFolder", folderNode);

					GetFileWithOutStreamResponse fileResponse = documentModuleClient.getFileWithOutStreamRequest(calcPath, userid, principal.getPassword());
					List<edms.wsdl.File> fileList = fileResponse.getGetFilesByParentFile().getFileListResult()
							.getFileList();
					if (folderNode != null) {
						if (folderNode.getFolderName() != null) {
							int indexOfPath = breadcumPath.lastIndexOf("/" + folderNode.getFolderName()+"/");
							if (indexOfPath >= 0 && folderNode.getFolderPath().length() < breadcumPath.length()) {
								breadcumPath = breadcumPath.substring(0, indexOfPath) + "/"
										+ folderNode.getFolderName();
							} else {
								if(!(folderNode.getFolderPath().indexOf(userid)>=0)){
									
									String l1=breadcumPath.replace("/"+userid, "");
									String l2="";
									if(folderNode.getFolderPath().indexOf(l1)>=0)
									 l2=folderNode.getFolderPath().substring(folderNode.getFolderPath().indexOf(l1));
									
									
									
									if(l2.length()<=l1.length()){
										
									}else{
										
										breadcumPath += "/" + folderNode.getFolderName();
									}
								}
								else if(!breadcumPath.equalsIgnoreCase(folderNode.getFolderPath()))
								breadcumPath += "/" + folderNode.getFolderName();
								
							}
						}
					}
					map.addAttribute("fileList", fileList);
					map.addAttribute("breadcum", calcPath);
					map.addAttribute("folderList", folderList);
					map.addAttribute("userid", userid);
					map.addAttribute("breadcumPath", folderNode.getFolderPath());
				}
				return "fileSystem";
			}
		} catch (Exception e) {

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
		try{
		if(principal==null){return "ajaxTrue";}else{
		path = path.substring(6);
		path = path.replaceFirst("_avi", "@");
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
				.getFolderRequest(path, userid,principal.getPassword());
		List<Folder> folderList = folderResponse.getGetFoldersByParentFolder()
				.getFolderListResult().getFolderList();
		GetFileWithOutStreamResponse fileResponse = documentModuleClient.getFileWithOutStreamRequest(
				path, userid,principal.getPassword());
		List<edms.wsdl.File> fileList = fileResponse.getGetFilesByParentFile()
				.getFileListResult().getFileList();
		map.addAttribute("fileList", fileList);
		map.addAttribute("folderClient", documentModuleClient);
		map.addAttribute("folderList", folderList);
		map.addAttribute("principal", principal);
		return "myDocument";
		}
	}catch(Exception e){

		return "ajaxTrue";
	}
	}

	@RequestMapping("/createFolder")
	@ResponseBody
	public String createFolder(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String folderName) {
		try{
		if(principal==null){return "ajaxTrue";}else{
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
		
		String 	folderPath=HtmlUtils.htmlEscape(folderName);
		
		folderName=folderPath;
		folderName=folderName.trim();
		
		CreateFolderResponse createFolderResponse = documentModuleClient
				.createFolder(folderName, parentFolder, userid,principal.getPassword(), keywords, notes);
		Folder folder = createFolderResponse.getFolder();
//		System.out.println(folder.getFolderPath());
		
		String newFolder = "";
		if (folder != null) {
			newFolder = 	"<li title='Name: "+folder.getFolderPath().substring(folder.getFolderPath().lastIndexOf("/")+1)+" &#013;Type: Folder &#013;Author: "+folder.getCreatedBy()+" &#013;Date: "+folder.getCreationDate().replace('T', ' ').substring(0,folder.getCreationDate().indexOf("."))+
		"ondblclick='getFileSystem(this.id)'	onclick='getDocProperties(this.id)' class='space select_box target folderContextMenuClass'	id='"+folder.getFolderPath()+"'"+
			" oncontextmenu='getDocProperties(this.id);getRightClickMenuFolder(this.id)' >"+
			"<div style='display: none;' "+
" id='folderPermissions'"+folder.getFolderPath()+"' >"+(folder.getUserRead().toString().indexOf(userid)>=0)+","+(folder.getUserWrite().toString().indexOf(userid)>=0)+","+(folder.getUserSecurity().toString().indexOf(userid)>=0)+"</div>"+
			"<div class='folder_icon inner_val'></div> <span>";
if(folder.getFolderName().length()>50){
newFolder+=folder.getFolderName().substring(0,50)+"...";
} else{
	newFolder=folder.getFolderName(); 
	}
newFolder="</span></li>";

		} else {
			return "access denied";
		}
		if(parentFolder.indexOf(userid)<0){
			return "false";
		}
		
		
		return parentFolder;
		}
	}catch(Exception e){

		return "ajaxTrue";
	}
	}
	@RequestMapping(value = "/addKeyword", method = RequestMethod.GET)
	@ResponseBody
	public String addKeyword(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String keyword) {
		try{

		if(principal==null){return "ajaxTrue";}else{
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
		

		/*keyword=keyword.replace("'"," ");
		keyword=keyword.replace("<"," ");
		keyword=keyword.replace(">"," ");
		keyword=keyword.replace("&", " and ");*/
		
		AddKeywordResponse addKeywordResponse = documentModuleClient
				.addKeyword(folderName,  userid,principal.getPassword(), keyword);
		return "";
		}
	}catch(Exception e){

		return "ajaxTrue";
	}
	}

	@RequestMapping(value = "/addNotes", method = RequestMethod.GET)
	@ResponseBody
	public String addNotes(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String note) {
		try{
		if(principal==null){return "ajaxTrue";}else{
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
				.addNotes(folderName,  userid,principal.getPassword(), note);
		return "Saved Successfully";
		}
	}catch(Exception e){

		return "ajaxTrue";
	}
	}

	@RequestMapping(value = "/removeKeyword", method = RequestMethod.GET)
	@ResponseBody
	public String removeKeyword(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String keyword) {
		try{
		if(principal==null){return "ajaxTrue";}else{
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
		RemoveKeywordResponse removeKeywordResponse = documentModuleClient.removeKeyword(folderName,  userid,principal.getPassword(), keyword);
		return "";
		} 
	}catch(Exception e){

		return "ajaxTrue";
	}
	}
	@RequestMapping(value = "/editKeyword", method = RequestMethod.GET)
	@ResponseBody
	public String removeKeyword(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String keyword, @RequestParam String editedKeyword) {
		try{
		
		if(principal==null){return "ajaxTrue";}else{
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
		
		

		/*editedKeyword=editedKeyword.replace("'"," ");
		editedKeyword=editedKeyword.replace("<"," ");
		editedKeyword=editedKeyword.replace(">"," ");
		editedKeyword=editedKeyword.replace("&", " and ");*/
		
		EditKeywordResponse editKeywordResponse = documentModuleClient
				.editKeyword(folderName,  userid,principal.getPassword(), keyword,editedKeyword);
		return "";
		} 
	}catch(Exception e){

		return "ajaxTrue";
	}
	}

	@RequestMapping("/createSharedFolder")
	public String createSharedFolder(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String folderName) {
		try{
		if(principal==null){return "ajaxTrue";}else{
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
				.createFolder(folderName, parentFolder,  userid,principal.getPassword(), keywords, notes);
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
	}catch(Exception e){

		return "ajaxTrue";
	}
	}


	@RequestMapping("/renameFolder")
	@ResponseBody
	public String renameFolder(ModelMap map, Principal principal,
			@RequestParam String oldFolderName,
			@RequestParam String newFolderName, HttpServletRequest request) {
		try{
		if(principal==null){return "ajaxTrue";}else{
		String userid="";
		if(principal.getName().contains("@")){
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		HttpSession hs = request.getSession(false);
		String folderName = (String) hs.getAttribute("currentFolder");
	 

		newFolderName=newFolderName.replace("/"," ");
		newFolderName=newFolderName.replace("\\"," ");
		//newFolderName=newFolderName.replace("-"," ");
		newFolderName=newFolderName.replace("'"," ");
		newFolderName=newFolderName.replace("<"," ");
		newFolderName=newFolderName.replace(">"," ");
		newFolderName=newFolderName.replace("&", " and ");
		newFolderName=newFolderName.trim();
		RenameFolderResponse renameResponse = documentModuleClient.renameFolder(oldFolderName, newFolderName, userid,principal.getPassword());
		RenameFolderRes resp = renameResponse.getRenameFolderRes();
		if (resp.isSuccess()) {
			if(oldFolderName.lastIndexOf("/")>0)
			return oldFolderName.substring(0, oldFolderName.lastIndexOf("/"));
			else
				return oldFolderName;
		} else {
			return "Access Denied";
		}
		} 
	}catch(Exception e){

		return "ajaxTrue";
	}
	}
	
	@RequestMapping("/restoreVersion")
	@ResponseBody
	public String restoreVersion(ModelMap map, Principal principal,
			@RequestParam String folderPath, @RequestParam String versionName,
			HttpServletRequest request) {
		try{
		if (principal != null) {
			String userid = "";
			if (principal.getName().contains("@")) {
				userid = principal.getName();
			} else {
				userid = principal.getName() + Config.EDMS_DOMAIN;
			}
			RestoreVersionResponse restoreResponse = documentModuleClient
					.restoreVersion(folderPath, versionName, userid,principal.getPassword());
			return restoreResponse.getRestoreVersionResponse();
		} else {
			return "true";
		}
	}catch(Exception e){

		return "ajaxTrue";
	}
	}

	@RequestMapping("/recycleDoc")
	@ResponseBody
	public String recycleDoc(ModelMap map, Principal principal,
			HttpServletRequest request,@RequestParam String docPath) {
		try{
		String folderName ="";
		boolean res =false;
		if(principal==null){return "ajaxTrue";}else{
			//String[] str=docPath.split(",");
		//	for (int i = 0; i < str.length; i++) {
			String userid = "";
			if (principal.getName().contains("@")) {
				userid = principal.getName();
			} else {
				userid = principal.getName() + Config.EDMS_DOMAIN;
			}
			HttpSession hs = request.getSession(false);
			// folderName = docPath;
			folderName =(String) hs.getAttribute("currentDoc");
		/*	if (folderName != "") {

			} else {
				folderName =(String) hs.getAttribute("currentFile");
			}*/
			RecycleFolderResponse recycleFolderResponse = documentModuleClient
					.recycleFolder(docPath, userid,principal.getPassword());
			String resp = recycleFolderResponse.getRecycleFolderResponse();
			//System.out.println(resp);
			//System.out.println(Boolean.getBoolean(resp)					+ folderName.substring(0, folderName.lastIndexOf("/")));
			// res = Boolean.parseBoolean(resp);
		
		//}
			/*	if (res) {
				return folderName.substring(0,folderName.lastIndexOf("/"));
			} else {
				System.out.println("response after recycle doc fails"+ folderName);*/
				return resp;
			//}
		}  
	}catch(Exception e){

		return "ajaxTrue";
	}
	}

	@RequestMapping("/deleteDoc")
	@ResponseBody
	public String deleteDoc(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String folderPath) {
		try{
		String resp="";
		if(principal==null){return "ajaxTrue";}else{
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
				.deleteFolder(folderName, userid,principal.getPassword());
		resp = deleteFolderResponse.getDeleteFolderResponse();
			}
			return resp;
		} 
	}catch(Exception e){

		return "ajaxTrue";
	}
	}

	@RequestMapping("/restoreDoc")
	@ResponseBody
	public String restoreDoc(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String folderPath) {
		try{
		String resp="";
		if(principal==null){return "ajaxTrue";}else{
				String[] str=folderPath.split(",");
			for (int i = 0; i < str.length; i++) {
			String userid="";
			if(principal.getName().contains("@"))
			{
				userid=principal.getName();
			}
			else
			{
					userid=principal.getName()+Config.EDMS_DOMAIN;
			}
			String folderName = str[i];
			RestoreFolderResponse restoreFolderResponse = documentModuleClient.restoreFolder(folderName, userid,principal.getPassword());
			 resp = restoreFolderResponse.getRestoreFolderResponse();
			}
			return resp;
		} 
	}catch(Exception e){
		e.printStackTrace();
		return "ajaxTrue";
	}
	}
	@RequestMapping("/assignSinglePermission")
	@ResponseBody
	public String assignSinglePermission(ModelMap map, Principal principal,
			@RequestParam String user, @RequestParam String value,@RequestParam String doctype,@RequestParam String multipath,
			HttpServletRequest request) {
		try{
		String resp="";
		String userid="";
		if(principal==null){return "ajaxTrue";}else{
			String[] str=multipath.split(",");
			for (int i = 0; i < str.length; i++) {
		if(!str.equals("")){
			if(principal.getName().contains("@")){
				userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
			userid=userid.trim();
			user=user.trim();
			value=value.trim();
			
			AssignSinglePermissionResponse response = documentModuleClient
				.assignSinglePermission(str[i].trim(), userid.trim(),principal.getPassword().trim(), user.trim(), value.trim());
		 	resp = response.getAssignSinglePermissionResponse();
		 	//MailUtils.sendComposeMail("192.168.0.53", "25", "edms@avi-oil.com", "google@2009", userid, "Shared with me", "dsdd");
			}
			}	//MailUtils.sendComposeMail("192.168.0.53", "25", "edms@avi-oil.com", "google@2009", userid, "Shared with me", "This is mail to inform you that someone have shared document with you.");
			//MailUtils.sendComposeMail("mail.silvereye.in", "25", "rohit@silvereye.in", "yahoo@2009", "nirbhay@silvereye.in", "Shared with me", "This is mail to inform you that someone have shared document with you.");
			return resp;
		} 
	}catch(Exception e){

		return "ajaxTrue";
	}
	}
	
	@RequestMapping("/removeAssignedPermission")
	@ResponseBody
	public String removeAssignedPermission(ModelMap map, Principal principal,@RequestParam String folderPath,@RequestParam String value,@RequestParam String user) {

		try{String resp="";
		String userid="";
		if(principal==null){return "ajaxTrue";}else{
		if(principal.getName().contains("@")){
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
			RemoveAssignedPermissionResponse response = documentModuleClient
				.removeAssignedPermission(folderPath.trim(), userid.trim(),principal.getPassword().trim(), user.trim(), value.trim());
		 	resp = response.getAssignSinglePermissionResponse();
			//MailUtils.sendComposeMail("192.168.0.53", "25", "edms@avi-oil.com", "google@2009", userid, "Shared with me", "This is mail to inform you that someone have shared document with you.");
			return resp;
		} 
	}catch(Exception e){

		return "ajaxTrue";
	}
	}
	

	@RequestMapping(value = "/moveDoc", method = RequestMethod.GET)
	@ResponseBody
	public String moveDoc(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String sourcePath,@RequestParam String destPath) {
		try{
			String ret="";
			boolean flag=true;
		if(principal==null){return "ajaxTrue";}else{
			String[] str=sourcePath.split(",");
			for (int i = 0; i < str.length; i++) {
			ret=	str[i].substring(0,str[i].lastIndexOf("/"));
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
		MoveDocResponse response = documentModuleClient.moveDoc(str[i],  destPath,userid,principal.getPassword());
		flag=response.isSuccess();
		}
			if(flag){
				return ret+",delma,"+"Moved Successfully";
				}else{
				return ret+",delma,"+"Error while moving.";
				}
		} 
	}catch(Exception e){

		return "ajaxTrue";
	}
	}

	@RequestMapping(value = "/copyDoc", method = RequestMethod.GET)
	@ResponseBody
	public String copyDoc(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String sourcePath,@RequestParam String destPath) {
		try{
		if(principal==null){return "ajaxTrue";}else{
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
		CopyDocResponse response = documentModuleClient.copyDoc(str[i],  destPath,userid,principal.getPassword());
		}
		return destPath;
		} 
	}catch(Exception e){

		return "ajaxTrue";
	}
	}
	@RequestMapping(value = "/sharingPopup", method = RequestMethod.GET)
	public String sharingPopup(ModelMap map, Principal principal,
			HttpServletRequest request) {
		try{
		if(principal==null){
			return "ajaxTrue";
			}else{
		HttpSession hs = request.getSession(false);
		String folderName = (String) hs.getAttribute("currentDoc");
		String userid="";
		if(principal.getName().contains("@")){
				userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		if(folderName!=""){
			GetFolderByPathResponse folderByPath = documentModuleClient
					.getFolderByPath(folderName, userid,principal.getPassword());
			map.addAttribute("currentFolder",folderByPath.getFolder());
		}else{
			folderName=(String) hs.getAttribute("currentFile");
			GetFolderByPathResponse folderByPath = documentModuleClient
					.getFolderByPath(folderName, userid,principal.getPassword());
			map.addAttribute("currentFolder",folderByPath.getFolder());
		}
		GetUsersListResponse response = this.userClient.getUsersListRequest(userid,principal.getPassword());
        map.addAttribute("userlist", (Object)response.getUsersList());
		return "sharingPopup";
		} 
	}catch(Exception e){

		return "ajaxTrue";
	}
	}
	@RequestMapping(value = "/sharingPopupOfFile", method = RequestMethod.GET)
	public String sharingPopupOfFile(ModelMap map, Principal principal,
			HttpServletRequest request) {
		try{
		if(principal==null){
			return "ajaxTrue";
			}else{
		HttpSession hs = request.getSession(false);
		String folderName = (String) hs.getAttribute("currentFile");
		String userid="";
		if(principal.getName().contains("@")){
				userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
	
			GetFolderByPathResponse folderByPath = documentModuleClient
					.getFolderByPath(folderName, userid,principal.getPassword());
			map.addAttribute("currentFolder",folderByPath.getFolder());
		
		GetUsersListResponse response = this.userClient.getUsersListRequest(userid,principal.getPassword());
        map.addAttribute("userlist", (Object)response.getUsersList());
		return "sharingPopup";
		} 
	}catch(Exception e){
		return "ajaxTrue";
	}
	}

	@RequestMapping(value = "/checkDocExist", method = RequestMethod.GET)
	@ResponseBody
	public String checkDocExist(ModelMap map, Principal principal,@RequestParam String docPath,
			HttpServletRequest request) {
		try{
		if(principal==null){
			return "ajaxTrue";
			}else{
		HttpSession hs = request.getSession(false);
		String folderName = (String) hs.getAttribute("currentFolder");
		String userid="";
		if(principal.getName().contains("@")){
				userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
			CheckDocExistResponse checkDocRes = documentModuleClient
					.checkDocExistRequest(docPath, userid, principal.getPassword(), folderName);
			return checkDocRes.isSuccess()+"";
		}
	}catch(Exception e){
		return "ajaxTrue";
	}
		} 
	


	@RequestMapping(value = "/createWorkspace", method = RequestMethod.GET)
	public String createWorkspace(ModelMap map, Principal principal,@RequestParam String workspaceName,
			HttpServletRequest request) {
		try{
		if(principal==null){
			return "ajaxTrue";
			}else{
		HttpSession hs = request.getSession(false);
		String folderName = (String) hs.getAttribute("currentFolder");
		String userid="";
		if(principal.getName().contains("@")){
				userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
			CreateWorkspaceResponse checkDocRes = documentModuleClient
					.createWorkspaceRequest(userid, principal.getPassword(), workspaceName);
			return checkDocRes.getResponseMessage();
		}
	}catch(Exception e){
		return "ajaxTrue";
	}
		} 
	
	
	
	
	
	/*@RequestMapping(value = "/multipleCopy", method = RequestMethod.POST)
	@ResponseBody
	public String multipleCopy(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String path, @RequestParam String sourcePath,@RequestParam String destPath) {
		String[] str=sourcePath.split(",");
		for (int i = 0; i < str.length; i++) {
		if(principal==null){}else{
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
