package edms.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import edms.core.Config;
import edms.model.UploadedFile;
import edms.webservice.client.FileClient;
import edms.webservice.client.FolderClient;
import edms.wsdl.CreateFileRequest;
import edms.wsdl.CreateFileResponse;
import edms.wsdl.CreateFolderResponse;
import edms.wsdl.Folder;
import edms.wsdl.GetFileByPathResponse;
import edms.wsdl.GetFileResponse;
import edms.wsdl.GetFolderByPathResponse;
import edms.wsdl.GetFolderResponse;

@Controller
public class DocumentController {
	public static final String FILE_UPLOAD_STATUS = "file_upload_status";
	@Autowired private FileClient fileClient;
	@Autowired private FolderClient folderClient;
	
	private Integer IMAGE_MAX_SIZE = 1024000;
	
	// list of allowed file extensions
	private Set<String> allowedImageExtensions;
	
	// list of error messages
	private List<String> errorMsgs = new ArrayList<String>();
	

	@RequestMapping("/uploadDocumentByJcr")
	public String uploadDocumentByJcr(@ModelAttribute(value="fileupload")UploadedFile fileupload,BindingResult result,
			ModelMap map,Principal principal,HttpServletRequest request, HttpServletResponse response){
		String res="";
		this.allowedImageExtensions = new HashSet<String>();
		this.allowedImageExtensions.add("png");
		this.allowedImageExtensions.add("bmp");
		this.allowedImageExtensions.add("jpg");
		this.allowedImageExtensions.add("jpeg");
		this.allowedImageExtensions.add("gif");
		this.allowedImageExtensions.add("xif");
		this.allowedImageExtensions.add("txt");
		this.allowedImageExtensions.add("docx");
		this.allowedImageExtensions.add("pdf");
		this.allowedImageExtensions.add("pod");
		this.allowedImageExtensions.add("vcf");
		System.out.println("in file upload "+fileupload);
		List<MultipartFile> multifiles=fileupload.getFiledata();
		System.out.println("no.of files="+multifiles.size());
		System.out.println("multiple is"+multifiles.isEmpty());
		MultipartFile mpf = multifiles.get(0);
		String fname=mpf.getOriginalFilename();
		System.out.println("get 0="+fname);
			
		String filename=null;
		try{
			if(multifiles.size()>10){
				map.addAttribute("errorMsgs",this.errorMsgs);
				map.addAttribute("fileuploaderror","true");
				return "error occured";
			}
			for (MultipartFile filecheck:multifiles){
				System.out.println("image in multiple="+filecheck.getOriginalFilename());
			if (filecheck.getSize()>0){
				filename=filecheck.getOriginalFilename().replace(" ", "-");
				String extension=FilenameUtils.getExtension(filename);
				System.out.println("file extenson="+extension);
				InputStream is=filecheck.getInputStream();
				byte[] iss=IOUtils.toByteArray(is);
				System.out.println("stream of file is : "+is);
				if (!this.allowedImageExtensions.contains(extension)){
					System.out.println("inside file extension check");
				//	addError("Incorrect file extension! Only PNG, BMP, JPG, JPEG, GIF, XIF are allowed");
					map.addAttribute("errorMsgs",this.errorMsgs);
					map.addAttribute("fileuploaderror","true");
					return "error occured";
				}
				if (filecheck.getSize()>IMAGE_MAX_SIZE){
				//	addError("File size too large.Must be maximum 500MB");
					map.addAttribute("errorMsgs",this.errorMsgs);
					map.addAttribute("fileuploaderror","true");
					return "error occured";
				}
				HttpSession hs = request.getSession(false);
				String notes="this file is testing file";
				String keywords="this,file,is,testing,file";
				String parentFolder = (String) hs.getAttribute("currentFolder");
				CreateFileResponse createFileResponse =fileClient.createFile(
						filename,parentFolder, principal.getName()+Config.EDMS_DOMAIN,keywords,notes, is.toString()	);
				edms.wsdl.File file = createFileResponse.getFile();
				String newFile="";
				if(file!=null){
				newFile = "<li   class='select_box target' id='"
						+file.getFilePath()
						+ "' ondblclick='getFileSystem(this.id)' >"
						+ "<div class='file_icon'></div>  <span>"
						/*+ file.getFilePath().substring(file.getFilePath().lastIndexOf('/') + 1)*/
						+ "</span>" 
						+ "</li>";
				}else{
					res= "access denied"; 
				}
				res= newFile;
			}
			else {
				System.out.println("in else");
				res= "please select a file";
			}
			}
			    res= "welcome";
		}
		catch (IOException ie){
				ie.printStackTrace();
			}
		return res;
	}
	public void updateSessionManager(HttpServletRequest request) {
		//HttpSessionManager.getInstance().update(request.getSession().getId());
	}
	
	@RequestMapping(value = "/getFileProperties", method = RequestMethod.GET)
	public String getDocProperties(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String path) {
	//listLdapUsersDetails(principal.getName()+Config.EDMS_DOMAIN);
	HttpSession hs = request.getSession(false);
	if (hs != null) {
		hs.setAttribute("currentFile", path);
		System.out.println("session value of currentFile : "+(String) hs.getAttribute("currentFile"));
		
	}
	String[] str = path.split("/");
	String calcPath = "";
	for (int i = 1; i < str.length; i++) {
		calcPath += "/" + str[i];
	}
	hs.setAttribute("currentFolder", calcPath);
	GetFileByPathResponse fileByPath=fileClient.getFileByPath(calcPath,principal.getName()+Config.EDMS_DOMAIN);
	edms.wsdl.File fileNode=fileByPath.getFile();
//	List<Folder> folderList = folderResponse.getGetFoldersByParentFolder()
//			.getFolderListResult().getFolderList();
	GetFileResponse fileResponse=fileClient.getFileRequest(calcPath, principal.getName()+Config.EDMS_DOMAIN);
	List<edms.wsdl.File> fileList=fileResponse.getGetFilesByParentFile().getFileListResult().getFileList();

	map.addAttribute("currentFolder",fileNode);
	map.addAttribute("breadcum",calcPath);
	map.addAttribute("fileList", fileList);
	map.addAttribute("userid",principal.getName()+Config.EDMS_DOMAIN);
	return "getFileProperties";
}
	
	@RequestMapping(value = "/setCurrentFile", method = RequestMethod.POST)
	@ResponseBody
	public String setCurrentFolder(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String path) {
		HttpSession hs = request.getSession(false);
		hs.setAttribute("currentFile", path);
		return "";
	}
}
