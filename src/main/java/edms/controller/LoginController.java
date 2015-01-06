package edms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edms.model.LoginModel;

@Controller
public class LoginController {
	
	@RequestMapping(value="/index", method=RequestMethod.GET)
	public String getLogin(ModelMap map){
		System.out.println("in index..........");
		//map.addAttribute("loginUser", new LoginModel());
		return "login";
	}
	
	/*@RequestMapping(value="/login_dashboard", method=RequestMethod.GET)
	public String getUserDashboard(){
		System.out.println("in login_dashboard..........");
		return "userDashboard";
	}*/

}
