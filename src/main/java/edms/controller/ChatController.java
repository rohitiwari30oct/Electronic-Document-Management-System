package edms.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edms.chatdwr.ScriptSessList;
import edms.chatdwr.XmppChatClass;

@Controller
public class ChatController {
	
	@Autowired private ScriptSessList scriptSessList;
	
	@Value ("${xmppDomain}") private String xmppDomain;
	@Value ("${packetReplyTimeout}") private int packetReplyTimeout; // millis
	@Value ("${chatImageFolder}") private String chatImageFolder;
	@Value ("${onlineStatus}") private String onlineStatus;
	@Value ("${awayStatus}") private String awayStatus;
	@Value ("${dndStatus}") private String dndStatus;
	
	@RequestMapping(value = "/sendChatMessage", method = RequestMethod.GET)
    public @ResponseBody String sendChat(@RequestParam Map<String,String> requestParams, HttpServletRequest request)
    {   
		String message=requestParams.get("message");
		String buddyJID=requestParams.get("buddyJID");
		XmppChatClass xmppChatClass=(XmppChatClass)request.getSession().getAttribute("xmppChatClass");
		xmppChatClass.sendChatMessages(message, buddyJID); 
		return "success";
    }
	
	@RequestMapping(value = "/inviteBuddy", method = RequestMethod.GET)
    public @ResponseBody String sendInvite(@RequestParam(value="buddyJID")String buddyJID, HttpServletRequest request){  
		XmppChatClass xmppChatClass=(XmppChatClass)request.getSession().getAttribute("xmppChatClass");
		xmppChatClass.sendInvite(buddyJID);
		return "Invited Successfully";
    }
	
	@RequestMapping(value = "/respondFrndReq", method = RequestMethod.GET)
    public @ResponseBody String respondToReq(@RequestParam(value="fromJID")String fromJID, HttpServletRequest request){ 
		XmppChatClass xmppChatClass=(XmppChatClass)request.getSession().getAttribute("xmppChatClass");
		xmppChatClass.acceptFrndReq(fromJID);
		return "Friend Request Accepted Successfully!";
    }
	
	@RequestMapping(value = "/denyFrndReq", method = RequestMethod.GET)
    public @ResponseBody String denyToReq(@RequestParam(value="fromJID")String fromJID, HttpServletRequest request){ 
		XmppChatClass xmppChatClass=(XmppChatClass)request.getSession().getAttribute("xmppChatClass");
		xmppChatClass.denyFrndReq(fromJID);
		return "Friend Request Refused!";
    }
	
	@RequestMapping(value = "/logoutChat", method = RequestMethod.GET)
    public @ResponseBody String closeChat(HttpServletRequest request){  
		System.out.println("in logout chat");
		XmppChatClass xmppChatClass=(XmppChatClass)request.getSession().getAttribute("xmppChatClass");
		xmppChatClass.closeConnection();
		return "successful log out";
    }
	
	@RequestMapping(value = "/reconnectChat", method = RequestMethod.GET)
    public @ResponseBody String reconnectChat(HttpServletRequest request){  
		System.out.println("in reconnectChat");
		//System.out.println("userid="+loginUser.getUserid());
				//System.out.println("password="+loginUser.getPassword());
				XmppChatClass xmppChatClass=new XmppChatClass();
				//TODO: SEPERATE THE CONFIGURATION
				xmppChatClass.createConnection(xmppDomain, packetReplyTimeout, request);
				xmppChatClass.registerListeners(chatImageFolder);
				//xmppChatClass.performLogin(loginUser.getUserid(), loginUser.getPassword(), onlineStatus);
				xmppChatClass.performLogin("nirbhay@silvereye.in", "google@2009", onlineStatus);
				scriptSessList.listenScriptSession();
				request.getSession().setAttribute("xmppChatClass", xmppChatClass);
		        return "successfully reconnected";
    }
	
	@RequestMapping(value = "/changedPresence", method = RequestMethod.GET)
    public @ResponseBody void changePresenceInfo(@RequestParam(value="presmode")String presmode, HttpServletRequest request){  
		XmppChatClass xmppChatClass=(XmppChatClass)request.getSession().getAttribute("xmppChatClass");
		xmppChatClass.sendChangePresence(presmode, onlineStatus, awayStatus, dndStatus);
    }

}
