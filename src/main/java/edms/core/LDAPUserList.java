package edms.core;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.naming.NamingEnumeration;
import javax.naming.directory.Attribute;
import javax.naming.directory.Attributes;
import javax.naming.directory.DirContext;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;

public class LDAPUserList {
	public static List<String> listLdapUserDirectory(String ldapurl, String entry, String pass, String base)
	{
		
		DirContext ctx=null;
		List<String> lst=new ArrayList<String>();
		try
		{
		//	System.out.println("Directory repository");
			

			ctx=LDAPConnection.getConnection(ldapurl, entry , pass);
		
		SearchControls constraints = new SearchControls(); 
		constraints.setSearchScope(SearchControls.ONELEVEL_SCOPE);
		String attrList[] = {"mail","enabledService"}; 
		constraints.setReturningAttributes(attrList);
		NamingEnumeration results =ctx.search(base,"mail=*", constraints);
		int f=0;
		int x=0;
		int flg=0;
		
		while (results.hasMore()) {
			f=1;
			
			String mail="";
			
			SearchResult si =(SearchResult)results.next();
			String ck=si.getName();
			Attributes attrs = si.getAttributes();
			String arr[]=ck.split(",");
			int l=arr.length;

			    if (attrs == null) {
			       System.out.println("   No attributes");
			        continue;
			    }
			    
			    
			    
			    	NamingEnumeration ae = attrs.getAll(); 
			    	while (ae.hasMoreElements()) {
			        Attribute attr =(Attribute)ae.next();
			        String id = attr.getID();
			        Enumeration vals = attr.getAll();
			        while (vals.hasMoreElements())
			        {
			        String str= vals.nextElement().toString();
			       
			        if(id.equalsIgnoreCase("mail"))
			        {
			        mail=str;
			        }
			        else if(id.equalsIgnoreCase("enabledService"))
			        {
			        	if(str.equalsIgnoreCase("displayedInGlobalAddressBook"))
			        	{
			        		flg=1;
			        	}
			        	
			        }
			        
			        
			     }
			    }

			if(mail.indexOf("@")>0 && flg==1)
			{
				lst.add(mail);
			}
			flg=0;
			
			}
			
		
			
			}
			catch(Exception e)
			{
				System.out.print(e);
			}
		finally
		{
			if(ctx!=null)
			{
				LDAPConnection.closeConn(ctx);
			}
				
		}
		
		          
  return   lst;        
}
	
	
	
}
