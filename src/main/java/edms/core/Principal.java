package edms.core;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class Principal{
	String name;
	String password;
	
	HttpServletRequest request=((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
	HttpSession hs = request.getSession(false);
		
	public String getName() {
		if(hs!=null)
		return (String)hs.getAttribute("userName");
		else
			return null;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		if(hs!=null)
		return (String)hs.getAttribute("password");
		else
			return null;
	}
	public void setPassword(String password) {
		this.password = password;
	}

}
