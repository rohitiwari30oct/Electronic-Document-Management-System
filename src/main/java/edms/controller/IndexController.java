package edms.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edms.chatdwr.ScriptSessList;
import edms.chatdwr.XmppChatClass;
import edms.core.Config;
import edms.model.LoginModel;
import edms.webservice.client.DocumentModuleClient;
import edms.webservice.client.UserClient;
import edms.webservice.client.WorkflowClient;
import edms.wsdl.Folder;
import edms.wsdl.GetFileResponse;
import edms.wsdl.GetFileWithOutStreamResponse;
import edms.wsdl.GetFolderByPathResponse;
import edms.wsdl.GetFolderResponse;
import edms.wsdl.GetRecycledDocsResponse;
import edms.wsdl.GetUsersListResponse;
import edms.wsdl.LoginResponse;
import edms.wsdl.RecentlyModifiedResponse;
import edms.wsdl.SearchDocByDateResponse;

import java.util.ArrayList;
import java.util.Calendar;
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
	
	@Autowired private ScriptSessList scriptSessList;
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
			//	hs.setAttribute("currentFolder", "/");
			}
		
		/*String countryName = "Spain";
		GetCountryResponse response = folderClient
				.GetCountryRequest(countryName);
		folderClient.printResponse(response);*/
		String path="";
		
		if(principal.getName().contains("@")){
			path = "/"+principal.getName();	
		}else{
		path = "/"+principal.getName()+Config.EDMS_DOMAIN;
		}
		//String path = "/";
		
		String userid="";
		if(principal.getName().contains("@")){
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		
		GetFolderByPathResponse folderByPath=documentModuleClient.getFolderByPath(path,userid);
		
		GetFolderResponse folderResponse = documentModuleClient.getFolderRequest(path,userid);

		List<Folder> folderList = folderResponse.getGetFoldersByParentFolder()
				.getFolderListResult().getFolderList();
		documentModuleClient.printResponse(folderResponse);	
		Folder folderNode=folderByPath.getFolder();
		map.addAttribute("principal", principal);
		map.addAttribute("currentFolder",folderNode);
		map.addAttribute( "folderList", folderList);
		map.addAttribute("folderClient",documentModuleClient);
		map.addAttribute("userid",userid );
		return "dashboard";
	}




	@RequestMapping(value = "/calender", method = RequestMethod.GET)
	public String getCalender(ModelMap map,Principal principal) {

		if(principal!=null){
		return "calender";
		}else{
			return "ajaxTrue";
		}
	}

	@RequestMapping(value = "/workflow", method = RequestMethod.GET)
	public String getWorkflow(ModelMap map,Principal principal) {

		if(principal!=null){
		return "workflow";
		}else{
			return "ajaxTrue";
		}
	}
	@RequestMapping(value = "/recently", method = RequestMethod.GET)
	public String getRecently(ModelMap map,Principal principal) {
		if(principal!=null){
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
		RecentlyModifiedResponse recentlyModifiedResponse = documentModuleClient.getRecentlyModified(path,userid);
		List<Folder> folderList = recentlyModifiedResponse.getRecentlyModifiedFolders().getFoldersList().getFolderList();
		map.addAttribute("folderList", folderList);
		List<edms.wsdl.File> fileList=recentlyModifiedResponse.getRecentlyModifiedFolders().getFilesList().getFileList();
		map.addAttribute("fileList", fileList);
		map.addAttribute("userid",userid);
		GetFolderByPathResponse folderByPath=documentModuleClient.getFolderByPath(path,userid);
		Folder folderNode=folderByPath.getFolder();
		map.addAttribute("principal", principal);
		map.addAttribute("currentFolder",folderNode);
		return "fileSystem";
		}else{
			return "ajaxTrue";
		}
	}
	@RequestMapping(value = "/getLeftDocument", method = RequestMethod.GET)
	public String getLeftDocument(ModelMap map,Principal principal,HttpServletRequest request) {
		if(principal!=null){
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
				.getFolderRequest(path, userid);
		List<Folder> folderList = folderResponse.getGetFoldersByParentFolder()
				.getFolderListResult().getFolderList();
		GetFileWithOutStreamResponse fileResponse = documentModuleClient.getFileWithOutStreamRequest(
				path, userid);
		List<edms.wsdl.File> fileList = fileResponse.getGetFilesByParentFile()
				.getFileListResult().getFileList();
		map.addAttribute("fileList", fileList);
		map.addAttribute("folderClient", documentModuleClient);
		map.addAttribute("folderList", folderList);
		map.addAttribute("principal", principal);
	return "myDocument";	}else{
		return "ajaxTrue";
	}
	
	}
	@RequestMapping(value = "/setting", method = RequestMethod.GET)
	public String getSetting(ModelMap map,Principal principal) {
		if(principal!=null){
			String userid="";
			if(principal.getName().contains("@")){
				userid=principal.getName();
				}else{
					userid=principal.getName()+Config.EDMS_DOMAIN;
				}
			map.addAttribute("userid",userid);
		return "setting";	
		}else{
			return "ajaxTrue";
		}
	}
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String dashboard(ModelMap map,Principal principal) {
		if(principal!=null){
			String userid="";
			if(principal.getName().contains("@")){
				userid=principal.getName();
				}else{
					userid=principal.getName()+Config.EDMS_DOMAIN;
				}
			map.addAttribute("userid",userid);
		return "dashboard";	
		}else{
			return "ajaxTrue";
		}
	}
	@RequestMapping(value = "/trash", method = RequestMethod.GET)
	public String getTrash(ModelMap map,Principal principal) {
		if(principal!=null){
		String userid="";
		if(principal.getName().contains("@")){
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		String path="/"+userid+"/trash";
		GetRecycledDocsResponse folderResponse = documentModuleClient.getRecycledDoc(userid, path);
		List<Folder> folderList = folderResponse.getGetRecycledDocs().getFoldersList().getFolderList();
		map.addAttribute("folderList", folderList);
		map.addAttribute("fileList", folderResponse.getGetRecycledDocs().getFilesList().getFileList());
		map.addAttribute("userid",userid);
		return "trash";	}else{
			return "ajaxTrue";
		}
	}
	
	/*@RequestMapping(value = "/chat", method = RequestMethod.GET)
		public void getchat(ModelMap map) {
			System.out.println("in get chat )))))))))))))))))))))))");
		}
	 */

	/*
	 * @Autowired private PersonRepo personRepo;
	 */
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/welcome", method = RequestMethod.GET)
	public String getIndex(ModelMap map, Principal principal, HttpServletRequest request) throws  IOException {
		if(principal==null){
			return "login";
		}
		
		/*public String getIndex(ModelMap map, Principal principal, HttpServletRequest request) throws  IOException {	*/
		// System.out.println("in welcome &&&&&&");
		// Session session=jcrService.getJcrSession();
		// System.out.println('session in controller : '+session);
		// map.addAttribute('jcrSession',session);

		/*
		 * FileInputStream is = new FileInputStream('d:/EDMS2.ppt'); SlideShow
		 * ppt = new SlideShow(is); is.close();
		 * 
		 * Dimension pgsize = ppt.getPageSize();
		 * pgsize.setSize((pgsize.getWidth())/4, (pgsize.getHeight())/4);
		 * Slide[] slide = ppt.getSlides(); for (int i = 0; i < slide.length;
		 * i++) {
		 * 
		 * BufferedImage img = new BufferedImage(pgsize.width, pgsize.height,
		 * BufferedImage.TYPE_INT_RGB); Graphics2D graphics =
		 * img.createGraphics(); //clear the drawing area
		 * graphics.setPaint(Color.white); graphics.fill(new
		 * Rectangle2D.Float(0, 0, pgsize.width, pgsize.height));
		 * 
		 * //render slide[i].draw(graphics);
		 * 
		 * //save the output FileOutputStream out = new
		 * FileOutputStream('d:/slide-' + (i+1) + '.png');
		 * javax.imageio.ImageIO.write(img, 'png', out); out.close(); }
		 */
		/*
		 * For reading of Excel File
		 * 
		 * //InputStream inp = new FileInputStream('d:/workbook.xls');
		 * InputStream inp = new FileInputStream('workbook.xlsx');
		 * 
		 * Workbook wb = null; try { wb = WorkbookFactory.create(inp); } catch
		 * (InvalidFormatException e1) { // TODO Auto-generated catch block
		 * e1.printStackTrace(); } Sheet sheet = wb.getSheetAt(0); Row row =
		 * sheet.getRow(2); Cell cell = row.getCell(2);
		 * System.out.println(cell.getStringCellValue()+' at '+ cell.getRow()+'
		 * and '+cell.getColumnIndex()); if (cell == null) cell =
		 * row.createCell(3);
		 * 
		 * cell.setCellType(Cell.CELL_TYPE_STRING); cell.setCellValue('Piyush
		 * Joshi');
		 * 
		 * // Write the output to a file FileOutputStream fileOut = new
		 * FileOutputStream('d:/workbook.xls'); wb.write(fileOut);
		 * fileOut.close();
		 */

		
		/*
		 * try{ int thumbWidth=50; int thumbHeight=50; // load image from
		 * filename Image image = Toolkit.getDefaultToolkit().getImage('d:/dd' +
		 * '.png'); MediaTracker mediaTracker = new MediaTracker(new
		 * Container()); mediaTracker.addImage(image, 0);
		 * 
		 * // determine thumbnail size from WIDTH and HEIGHT double thumbRatio =
		 * (double)thumbWidth / (double)thumbHeight; int imageWidth =
		 * image.getWidth(null); int imageHeight = image.getHeight(null); double
		 * imageRatio = (double)imageWidth / (double)imageHeight; if (thumbRatio
		 * < imageRatio) { thumbHeight = (int)(thumbWidth / imageRatio); } else
		 * { thumbWidth = (int)(thumbHeight * imageRatio); }
		 * 
		 * // draw original image to thumbnail image object and // scale it to
		 * the new size on-the-fly BufferedImage thumbImage = new
		 * BufferedImage(50, thumbHeight, BufferedImage.TYPE_INT_RGB);
		 * Graphics2D graphics2D = thumbImage.createGraphics();
		 * graphics2D.setRenderingHint(RenderingHints.KEY_INTERPOLATION,
		 * RenderingHints.VALUE_INTERPOLATION_BILINEAR);
		 * graphics2D.drawImage(image, 0, 0, thumbWidth, thumbHeight, null);
		 * 
		 * // save thumbnail image to outFilename BufferedOutputStream out = new
		 * BufferedOutputStream(new FileOutputStream('d:/dd1' + '.png'));
		 * out.close(); }catch(Exception e){ e.printStackTrace();
		 * 
		 * }
		 */
		// Repository repository = new TransientRepository();
		// Session session = repository.login(new SimpleCredentials('username',
		// 'password'.toCharArray()));
		/*
		 * try{ InputStream is =
		 * getClass().getClassLoader().getResourceAsStream('CustomNodes.cnd');
		 * 
		 * Reader cnd = new InputStreamReader(is); NodeType[] nodeTypes =
		 * CndImporter.registerNodeTypes(cnd, session); }catch(Exception e ){
		 * e.printStackTrace(); }
		 */
		// Node root = session.getRootNode();
		/*
		 * System.out.println('no of child of root : '+root.getDepth());
		 * NodeIterator nodeIterator=root.getNodes(); System.out.println('size
		 * of root node.. : '+nodeIterator.getSize()); Node
		 * nod1=nodeIterator.nextNode(); // Node nod2=nodeIterator.nextNode();
		 * System.out.println('child node of root ........1 : '+nod1.getPath());
		 * // System.out.println('child node of root ........2 :
		 * '+nod2.getPath()); System.out.println('have child more :
		 * '+nodeIterator.hasNext());
		 * 
		 * Node hello = root.addNode('hello');
		 * 
		 * System.out.println(root.getPrimaryNodeType());
		 * 
		 * root.getNode('hello');
		 */
		// try {

		/*
		 * FileInputStream iss =new FileInputStream(new File('D:/edms
		 * project/spring
		 * -tool-suite-3.6.0.RELEASE-e4.4-win32-x86_64/sts-bundle/sts
		 * -3.6.0.RELEASE/repository.xml')); Node contentNode =
		 * root.addNode('jcr:content', 'nt:resource');
		 * contentNode.addMixin(JcrConstants.MIX_VERSIONABLE);
		 * contentNode.setProperty(JcrConstants.JCR_MIMETYPE, 'xml');
		 * contentNode.setProperty(JcrConstants.JCR_DATA, iss);
		 * contentNode.setProperty(JcrConstants.JCR_LASTMODIFIED,
		 * Calendar.getInstance());
		 */
		// create versionable node
		/*
		 * Node n = root.addNode('childNode', 'nt:unstructured');
		 * n.addMixin('mix:versionable'); n.setProperty('anyProperty', 'Blah');
		 * session.save(); Version firstVersion = n.checkin();
		 * 
		 * //add new version Node child = root.getNode('childNode');
		 * child.checkout(); child.setProperty('anyProperty', 'Blah2');
		 * session.save(); child.checkin();
		 * 
		 * 
		 * 
		 * // restoring old version child.checkout();
		 */// child.restore(firstVersion, true);
		// Node child=root.getNode('newName3');

		/*
		 * Version ver= child.checkin(); child.restore(ver, true);
		 * child.checkout();
		 */
		// print version history
		/*
		 * VersionHistory history = child.getVersionHistory(); for
		 * (VersionIterator it = history.getAllVersions(); it.hasNext();) {
		 * Version version = (Version) it.next();
		 * System.out.println(version.getCreated().getTime()+' version
		 * description is : '+version.getName()); }
		 */
		// System.out.println('base version of newName3 :
		// '+child.getBaseVersion().getName());
		// delete
		/*
		 * for(int i=1;i<=10;i++){
		 * 
		 * root.getNode('hello['+i+']').remove(); session.save(); }
		 */
		// child.getSession().move(child.getPath(), child.getParent().getPath()
		// + '' + 'newName2');
		/*
		 * } finally { session.save(); session.logout(); }
		 */

		// FileInputStream iss =new FileInputStream(new File('D:/edms
		// project/spring-tool-suite-3.6.0.RELEASE-e4.4-win32-x86_64/sts-bundle/sts-3.6.0.RELEASE/repository.xml'));
		// InputStream in=iss;
		/*
		 * Workspace workspace=session.getWorkspace();
		 * workspace.getNamespaceRegistry().registerNamespace('ocm1',
		 * 'http://jackrabbit.apache.org/ocm1'); System.out.println('workspace
		 * is : '+workspace.getName()); System.out.println('');
		 */
		/*	Tika tika = new Tika();
		// FileOutputStream out = null;
		try {
			// out = new FileOutputStream(new File('D:/edms
			// project/spring-tool-suite-3.6.0.RELEASE-e4.4-win32-x86_64/sts-bundle/sts-3.6.0.RELEASE/repository.xml'));
			// IOUtils.copy(in, out);
			String mimeType = tika.detect(new File("D:/testLdap.pdf"));
			System.out.println(mimeType);
		} catch (Exception e) {
			System.err.println(e);
		}*/
		// map.addAttribute("loginUser", new LoginModel());
		  
		  
		HttpSession hs = request.getSession(false);
		if (hs.getAttribute("currentFolder") == null) {
			if(principal.getName().contains("@")){
				hs.setAttribute("currentFolder", "/"+principal.getName());
				hs.setAttribute("currentDoc", "/"+principal.getName());
				}else{
				hs.setAttribute("currentFolder", "/"+principal.getName()+Config.EDMS_DOMAIN);
				hs.setAttribute("currentDoc", "/"+principal.getName()+Config.EDMS_DOMAIN);
				}
		//	hs.setAttribute("currentFolder", "/");
			}
		/*String countryName = "Spain";
		GetCountryResponse response = folderClient
				.GetCountryRequest(countryName);
		folderClient.printResponse(response);*/

		String path="";
		if(principal.getName().contains("@")){
			path = "/"+principal.getName();	
		}else{
		path = "/"+principal.getName()+Config.EDMS_DOMAIN;
		}
	//	LoginResponse loginResponse=userClient.loginRequest(principal.getName()+"@avi-oil.com", Config.JCR_PASSWORD);
		String userid="";
		if(principal.getName().contains("@")){
			userid=principal.getName();
			}else{
				userid=principal.getName()+Config.EDMS_DOMAIN;
			}
		GetFolderByPathResponse folderByPath=documentModuleClient.getFolderByPath(path,userid);
		
		GetFolderResponse folderResponse = documentModuleClient.getFolderRequest(path,userid);
	
	
		GetFileWithOutStreamResponse fileResponse = documentModuleClient.getFileWithOutStreamRequest(
				path, userid);
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
		// map.addAttribute("nodeIterator", nodeIterator);
		/*	GetUsersListResponse response=userClient.getUsersListRequest(userid);
		map.addAttribute("userlist",response.getUsersList());*/
		/*	//CHAT CODE BEGINS
		//System.out.println("userid="+loginUser.getUserid());
		//System.out.println("password="+loginUser.getPassword());
		XmppChatClass xmppChatClass=new XmppChatClass();
		//TODO: SEPERATE THE CONFIGURATION
		xmppChatClass.createConnection(xmppDomain, packetReplyTimeout, request);
		xmppChatClass.registerListeners(chatImageFolder);
		//xmppChatClass.performLogin(loginUser.getUserid(), loginUser.getPassword(), onlineStatus);
		xmppChatClass.performLogin("nirbhay@silvereye.in", "SIS@2009", onlineStatus);
		scriptSessList.listenScriptSession();
		request.getSession().setAttribute("xmppChatClass", xmppChatClass);
		map.addAttribute("imageurl", chatImageFolder);*/
		return "userDashboard";
	}
	
	
	
	/*
	 * @RequestMapping("/index") public String index(Model model) {
	 * System.out.println("****************************in getusers"); long begin
	 * = System.currentTimeMillis(); List<String> list = new
	 * ArrayList<String>();
	 * 
	 * List<String> lt=new ArrayList<String>(); lt.add("dc=silvereye,dc=co"); //
	 * @formatter:off List<String> ldap = ldapSearch(lt,
	 * "(objectCategory=person)", "cn"); // @formatter:on
	 * 
	 * for (Iterator<String> it = ldap.iterator(); it.hasNext();) { String user
	 * = it.next(); System.out.println("User name is :"+user); //if
	 * (!Config.SYSTEM_USER.equals(user)) { // if
	 * (Config.SYSTEM_LOGIN_LOWERCASE) { // user = user.toLowerCase(); // }
	 * 
	 * list.add(user); try { // getRolesByUser(user); // getName(user); //
	 * getMail(user); } catch (Exception e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); }
	 * 
	 * //} } System.out.println("all done");
	 * 
	 * 
	 * if (Config.PRINCIPAL_LDAP_USERS_FROM_ROLES) { // Get Roles //
	 * @formatter:off List<String> roles =
	 * ldapSearch(Config.PRINCIPAL_LDAP_ROLE_SEARCH_BASE,
	 * Config.PRINCIPAL_LDAP_ROLE_SEARCH_FILTER,
	 * Config.PRINCIPAL_LDAP_ROLE_ATTRIBUTE); // @formatter:on
	 * 
	 * // Get Users by Role for (String role : roles) { // @formatter:off
	 * List<String> users = ldapSearch(MessageFormat.format(Config.
	 * PRINCIPAL_LDAP_USERS_BY_ROLE_SEARCH_BASE, role),
	 * MessageFormat.format(Config.PRINCIPAL_LDAP_USERS_BY_ROLE_SEARCH_FILTER,
	 * role), Config.PRINCIPAL_LDAP_USERS_BY_ROLE_ATTRIBUTE); // @formatter:on
	 * 
	 * for (String user : users) {
	 * System.out.println("these are users of active directory"); if
	 * (!Config.SYSTEM_USER.equals(user)) { if (Config.SYSTEM_LOGIN_LOWERCASE) {
	 * user = user.toLowerCase(); }
	 * 
	 * if (!list.contains(user)) { list.add(user); } } } } }
	 * 
	 * 
	 * List<String> persons= personRepo.getAllPersonNames();
	 * System.out.println(persons.size()); return "index"; }
	 */

	private List<String> ldapSearch(String searchBase, String searchFilter,
			String attribute) {
		List<String> searchBases = new ArrayList<String>();
		searchBases.add(searchBase);
		return ldapSearch(searchBases, searchFilter, attribute);
	}

	@SuppressWarnings("unchecked")
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

		// Enable connection pooling
		// @see
		// http://docs.oracle.com/javase/jndi/tutorial/ldap/connect/pool.html
		env.put("com.sun.jndi.ldap.connect.pool", "true");

		/**
		 * Referral values: ignore, follow or throw.
		 * 
		 * @see http
		 *      ://docs.oracle.com/javase/jndi/tutorial/ldap/referral/jndi.html
		 * @see http://java.sun.com/products/jndi/jndi-ldap-gl.html
		 */
		env.put(Context.REFERRAL, "follow");

		// Optional is some cases (Max OS/X)
		env.put(Context.SECURITY_PRINCIPAL,
				"CN=Administrator,CN=Users,DC=silvereye,DC=co");

		env.put(Context.SECURITY_CREDENTIALS, "##DJ##1891");
		// System.out.println("env end");
		return env;
	}

	public List<String> getRolesByUser(String user) throws Exception {
		long begin = System.currentTimeMillis();
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
		long begin = System.currentTimeMillis();
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
		long begin = System.currentTimeMillis();
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
