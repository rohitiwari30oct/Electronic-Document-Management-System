package edms.controller;


import edms.core.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edms.webservice.client.UserClient;
import edms.wsdl.GetUsersListResponse;



@Controller
public class UserController {

	@Autowired UserClient userClient;
	
	@RequestMapping("/getUsersList")
	public String getUsersList(Model model,Principal principal){
		//GetUsersListResponse response=userClient.getUsersListRequest(userId, password)
		return "userDashboard";
	}
}
