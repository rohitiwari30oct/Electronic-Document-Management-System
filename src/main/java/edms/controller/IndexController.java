package edms.controller;

import java.io.IOException;
import edms.core.Principal;
import java.text.MessageFormat;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import edms.core.Config;
import edms.webservice.client.DocumentModuleClient;
import edms.webservice.client.UserClient;
import edms.webservice.client.WorkflowClient;
import edms.wsdl.Folder;
import edms.wsdl.GetFileWithOutStreamResponse;
import edms.wsdl.GetFolderByPathResponse;
import edms.wsdl.GetFolderResponse;
import edms.wsdl.GetRecycledDocsResponse;
import edms.wsdl.GetUsersListResponse;
import edms.wsdl.RecentlyModifiedResponse;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import javax.naming.Context;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.ReferralException;
import javax.naming.directory.Attribute;
import javax.naming.directory.Attributes;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class IndexController {
	
//	@Autowired private ScriptSessList scriptSessList;
	//@Autowired private Runner runner;
	
	@Value ("${xmppDomain}") private String xmppDomain;
	@Value ("${packetReplyTimeout}") private int packetReplyTimeout; // millis
	@Value ("${chatImageFolder}") private String chatImageFolder;
	@Value ("${onlineStatus}") private String onlineStatus;

	@Autowired DocumentModuleClient documentModuleClient;
	@Autowired UserClient userClient;
	@Autowired WorkflowClient workflowClient;

	@RequestMapping(value = "/userDashboard", method = RequestMethod.GET)
	public String getUserDashboard(ModelMap map,Principal principal,HttpServletRequest request) {
		try{
		HttpSession hs = request.getSession(false);
		if(principal==null){
			return "login";
		}
		if (hs.getAttribute("currentFolder") == null) {
				if(principal.getName().contains("@")){
					hs.setAttribute("currentFolder", "/"+principal.getName());
					hs.setAttribute("currentDoc", "/"+principal.getName());
				}else{
					hs.setAttribute("currentFolder", "/"+principal.getName()+Config.EDMS_DOMAIN);
					hs.setAttribute("currentDoc", "/"+principal.getName()+Config.EDMS_DOMAIN);
				}
			}
		String path="";
		if(principal.getName().contains("@")){
			path = "/"+principal.getName();	
		}else{
		path = "/"+principal.getName()+Config.EDMS_DOMAIN;
		}
		String userid="";
		if(principal.getName().contains("@")){
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		GetFolderByPathResponse folderByPath=documentModuleClient.getFolderByPath(path,userid,principal.getPassword());
		GetFolderResponse folderResponse = documentModuleClient.getFolderRequest(path,userid,principal.getPassword());
		List<Folder> folderList = folderResponse.getGetFoldersByParentFolder()
				.getFolderListResult().getFolderList();
		documentModuleClient.printResponse(folderResponse);	
		Folder folderNode=folderByPath.getFolder();
		map.addAttribute("principal", principal);
		map.addAttribute("currentFolder",folderNode);
		map.addAttribute( "folderList", folderList);
		map.addAttribute("folderClient",documentModuleClient);
		map.addAttribute("breadcumPath","/"+userid);
		map.addAttribute("userid",userid );
		return "dashboard";
	}catch(Exception e){
		return "ajaxTrue";
	}
	}

	@RequestMapping(value = "/calender", method = RequestMethod.GET)
	public String getCalender(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "calender";
		}
	}
	
	

	@RequestMapping(value = "/workflow", method = RequestMethod.GET)
	public String getWorkflow(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "workflow";
		}
	}
	
	@RequestMapping(value = "/travelExpensesReimbursementHistory", method = RequestMethod.GET)
	public String travelExpensesReimbursementHistory(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "travelExpensesReimbursementHistory";
		}
	}

	@RequestMapping(value = "/startTravelExpensesReimbursement", method = RequestMethod.GET)
	public String startTravelExpensesReimbursement(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "startTravelExpensesReimbursement";
		}
	}

	@RequestMapping(value = "/verifyTravelExpensesReimbursement", method = RequestMethod.GET)
	public String verifyTravelExpensesReimbursement(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "verifyTravelExpensesReimbursement";
		}
	}

	@RequestMapping(value = "/approveTravelExpensesReimbursement", method = RequestMethod.GET)
	public String approveTravelExpensesReimbursement(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "approveTravelExpensesReimbursement";
		}
	}
	
	@RequestMapping(value = "/authorizeTravelExpensesReimbursement", method = RequestMethod.GET)
	public String authorizeTravelExpensesReimbursement(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "authorizeTravelExpensesReimbursement";
		}
	}
	@RequestMapping(value = "/accountTravelExpensesReimbursement", method = RequestMethod.GET)
	public String accountTravelExpensesReimbursement(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "accountTravelExpensesReimbursement";
		}
	}

	@RequestMapping(value = "/readjustTravelExpensesReimbursement", method = RequestMethod.GET)
	public String readjustTravelExpensesReimbursement(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "readjustTravelExpensesReimbursement";
		}
	}

	@RequestMapping(value = "/handleIOMFormHistory", method = RequestMethod.GET)
	public String handleIOMFormHistory(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "handleIOMFormHistory";
		}
	}

	@RequestMapping(value = "/attachmentIOMForm", method = RequestMethod.GET)
	public String attachmentIOMForm(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "attachmentIOMForm";
		}
	}
	@RequestMapping(value = "/startIOMForm", method = RequestMethod.GET)
	public String startIOMForm(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "startIOMForm";
		}
	}
	@RequestMapping(value = "/handleIOMForm", method = RequestMethod.GET)
	public String handleIOMForm(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "handleIOMForm";
		}
	}
	@RequestMapping(value = "/handleIOMForm2", method = RequestMethod.GET)
	public String handleIOMForm2(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "handleIOMForm2";
		}
	}
	@RequestMapping(value = "/readjustIOMForm", method = RequestMethod.GET)
	public String readjustIOMForm(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "readjustIOMForm";
		}
	}
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "test";
		}
	}

	@RequestMapping(value = "/startPurchaseRequisitionApplicationForm", method = RequestMethod.GET)
	public String startPurchaseRequisitionApplicationForm(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "startPurchaseRequisitionApplicationForm";
		}
	}
	
	@RequestMapping(value = "/handlePurchaseRequisitionApplicationForm", method = RequestMethod.GET)
	public String handlePurchaseRequisitionApplicationForm(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "handlePurchaseRequisitionApplicationForm";
		}
	}
	

	@RequestMapping(value = "/approvePurchaseRequisitionApplicationForm", method = RequestMethod.GET)
	public String approvePurchaseRequisitionApplicationForm(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "approvePurchaseRequisitionApplicationForm";
		}
	}
	
	
	@RequestMapping(value = "/handlePurchaseRequisitionApplicationFormHistory", method = RequestMethod.GET)
	public String handlePurchaseRequisitionApplicationFormHistory(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "handlePurchaseRequisitionApplicationFormHistory";
		}
	}
	@RequestMapping(value = "/lastHandlePurchaseRequisitionApplicationForm", method = RequestMethod.GET)
	public String lasthandlePurchaseRequisitionApplicationForm(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "lastHandlePurchaseRequisitionApplicationForm";
		}
	}
	
	
	@RequestMapping(value = "/readjustPurchaseRequisitionApplicationForm", method = RequestMethod.GET)
	public String readjustPurchaseRequisitionApplicationForm(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "readjustPurchaseRequisitionApplicationForm";
		}
	}
	
	
	@RequestMapping(value = "/startPurchaseRequisitionApplicationFormHO", method = RequestMethod.GET)
	public String startPurchaseRequisitionApplicationFormHO(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "startPurchaseRequisitionApplicationFormHO";
		}
	}
	
	@RequestMapping(value = "/handlePurchaseRequisitionApplicationFormHO", method = RequestMethod.GET)
	public String handlePurchaseRequisitionApplicationFormHO(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "handlePurchaseRequisitionApplicationFormHO";
		}
	}
	

	@RequestMapping(value = "/approvePurchaseRequisitionApplicationFormHO", method = RequestMethod.GET)
	public String approvePurchaseRequisitionApplicationFormHO(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "approvePurchaseRequisitionApplicationFormHO";
		}
	}
	@RequestMapping(value = "/handlePurchaseRequisitionApplicationFormHOHistory", method = RequestMethod.GET)
	public String handlePurchaseRequisitionApplicationFormHOHistory(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "handlePurchaseRequisitionApplicationFormHOHistory";
		}
	}
	@RequestMapping(value = "/lastHandlePurchaseRequisitionApplicationFormHO", method = RequestMethod.GET)
	public String lasthandlePurchaseRequisitionApplicationFormHO(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "lastHandlePurchaseRequisitionApplicationFormHO";
		}
	}
	
	
	@RequestMapping(value = "/readjustPurchaseRequisitionApplicationFormHO", method = RequestMethod.GET)
	public String readjustPurchaseRequisitionApplicationFormHO(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "readjustPurchaseRequisitionApplicationFormHO";
		}
	}
	
	

	   @RequestMapping(value = "/medicalExpensesReimbursementHistory", method = RequestMethod.GET)
	    public String medicalExpensesReimbursementHistory(ModelMap map,Principal principal) {
	        if(principal==null){return "ajaxTrue";}else{
	        return "medicalExpensesReimbursementHistory";
	        }
	    }
	   @RequestMapping(value = "/startMedicalExpensesReimbursement", method = RequestMethod.GET)
	    public String startMedicalExpensesReimbursement(ModelMap map,Principal principal) {
	        if(principal==null){return "ajaxTrue";}else{
	        return "startMedicalExpensesReimbursement";
	        }
	    }

	    @RequestMapping(value = "/verifyMedicalExpensesReimbursement", method = RequestMethod.GET)
	    public String verifyMedicalExpensesReimbursement(ModelMap map,Principal principal) {
	        if(principal==null){return "ajaxTrue";}else{
	        return "verifyMedicalExpensesReimbursement";
	        }
	    }

	    @RequestMapping(value = "/approveMedicalExpensesReimbursement", method = RequestMethod.GET)
	    public String approveMedicalExpensesReimbursement(ModelMap map,Principal principal) {
	        if(principal==null){return "ajaxTrue";}else{
	        return "approveMedicalExpensesReimbursement";
	        }
	    }

	    @RequestMapping(value = "/authorizeMedicalExpensesReimbursement", method = RequestMethod.GET)
	    public String authorizeMedicalExpensesReimbursement(ModelMap map,Principal principal) {
	        if(principal==null){return "ajaxTrue";}else{
	        return "authorizeMedicalExpensesReimbursement";
	        }
	    }
	    @RequestMapping(value = "/accountMedicalExpensesReimbursement", method = RequestMethod.GET)
	    public String accountMedicalExpensesReimbursement(ModelMap map,Principal principal) {
	        if(principal==null){return "ajaxTrue";}else{
	        return "accountMedicalExpensesReimbursement";
	        }
	    }

	    @RequestMapping(value = "/readjustMedicalExpensesReimbursement", method = RequestMethod.GET)
	    public String readjustMedicalExpensesReimbursement(ModelMap map,Principal principal) {
	        if(principal==null){return "ajaxTrue";}else{
	        return "readjustMedicalExpensesReimbursement";
	        }
	    }
	
	    
	

		@RequestMapping(value = "/leaveApplicationFormHistory", method = RequestMethod.GET)
		public String leaveApplicationFormHistory(ModelMap map,Principal principal) {
			if(principal==null){return "ajaxTrue";}else{
			return "leaveApplicationFormHistory";
			}
		}
		@RequestMapping(value = "/startLeaveApplicationForm", method = RequestMethod.GET)
		public String startLeaveApplicationForm(ModelMap map,Principal principal) {
			if(principal==null){return "ajaxTrue";}else{
			return "startLeaveApplicationForm";
			}
		}
	
	@RequestMapping(value = "/verifyLeaveApplicationForm", method = RequestMethod.GET)
	public String verifyLeaveApplicationForm(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "verifyLeaveApplicationForm";
		}
	}
	
	@RequestMapping(value = "/approveLeaveApplicationForm", method = RequestMethod.GET)
	public String approveLeaveApplicationForm(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "approveLeaveApplicationForm";
		}
	}
	
	@RequestMapping(value = "/authorizeLeaveApplicationForm", method = RequestMethod.GET)
	public String authorizeLeaveApplicationForm(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "authorizeLeaveApplicationForm";
		}
	}
	
	@RequestMapping(value = "/readjustLeaveApplicationForm", method = RequestMethod.GET)
	public String readjustLeaveApplicationForm(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "readjustLeaveApplicationForm";
		}
	}
	
	
	@RequestMapping(value = "/startInterOfficeMemoForm", method = RequestMethod.GET)
	public String startInterOfficeMemoForm(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "startInterOfficeMemoForm";
		}
	}
	
	
	@RequestMapping(value = "/startCashPaymentVoucherForm", method = RequestMethod.GET)
	public String startCashPaymentVoucherForm(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "startCashPaymentVoucherForm";
		}
	}
	
	
	@RequestMapping(value = "/handleCashPaymentVoucherForm", method = RequestMethod.GET)
	public String handleCashPaymentVoucherForm(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "handleCashPaymentVoucherForm";
		}
	}
	
	
	@RequestMapping(value = "/readjustCashPaymentVoucherForm", method = RequestMethod.GET)
	public String readjustCashPaymentVoucherForm(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "readjustCashPaymentVoucherForm";
		}
	}
	

	@RequestMapping(value = "/handleCashPaymentVoucherFormHistory", method = RequestMethod.GET)
	public String handleCashPaymentVoucherFormHistory(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "handleCashPaymentVoucherFormHistory";
		}
	}

	@RequestMapping(value = "/lastHandleCashPaymentVoucherForm", method = RequestMethod.GET)
	public String lastHandleCashPaymentVoucherForm(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "lastHandleCashPaymentVoucherForm";
		}
	}
	
	@RequestMapping(value = "/handleCashPaymentVoucherApproveForm", method = RequestMethod.GET)
	public String handleCashPaymentVoucherApproveForm(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "handleCashPaymentVoucherApproveForm";
		}
	}
	
	@RequestMapping(value = "/handleCashPaymentVoucherUserForm", method = RequestMethod.GET)
	public String handleCashPaymentVoucherUserForm(ModelMap map,Principal principal) {
		if(principal==null){return "ajaxTrue";}else{
		return "handleCashPaymentVoucherUserForm";
		}
	}
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/recently", method = RequestMethod.GET)
	public String getRecently(ModelMap map,Principal principal) {
		try{
		if(principal==null){return "ajaxTrue";}else{
			String path="";
			if(principal.getName().contains("@")){
				path = "/"+principal.getName();	
			}else{
			path = "/"+principal.getName()+Config.EDMS_DOMAIN;
			}
			String userid="";
			if(principal.getName().contains("@")){
				userid=principal.getName();
				}else{
					userid=principal.getName()+Config.EDMS_DOMAIN;
				}
			
			RecentlyModifiedResponse recentlyModifiedResponse = documentModuleClient.getRecentlyModified(path,userid,principal.getPassword());
			List<Folder> folderList = recentlyModifiedResponse.getRecentlyModifiedFolders().getFoldersList().getFolderList();
			map.addAttribute("folderList", folderList);
			List<edms.wsdl.File> fileList=recentlyModifiedResponse.getRecentlyModifiedFolders().getFilesList().getFileList();
			map.addAttribute("fileList", fileList);
			map.addAttribute("userid",userid);
			GetFolderByPathResponse folderByPath=documentModuleClient.getFolderByPath(path,userid,principal.getPassword());
			Folder folderNode=folderByPath.getFolder();
			map.addAttribute("principal", principal);
			map.addAttribute("currentFolder",folderNode);
			map.addAttribute("breadcumPath","/"+userid);
			return "fileSystem";
		}
	}catch(Exception e){
		return "ajaxTrue";
	}
	}
	@RequestMapping(value = "/getLeftDocument", method = RequestMethod.GET)
	public String getLeftDocument(ModelMap map,Principal principal,HttpServletRequest request) {
		try{
		if(principal==null){return "ajaxTrue";}else{
		String path="";
		if(principal.getName().contains("@")){
			path = "/"+principal.getName();	
		}else{
		path = "/"+principal.getName()+Config.EDMS_DOMAIN;
		}
		String userid="";
		if(principal.getName().contains("@")){
				userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		GetFolderResponse folderResponse = documentModuleClient
				.getFolderRequest(path, userid,principal.getPassword());
		List<Folder> folderList = folderResponse.getGetFoldersByParentFolder()
				.getFolderListResult().getFolderList();
		GetFileWithOutStreamResponse fileResponse = documentModuleClient.getFileWithOutStreamRequest(
				path, userid,principal.getPassword());
		List<edms.wsdl.File> fileList = fileResponse.getGetFilesByParentFile()
				.getFileListResult().getFileList();
		map.addAttribute("fileList", fileList);
		map.addAttribute("folderClient", documentModuleClient);
		map.addAttribute("folderList", folderList);
		map.addAttribute("principal", principal);
		return "myDocument";	
		}
		}catch(Exception e){
			return "ajaxTrue";
		}
	
	}
	@RequestMapping(value = "/setting", method = RequestMethod.GET)
	public String getSetting(ModelMap map,Principal principal) {
		try{
		if(principal==null){return "ajaxTrue";}else{
			String userid="";
			if(principal.getName().contains("@")){
				userid=principal.getName();
				}else{
					userid=principal.getName()+Config.EDMS_DOMAIN;
				}
			map.addAttribute("userid",userid);
		return "setting";	
		}
	}catch(Exception e){
		return "ajaxTrue";
	}
	}
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String dashboard(ModelMap map,Principal principal) {
		try{
		if(principal==null){return "ajaxTrue";}else{
			String userid="";
			if(principal.getName().contains("@")){
				userid=principal.getName();
				}else{
					userid=principal.getName()+Config.EDMS_DOMAIN;
				}
			map.addAttribute("userid",userid);
		return "dashboard";	
		}
	}catch(Exception e){
		return "ajaxTrue";
	}
	}
	@RequestMapping(value = "/trash", method = RequestMethod.GET)
	public String getTrash(ModelMap map,Principal principal) {
		try{
		if(principal==null){return "ajaxTrue";}else{
		String userid="";
		if(principal.getName().contains("@")){
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		String path="/"+userid+"/trash";
		GetRecycledDocsResponse folderResponse = documentModuleClient.getRecycledDoc(userid,principal.getPassword(), path);
		List<Folder> folderList = folderResponse.getGetRecycledDocs().getFoldersList().getFolderList();
		map.addAttribute("folderList", folderList);
		map.addAttribute("fileList", folderResponse.getGetRecycledDocs().getFilesList().getFileList());
		map.addAttribute("userid",userid);
		return "trash";	}
	}catch(Exception e){
		return "ajaxTrue";
	}
	}
	//@SuppressWarnings("deprecation")
	@RequestMapping(value = "/welcome", method = RequestMethod.POST)
	public String getIndex(ModelMap map, Principal principal, HttpServletRequest request) throws  IOException {
		
		HttpSession hs = request.getSession(false);
	
		try{
		if(principal==null){
			return "index";
		}
		String userName=request.getParameter("j_username");
		userName=userName.toLowerCase();
		String password=request.getParameter("j_password");
		hs.setAttribute("userName",userName);
		hs.setAttribute("password",password);

	
		
		
		
		if (hs.getAttribute("currentFolder") == null) {
			if(principal.getName().contains("@")){
					hs.setAttribute("currentFolder", "/"+principal.getName());
					hs.setAttribute("currentDoc", "/"+principal.getName());
				}else{
					hs.setAttribute("currentFolder", "/"+principal.getName()+Config.EDMS_DOMAIN);
					hs.setAttribute("currentDoc", "/"+principal.getName()+Config.EDMS_DOMAIN);
				}
			}
		
		
		String path="";
		if(principal.getName().contains("@")){
			path = "/"+principal.getName();	
			Config.EDMS_DOMAIN=principal.getName().substring(principal.getName().lastIndexOf("@"));
		}else{
		path = "/"+principal.getName()+Config.EDMS_DOMAIN;
		}
		String userid="";
		
		
		if(principal.getName().contains("@")){
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		GetFolderByPathResponse folderByPath=null;
		 folderByPath=documentModuleClient.getFolderByPath(path,userid,principal.getPassword());
		GetFolderResponse folderResponse = documentModuleClient.getFolderRequest(path,userid,principal.getPassword());
		GetFileWithOutStreamResponse fileResponse = documentModuleClient.getFileWithOutStreamRequest(
				path, userid,principal.getPassword());
		List<edms.wsdl.File> fileList = fileResponse.getGetFilesByParentFile()
				.getFileListResult().getFileList();
		map.addAttribute("fileList", fileList);
		List<Folder> folderList = folderResponse.getGetFoldersByParentFolder()
				.getFolderListResult().getFolderList();
		documentModuleClient.printResponse(folderResponse);	
		Folder folderNode=folderByPath.getFolder();
		map.addAttribute("principal", principal);
		map.addAttribute("currentFolder",folderNode);
		map.addAttribute( "folderList", folderList);
		map.addAttribute("folderClient",documentModuleClient);
		map.addAttribute("userid",userid );  
		GetUsersListResponse response = this.userClient.getUsersListRequest(userid,password);
        map.addAttribute("userlist", (Object)response.getUsersList());
		map.addAttribute("breadcumPath","/"+userid);
	}catch(Exception e){
		map.addAttribute("message", "Incorrect Username/Password");
		if(hs!=null){
			hs.invalidate();
		}
		return "login";
	}
		return "userDashboard";
	}
/*	@RequestMapping(value = "/welcome", method = RequestMethod.GET)
	public String getIndex1(ModelMap map, Principal principal, HttpServletRequest request) throws  IOException {
		
		HttpSession hs = request.getSession(false);
		if(hs!=null){
		try{
		if(principal==null){
			return "index";
		}
		String userName=request.getParameter("j_username");
		userName=userName.toLowerCase();
		String password=request.getParameter("j_password");
		hs.setAttribute("userName",userName);
		hs.setAttribute("password",password);

	
		
		
		
		if (hs.getAttribute("currentFolder") == null) {
			if(principal.getName().contains("@")){
					hs.setAttribute("currentFolder", "/"+principal.getName());
					hs.setAttribute("currentDoc", "/"+principal.getName());
				}else{
					hs.setAttribute("currentFolder", "/"+principal.getName()+Config.EDMS_DOMAIN);
					hs.setAttribute("currentDoc", "/"+principal.getName()+Config.EDMS_DOMAIN);
				}
			}
		
		
		String path="";
		if(principal.getName().contains("@")){
			path = "/"+principal.getName();	
			Config.EDMS_DOMAIN=principal.getName().substring(principal.getName().lastIndexOf("@"));
		}else{
		path = "/"+principal.getName()+Config.EDMS_DOMAIN;
		}
		String userid="";
		
		
		if(principal.getName().contains("@")){
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		GetFolderByPathResponse folderByPath=null;
		 folderByPath=documentModuleClient.getFolderByPath(path,userid,principal.getPassword());
		GetFolderResponse folderResponse = documentModuleClient.getFolderRequest(path,userid,principal.getPassword());
		GetFileWithOutStreamResponse fileResponse = documentModuleClient.getFileWithOutStreamRequest(
				path, userid,principal.getPassword());
		List<edms.wsdl.File> fileList = fileResponse.getGetFilesByParentFile()
				.getFileListResult().getFileList();
		map.addAttribute("fileList", fileList);
		List<Folder> folderList = folderResponse.getGetFoldersByParentFolder()
				.getFolderListResult().getFolderList();
		documentModuleClient.printResponse(folderResponse);	
		Folder folderNode=folderByPath.getFolder();
		map.addAttribute("principal", principal);
		map.addAttribute("currentFolder",folderNode);
		map.addAttribute( "folderList", folderList);
		map.addAttribute("folderClient",documentModuleClient);
		map.addAttribute("userid",userid );  
		GetUsersListResponse response = this.userClient.getUsersListRequest(userid,password);
        map.addAttribute("userlist", (Object)response.getUsersList());
		map.addAttribute("breadcumPath","/"+userid);
	}catch(Exception e){
		map.addAttribute("message", "Incorrect Username/Password");
		if(hs!=null){
			hs.invalidate();
		}
		return "login";
	}}else{

		return "login";
	}
		return "userDashboard";
	}*/
	
	private List<String> ldapSearch(String searchBase, String searchFilter,
			String attribute) {
		List<String> searchBases = new ArrayList<String>();
		searchBases.add(searchBase);
		return ldapSearch(searchBases, searchFilter, attribute);
	}

//	@SuppressWarnings("unchecked")
	private List<String> ldapSearch(List<String> searchBases,
			String searchFilter, String attribute) {
		// System.out.println("ldap search start");
		List<String> al = new ArrayList<String>();
		DirContext ctx = null;
		Hashtable<String, String> env = getEnvironment();

		try {
			ctx = new InitialDirContext(env);
			SearchControls searchCtls = new SearchControls();
			searchCtls.setSearchScope(SearchControls.SUBTREE_SCOPE);

			for (String searchBase : searchBases) {
				NamingEnumeration<SearchResult> results = ctx.search(
						searchBase, searchFilter, searchCtls);

				while (results.hasMore()) {
					SearchResult searchResult = (SearchResult) results.next();
					Attributes attributes = searchResult.getAttributes();

					if (attribute.equals("")) {
						StringBuilder sb = new StringBuilder();

						for (NamingEnumeration<?> ne = attributes.getAll(); ne
								.hasMore();) {
							Attribute attr = (Attribute) ne.nextElement();
							sb.append(attr.toString());
							sb.append("\n");
						}

						al.add(sb.toString());
					} else {
						Attribute attrib = attributes.get(attribute);

						if (attrib != null) {
							// Handle multi-value attributes
							for (NamingEnumeration<?> ne = attrib.getAll(); ne
									.hasMore();) {
								String value = (String) ne.nextElement();

								// If FQDN get only main part
								if (value.startsWith("CN=")
										|| value.startsWith("cn=")) {
									String cn = value.substring(3,
											value.indexOf(','));
									al.add(cn);
								} else {
									al.add(value);
								}
							}
						}
					}
				}
			}
		} catch (ReferralException e) {

			try {
			} catch (org.springframework.ldap.NamingException e1) {
			}
		} catch (NamingException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ctx != null) {
					ctx.close();
				}
			} catch (NamingException e) {
				e.printStackTrace();
			}
		}
		// System.out.println("ldap search end");
		return al;
	}

	private static Hashtable<String, String> getEnvironment() {
		// System.out.println("env start");
		Hashtable<String, String> env = new Hashtable<String, String>();

		env.put(Context.INITIAL_CONTEXT_FACTORY,
				"com.sun.jndi.ldap.LdapCtxFactory");
		env.put(Context.SECURITY_AUTHENTICATION, "simple");
		env.put(Context.PROVIDER_URL, "ldap://192.168.1.111:389");

		env.put("com.sun.jndi.ldap.connect.pool", "true");

	
		env.put(Context.REFERRAL, "follow");

		// Optional is some cases (Max OS/X)
		env.put(Context.SECURITY_PRINCIPAL,
				"CN=Administrator,CN=Users,DC=silvereye,DC=co");

		env.put(Context.SECURITY_CREDENTIALS, "##DJ##1891");
		// System.out.println("env end");
		return env;
	}

	public List<String> getRolesByUser(String user) throws Exception {
		List<String> list = new ArrayList<String>();

		// @formatter:off
		List<String> ldap = ldapSearch(MessageFormat.format(
				"DC=silvereye,DC=co", user), MessageFormat.format(
				"(&(objectCategory=person)(sAMAccountName={0}))", user),
				"memberOf");
		// @formatter:on

		for (Iterator<String> it = ldap.iterator(); it.hasNext();) {
			String role = it.next();
			System.out.println("User role is : " + role);
			list.add(role);
		}

		return list;
	}

	public String getName(String user) throws Exception {
		String name = null;

		// @formatter:off
		List<String> ldap = ldapSearch(
				MessageFormat.format("dc=silvereye,dc=co", user),
				MessageFormat.format("(objectCategory=person)", user), "cn");
		// @formatter:on

		if (!ldap.isEmpty()) {
			name = ldap.get(0);
		}

		System.out.println("User name is : " + name);
		return name;
	}

	public String getMail(String user) throws Exception {
		String mail = null;

		// @formatter:off
		List<String> ldap = ldapSearch(MessageFormat.format(
				"DC=silvereye,DC=co", user), MessageFormat.format(
				"(&(objectclass=person)(sAMAccountName={0}))", user), "mail");
		// @formatter:on

		if (!ldap.isEmpty()) {
			mail = ldap.get(0);
		}

		System.out.println("mail Of : " + user + "=  : " + mail);
		return mail;
	}
}
