package edms.controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.UUID;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.tika.config.TikaConfig;
import org.apache.tika.detect.Detector;
import org.apache.tika.io.TikaInputStream;
import org.apache.tika.metadata.Metadata;
import org.apache.tika.mime.MediaType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.HtmlUtils;

import com.artofsolving.jodconverter.DocumentConverter;
import com.artofsolving.jodconverter.openoffice.connection.OpenOfficeConnection;
import com.artofsolving.jodconverter.openoffice.connection.SocketOpenOfficeConnection;
import com.artofsolving.jodconverter.openoffice.converter.OpenOfficeDocumentConverter;

import edms.core.Config;
import edms.core.LDAPConnection;
import edms.core.Principal;
import edms.core.SizeCalculator;
import edms.webservice.client.DocumentModuleClient;
import edms.webservice.client.WorkflowClient;
import edms.wsdl.CreateFileResponse;
import edms.wsdl.GetAttachmentResponse;
import edms.wsdl.GetFileByPathResponse;
import edms.wsdl.GetFileByPathWithOutStreamResponse;
import edms.wsdl.RemovePublicLinkResponse;
import edms.wsdl.SetPublicLinkRequest;
import edms.wsdl.SetPublicLinkResponse;

@Controller
public class DocumentController extends HttpServlet {

	public static final String FILE_UPLOAD_STATUS = "file_upload_status";
	@Autowired
	private DocumentModuleClient documentModuleClient;
	@Autowired
	private WorkflowClient workflowClient;
	private Integer IMAGE_MAX_SIZE = 52000000;
	// list of allowed file extensions
	private Set<String> allowedImageExtensions;
	// list of error messages
	private List<String> errorMsgs = new ArrayList<String>();

	@RequestMapping("/getAttachment")
	//@ResponseBody
	public String getAttachment(ModelMap map, Principal principal, HttpServletRequest request,
			HttpServletResponse response, @RequestParam String attachmentID) {

		try {
			if (principal==null||principal.getName()==null) {
				return "ajaxTrue";
			} else {
				String userid = "";
				if (principal.getName().contains("@")) {
					userid = principal.getName();
				} else {
					userid = principal.getName() + Config.EDMS_DOMAIN;
				}
				try {
					File fl = new File(attachmentID);
					InputStream inStream = new FileInputStream(fl);
					byte[] imageBytes = IOUtils.toByteArray(inStream);
					byte[] encodedBaseData = org.apache.commons.codec.binary.Base64.encodeBase64(imageBytes);
					edms.wsdl.File fileNode = new edms.wsdl.File();
					fileNode.setFileContent(encodedBaseData);
					fileNode.setFileName(fl.getName());
					map.addAttribute("fileNode", fileNode);
					return "getPreview";
				
					/*
					String headerKey = "Content-Disposition";
					String headerValue = String.format("attachment; filename=\"%s\"", attachmentID);
					response.setHeader(headerKey, headerValue);
					OutputStream outStream = response.getOutputStream();
					byte[] buffer1 = new byte[4096];
					int bytesRead = -1;
					while ((bytesRead = inStream.read(buffer1)) != -1) {
						outStream.write(buffer1, 0, bytesRead);
					}
					inStream.close();
					outStream.close();
					*/
				} catch (IOException e) {
					e.printStackTrace();
				}
				return "";
			}
		} catch (Exception e) {
			return "ajaxTrue";
		}
	}
	 
	@RequestMapping("/deleteAttachment")
	@ResponseBody
	public void deleteAttachment(ModelMap map, Principal principal, HttpServletRequest request,
			HttpServletResponse response,@RequestParam String path) {
		
		File fl=new File(path);
		fl.delete();
		
	}
		@RequestMapping("/uploadAttachment")
		@ResponseBody
		public String uploadAttachment(ModelMap map, Principal principal, MultipartHttpServletRequest request,
				HttpServletResponse response) {
		try {
			if (principal == null) {
				return "ajaxTrue";
			} else {
				String res = "";
				String attachmentID="";
				this.allowedImageExtensions = new HashSet<String>();
				this.allowedImageExtensions.add("");
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
				String userid = "";
				if (principal.getName().contains("@")) {
					userid = principal.getName();
				} else {
					userid = principal.getName() + Config.EDMS_DOMAIN;
				}
				

				HttpSession hs = request.getSession(false);
				InputStream is = null;
				TikaInputStream stream = null;
				try {
					Iterator<String> itr = request.getFileNames();
					if (!itr.hasNext()) {
						return ",please select a file";
					}
					while (itr.hasNext()) {
						MultipartFile filecheck = request.getFile(itr.next());
						if (filecheck.getSize() >= 0) {
							is = filecheck.getInputStream();
							//String realPath = getServletContext().getRealPath("/");
							File fl=new File("/maildir/edms/workflow-attachment/mr"+UUID.randomUUID()+filecheck.getOriginalFilename());
							OutputStream outStream = new FileOutputStream(fl);
							byte[] buffer1 = new byte[4096];
							int bytesRead = -1;
							while ((bytesRead = is.read(buffer1)) != -1) {
								outStream.write(buffer1, 0, bytesRead);
							}
							is.close();
							outStream.close();
							return fl.getPath().replaceAll("\\\\", "/");
							
							
						} else {
						}
					}
					return attachmentID;
				} catch (IOException ie) {
					ie.printStackTrace();
					return ",Error Occured";
				} finally {
					if (is != null)
						try {
							is.close();
						} catch (IOException e) {
							e.printStackTrace();
						}
					if (stream != null)
						try {
							stream.close();
						} catch (IOException e) {
							e.printStackTrace();
						}
				//	org.apache.commons.io.FileUtils.deleteQuietly(fil);
				}
			}
		} catch (Exception e) {
			return "ajaxTrue";
		}
	}

