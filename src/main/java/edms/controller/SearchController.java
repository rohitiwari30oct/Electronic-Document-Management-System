package edms.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edms.core.Config;
import edms.webservice.client.DocumentModuleClient;
import edms.wsdl.Folder;
import edms.wsdl.GetFolderByPathResponse;
import edms.wsdl.SearchDocByDateResponse;
import edms.wsdl.SearchDocByLikeResponse;

@Controller
public class SearchController {

	@Autowired DocumentModuleClient documentModuleClient;

	@RequestMapping(value="/searchDocByName")
	public String searchDocByName(Principal principal,ModelMap map,@RequestParam String name,HttpServletRequest request){
		if(principal!=null){
		HttpSession hs=request.getSession(false);
		String folderPath="";
		if(hs!=null){
			folderPath=(String)hs.getAttribute("currentFolder");
		}
		String userid="";
		if(principal.getName().contains("@")){
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		if(folderPath.equals("")){
			hs.setAttribute("currentFolder","/"+userid);
			hs.setAttribute("currentDoc", "/"+userid);
			folderPath="/"+userid;
		}
		folderPath="/"+userid;
		//System.out.println(userid+" "+name);
		GetFolderByPathResponse folderResponse = documentModuleClient.getFolderByPath(folderPath,userid);
		/*if(name.split("/").length>3)
		name=name.replaceFirst("/", " ");*/
		
		
		if(name.indexOf(".")>0)
		{
			
			name=name.replaceFirst("-", " ");
			name=name.replace(".", " ");
			//System.out.println(name);
			//name=name.substring(0,name.indexOf("."))+" "+name.substring(name.indexOf(".")+1);
		}
		else{
			name=name.replace("-", " ");
		}
		
		SearchDocByLikeResponse searchResponse=documentModuleClient.searchDocByLike(name,folderPath,Config.EDMS_NAME,userid);
		List<Folder> folderList = searchResponse.getSearchedFolders().getFoldersList().getFolderList();
		map.addAttribute("folderList", folderList);
		List<edms.wsdl.File> fileList=searchResponse.getSearchedFolders().getFilesList().getFileList();
		map.addAttribute("fileList", fileList);
		map.addAttribute("userid",userid);
		map.addAttribute("currentFolder",folderResponse.getFolder());
		return "fileSystem";
		}else{
			return "ajaxTrue";
		}
	}

	@RequestMapping(value="/getDocsByKeyWords")
	public String getDocsByKeyWords(Principal principal,ModelMap map,@RequestParam String name,HttpServletRequest request){

		if(principal!=null){
		HttpSession hs=request.getSession(false);
		String folderPath="";
		if(hs!=null){
			folderPath=(String)hs.getAttribute("currentFolder");
		}
		String userid="";
		if(principal.getName().contains("@")){
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		if(folderPath.equals("")){
			hs.setAttribute("currentFolder","/"+userid);
			hs.setAttribute("currentDoc", "/"+userid);
			folderPath="/"+userid;
		}
		folderPath="/"+userid;
		//System.out.println(userid+" "+name);
		GetFolderByPathResponse folderResponse = documentModuleClient.getFolderByPath(folderPath,userid);
		if(name.split("/").length>3)
		name=name.replaceFirst("/", " ");
		name=name.replace("-", " ");
		SearchDocByLikeResponse searchResponse=documentModuleClient.searchDocByLike(name,folderPath,Config.EDMS_KEYWORDS,userid);
		List<Folder> folderList = searchResponse.getSearchedFolders().getFoldersList().getFolderList();
		map.addAttribute("folderList", folderList);
		List<edms.wsdl.File> fileList=searchResponse.getSearchedFolders().getFilesList().getFileList();
		map.addAttribute("fileList", fileList);
		map.addAttribute("userid",userid);
		map.addAttribute("currentFolder",folderResponse.getFolder());
		return "fileSystem";}else{
			return "ajaxTrue";
		}
	}


	@RequestMapping(value="/getDocsByDate")
	public String getDocsByDate(Principal principal,ModelMap map,@RequestParam String name,HttpServletRequest request){

		if(principal!=null){
		HttpSession hs=request.getSession(false);
		String folderPath="";
		if(hs!=null){
			folderPath=(String)hs.getAttribute("currentFolder");
		}
		String userid="";
		if(principal.getName().contains("@")){
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		if(folderPath.equals("")){
			hs.setAttribute("currentFolder","/"+userid);
			hs.setAttribute("currentDoc", "/"+userid);
			folderPath="/"+userid;
		}
		//System.out.println(userid+" "+name);
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat format = new SimpleDateFormat(
				"YYYY-MM-dd'T'HH:mm:ss.SSSZ");
		String date=format.format(cal.getTime());
		//System.out.println(cal.getTime());
		//System.out.println(date);
		switch (name) {
		case "yyyy":
		{
			name=date.substring(0, 4);
			break;
		}			
		case "mm":
		{
			name=date.substring(0, 7);
			break;
		}
		case "dd":
		{
			name=date.substring(0, 10);
			break;
		}
		case "hh":
		{
			name=date.substring(0, 13);
			break;
		}
		default:
			break;
		}
		folderPath="/"+userid;
		GetFolderByPathResponse folderResponse = documentModuleClient.getFolderByPath(folderPath,userid);
		SearchDocByDateResponse searchResponse=documentModuleClient.searchDocByDate(name,folderPath,Config.EDMS_MODIFICATIONDATE,userid);
		List<Folder> folderList = searchResponse.getSearchedFolders().getFoldersList().getFolderList();
		map.addAttribute("folderList", folderList);
		List<edms.wsdl.File> fileList=searchResponse.getSearchedFolders().getFilesList().getFileList();
		map.addAttribute("fileList", fileList);
		map.addAttribute("userid",userid);
		map.addAttribute("currentFolder",folderResponse.getFolder());
		return "fileSystem";}else{
			return "ajaxTrue";
		}
	}
	
	
	
}
