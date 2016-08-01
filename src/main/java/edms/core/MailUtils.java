package edms.core;

import java.util.List;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.annotation.PostConstruct;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.mail.*;
import javax.mail.Flags.Flag;
import javax.mail.internet.*;
import java.io.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;
import com.sun.mail.imap.AppendUID;
import com.sun.mail.imap.IMAPFolder;
import com.sun.mail.imap.IMAPStore;
import com.sun.mail.imap.protocol.FLAGS;

import edms.core.Config;
public class MailUtils {

	public static boolean sendComposeMail(String host, String port,String id, String pass, String to, String sub ,String cnt)
	{
		
		boolean status=true;
		
		
		final String username = id;//change accordingly
		final String password = pass;//change accordingly
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		
		Session ses = Session.getInstance(props,
		  new javax.mail.Authenticator() {
		    protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
		        return new PasswordAuthentication(username, password);
		    }
		  });

		try {
			

		    Message message = new MimeMessage(ses);
		  
		    message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));

		    message.setFrom(new InternetAddress(username));
		    
		    Date dt=new Date();
		    SimpleDateFormat format = new SimpleDateFormat("E, dd MMM yyyy HH:mm:ss Z");
			String     DateToStr = format.format(dt);
			message.setHeader("Date", DateToStr);
			message.setSubject(sub);
			
			
			
			
			
			cnt="<body style='font-family:arial;'>"+
      "<div  class='main_body' style='width:900px; margin:0 auto; background:#eee;'>"+
             " <div class='mid_content' style='padding: 25px;' >"+
             "      <div class='logo' style='  float: left;'>"+
             "           <img src='images/logo.png' style='width: 128px;' />"+
             "    </div>"+
             "      <div class='clear' style='clear:both;'></div>"+
             "      <h1 class='heading' style='  font-size: 17px;font-family: arial;border-bottom: 1px solid #ccc;padding-bottom: 10px;color: #7B7B7B;'>EDMS Notification</h1>"+
             "         <p class='information' style='font-size: 13px;text-align: justify;line-height: 19px;'>"+username+" have shared an item with you. Please visit <a href='http://edms.avi-oil.com/'>Avi-oil EDMS</a></p>"+
             "         <div class='button_button' style='  float: LEFT;padding: 6px;background: #E4E4E4;font-size: 12px;border-bottom: 2px solid #A8A8A8;border: 1px solid #ccc;cursor: pointer;'><a href='http://edms.avi-oil.com/' style='  color: #7C7C7C;text-decoration: none;'>Home</a></div>"+
             " </div>"+
             "<div class='clear' style='clear:both;'></div>"+
             " <div class='footer' style='  background: #E5E5E5;padding-bottom: 30px;margin-top: 15px;padding: 11px;border-top: 1px solid #ccc;'>"+
             "        <img src='images/logo.png' style='  width: 52px;float: left;margin-right: 10px;' />"+
             "      <ul style='margin: 0px;padding: 0px;list-style-type: none;'>"+
             "           <li style='font-size: 12px;padding-left: 5px;padding-right: 5px;border-right: 1px solid #ccc; float:left;margin-bottom: 6px;"+
             "color: #666;'>Secured Access</li>"+
             "        <li style='font-size: 12px;padding-left: 5px;padding-right: 5px;border-right: 1px solid #ccc;float:left;margin-bottom: 6px;"+
             "color: #666;'>AJAX Webmail</li>"+
             "            <li style='font-size: 12px;padding-left: 5px;padding-right: 5px;border-right: 1px solid #ccc;float:left;margin-bottom: 6px;"+
             "color: #666;'>Clustering/High Availability</li>"+
             "           <li style='font-size: 12px;padding-left: 5px;padding-right: 5px;border-right: 1px solid #ccc;float:left;margin-bottom: 6px;"+
             "color: #666;'>Multiple Domain Support</li>"+
             "          <li style='font-size: 12px;padding-left: 5px;padding-right: 5px;border-right: 1px solid #ccc;float:left;margin-bottom: 6px;"+
             "color: #666;'>CalDAV/CardDAV Access</li>"+
             "         <li style='font-size: 12px;padding-left: 5px;padding-right: 5px;border-right: 1px solid #ccc;float:left;margin-bottom: 6px;"+
             "color: #666;'>Instant Messaging</li>"+
             "           <li style='font-size: 12px;padding-left: 5px;padding-right: 5px;border-right: 1px solid #ccc;float:left;margin-bottom: 6px;"+
             "color: #666;'>E-mail Security</li>"+
             "          <li style='font-size: 12px;padding-left: 5px;padding-right: 5px;border-right: 1px solid #ccc;float:left;margin-bottom: 6px;"+
             "color: #666;'>Advanced Admin Panel</li>"+
             "              <li style='font-size: 12px;padding-left: 5px;padding-right: 5px;border-right: 1px solid #ccc;float:left;margin-bottom: 6px;"+
             "color: #666;'>"+
             "Anti-Spam and Anti-Virus</li>"+
             "       </ul>"+
             "        <div class='clear' style='clear:both;'></div>"+
             "  </div>"+
             "  </div>"+
             "</body>";
			
			message.setContent(cnt,"text/html" );
		
		         
			
		    Transport.send(message);
		    
		    System.out.println("Message sent...");
		    
		} catch (Exception e) {
			status=false;
		    System.out.println(e);
		}
		
		
		
  return  status;        
}
	
	
	
}
