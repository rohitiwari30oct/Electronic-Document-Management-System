package edms.controller;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics2D;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.wimpi.telnetd.io.terminal.xterm;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.poi.hslf.model.Slide;
import org.apache.poi.hslf.usermodel.SlideShow;
import org.apache.poi.hwpf.converter.WordToHtmlConverter;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
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
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xwpf.converter.core.FileURIResolver;
import org.apache.poi.xwpf.converter.core.XWPFConverterException;
import org.apache.poi.xwpf.converter.pdf.PdfConverter;
import org.apache.poi.xwpf.converter.pdf.PdfOptions;
import org.apache.poi.xwpf.converter.xhtml.XHTMLConverter;
import org.apache.poi.xwpf.converter.xhtml.XHTMLOptions;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.tika.Tika;
import org.apache.tika.config.TikaConfig;
import org.apache.tika.detect.Detector;
import org.apache.tika.io.TikaInputStream;
import org.apache.tika.metadata.Metadata;
import org.apache.tika.mime.MediaType;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

import edms.core.Config;
import edms.model.UploadedFile;
import edms.webservice.client.DocumentModuleClient;
import edms.wsdl.CopyDocResponse;
import edms.wsdl.CreateFileRequest;
import edms.wsdl.CreateFileResponse;
import edms.wsdl.CreateFolderResponse;
import edms.wsdl.Folder;
import edms.wsdl.GetFileByPathResponse;
import edms.wsdl.GetFileByPathWithOutStreamResponse;
import edms.wsdl.GetFileResponse;
import edms.wsdl.GetFolderByPathResponse;
import edms.wsdl.GetFolderResponse;

@Controller
public class DocumentController extends HttpServlet {
	public static final String FILE_UPLOAD_STATUS = "file_upload_status";
	@Autowired
	private DocumentModuleClient documentModuleClient;

	private Integer IMAGE_MAX_SIZE =52000000;

	// list of allowed file extensions
	private Set<String> allowedImageExtensions;

	// list of error messages
	private List<String> errorMsgs = new ArrayList<String>();