	@RequestMapping("/uploadDocumentByJcr")
	@ResponseBody
	public String uploadDocumentByJcr(ModelMap map, Principal principal, MultipartHttpServletRequest request,
			HttpServletResponse response) {
				String userid = "";
		try {
			if (principal == null) {
				return "ajaxTrue";
			} else {
				String res = "";
				this.allowedImageExtensions = new HashSet<String>();
				this.allowedImageExtensions.add("");
				
				
				
				/*
				 * this.allowedImageExtensions.add("application/javascript");
				 * this.allowedImageExtensions.add("image/png");
				 * this.allowedImageExtensions.add("image/bmp");
				 * this.allowedImageExtensions.add("image/jpeg");
				 * this.allowedImageExtensions.add("image/gif");
				 * this.allowedImageExtensions.add("application/msword");
				 * this.allowedImageExtensions.add("text/plain");
				 * this.allowedImageExtensions.add(
				 * "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
				 * ); this.allowedImageExtensions.add("application/pdf");
				 * this.allowedImageExtensions.add("application/vnd.ms-excel");
				 * this.allowedImageExtensions.add(
				 * "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
				 * ); this.allowedImageExtensions.add("text/csv");
				 * this.allowedImageExtensions.add("text/x-vcard");
				 * this.allowedImageExtensions.add("text/calendar");
				 * this.allowedImageExtensions.add("text/html");
				 * this.allowedImageExtensions.add("application/x-msdownload");
				 * this.allowedImageExtensions.add("application/zip");
				 * this.allowedImageExtensions.add("application/x-7z-compressed"
				 * );
				 */
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
				if (principal.getName().contains("@")) {
					userid = principal.getName();
				} else {
					userid = principal.getName() + Config.EDMS_DOMAIN;
				}
	
				
				InputStream is = null;
				TikaInputStream stream = null;
				try {
					Iterator<String> itr = request.getFileNames();
					if (!itr.hasNext()) {
						return ",please select a file";
					}
					while (itr.hasNext()) {
						MultipartFile filecheck = request.getFile(itr.next());
						if (filecheck.getSize() >= 0) {
							long filesize = filecheck.getSize();
							String folderPath = filecheck.getOriginalFilename();
							filename = HtmlUtils.htmlEscape(folderPath);
							is = filecheck.getInputStream();
							byte[] encodedBaseData = org.apache.commons.codec.binary.Base64
									.encodeBase64(IOUtils.toByteArray(is));
							TikaConfig config = TikaConfig.getDefaultConfig();
							Detector detector = config.getDetector();
							stream = TikaInputStream.get(is);
							Metadata metadata = new Metadata();
							metadata.add(Metadata.RESOURCE_NAME_KEY, filecheck.getOriginalFilename());
							MediaType mediaType = detector.detect(stream, metadata);
							if (this.allowedImageExtensions.contains(mediaType)) {
								map.addAttribute("errorMsgs", this.errorMsgs);
								map.addAttribute("fileuploaderror", "true");
								return ",error occured";
							} else {
								if (filecheck.getSize() > IMAGE_MAX_SIZE) { //
									map.addAttribute("errorMsgs", this.errorMsgs);
									map.addAttribute("fileuploaderror", "true");
									return ",error occured";
								} else {
									HttpSession hs = request.getSession(false);
									String notes = "";
									String keywords = "";
									String parentFolder = (String) hs.getAttribute("currentFolder");
									CreateFileResponse createFileResponse = documentModuleClient.createFile(filename,
											parentFolder, userid, principal.getPassword(), keywords, notes,
											encodedBaseData, filesize);
									edms.wsdl.File file = createFileResponse.getFile();
									String newFile = "";
									if (file != null) {
										String size = "";
										long sizee = 0;
										if (file.getFileSize() / 1024 > 1024) {
											sizee = (file.getFileSize() / (1024 * 1024));
											size = sizee + " MB";
										} else if (file.getFileSize() > 1024) {
											sizee = (file.getFileSize() / 1024);
											size = sizee + " KB";
										} else {
											size = file.getFileSize() + " Byte";
										}
										newFile = " <li ondblclick='getPrevious()' " + " title='Name: "
												+ file.getFilePath().substring(file.getFilePath().lastIndexOf("/") + 1)
												+ " &#013;Type: File &#013;Size: " + size + " &#013;Author: "
												+ file.getCreatedBy() + " &#013;Date:"
												+ file.getCreationDate().replace('T', ' ').substring(0,
														file.getCreationDate().indexOf("."))
												+ "'"
												+ " onclick='getFileProperties(this.id)' class='space select_box target fileContextMenuClass'"
												+ " id='" + file.getFilePath() + "'"
												+ " oncontextmenu='getFileProperties(this.id);getRightClickMenuFile(this.id)'>"
												+ " <div style='display: none;' " + " id='filePermissions"
												+ file.getFilePath() + "' >"
												+ file.getUserRead().toString().contains(userid) + ","
												+ file.getUserWrite().toString().contains(userid) + ","
												+ file.getUserSecurity().toString().contains(userid) + "" + "</div>";

										if (file.getFileName().contains(".pdf")) {
											newFile += "			<div class='new_pdf'></div> ";
										} else if (file.getFileName().contains(".doc")) {
											newFile += "			<div class='new_word'></div> ";
										} else if (file.getFileName().contains(".xls")
												|| file.getFileName().contains(".csv")) {
											newFile += "			<div class='new_msexcel'></div> ";
										} else if (file.getFileName().contains(".ppt")) {
											newFile += "			<div class='new_ppt'></div> ";
										} else if (file.getFileName().contains(".jpg")) {
											newFile += "			<div class='new_jpg'></div> ";
										} else if (file.getFileName().contains(".png")) {
											newFile += "			<div class='new_png'></div> ";
										} else if (file.getFileName().contains(".gif")) {
											newFile += "			<div class='new_gif'></div> ";
										} else if (file.getFileName().contains(".xml")
												|| file.getFileName().contains(".vcf")
												|| file.getFileName().contains(".pod")
												|| file.getFileName().contains(".ics")) {
											newFile += "			<div class='new_txt'></div> ";
										} else if (file.getFileName().contains(".txt")) {
											newFile += "			<div class='new_txt'></div> ";
										} else if (file.getFileName().contains(".bmp")) {
											newFile += "			<div class='blank_image'></div> ";
										} else if (file.getFileName().contains(".ico")) {
											newFile += "			<div class='new_ico'></div> ";
										} else {
											newFile += "			<div class='blank_image'></div> ";
										}
										newFile += " <span>" + file.getFileName() + "</span></li>";
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
					if (is != null)
						try {
							is.close();
						} catch (IOException e) {
							e.printStackTrace();
						}
					if (stream != null)
						try {
							stream.close();
						} catch (IOException e) {
							e.printStackTrace();
						}
					org.apache.commons.io.FileUtils.deleteQuietly(fil);
				}
			}
		} catch (Exception e) {
			return "ajaxTrue";
		}}

	public void updateSessionManager(HttpServletRequest request) {
	}

	@RequestMapping(value = "/getFileProperties", method = RequestMethod.GET)
	public String getDocProperties(ModelMap map, Principal principal, HttpServletRequest request,
			@RequestParam String path) {
		try {
			if (principal == null) {
				return "ajaxTrue";
			} else {
				// listLdapUsersDetails(principal.getName()+Config.EDMS_DOMAIN);
				HttpSession hs = request.getSession(false);
				if (hs != null) {
					hs.setAttribute("currentFile", path);
					hs.setAttribute("currentDoc", path);
				}
				String userid = "";
				if (principal.getName().contains("@")) {
					userid = principal.getName();
				} else {
					userid = principal.getName() + Config.EDMS_DOMAIN;
				}
				String[] str = path.split("/");
				String calcPath = "";
				for (int i = 1; i < str.length; i++) {
					calcPath += "/" + str[i];
				}
				hs.setAttribute("currentFile", calcPath);
				hs.setAttribute("currentDoc", calcPath);
				GetFileByPathWithOutStreamResponse fileByPath = documentModuleClient
						.getFileByPathWithOutStream(calcPath, userid, principal.getPassword());
				edms.wsdl.File fileNode = fileByPath.getFile();
				map.addAttribute("currentFolder", fileNode);
				map.addAttribute("breadcum", calcPath);
				// map.addAttribute("fileList", fileList);
				map.addAttribute("userid", userid);
				return "getFileProperties";
			}

		} catch (Exception e) {

			return "ajaxTrue";
		}
	}

	@RequestMapping(value = "/ajaxTrue", method = RequestMethod.GET)
	public String ajaxTrue(ModelMap map, Principal principal) {
		return "ajaxTrue";
	}

	@RequestMapping(value = "/setCurrentFile", method = RequestMethod.POST)
	@ResponseBody
	public String setCurrentFile(ModelMap map, Principal principal, HttpServletRequest request,
			@RequestParam String path) {
		try {
			if (principal == null) {
				return "ajaxTrue";
			} else {
				HttpSession hs = request.getSession(false);
				hs.setAttribute("currentFile", path);
				hs.setAttribute("currentDoc", path);
				return "";
			}
		} catch (Exception e) {
			return "ajaxTrue";
		}

	}
	
	@RequestMapping(value = "/getPublicDoc", method = RequestMethod.GET)
	@ResponseBody
	public String getPublicDoc(ModelMap map, Principal principal, HttpServletRequest request,
			HttpServletResponse response, @RequestParam String filePath) {
		try {
			if (principal == null) {
				return "ajaxTrue";
			} else {
				String userid = "";
				userid = Config.EDMS_GUEST_USER + Config.EDMS_DOMAIN;
				edms.wsdl.File fileNode = null;
				filePath = request.getParameter("filePath");
				GetFileByPathResponse fileByPath = documentModuleClient.getFileByPath(filePath, userid,
						Config.EDMS_GUEST_PASSWORD);
				fileNode = fileByPath.getFile();
				byte[] imageBytes = org.apache.commons.codec.binary.Base64.decodeBase64(fileNode.getFileContent());
				InputStream inStream = new ByteArrayInputStream(imageBytes);
				String headerKey = "Content-Disposition";
				String headerValue = String.format("attachment; filename=\"%s\"", fileNode.getFileName());
				response.setHeader(headerKey, headerValue);
				OutputStream outStream = response.getOutputStream();
				byte[] buffer1 = new byte[4096];
				int bytesRead = -1;
				while ((bytesRead = inStream.read(buffer1)) != -1) {
					outStream.write(buffer1, 0, bytesRead);
				}
				inStream.close();
				outStream.close();
			}
			return "Sorry, you have requested for wrong resource";
		} catch (Exception e) {
			return "Sorry, you have requested for wrong resource";
		}
	}

	@RequestMapping(value = "/getFileContent", method = RequestMethod.GET)
	@ResponseBody
	public String getFileContent(ModelMap map, Principal principal, HttpServletRequest request,
			HttpServletResponse response, @RequestParam String folderPath) {
		FileOutputStream fos = null;
		java.io.File outputFile = null;
		try {
			outputFile = java.io.File.createTempFile("temp", ".zip");
			fos = new FileOutputStream(outputFile);
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ZipOutputStream zos = new ZipOutputStream(fos);
		byte[] buffer = new byte[4096];

		try {
			if (principal == null) {
				return "ajaxTrue";
			} else {
				String userid = "";
				if (principal.getName().contains("@")) {
					userid = principal.getName();
				} else {
					userid = principal.getName() + Config.EDMS_DOMAIN;
				}
				try {
					edms.wsdl.File fileNode = null;
					InputStream inStream1 = null;
					int count = 0;
					String[] str = folderPath.split(",");
					for (int i = 0; i < str.length; i++) {
						count++;
						GetFileByPathResponse fileByPath = documentModuleClient.getFileByPath(str[i], userid,
								principal.getPassword());
						fileNode = fileByPath.getFile();
						byte[] imageBytes = org.apache.commons.codec.binary.Base64
								.decodeBase64(fileNode.getFileContent());
						InputStream inStream = new ByteArrayInputStream(imageBytes);
						inStream1 = inStream;
						ZipEntry ze = new ZipEntry(fileNode.getFileName());
						zos.putNextEntry(ze);
						int len;
						while ((len = inStream.read(buffer)) > 0) {
							zos.write(buffer, 0, len);
						}
						inStream.close();
					}
					if (count == 1) {
						byte[] imageBytes = org.apache.commons.codec.binary.Base64
								.decodeBase64(fileNode.getFileContent());
						inStream1 = new ByteArrayInputStream(imageBytes);
						String headerKey = "Content-Disposition";
						String headerValue = String.format("attachment; filename=\"%s\"", fileNode.getFileName());
						response.setHeader(headerKey, headerValue);
						OutputStream outStream = response.getOutputStream();
						byte[] buffer1 = new byte[4096];
						int bytesRead = -1;
						while ((bytesRead = inStream1.read(buffer1)) != -1) {
							outStream.write(buffer1, 0, bytesRead);
						}
						inStream1.close();
						outStream.close();
					} else {
						zos.closeEntry();
						zos.close();
						InputStream inStream = new FileInputStream(outputFile);
						String headerKey = "Content-Disposition";
						String headerValue = String.format("attachment; filename=\"%s\"", "alldownloads.zip");
						response.setHeader(headerKey, headerValue);
						OutputStream outStream = response.getOutputStream();
						byte[] buffer1 = new byte[4096];
						int bytesRead = -1;
						while ((bytesRead = inStream.read(buffer1)) != -1) {
							outStream.write(buffer1, 0, bytesRead);
						}
						inStream.close();
						outStream.close();
						inStream1.close();
						outputFile.delete();
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
				return "";
			}
		} catch (Exception e) {
			return "ajaxTrue";
		}

	}


	@RequestMapping("/getPreview")
	public String getPreview(ModelMap map, Principal principal, HttpServletRequest request) {
		try {
			if (principal == null) {
				return "ajaxTrue";
			} else {
				String folderPath = "";
				// ArrayList<String> imageString=new ArrayList<String>();
				HttpSession hs = request.getSession(false);
				if (hs != null) {
					folderPath = (String) hs.getAttribute("currentFile");
				}
				String userid = "";
				if (principal.getName().contains("@")) {
					userid = principal.getName();
				} else {
					userid = principal.getName() + Config.EDMS_DOMAIN;
				}
				GetFileByPathResponse fileByPath = documentModuleClient.getFileByPath(folderPath, userid,
						principal.getPassword());
				edms.wsdl.File fileNode = fileByPath.getFile();
				map.addAttribute("fileNode", fileNode);
				return "getPreview";
			}
		} catch (Exception e) {
			return "ajaxTrue";
		}
	}

	@RequestMapping("/setPublicLinkRequest")
	@ResponseBody
	public String setPublicLinkRequest(ModelMap map, Principal principal, HttpServletRequest request) {
		try {
			if (principal == null) {
				return "ajaxTrue";
			} else {
				String filePath = "";
				// ArrayList<String> imageString=new ArrayList<String>();
				HttpSession hs = request.getSession(false);
				if (hs != null) {
					filePath = (String) hs.getAttribute("currentFile");
				}
				String userid = "";
				if (principal.getName().contains("@")) {
					userid = principal.getName();
				} else {
					userid = principal.getName() + Config.EDMS_DOMAIN;
				}
			SetPublicLinkResponse fileByPath = documentModuleClient.setPublicLinkRequest(filePath, userid, principal.getPassword(), Config.EDMS_GUEST);
			if(fileByPath.getResponseMessage().equals("success")){
				String uri="/edms/getPublicDoc?filePath="+filePath;
			    String scheme = request.getScheme();
			    String serverName = request.getServerName();
			    int serverPort = request.getServerPort();
			    String url = scheme + "://" + serverName + ":" + serverPort + uri;
				return url;
			}
			
			return "Sorry, failed to find link";
			}
			} catch (Exception e) {
			return "Sorry, failed to find link";
		}
	}
	

	@RequestMapping("/removePublicLinkRequest")
	@ResponseBody
	public String removePublicLinkRequest(ModelMap map, Principal principal, HttpServletRequest request) {
		try {
			if (principal == null) {
				return "ajaxTrue";
			} else {
				String filePath = "";
				// ArrayList<String> imageString=new ArrayList<String>();
				HttpSession hs = request.getSession(false);
				if (hs != null) {
					filePath = (String) hs.getAttribute("currentFile");
				}
				String userid = "";
				if (principal.getName().contains("@")) {
					userid = principal.getName();
				} else {
					userid = principal.getName() + Config.EDMS_DOMAIN;
				}
			RemovePublicLinkResponse fileByPath = documentModuleClient.removePublicLinkRequest(filePath, userid, principal.getPassword(), Config.EDMS_GUEST);
			if(fileByPath.getResponseMessage().equals("success")){
				return "";
			}
			
			return "Sorry, failed to find link";
			}
			} catch (Exception e) {
			return "Sorry, failed to find link";
		}
	}
	
	
	
	
	
}
