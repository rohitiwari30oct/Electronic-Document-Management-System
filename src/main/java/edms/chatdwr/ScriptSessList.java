package edms.chatdwr;

import javax.servlet.http.HttpSession;

import org.directwebremoting.Container;
import org.directwebremoting.ScriptSession;
import org.directwebremoting.ServerContextFactory;
import org.directwebremoting.event.ScriptSessionEvent;
import org.directwebremoting.event.ScriptSessionListener;
import org.directwebremoting.extend.ScriptSessionManager;
import org.jivesoftware.smack.XMPPConnection;
import org.jivesoftware.smack.tcp.XMPPTCPConnection;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Service
public class ScriptSessList {
	
	public void listenScriptSession() {
		   Container container = ServerContextFactory.get().getContainer();
		   ScriptSessionManager manager = container.getBean(ScriptSessionManager.class);
		   ScriptSessionListener listener=new ScriptSessionListener() {
			
			@Override
			public void sessionDestroyed(ScriptSessionEvent ev) {
				System.out.println("Script Session destroyed..........");
			}
			
			@Override
			public void sessionCreated(ScriptSessionEvent ev) {
				System.out.println("Script Session Created..........");
				ServletRequestAttributes sra=((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes());
				HttpSession httpSession=sra.getRequest().getSession();
				XMPPConnection xmppConnection=(XMPPTCPConnection)httpSession.getAttribute("xmppConnection");
				String [] loginUser=xmppConnection.getUser().split("/");
				ScriptSession session=ev.getSession();
				session.setAttribute("scriptAttribute", loginUser[0]);
				System.out.println("attribute name==========="+session.getAttribute("scriptAttribute"));
			}
		};
		manager.addScriptSessionListener(listener);
		}

}