	@RequestMapping("/uploadDocumentByJcr")
	@ResponseBody
	public String uploadDocumentByJcr(ModelMap map, Principal principal,
			MultipartHttpServletRequest request, HttpServletResponse response) {
		if(principal!=null){
		String res = "";
		this.allowedImageExtensions = new HashSet<String>();
		this.allowedImageExtensions.add("");
		
		
		
		

/*		this.allowedImageExtensions.add("application/javascript");
		this.allowedImageExtensions.add("image/png");
		this.allowedImageExtensions.add("image/bmp");
		this.allowedImageExtensions.add("image/jpeg");
		this.allowedImageExtensions.add("image/gif");
		this.allowedImageExtensions.add("application/msword");
		this.allowedImageExtensions.add("text/plain");
		this.allowedImageExtensions.add("application/vnd.openxmlformats-officedocument.wordprocessingml.document");
		this.allowedImageExtensions.add("application/pdf");
		this.allowedImageExtensions.add("application/vnd.ms-excel");
		this.allowedImageExtensions.add("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
		this.allowedImageExtensions.add("text/csv");
		this.allowedImageExtensions.add("text/x-vcard");
		this.allowedImageExtensions.add("text/calendar");
		this.allowedImageExtensions.add("text/html");
		this.allowedImageExtensions.add("application/x-msdownload");
		this.allowedImageExtensions.add("application/zip");
		this.allowedImageExtensions.add("application/x-7z-compressed");*/
		this.allowedImageExtensions.add("application/octet-stream");
		this.allowedImageExtensions.add("audio/mpeg3");
		this.allowedImageExtensions.add("audio/x-mpeg-3");
		this.allowedImageExtensions.add("video/mpeg");
		this.allowedImageExtensions.add("video/x-mpeg");
		this.allowedImageExtensions.add("audio/mpeg");
		this.allowedImageExtensions.add("application/x-troff-msvideo");
		this.allowedImageExtensions.add("video/avi");
		this.allowedImageExtensions.add("video/msvideo");
		this.allowedImageExtensions.add("video/x-msvideo");
		this.allowedImageExtensions.add("video/x-flv");
		this.allowedImageExtensions.add("application/x-msdownload");
		this.allowedImageExtensions.add("application/x-dosexec");
		File fil = null;
		String filename = null;
		String userid="";
		if(principal.getName().contains("@")){
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		
		
		InputStream is=null;
		TikaInputStream stream=null;
		
		try {
			Iterator<String> itr = request.getFileNames();
			if (!itr.hasNext()) {
				return ",please select a file";
			}
			while (itr.hasNext()) {
				MultipartFile filecheck = request.getFile(itr.next());

				// System.out.println("image in multiple="+filecheck.getOriginalFilename());
				if (filecheck.getSize() > 0) {
					long filesize=filecheck.getSize();
					filename = filecheck.getOriginalFilename()
							.replace(" ", "-");
					String extension = FilenameUtils.getExtension(filename);
					// //System.out.println("file extenson="+extension);
					is = filecheck.getInputStream();
					
					
				/*	ClamScan clamScan = new ClamScan("mail.silvereye.in", 3310, 20);
					ScanResult result = clamScan.scan(is);
					System.out.println("status of antivirus scan : "+result.getStatus());
*/
					/*
					 * int idx = filename.lastIndexOf('.'); String fileExtension
					 * = idx > 0 ? filename.substring(idx) : ".tmp"; fil =
					 * File.createTempFile("okm", fileExtension);
					 * filecheck.transferTo(fil); FileInputStream fs=new
					 * FileInputStream(fil);
					 */
					// String imageBytes = IOUtils.toByteArray(is);
					/*
					 * org.apache.commons.codec.binary.Base64
					 * .encodeBase64URLSafeString(IOUtils.toByteArray(is));
					 */
					// String iss= IOUtils.toString(is);
					// //System.out.println("stream of file is : "+is);
					byte[] encodedBaseData = org.apache.commons.codec.binary.Base64
							.encodeBase64(IOUtils.toByteArray(is));
					
					
					TikaConfig config = TikaConfig.getDefaultConfig();
					 Detector detector = config.getDetector();

					 stream = TikaInputStream.get(is);

					 Metadata metadata = new Metadata();
					 metadata.add(Metadata.RESOURCE_NAME_KEY, filecheck.getOriginalFilename());
					 MediaType mediaType = detector.detect(stream, metadata);
					
					System.out.println("mime type of file "+filename+" is " +mediaType);
					
					System.out.println(this.allowedImageExtensions.contains(mediaType));
					if (this.allowedImageExtensions.contains(mediaType)) {// //System.out.println("inside file extension check");
						// addError("Incorrect file extension! Only PNG, BMP, JPG, JPEG, GIF, XIF are allowed");
						map.addAttribute("errorMsgs", this.errorMsgs);
						map.addAttribute("fileuploaderror", "true");
						
						return ",error occured";}else{

							

							
							 if (filecheck.getSize()>IMAGE_MAX_SIZE){ //
							// addError("File size too large.Must be maximum 500MB");
							 map.addAttribute("errorMsgs",this.errorMsgs);
							 map.addAttribute("fileuploaderror","true");

								System.out.println("file size is not allowed ");
							 return	 ",error occured"; }
							 else{
									HttpSession hs = request.getSession(false);
									String notes = "";
									String keywords = "";
									String parentFolder = (String) hs
											.getAttribute("currentFolder");
							// Files.write(path, encodedBaseData);
							// Files.write(path2,decodedBaseData);
							/*
							 * String
							 * encodedString=org.apache.commons.codec.binary.Base64
							 * .encodeBase64URLSafeString(IOUtils.toByteArray(is));
							 */
							// //System.out.println(org.apache.commons.codec.binary.Base64
							// .encodeBase64URLSafeString(IOUtils.toByteArray(is)));
							CreateFileResponse createFileResponse = documentModuleClient
									.createFile(filename, parentFolder,
											userid,
											keywords, notes, encodedBaseData,filesize);
							edms.wsdl.File file = createFileResponse.getFile();
							String newFile = "";
							if (file != null) {
								newFile = "<li onclick='getFileProperties(this.id)' class='select_box target fileContextMenuClass'"
										+ " id='"
										+ file.getFilePath()
										+ "' >";
								 	if(file.getFileName().contains(".pdf")){
								 		newFile += "			<div class='new_pdf'></div> ";
								 	}else if(file.getFileName().contains(".doc")){
								 		newFile += "			<div class='new_word'></div> ";
								 	}else if(file.getFileName().contains(".xls")||file.getFileName().contains(".csv")){
								 		newFile += "			<div class='new_msexcel'></div> ";
								 	}else if(file.getFileName().contains(".ppt")){
								 		newFile += "			<div class='new_ppt'></div> ";
								 	}else if(file.getFileName().contains(".jpg")){
								 		newFile += "			<div class='new_jpg'></div> ";
								 	}else if(file.getFileName().contains(".png")){
								 		newFile += "			<div class='new_png'></div> ";
								 	}else if(file.getFileName().contains(".gif")){
								 		newFile += "			<div class='new_gif'></div> ";
								 	}else if(file.getFileName().contains(".xml")||file.getFileName().contains(".vcf")||file.getFileName().contains(".pod")||file.getFileName().contains(".ics")){
								 		newFile += "			<div class='new_txt'></div> ";
								 	}else if(file.getFileName().contains(".txt")){
								 		newFile += "			<div class='new_txt'></div> ";
								 	}else if(file.getFileName().contains(".bmp")){
								 		newFile += "			<div class='blank_image'></div> ";
								 	}else if(file.getFileName().contains(".ico")){
								 		newFile += "			<div class='new_ico'></div> ";
								 	}else{
								 		newFile += "			<div class='blank_image'></div> ";
								 	}
								newFile += " <span>" + file.getFileName()
										+ "</span></li>";
								res += newFile;
							} else {
								return ",Error Occured";
							}
						 }
						}
				} else {
					return ",please select a file";
				}
			}
			return res + ",Successfully Uploaded";

		} catch (IOException ie) {
			ie.printStackTrace();
			return ",Error Occured";
		} finally {
			if(is!=null)
				try {
					is.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			if(stream!=null)
				try {
					stream.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			org.apache.commons.io.FileUtils.deleteQuietly(fil);
		}}else{
			return "true";
		}
	}

	public void updateSessionManager(HttpServletRequest request) {
		// HttpSessionManager.getInstance().update(request.getSession().getId());
	}

	@RequestMapping(value = "/getFileProperties", method = RequestMethod.GET)
	public String getDocProperties(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String path) {
		if(principal!=null){
		// listLdapUsersDetails(principal.getName()+Config.EDMS_DOMAIN);
		HttpSession hs = request.getSession(false);
		if (hs != null) {
			hs.setAttribute("currentFile", path);
			hs.setAttribute("currentDoc", path);
			// System.out.println("session value of currentFile : "+(String)
			// hs.getAttribute("currentFile"));
		}
		String userid="";
		if(principal.getName().contains("@")){
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		String[] str = path.split("/");
		String calcPath = "";
		for (int i = 1; i < str.length; i++) {
			calcPath += "/" + str[i];
		}
		hs.setAttribute("currentFile", calcPath);
		hs.setAttribute("currentDoc", calcPath);
	//	hs.setAttribute("currentFolder", "");
		GetFileByPathWithOutStreamResponse fileByPath = documentModuleClient.getFileByPathWithOutStream(
				calcPath, userid);
		edms.wsdl.File fileNode = fileByPath.getFile();
		// //System.out.println(fileNode.getFileContent());
		// List<Folder> folderList =
		// folderResponse.getGetFoldersByParentFolder()
		// .getFolderListResult().getFolderList();
		/*
		 * GetFileResponse
		 * fileResponse=documentModuleClient.getFileRequest(calcPath,
		 * principal.getName()+Config.EDMS_DOMAIN); List<edms.wsdl.File>
		 * fileList
		 * =fileResponse.getGetFilesByParentFile().getFileListResult().getFileList
		 * ();
		 */
		map.addAttribute("currentFolder", fileNode);
		map.addAttribute("breadcum", calcPath);
		// map.addAttribute("fileList", fileList);
		map.addAttribute("userid", userid);
		return "getFileProperties";}
		else{
			return "ajaxTrue";
		}
	}

	@RequestMapping(value = "/ajaxTrue", method = RequestMethod.GET)
	public String ajaxTrue(ModelMap map, Principal principal)
			{
		return "ajaxTrue";
			}
	

	@RequestMapping(value = "/setCurrentFile", method = RequestMethod.POST)
	@ResponseBody
	public String setCurrentFile(ModelMap map, Principal principal,
			HttpServletRequest request, @RequestParam String path) {
		if(principal!=null){
		HttpSession hs = request.getSession(false);
		hs.setAttribute("currentFile", path);
		hs.setAttribute("currentDoc", path);
		//hs.setAttribute("currentFolder", "");
				return "";}
				else{
					return "true";
				}
		}


	@RequestMapping(value = "/getFileContent", method = RequestMethod.GET)
	@ResponseBody
	public String getFileContent(ModelMap map, Principal principal,
			HttpServletRequest request, HttpServletResponse response,
			@RequestParam String folderPath) {

		if(principal!=null){
		String userid="";
		if(principal.getName().contains("@")){
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		try {
			GetFileByPathResponse fileByPath = documentModuleClient
					.getFileByPath(folderPath, userid);
			edms.wsdl.File fileNode = fileByPath.getFile();

			byte[] imageBytes = org.apache.commons.codec.binary.Base64
					.decodeBase64(fileNode.getFileContent());
			/*
			 * Path
			 * path2=Paths.get("D://testingFolder//decoded3"+fileNode.getFileName
			 * ()); try { Files.write(path2, imageBytes); } catch (IOException
			 * e2) { // TODO Auto-generated catch block e2.printStackTrace(); }
			 */

			InputStream inStream = new ByteArrayInputStream(imageBytes);

			// //System.out.println("content of file is : "+fileNode.getFileContent());
			// forces download

			// obtains ServletContext
			// ServletContext context = getServletContext();

			// gets MIME type of the file
			// String mimeType = context.getMimeType(filePath);

			// modifies response
			// response.setContentType("application/pdf");
			// response.setContentLength((int) downloadFile.length());
 
			String headerKey = "Content-Disposition";
			String headerValue = String.format("attachment; filename=\"%s\"",
					fileNode.getFileName());
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
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
		}else{
			return "ajaxTrue";
		}
		/*
		 * try { GetFileByPathResponse
		 * fileByPath=documentModuleClient.getFileByPath
		 * (folderPath,principal.getName()+Config.EDMS_DOMAIN); edms.wsdl.File
		 * fileNode=fileByPath.getFile(); String headerKey =
		 * "Content-Disposition"; String headerValue =
		 * String.format("attachment; filename=\"%s\"", fileNode.getFileName());
		 * response.setHeader(headerKey, headerValue);
		 * //System.out.println(fileNode.getFileContent()+ " is file");
		 * InputStream input =IOUtils.toInputStream(fileNode.getFileContent());
		 * String destFilePath = "/" + fileNode.getFileName(); //OutputStream
		 * output = response.getOutputStream(); FileOutputStream output = new
		 * FileOutputStream(destFilePath); byte[] buffer = new byte[4096];
		 * 
		 * int byteRead;
		 * 
		 * while ((byteRead = input.read(buffer)) != -1) {
		 * 
		 * output.write(buffer, 0, byteRead);
		 * 
		 * output.close(); } }catch (IOException e) { // TODO Auto-generated
		 * catch block e.printStackTrace(); }
		 */
	}
	
	
	@RequestMapping("/getPreview")
	public String getPreview(ModelMap map,Principal principal,HttpServletRequest request){

		if(principal!=null){
		String folderPath="";
		ArrayList<String> imageString=new ArrayList<String>();
		HttpSession hs=request.getSession(false);
		if(hs!=null){
			folderPath=(String)hs.getAttribute("currentFile");
		}
		String userid="";
		if(principal.getName().contains("@")){
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		GetFileByPathResponse fileByPath = documentModuleClient
				.getFileByPath(folderPath, userid);
		edms.wsdl.File fileNode = fileByPath.getFile();
		/*
		 * Path
		 * path2=Paths.get("D://testingFolder//decoded3"+fileNode.getFileName
		 * ()); try { Files.write(path2, imageBytes); } catch (IOException
		 * e2) { // TODO Auto-generated catch block e2.printStackTrace(); }
		 */
		/*	byte[] imageBytes = org.apache.commons.codec.binary.Base64
				.decodeBase64(fileNode.getFileContent());
		

		InputStream inStream = new ByteArrayInputStream(imageBytes);
		String ps="";
		ArrayList<String> imageList=(ArrayList<String>)request.getAttribute("previewImages");
	
		try {
			if(fileNode.getFileName().contains(".pdf")){
			 //load pdf file in the document object
			PDDocument doc=PDDocument.load(inStream);
			//Get all pages from document and store them in a list
			List<PDPage> pages=doc.getDocumentCatalog().getAllPages();
			//create iterator object so it is easy to access each page from the list
			Iterator<PDPage> i= pages.iterator();
			int count=1; //count variable used to separate each image file
			//Convert every page of the pdf document to a unique image file
			System.out.println("Please wait...");
			while(i.hasNext()){
			PDPage page=i.next();
			BufferedImage bi=page.convertToImage();
			try {
				ByteArrayOutputStream bos = new ByteArrayOutputStream();
				ImageIO.write(bi, "png", bos);
				String encodedImage = org.apache.commons.codec.binary.Base64
						.encodeBase64String(bos.toByteArray());
				ps+="<img src='data:image/png;base64,"+encodedImage+"' />";
				//imageString.add("data:image/png;base64," + encodedImage);
				bos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			count++;
			}
			
			
		}else if(fileNode.getFileName().contains(".ppt"))
		{
			
			  SlideShow	  ppt = new SlideShow(inStream); 
			  inStream.close();
			  
			  Dimension pgsize = ppt.getPageSize();
			  pgsize.setSize((pgsize.getWidth()), (pgsize.getHeight()));
			  Slide[] slide = ppt.getSlides(); 
			  for (int j = 0; j < slide.length; j++) {
			  
			  BufferedImage img = new BufferedImage(pgsize.width, pgsize.height, BufferedImage.TYPE_INT_RGB); 
			  Graphics2D graphics = img.createGraphics(); //clear the drawing area
			  graphics.setPaint(Color.white); 
			  graphics.fill(new	  Rectangle2D.Float(0, 0, pgsize.width, pgsize.height));
			  
			  //render 
			  slide[j].draw(graphics);
			  
			  //save the output 
			  ByteArrayOutputStream bos = new ByteArrayOutputStream();
			  javax.imageio.ImageIO.write(img, "png", bos); 
			  String encodedImage = org.apache.commons.codec.binary.Base64
						.encodeBase64String(bos.toByteArray());
				ps+="<img src='data:image/png;base64,"+encodedImage+"' />";
				//imageString.add("data:image/png;base64," + encodedImage);
				bos.close();
			  }
			 
			
		}else if(fileNode.getFileName().contains(".xls"))
		{
			java.io.File outputFile=File.createTempFile("temp", ".csv");
			if(fileNode.getFileName().contains(".xlsx")){

		        Config.convertToXlsx(inStream, outputFile);
			}else{

		        Config.convertToXls(inStream, outputFile);
			}

			InputStreamReader isr = new InputStreamReader(new FileInputStream(outputFile));
			BufferedReader br = new BufferedReader(isr);
			ps+=("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">");
			ps+=("<html xmlns=\"http://www.w3.org/1999/xhtml\">");
			ps+=("<head><meta http-equiv=\"Content-type\" content=\"text/html;charset=UTF-8\"/>");
			
			ps+=("</head><body><h1></h1>");
	 
			ps+=("<table>");
			String stdinLine;
			boolean firstLine = true;
			while ((stdinLine = br.readLine()) != null) {
				String[] columns = Config.escapeChars(stdinLine).split(",");
				if (firstLine == true) {
					ps+=Config.tableHeader(ps, columns);
					firstLine = false;
				} else {
					ps+=Config.tableRow(ps, columns);
				}
			}
			ps+=("</table></body></html>");
			
			
				outputFile.delete();
			
			
		}else if(fileNode.getFileName().contains(".docx")){
        XWPFDocument document = new XWPFDocument(inStream);


        XHTMLOptions options = XHTMLOptions.create().URIResolver(new FileURIResolver(new File("word/media")));

        OutputStream out = new ByteArrayOutputStream();


        XHTMLConverter.getInstance().convert(document, out, options);
        ps +=out.toString();
        }else{
        	
        }
			
			
			
			*/

			
			
			
			
			
			
			
			
			

			//map.addAttribute("previewImages", imageString);
		//	map.addAttribute("previewImages", ps);
map.addAttribute("fileNode",fileNode);
	/*	} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ERROR: " + e.getMessage());
		}
*/
		return "getPreview";}else{
			return "ajaxTrue";
		}
	}
	
	
/*	@RequestMapping({"/getPreview"})
	  public String getPreview(ModelMap map, Principal principal, HttpServletRequest request)
	  {
		if(principal!=null){
		String ps="";
	    String folderPath = "";
	    ArrayList<String> imageString = new ArrayList<String>();
	    HttpSession hs = request.getSession(false);
	    if (hs != null) {
	      folderPath = (String)hs.getAttribute("currentFile");
	    }
	    String userid = "";
	    if (principal.getName().contains("@")) {
	      userid = principal.getName();
	    } else {
	      userid = principal.getName() + Config.EDMS_DOMAIN;
	    }
	    GetFileByPathResponse fileByPath = this.documentModuleClient
	      .getFileByPath(folderPath, userid);
	    edms.wsdl.File fileNode = fileByPath.getFile();
	    
	    byte[] imageBytes = 
	      Base64.decodeBase64(fileNode.getFileContent());

	    InputStream inStream = new ByteArrayInputStream(imageBytes);
	    try
	    {
	      if (fileNode.getFileName().contains(".pdf"))
	      {
	        PDDocument doc = PDDocument.load(inStream);
	        
	        List<PDPage> pages = doc.getDocumentCatalog().getAllPages();
	        
	        Iterator<PDPage> i = pages.iterator();
	        int count = 1;
	        
	        System.out.println("Please wait...");
	        while (i.hasNext())
	        {
	          PDPage page = (PDPage)i.next();
	          BufferedImage bi = page.convertToImage();
	          try
	          {
	            ByteArrayOutputStream bos = new ByteArrayOutputStream();
	            ImageIO.write(bi, "png", bos);
	            String encodedImage = 
	              Base64.encodeBase64String(bos.toByteArray());
	            imageString.add("data:image/png;base64," + encodedImage);
	            bos.close();
	          }
	          catch (IOException e)
	          {
	            e.printStackTrace();
	          }
	          count++;
	        }
	      }
	      else if (fileNode.getFileName().contains(".ppt"))
	      {
	        SlideShow ppt = new SlideShow(inStream);
	        inStream.close();
	        
	        Dimension pgsize = ppt.getPageSize();
	        pgsize.setSize(pgsize.getWidth(), pgsize.getHeight());
	        Slide[] slide = ppt.getSlides();
	        for (int j = 0; j < slide.length; j++)
	        {
	          BufferedImage img = new BufferedImage(pgsize.width, pgsize.height, 1);
	          Graphics2D graphics = img.createGraphics();
	          graphics.setPaint(Color.white);
	          graphics.fill(new Rectangle2D.Float(0.0F, 0.0F, pgsize.width, pgsize.height));
	          

	          slide[j].draw(graphics);
	          

	          ByteArrayOutputStream bos = new ByteArrayOutputStream();
	          ImageIO.write(img, "png", bos);
	          String encodedImage = 
	            Base64.encodeBase64String(bos.toByteArray());
	          imageString.add("data:image/png;base64," + encodedImage);
	          bos.close();
	        }
	      }else if(fileNode.getFileName().contains(".xls"))
			{
				java.io.File outputFile=File.createTempFile("temp", ".csv");
				if(fileNode.getFileName().contains(".xlsx")){

			        Config.convertToXlsx(inStream, outputFile);
				}else{

			        Config.convertToXls(inStream, outputFile);
				}

				InputStreamReader isr = new InputStreamReader(new FileInputStream(outputFile));
				BufferedReader br = new BufferedReader(isr);
				ps+=("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">");
				ps+=("<html xmlns=\"http://www.w3.org/1999/xhtml\">");
				ps+=("<head><meta http-equiv=\"Content-type\" content=\"text/html;charset=UTF-8\"/>");
				
				ps+=("</head><body><h1></h1>");
		 
				ps+=("<table>");
				String stdinLine;
				boolean firstLine = true;
				while ((stdinLine = br.readLine()) != null) {
					String[] columns = Config.escapeChars(stdinLine).split(",");
					if (firstLine == true) {
						ps+=Config.tableHeader(ps, columns);
						firstLine = false;
					} else {
						ps+=Config.tableRow(ps, columns);
					}
				}
				ps+=("</table></body></html>");
				outputFile.delete();
				
			}else if(fileNode.getFileName().contains(".docx")){
	        XWPFDocument document = new XWPFDocument(inStream);
	        XHTMLOptions options = XHTMLOptions.create().URIResolver(new FileURIResolver(new File("word/media")));
	        OutputStream out = new ByteArrayOutputStream();
	        XHTMLConverter.getInstance().convert(document, out, options);
	        ps +=out.toString();
	        }else if(fileNode.getFileName().contains(".bmp")||fileNode.getFileName().contains(".jpg")||fileNode.getFileName().contains(".png")||fileNode.getFileName().contains(".gif")){
	        	
	        	String encodedImage = org.apache.commons.codec.binary.Base64
	        			.encodeBase64String(imageBytes);
	        	imageString.add("data:image/png;base64,"+encodedImage);
	        }else if(fileNode.getFileName().contains(".txt")){
	        	String encodedImage = IOUtils.toString(imageBytes);
	        	ps=encodedImage;
	        }
	      map.addAttribute("previewImages", imageString);
	      map.addAttribute("previewHtml", ps);
	    }
	    catch (Exception e)
	    {
	      e.printStackTrace();
	      System.out.println("ERROR: " + e.getMessage());
	    }
	    return "getPreview";}else{
			return "ajaxTrue";
		}
	  }
	*/
	
	
	
	
	
	
	
}
