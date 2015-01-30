package edms.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import edms.core.Config;
import edms.model.UploadedFile;
import edms.webservice.client.DocumentModuleClient;
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
	@Autowired private DocumentModuleClient documentModuleClient;
	
	private Integer IMAGE_MAX_SIZE = 1024000;
	
	// list of allowed file extensions
	private Set<String> allowedImageExtensions;
	
	// list of error messages
	private List<String> errorMsgs = new ArrayList<String>();
	

	@RequestMapping("/uploadDocumentByJcr")
	@ResponseBody
	public String uploadDocumentByJcr(ModelMap map,Principal principal,MultipartHttpServletRequest request, HttpServletResponse response){
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
		File fil =null;
		String filename=null;
		try{
			
			Iterator<String> itr = request.getFileNames();
			while (itr.hasNext()){
			MultipartFile filecheck = request.getFile(itr.next());
		
				System.out.println("image in multiple="+filecheck.getOriginalFilename());
			if (filecheck.getSize()>0){
				filename=filecheck.getOriginalFilename().replace(" ", "-");
				String extension=FilenameUtils.getExtension(filename);
				System.out.println("file extenson="+extension);
				InputStream is=filecheck.getInputStream();
				//InputStream is=new FileInputStream(new File("D://1.png"));
				
				/*int idx = filename.lastIndexOf('.');
				String fileExtension = idx > 0 ? filename.substring(idx) : ".tmp";
				fil = File.createTempFile("okm", fileExtension);
				filecheck.transferTo(fil);
				FileInputStream fs=new FileInputStream(fil);*/
				//String imageBytes = IOUtils.toByteArray(is);
			/*	org.apache.commons.codec.binary.Base64
						.encodeBase64URLSafeString(IOUtils.toByteArray(is));*/
			//	String iss= IOUtils.toString(is);
				//System.out.println("stream of file is : "+is);
				if (!this.allowedImageExtensions.contains(extension)){
					System.out.println("inside file extension check");
				//	addError("Incorrect file extension! Only PNG, BMP, JPG, JPEG, GIF, XIF are allowed");
					map.addAttribute("errorMsgs",this.errorMsgs);
					map.addAttribute("fileuploaderror","true");
					res= "error occured";
				}
				if (filecheck.getSize()>IMAGE_MAX_SIZE){
				//	addError("File size too large.Must be maximum 500MB");
					map.addAttribute("errorMsgs",this.errorMsgs);
					map.addAttribute("fileuploaderror","true");
					res= "error occured";
				}
				HttpSession hs = request.getSession(false);
				String notes="this file is testing file";
				String keywords="this,file,is,testing,file";
				String parentFolder = (String) hs.getAttribute("currentFolder");
				String encodedString=org.apache.commons.codec.binary.Base64
						.encodeBase64URLSafeString(IOUtils.toByteArray(is));
				System.out.println(org.apache.commons.codec.binary.Base64
						.encodeBase64URLSafeString(IOUtils.toByteArray(is)));
				CreateFileResponse createFileResponse =documentModuleClient.createFile(
						filename,parentFolder, principal.getName()+Config.EDMS_DOMAIN,keywords,notes,encodedString);
				edms.wsdl.File file = createFileResponse.getFile();
				String newFile="";
				if(file!=null){
					newFile="<li onclick='getFileProperties(this.id)' class='select_box target'"+
							" id='"+file.getFilePath()+"' ondblclick='getFileContent(this.id)'>";
							
								if(file.getFileName().contains(".pdf")){
									newFile+=	"<div class='pdf_icon'></div> ";
	 	}else if(file.getFileName().contains(".doc")){
	 		newFile+=	"	<div class='msoffice_icon'></div> ";
	 	}else if(file.getFileName().contains(".xls")){
	 		newFile+=	"	<div class='msexcel_icon'></div>";
	 	}else if(file.getFileName().contains(".ppt")){
	 		newFile+=	"	<div class='ppt_icon'></div> ";
	 	}else{
	 		newFile+=	"	<div class='pdf_icon'></div> ";
	 	}
						 		newFile+=	" <span>"+file.getFileName()+"</span></li>";
						 		res+= newFile;
				}else{
					return ",Error Occured"; 
				}
				
			}
			else {
				System.out.println("in else");
				res= "please select a file";
			}
			
			}
			return res+",Successfully Uploaded";
			    
		}
		catch (IOException ie){
			res=",Error Occured";
				ie.printStackTrace();
			}
		finally{
			
			org.apache.commons.io.FileUtils.deleteQuietly(fil);
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
	hs.setAttribute("currentFile", calcPath);
	hs.setAttribute("currentFolder", "");
	GetFileByPathResponse fileByPath=documentModuleClient.getFileByPath(calcPath,principal.getName()+Config.EDMS_DOMAIN);
	edms.wsdl.File fileNode=fileByPath.getFile();
	System.out.println(fileNode.getFileContent());
	//	List<Folder> folderList = folderResponse.getGetFoldersByParentFolder()
	//			.getFolderListResult().getFolderList();
	GetFileResponse fileResponse=documentModuleClient.getFileRequest(calcPath, principal.getName()+Config.EDMS_DOMAIN);
	List<edms.wsdl.File> fileList=fileResponse.getGetFilesByParentFile().getFileListResult().getFileList();

	map.addAttribute("currentFolder",fileNode);
	map.addAttribute("breadcum",calcPath);
	map.addAttribute("fileList", fileList);
	map.addAttribute("userid",principal.getName()+Config.EDMS_DOMAIN);
	return "getFileProperties";
}
	
	@RequestMapping(value = "/setCurrentFile", method = RequestMethod.POST)
	@ResponseBody
	public String setCurrentFile(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String path) {
		HttpSession hs = request.getSession(false);
		hs.setAttribute("currentFile", path);
		hs.setAttribute("currentFolder", "");
		return "";
	}

	@RequestMapping(value = "/getFileContent", method = RequestMethod.GET)
	public void getFileContent(ModelMap map, Principal principal,
			HttpServletRequest request,
			HttpServletResponse response, @RequestParam String folderPath) {
				try {
					GetFileByPathResponse fileByPath=documentModuleClient.getFileByPath(folderPath,principal.getName()+Config.EDMS_DOMAIN);
					edms.wsdl.File fileNode=fileByPath.getFile();
					
					byte[] imageBytes = org.apache.commons.codec.binary.Base64.decodeBase64(fileNode.getFileContent());
					String iss;
						iss = IOUtils.toString(imageBytes);
				InputStream inStream =  IOUtils.toInputStream(iss);
				System.out.println("content of file is : "+fileNode.getFileContent());
				// forces download
				String headerKey = "Content-Disposition";
				String headerValue = String.format("attachment; filename=\"%s\"", fileNode.getFileName());
				response.setHeader(headerKey, headerValue);
		
				// obtains response's output stream
				OutputStream outStream = response.getOutputStream();
		
				byte[] buffer = new byte[4096];
				int bytesRead = -1;
		
				while ((bytesRead = inStream.read(buffer)) != -1) {
				outStream.write(buffer, 0, bytesRead);
				}
				
				inStream.close();
				outStream.close();
					}catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
				
		
		
		
		/* try {	GetFileByPathResponse fileByPath=documentModuleClient.getFileByPath(folderPath,principal.getName()+Config.EDMS_DOMAIN);
		edms.wsdl.File fileNode=fileByPath.getFile();
		  String headerKey = "Content-Disposition";
          String headerValue = String.format("attachment; filename=\"%s\"",  fileNode.getFileName());
          response.setHeader(headerKey, headerValue);
          System.out.println(fileNode.getFileContent()+ " is file");
          InputStream input =IOUtils.toInputStream(fileNode.getFileContent());
          String destFilePath = "/" +  fileNode.getFileName();
          //OutputStream output = response.getOutputStream();
          FileOutputStream output = new FileOutputStream(destFilePath);
          byte[] buffer = new byte[4096];

          int byteRead;

          while ((byteRead = input.read(buffer)) != -1) {
            
				output.write(buffer, 0, byteRead);
			
          output.close();
             } }catch (IOException e) {
 				// TODO Auto-generated catch block
 				e.printStackTrace();
 			}
		*/
	}
}
