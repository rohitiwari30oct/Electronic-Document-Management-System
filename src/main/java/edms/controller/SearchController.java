package edms.controller;

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
import edms.core.Principal;
import edms.webservice.client.DocumentModuleClient;
import edms.wsdl.Folder;
import edms.wsdl.GetFolderByPathResponse;
import edms.wsdl.SearchDocByDateResponse;
import edms.wsdl.SearchDocByLikeResponse;

@Controller
public class SearchController {

	@Autowired
	DocumentModuleClient documentModuleClient;

	@RequestMapping(value = "/searchDocByName")
	public String searchDocByName(Principal principal, ModelMap map, @RequestParam String name,
			HttpServletRequest request) {
		try {
			if (principal == null) {
				return "ajaxTrue";
			} else {
				HttpSession hs = request.getSession(false);
				String folderPath = "";
				if (hs != null) {
					folderPath = (String) hs.getAttribute("currentFolder");
				}
				String userid = "";
				if (principal.getName().contains("@")) {
					userid = principal.getName();
				} else {
					userid = principal.getName() + Config.EDMS_DOMAIN;
				}
				if (folderPath.equals("")) {
					hs.setAttribute("currentFolder", "/" + userid);
					hs.setAttribute("currentDoc", "/" + userid);
					folderPath = "/" + userid;
				}
				GetFolderByPathResponse folderResponse = documentModuleClient.getFolderByPath(folderPath, userid,
						principal.getPassword());

				if (!name.matches(".*\\d+.*")) {
					if (name.indexOf("--") > 0) {
						name = name.replace("--", " ");
					} else {
						name = name.replace("-", " ");
					}
				} else {
					name = name.replace("--", " ");
					String[] str = name.split("-");
					name = str[0];
					for (int i = 0; i < str.length - 1; i++) {
						boolean flag1 = false, flag2 = false;
						try {
							if(name.matches(".*\\d+.*"))
							flag1 = true;
							else
								flag1=false;
						} catch (NumberFormatException e) {
							flag1 = false;
						} catch (NullPointerException e) {
							flag1 = false;
						}
						try {
							if(name.matches(".*\\d+.*"))
							flag2 = true;
							else
								flag2=false;
							
						} catch (NumberFormatException e) {
							flag2 = false;
						} catch (NullPointerException e) {
							flag2 = false;
						}
						if (!flag1 && flag2 || (flag1 && flag2)) {
							name = name + "-" + str[i + 1];
						} else {
							name = name + " " + str[i + 1];
						}

					}
				}
				SearchDocByLikeResponse searchResponse = documentModuleClient.searchDocByLike(name, folderPath,
						Config.EDMS_NAME, userid, principal.getPassword());
				List<Folder> folderList = searchResponse.getSearchedFolders().getFoldersList().getFolderList();
				map.addAttribute("folderList", folderList);
				List<edms.wsdl.File> fileList = searchResponse.getSearchedFolders().getFilesList().getFileList();
				map.addAttribute("fileList", fileList);
				map.addAttribute("userid", userid);
				map.addAttribute("currentFolder", folderResponse.getFolder());
				map.addAttribute("breadcumPath", folderPath);
				return "fileSystem";
			}
		} catch (Exception e) {

			return "ajaxTrue";
		}
	}

