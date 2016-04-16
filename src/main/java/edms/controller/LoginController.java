package edms.controller;

import java.util.List;

import edms.core.Config;
import edms.core.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edms.model.LoginModel;
import edms.webservice.client.DocumentModuleClient;
import edms.webservice.client.UserClient;
import edms.wsdl.Folder;
import edms.wsdl.GetFileWithOutStreamResponse;
import edms.wsdl.GetFolderByPathResponse;
import edms.wsdl.GetFolderResponse;
import edms.wsdl.GetUsersListResponse;

@Controller
public class LoginController {

	@Autowired DocumentModuleClient documentModuleClient;
	@Autowired UserClient userClient;
	
	@RequestMapping(value="/index", method=RequestMethod.GET)
	public String getLogin(ModelMap map,Principal principal,HttpServletRequest request,String userName,String password){
		System.out.println("in index..........");
			HttpSession hs = request.getSession(false);
			if(hs!=null){
		try{
			
			if(hs.isNew()||hs==null){
				return "login";
			}else{
			userName=(String)hs.getAttribute("userName");
			password=(String)hs.getAttribute("password");
			
			if (hs.getAttribute("currentFolder") == null) {
				if(principal.getName().contains("@")){
						hs.setAttribute("currentFolder", "/"+principal.getName());
						hs.setAttribute("currentDoc", "/"+principal.getName());
					}else{
						hs.setAttribute("currentFolder", "/"+principal.getName()+Config.EDMS_DOMAIN);
						hs.setAttribute("currentDoc", "/"+principal.getName()+Config.EDMS_DOMAIN);
					}
				}
			String path="";
			if(principal.getName().contains("@")){
				path = "/"+principal.getName();	
				Config.EDMS_DOMAIN=principal.getName().substring(principal.getName().lastIndexOf("@")+1);
			}else{
			path = "/"+principal.getName()+Config.EDMS_DOMAIN;
			}
			String userid="";
			if(principal.getName().contains("@")){
				userid=principal.getName();
				}else{
					userid=principal.getName()+Config.EDMS_DOMAIN;
				}
			
			Config.EDMS_DOMAIN=userid.substring(userid.lastIndexOf("@")+1);
			
			GetFolderByPathResponse folderByPath=null;
			 folderByPath=documentModuleClient.getFolderByPath(path,userid,principal.getPassword());
			GetFolderResponse folderResponse = documentModuleClient.getFolderRequest(path,userid,principal.getPassword());
			GetFileWithOutStreamResponse fileResponse = documentModuleClient.getFileWithOutStreamRequest(
					path, userid,principal.getPassword());
			List<edms.wsdl.File> fileList = fileResponse.getGetFilesByParentFile()
					.getFileListResult().getFileList();
			map.addAttribute("fileList", fileList);
			List<Folder> folderList = folderResponse.getGetFoldersByParentFolder()
					.getFolderListResult().getFolderList();
			documentModuleClient.printResponse(folderResponse);	
			Folder folderNode=folderByPath.getFolder();
			map.addAttribute("principal", principal);
			map.addAttribute("currentFolder",folderNode);
			map.addAttribute( "folderList", folderList);
			map.addAttribute("folderClient",documentModuleClient);
			map.addAttribute("userid",userid );  
			GetUsersListResponse response = this.userClient.getUsersListRequest(userid,password);
	        map.addAttribute("userlist", (Object)response.getUsersList());
			map.addAttribute("breadcumPath","/"+userid);
	        return "userDashboard";
		}
			
		}catch(Exception e){
			map.addAttribute("message", "Incorrect Username/Password");
			if(hs!=null){
				hs.invalidate();
			}
			return "login";
		}}
			else{
				return "login";
			}
		
		
		
		
		/*principalContainer.setUserName(principal.getName());
		System.out.println(principalContainer.getUserName());
		System.out.println("Logged in user name is "+principal.getName());
		principalContainer.setPassword(password);
		//map.addAttribute("loginUser", new LoginModel());
		*/		
	}
	

	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String tobelogout(ModelMap map,HttpServletResponse response,HttpServletRequest request,Principal principal){
		System.out.println("in logout..........");
		HttpSession session=request.getSession(false);
		if(session!=null)
		session.invalidate();
		//map.addAttribute("loginUser", new LoginModel());
		
		 response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	     response.setHeader("Pragma","no-cache");
	     response.setDateHeader("Expires", 0);
		
		
		return "login";
	}
	
	
	
	/*@RequestMapping(value="/login_dashboard", method=RequestMethod.GET)
	public String getUserDashboard(){
		System.out.println("in login_dashboard..........");
		return "userDashboard";
	}*/

}
