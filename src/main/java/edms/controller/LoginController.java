package edms.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edms.core.PrincipalContainer;
import edms.model.LoginModel;

@Controller
public class LoginController {
	
	@RequestMapping(value="/index", method=RequestMethod.GET)
	public String getLogin(ModelMap map,Principal principal,HttpServletRequest request,String userName,String password){
		System.out.println("in index..........");
		/*PrincipalContainer principalContainer=new PrincipalContainer();
		principalContainer.setUserName(principal.getName());
		System.out.println(principalContainer.getUserName());
		System.out.println("Logged in user name is "+principal.getName());
		principalContainer.setPassword(password);
		//map.addAttribute("loginUser", new LoginModel());
		*/		
		return "login";
	}
	

/*	@RequestMapping(value="/tobelogout", method=RequestMethod.GET)
	public String tobelogout(ModelMap map,HttpServletResponse response,HttpServletRequest request,Principal principal){
		System.out.println("in logout..........");
		
		HttpSession session=request.getSession(false);
		session.invalidate();
		//map.addAttribute("loginUser", new LoginModel());
		return "/logout";
	}*/
	
	
	
	/*@RequestMapping(value="/login_dashboard", method=RequestMethod.GET)
	public String getUserDashboard(){
		System.out.println("in login_dashboard..........");
		return "userDashboard";
	}*/

}