	@RequestMapping(value = "/getDocsByKeyWords")
	public String getDocsByKeyWords(Principal principal, ModelMap map, @RequestParam String name,
			HttpServletRequest request) {
		try {

			if (principal == null) {
				return "ajaxTrue";
			} else {
				HttpSession hs = request.getSession(false);
				String folderPath = "";
				if (hs != null) {
					folderPath = (String) hs.getAttribute("currentFolder");
				}
				String userid = "";
				if (principal.getName().contains("@")) {
					userid = principal.getName();
				} else {
					userid = principal.getName() + Config.EDMS_DOMAIN;
				}
				if (folderPath.equals("")) {
					hs.setAttribute("currentFolder", "/" + userid);
					hs.setAttribute("currentDoc", "/" + userid);
					folderPath = "/" + userid;
				}
				GetFolderByPathResponse folderResponse = documentModuleClient.getFolderByPath(folderPath, userid,
						principal.getPassword());
				if (name.split("/").length > 3)
					name = name.replaceFirst("/", " ");

				if (!name.matches(".*\\d+.*")) {
					if (name.indexOf("--") > 0) {
						name = name.replace("--", " ");
					} else {
						name = name.replace("-", " ");
					}
				} else {
					name = name.replace("--", " ");
					String[] str = name.split("-");
					name = str[0];
					for (int i = 0; i < str.length - 1; i++) {
						boolean flag1 = false, flag2 = false;
						try {
							Integer.parseInt(str[i]);
							flag1 = true;
						} catch (NumberFormatException e) {
							flag1 = false;
						} catch (NullPointerException e) {
							flag1 = false;
						}
						try {
							Integer.parseInt(str[i + 1]);
							flag2 = true;
						} catch (NumberFormatException e) {
							flag2 = false;
						} catch (NullPointerException e) {
							flag2 = false;
						}
						if (flag1 || flag2) {
							name = name + "-" + str[i + 1];
						} else {
							name = name + " " + str[i + 1];
						}

					}

				}
				SearchDocByLikeResponse searchResponse = documentModuleClient.searchDocByLike(name, folderPath,
						Config.EDMS_KEYWORDS, userid, principal.getPassword());
				List<Folder> folderList = searchResponse.getSearchedFolders().getFoldersList().getFolderList();
				map.addAttribute("folderList", folderList);
				List<edms.wsdl.File> fileList = searchResponse.getSearchedFolders().getFilesList().getFileList();
				map.addAttribute("fileList", fileList);
				map.addAttribute("userid", userid);
				map.addAttribute("currentFolder", folderResponse.getFolder());
				map.addAttribute("breadcumPath", folderPath);
				return "fileSystem";
			}
		} catch (Exception e) {

			return "ajaxTrue";
		}
	}

	@RequestMapping(value = "/getDocsByDate")
	public String getDocsByDate(Principal principal, ModelMap map, @RequestParam String name,
			HttpServletRequest request) {
		try {

			if (principal == null) {
				return "ajaxTrue";
			} else {
				HttpSession hs = request.getSession(false);
				String folderPath = "";
				if (hs != null) {
					folderPath = (String) hs.getAttribute("currentFolder");
				}
				String userid = "";
				if (principal.getName().contains("@")) {
					userid = principal.getName();
				} else {
					userid = principal.getName() + Config.EDMS_DOMAIN;
				}
				if (folderPath.equals("")) {
					hs.setAttribute("currentFolder", "/" + userid);
					hs.setAttribute("currentDoc", "/" + userid);
					folderPath = "/" + userid;
				}
				Calendar cal = Calendar.getInstance();
				SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd'T'HH:mm:ss.SSSZ");
				String date = format.format(cal.getTime());
				switch (name) {
				case "yyyy": {
					name = date.substring(0, 4);
					break;
				}
				case "mm": {
					name = date.substring(0, 7);
					break;
				}
				case "dd": {
					name = date.substring(0, 10);
					break;
				}
				case "hh": {
					name = date.substring(0, 13);
					break;
				}
				default:
					break;
				}
				GetFolderByPathResponse folderResponse = documentModuleClient.getFolderByPath(folderPath, userid,
						principal.getPassword());
				SearchDocByDateResponse searchResponse = documentModuleClient.searchDocByDate(name, folderPath,
						Config.EDMS_CREATIONDATE, userid, principal.getPassword());
				List<Folder> folderList = searchResponse.getSearchedFolders().getFoldersList().getFolderList();
				map.addAttribute("folderList", folderList);
				List<edms.wsdl.File> fileList = searchResponse.getSearchedFolders().getFilesList().getFileList();
				map.addAttribute("fileList", fileList);
				map.addAttribute("userid", userid);
				map.addAttribute("currentFolder", folderResponse.getFolder());
				map.addAttribute("breadcumPath", folderPath);
				return "fileSystem";
			}
		} catch (Exception e) {

			return "ajaxTrue";
		}
	}
}
