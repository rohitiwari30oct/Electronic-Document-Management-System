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
import org.springframework.web.multipart.MultipartFile;

import edms.core.Config;
import edms.model.UploadedFile;
import edms.webservice.client.FileClient;
import edms.wsdl.CreateFileRequest;
import edms.wsdl.CreateFileResponse;
import edms.wsdl.CreateFolderResponse;
import edms.wsdl.Folder;

@Controller
public class DocumentController {
	public static final String FILE_UPLOAD_STATUS = "file_upload_status";
	@Autowired private FileClient fileClient;
	
	private Integer IMAGE_MAX_SIZE = 1024000;
	
	// list of allowed file extensions
	private Set<String> allowedImageExtensions;
	
	// list of error messages
	private List<String> errorMsgs = new ArrayList<String>();
	

	@RequestMapping("/uploadDocumentByJcr")
	public String uploadDocumentByJcr(@ModelAttribute(value="fileupload")UploadedFile fileupload,BindingResult result,
			ModelMap map,Principal principal,HttpServletRequest request, HttpServletResponse response){

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
				return "createAlbum";
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
					return "createAlbum";
				}
				if (filecheck.getSize()>IMAGE_MAX_SIZE){
				//	addError("File size too large.Must be maximum 500MB");
					map.addAttribute("errorMsgs",this.errorMsgs);
					map.addAttribute("fileuploaderror","true");
					return "createAlbum";
				}
				HttpSession hs = request.getSession(false);
				String notes="this folder is testing folder";
				String keywords="this,folder,is,testing,folder";
				String parentFolder = (String) hs.getAttribute("currentFolder");
				CreateFileResponse createFileResponse =fileClient.createFile(
						filename, parentFolder, principal.getName()+Config.EDMS_DOMAIN,keywords,notes);
				edms.wsdl.File file = createFileResponse.getFile();
				String newFile="";
				if(file!=null){
				newFile = "<li   class='select_box target' id='"
						+file.getFilePath()
						+ "' ondblclick='getFileSystem(this.id)' >"
						+ "<div class='folder_icon'></div>  <span>"
						+ file.getFilePath().substring(file.getFilePath().lastIndexOf('/') + 1)
						+ "</span>" 
						+ "</li>";
				}else{
					return "access denied"; 
				}
				return newFile;
			}
			else {
				System.out.println("in else");
				return "please select a file";
			}
			}
			    return "index";
		}
		catch (IOException ie){
				ie.printStackTrace();
			}
		return "index";
	}
	public void updateSessionManager(HttpServletRequest request) {
		//HttpSessionManager.getInstance().update(request.getSession().getId());
	}
	
	
	
}
