package edms.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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

		HttpSession hs=request.getSession(false);
		String folderPath="";
		if(hs!=null){
			folderPath=(String)hs.getAttribute("currentFolder");
		}
		String userid=principal.getName()+Config.EDMS_DOMAIN;
		if(folderPath.equals("")){
			hs.setAttribute("currentFolder","/"+userid);
			folderPath="/"+userid;
		}
		System.out.println(userid+" "+name);
		GetFolderByPathResponse folderResponse = documentModuleClient.getFolderByPath(folderPath,principal.getName()+Config.EDMS_DOMAIN);
		
		SearchDocByLikeResponse searchResponse=documentModuleClient.searchDocByLike(name,folderPath,Config.EDMS_NAME,userid);
		List<Folder> folderList = searchResponse.getSearchedFolders().getFoldersList().getFolderList();
		map.addAttribute("folderList", folderList);
		List<edms.wsdl.File> fileList=searchResponse.getSearchedFolders().getFilesList().getFileList();
		map.addAttribute("fileList", fileList);
		map.addAttribute("userid",principal.getName()+"@avi-oil.com");
		map.addAttribute("currentFolder",folderResponse.getFolder());
		return "searchResult";
	}

	@RequestMapping(value="/getDocsByKeyWords")
	public String getDocsByKeyWords(Principal principal,ModelMap map,@RequestParam String name,HttpServletRequest request){

		HttpSession hs=request.getSession(false);
		String folderPath="";
		if(hs!=null){
			folderPath=(String)hs.getAttribute("currentFolder");
		}
		String userid=principal.getName()+Config.EDMS_DOMAIN;
		if(folderPath.equals("")){
			hs.setAttribute("currentFolder","/"+userid);
			folderPath="/"+userid;
		}
		System.out.println(userid+" "+name);
		GetFolderByPathResponse folderResponse = documentModuleClient.getFolderByPath(folderPath,principal.getName()+Config.EDMS_DOMAIN);
		
		SearchDocByLikeResponse searchResponse=documentModuleClient.searchDocByLike(name,folderPath,Config.EDMS_KEYWORDS,userid);
		List<Folder> folderList = searchResponse.getSearchedFolders().getFoldersList().getFolderList();
		map.addAttribute("folderList", folderList);
		List<edms.wsdl.File> fileList=searchResponse.getSearchedFolders().getFilesList().getFileList();
		map.addAttribute("fileList", fileList);
		map.addAttribute("userid",principal.getName()+"@avi-oil.com");
		map.addAttribute("currentFolder",folderResponse.getFolder());
		return "searchResult";
	}


	@RequestMapping(value="/getDocsByDate")
	public String getDocsByDate(Principal principal,ModelMap map,@RequestParam String name,HttpServletRequest request){

		HttpSession hs=request.getSession(false);
		String folderPath="";
		if(hs!=null){
			folderPath=(String)hs.getAttribute("currentFolder");
		}
		String userid=principal.getName()+Config.EDMS_DOMAIN;
		if(folderPath.equals("")){
			hs.setAttribute("currentFolder","/"+userid);
			folderPath="/"+userid;
		}
		System.out.println(userid+" "+name);
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat format = new SimpleDateFormat(
				"YYYY-MM-dd'T'HH:mm:ss.SSSZ");
		String date=format.format(cal.getTime());
		System.out.println(cal.getTime());
		System.out.println(date);
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
		GetFolderByPathResponse folderResponse = documentModuleClient.getFolderByPath(folderPath,principal.getName()+Config.EDMS_DOMAIN);
		SearchDocByDateResponse searchResponse=documentModuleClient.searchDocByDate(name,folderPath,Config.EDMS_MODIFICATIONDATE,userid);
		List<Folder> folderList = searchResponse.getSearchedFolders().getFoldersList().getFolderList();
		map.addAttribute("folderList", folderList);
		List<edms.wsdl.File> fileList=searchResponse.getSearchedFolders().getFilesList().getFileList();
		map.addAttribute("fileList", fileList);
		map.addAttribute("userid",principal.getName()+"@avi-oil.com");
		map.addAttribute("currentFolder",folderResponse.getFolder());
		return "searchResult";
	}
	
	
	
}
