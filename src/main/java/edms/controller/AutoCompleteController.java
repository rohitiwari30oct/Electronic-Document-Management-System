package edms.controller;

import edms.core.Config;
import edms.core.Principal;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edms.webservice.client.UserClient;
import edms.webservice.client.WorkflowClient;
import edms.wsdl.GetGenerateProcessImageResponse;
import edms.wsdl.GetStartFormDataResponse;
import edms.wsdl.GetUsersListResponse;
import edms.wsdl.StartFormData;

@Controller
public class AutoCompleteController {
	
	@Autowired private WorkflowClient workflowClient;
	@Autowired UserClient userClient;
	

	 @RequestMapping(value = "/autocomp", method = RequestMethod.GET)
	   public @ResponseBody String autocomp(ModelMap map, Principal principal, HttpServletRequest request) {                 
		 String res="";
		 String userid="";
			if(principal.getName().contains("@")){
					userid=principal.getName();
				}else{
					userid=principal.getName()+Config.EDMS_DOMAIN;
				}
		 GetUsersListResponse response = this.userClient.getUsersListRequest(userid,principal.getPassword());
	         
	      //jQuery related start		
			String query = (String)request.getParameter("q");
			
			int cnt=1;
		
			  ArrayList<String> userlist=(ArrayList<String>)response.getUsersList();
              for(String str:userlist){
				if(str.toUpperCase().startsWith(query.toUpperCase()))
				{
					res+=str+"\n";
					if(cnt>=10)
						break;
					cnt++;
				}
			}
		//jQuery related end
	   
	 	

			   
	 return res;
	  }
	

}
