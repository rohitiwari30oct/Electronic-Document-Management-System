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

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class DocumentController {
	public static final String FILE_UPLOAD_STATUS = "file_upload_status";
//	@Autowired public DocumentModule documentModule;
	
	private Integer IMAGE_MAX_SIZE = 1024000;
	
	// list of allowed file extensions
	private Set<String> allowedImageExtensions;
	
	// list of error messages
	private List<String> errorMsgs = new ArrayList<String>();
	/*
	@RequestMapping("/uploadDocument")
	public String uploadDocument(@ModelAttribute(value="fileupload")UploadedFile fileupload,BindingResult result,
			ModelMap map,Principal principal,HttpServletRequest request, HttpServletResponse response){

				// Parse the request and get all parameters and the uploaded
				// file
		//String userid=principal.getName();
		//User users = userService.getUserByUUID(userid);
		//map.addAttribute("reglist", reglist);
		//map.addAttribute("memberInfoService", memberInfoService);
		//map.addAttribute("error","false");
		//map.addAttribute("albumdetails",new UploadedFile());
		//map.addAttribute("uploadpopup","false");
		//List<DocumentFile> malist = memoriesAlbumService.getAlbumByUserid(userid);
		map.addAttribute("malist",malist);
		map.addAttribute("userid",userid);
		map.addAttribute("memservice",memoriesAlbumPhotoService);
		
		// the state of the controller is preserved between calls, so each time
		// we need to clear the error messages from the previous submission
		// clearMessages();
		
		this.allowedImageExtensions = new HashSet<String>();
		this.allowedImageExtensions.add("png");
		this.allowedImageExtensions.add("bmp");
		this.allowedImageExtensions.add("jpg");
		this.allowedImageExtensions.add("jpeg");
		this.allowedImageExtensions.add("gif");
		this.allowedImageExtensions.add("xif");

		List<MultipartFile> multifiles=fileupload.getFiledata();
		System.out.println("no.of files="+multifiles.size());
		System.out.println("multiple is"+multifiles.isEmpty());
		MultipartFile mpf = multifiles.get(0);
		String fname=mpf.getOriginalFilename();
		System.out.println("get 0="+fname);
			
		String filename=null;
		int photoid=0;
		int albumid=0;
		String albumname=fileupload.getAlbumname();
		System.out.println("album name in controller="+albumname);
		try{
			if(multifiles.size()>10){
			//	addError("You can upload only 10 pictures at once");
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
				DocumentFile doc=new DocumentFile();
				doc.setFilePath("D://"+filename);
				InputStream is=filecheck.getInputStream();
				
				try {
					doc=documentModule.create("", doc, is, filecheck.getSize(), "rohit@silvereye.co", null);
				} catch (UnsupportedMimeTypeException
						| FileSizeExceededException
						| UserQuotaExceededException | VirusDetectedException
						| ItemExistsException | PathNotFoundException
						| AccessDeniedException | RepositoryException
						| DatabaseException | ExtensionException
						| AutomationException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
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
			}
			else {
				System.out.println("in else");
			//	addError("Select at least one picture");
				map.addAttribute("errorMsgs",this.errorMsgs);
				map.addAttribute("fileuploaderror","true");
				return "createAlbum";
			}
			}
		//	List<Memories_Album_Photo> album_photo=new ArrayList<Memories_Album_Photo>();
			for (MultipartFile file:multifiles){
				System.out.println("in file upload code");
				java.util.Date dt=new  java.util.Date();
				java.sql.Date date = new java.sql.Date(dt.getTime());
			    DocumentFile documentFile = new DocumentFile();
			}
				
				for (MultipartFile file:multifiles){	
					albumname=fileupload.getAlbumname();
			        java.util.Date dt=new  java.util.Date();
			 	    java.sql.Date date = new java.sql.Date(dt.getTime());
			 	     List<Memories_Album> malst = memoriesAlbumService.getAlbumByNameAndUseridAndDate(albumname, userid, date);
				    for(Memories_Album ma:malst){
				    	albumid=ma.getAlbumid();
				    }
				    System.out.println("album id is="+albumid);
				    filename=file.getOriginalFilename().replace(" ", "-");
				    List<Memories_Album_Photo> mplist = memoriesAlbumPhotoService.getPhotoByAlbumIdAndPhoto(albumid,filename);
			
				    for(Memories_Album_Photo mp:mplist){
				    	photoid=mp.getSn();
				    }
				    System.out.println("photo id is="+photoid);
				   
				    
				    
				    
				    File dl = new File (System.getProperty("catalina.base")+"/uploadedfiles/albums/"+"/"+albumid+"/"+photoid+"/"+filename);
			    	String datafile=System.getProperty("catalina.base")+"/uploadedfiles/albums/"+"/"+albumid+"/"+photoid+"/"+filename;
			    	System.out.println("PATH="+datafile);
				    if(!dl.exists()){
				    	System.out.println("in not file"+dl.getAbsolutePath());
					    dl.mkdirs();
				    }
					file.transferTo(dl);
					System.out.println("file added");
				    map.addAttribute("message",filename);
				   // map.addAttribute("userid",userid);
				    System.out.println("before showfile");
				}
						
			//	map.addAttribute("userid",userid);
				Memories_Album memoriesAlbum=memoriesAlbumService.getAlbumByAlbumid(albumid);
				map.addAttribute("memoriesAlbum", memoriesAlbum);
			    map.addAttribute("albumid",albumid);
			    map.addAttribute("albumname",albumname);
			    map.addAttribute("albumdetail",fileupload.getAlbumdetails());
			    int last=10;
				List<Memories_Album_Photo> albumphoto = memoriesAlbumPhotoService.paginatePhotos(albumid,0,last);
			    map.addAttribute("albumphoto",albumphoto);
			    map.addAttribute("fileupload", new UploadedFile());
			    map.addAttribute("fileuploaderror","false");
			    int count=memoriesAlbumPhotoService.getPhotoCountByAlbumId(albumid);
				map.addAttribute("count", count);
				map.addAttribute("last", last);
			    return "index";
		}
		catch (IOException ie){
				ie.printStackTrace();
			}
		return "index";
	
		return "index";
	}
	@RequestMapping("/uploadDocumentByJcr")
	public String uploadDocumentByJcr(@ModelAttribute(value="fileupload")UploadedFile fileupload,BindingResult result,
			ModelMap map,Principal principal,HttpServletRequest request, HttpServletResponse response){/*

		this.allowedImageExtensions = new HashSet<String>();
		this.allowedImageExtensions.add("png");
		this.allowedImageExtensions.add("bmp");
		this.allowedImageExtensions.add("jpg");
		this.allowedImageExtensions.add("jpeg");
		this.allowedImageExtensions.add("gif");
		this.allowedImageExtensions.add("xif");

		List<MultipartFile> multifiles=fileupload.getFiledata();
		System.out.println("no.of files="+multifiles.size());
		System.out.println("multiple is"+multifiles.isEmpty());
		MultipartFile mpf = multifiles.get(0);
		String fname=mpf.getOriginalFilename();
		System.out.println("get 0="+fname);
			
		String filename=null;
		int photoid=0;
		int albumid=0;
		String albumname=fileupload.getAlbumname();
		System.out.println("album name in controller="+albumname);
		try{
			if(multifiles.size()>10){
			//	addError("You can upload only 10 pictures at once");
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
				DocumentFile doc=new DocumentFile();
				doc.setFilePath("D://"+filename);
				InputStream is=filecheck.getInputStream();
				
				try {
					doc=documentModule.create("", doc, is, filecheck.getSize(), "rohit@silvereye.co", null);
				} catch (UnsupportedMimeTypeException
						| FileSizeExceededException
						| UserQuotaExceededException | VirusDetectedException
						| ItemExistsException | PathNotFoundException
						| AccessDeniedException | RepositoryException
						| DatabaseException | ExtensionException
						| AutomationException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
				
				
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
			}
			else {
				System.out.println("in else");
			//	addError("Select at least one picture");
				map.addAttribute("errorMsgs",this.errorMsgs);
				map.addAttribute("fileuploaderror","true");
				return "createAlbum";
			}
			}
		//	List<Memories_Album_Photo> album_photo=new ArrayList<Memories_Album_Photo>();
			for (MultipartFile file:multifiles){
				System.out.println("in file upload code");
				java.util.Date dt=new  java.util.Date();
				java.sql.Date date = new java.sql.Date(dt.getTime());
			    DocumentFile documentFile = new DocumentFile();
			}
				 
				
				
				
				for (MultipartFile file:multifiles){	
					albumname=fileupload.getAlbumname();
			        java.util.Date dt=new  java.util.Date();
			 	    java.sql.Date date = new java.sql.Date(dt.getTime());
			 	     List<Memories_Album> malst = memoriesAlbumService.getAlbumByNameAndUseridAndDate(albumname, userid, date);
				    for(Memories_Album ma:malst){
				    	albumid=ma.getAlbumid();
				    }
				    System.out.println("album id is="+albumid);
				    filename=file.getOriginalFilename().replace(" ", "-");
				    List<Memories_Album_Photo> mplist = memoriesAlbumPhotoService.getPhotoByAlbumIdAndPhoto(albumid,filename);
			
				    for(Memories_Album_Photo mp:mplist){
				    	photoid=mp.getSn();
				    }
				    System.out.println("photo id is="+photoid);
				    File dl = new File (System.getProperty("catalina.base")+"/uploadedfiles/albums/"+"/"+albumid+"/"+photoid+"/"+filename);
			    	String datafile=System.getProperty("catalina.base")+"/uploadedfiles/albums/"+"/"+albumid+"/"+photoid+"/"+filename;
			    	System.out.println("PATH="+datafile);
				    if(!dl.exists()){
				    	System.out.println("in not file"+dl.getAbsolutePath());
					    dl.mkdirs();
				    }
					file.transferTo(dl);
					System.out.println("file added");
				    map.addAttribute("message",filename);
				    // map.addAttribute("userid",userid);
				    System.out.println("before showfile");
				}
						
				//	map.addAttribute("userid",userid);
				Memories_Album memoriesAlbum=memoriesAlbumService.getAlbumByAlbumid(albumid);
				map.addAttribute("memoriesAlbum", memoriesAlbum);
			    map.addAttribute("albumid",albumid);
			    map.addAttribute("albumname",albumname);
			    map.addAttribute("albumdetail",fileupload.getAlbumdetails());
			    int last=10;
				List<Memories_Album_Photo> albumphoto = memoriesAlbumPhotoService.paginatePhotos(albumid,0,last);
			    map.addAttribute("albumphoto",albumphoto);
			    map.addAttribute("fileupload", new UploadedFile());
			    map.addAttribute("fileuploaderror","false");
			    int count=memoriesAlbumPhotoService.getPhotoCountByAlbumId(albumid);
				map.addAttribute("count", count);
				map.addAttribute("last", last);
			    return "index";
		}
		catch (IOException ie){
				ie.printStackTrace();
			}
		return "index";
	
		return "index";}*/
	public void updateSessionManager(HttpServletRequest request) {
		//HttpSessionManager.getInstance().update(request.getSession().getId());
	}
}
