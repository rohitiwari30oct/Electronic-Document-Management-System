package edms.controller;

import edms.core.Principal;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edms.core.Config;
import edms.webservice.client.DocumentModuleClient;
import edms.wsdl.Folder;
import edms.wsdl.SearchDocByDateResponse;

@Controller
public class UserStatisticsController {

	@Autowired DocumentModuleClient documentModuleClient;

	@RequestMapping(value = "/userStatistics", method = RequestMethod.GET)
	public String getStatistics(Principal principal,ModelMap map,HttpServletRequest request) {
	
		try{
		if(principal==null){return "ajaxTrue";}else{
		String name="";
		HttpSession hs=request.getSession(false);
		String folderPath="";
		if(hs!=null){
			folderPath=(String)hs.getAttribute("currentFolder");
		}
		String userid=principal.getName()+Config.EDMS_DOMAIN;
		if(folderPath.equals("")){
			hs.setAttribute("currentFolder","/"+userid);
			hs.setAttribute("currentDoc", "/"+userid);
			folderPath="/"+userid;
		}
		folderPath="/"+userid;
		System.out.println(userid+" "+name);
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat format = new SimpleDateFormat(
				"YYYY-MM-dd'T'HH:mm:ss.SSSZ");
		String date=format.format(cal.getTime());
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
		name=date.substring(0, 7);
		SearchDocByDateResponse searchResponse=documentModuleClient.searchDocByDate(name,folderPath,Config.EDMS_MODIFICATIONDATE,userid,principal.getPassword());
		List<Folder> folderList = searchResponse.getSearchedFolders().getFoldersList().getFolderList();
		List<edms.wsdl.File> fileList=searchResponse.getSearchedFolders().getFilesList().getFileList();
		map.addAttribute("lastMonthModifiedFolderList", folderList);
		map.addAttribute("lastMonthModifiedFileList", fileList);
		searchResponse=documentModuleClient.searchDocByDate(name,folderPath,Config.EDMS_CREATIONDATE,userid,principal.getPassword());
		folderList = searchResponse.getSearchedFolders().getFoldersList().getFolderList();
		fileList=searchResponse.getSearchedFolders().getFilesList().getFileList();
		map.addAttribute("lastMonthCreatedFolderList", folderList);
		map.addAttribute("lastMonthCreatedFileList", fileList);
		return "userStatistics";}
	}catch(Exception e){

		return "ajaxTrue";
	}
	}
	
}
