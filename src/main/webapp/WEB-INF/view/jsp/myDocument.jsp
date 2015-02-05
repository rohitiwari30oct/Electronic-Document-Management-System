<%@page import="java.security.Principal"%>
<%@page import="edms.webservice.client.DocumentModuleClient"%>
<%@page import="edms.wsdl.Folder"%>
<%@page import="java.util.List"%>
<%@page import="edms.wsdl.GetFolderResponse"%>
<%@page import="edms.wsdl.HasChildResponse"%>
<%@page import="edms.core.Config"%>
<script src="js/left_event.js" type="application/javascript"></script>
        <!---------------/// USER NEW SEND STRAED HERE ------------->
<script src="js/jquery_popup.js"></script>   
<script type="text/javascript" src="js/user_send.js"></script>
<script type="text/javascript" src="js/group_send.js"></script>
<link href="css/user_send.css" type="text/css" rel="stylesheet"/>
<link href="css/group_send.css" type="text/css" rel="stylesheet"/>
<link rel="stylesheet" href="css/jquery_popup.css" />
<link rel="stylesheet" href="css/new_icon.css" />
<link rel="stylesheet" href="css/new_changes.css" />
<!----------------/// USER NEW SEND END HERE ---------------> 

<!-- 	<li class="file_system tab_header" onClick="tab_left()"><a
				href="index_testing.htm">MY DOCUMENT</a>
				<div class="icon"></div></li> -->
				<ul>
					<%
						Principal principal=(Principal)request.getAttribute("principal");
									DocumentModuleClient folderClient = (DocumentModuleClient) request
											.getAttribute("folderClient");
									System.out.println("check 0");
									List<Folder> folderList = (List<Folder>) request.getAttribute("folderList");
									System.out.println("check 1 :"+folderList.size());
									for (Folder folder : folderList) {
										HasChildResponse hasChild = folderClient.hasChild(folder
												.getFolderPath(),principal.getName()+"@avi-oil.com");

										System.out.println("check 2 :");
										//if(!folder.getFolderName().equals(Config.JCR_SYSTEM)&&(!folder.getFolderProperty(JcrConstants.JCR_PRIMARYTYPE).getString().equals(JcrConstants.NT_RESOURCE))){
										/*  		if(folder.getFolderPrimaryNodeType().getName().equals(JcrConstants.NT_FOLDER)){ */
					%>
					<%
						if (hasChild.isHasChild()) {
					%>
					<li
						><div id="listli<%=folder.getFolderPath().replace('/', '_')
							.replace('.', '_').replaceFirst("@avi","_avi").replace(" ","_spc_spc_")%>"
						onclick="getSubFolders(this.id)">
						<div class="subfolder_sign" id="sign<%=folder.getFolderPath().replace('/', '_')
							.replace('.', '_').replaceFirst("@avi","_avi").replace(" ","_spc_spc_")%>"></div></div>
						<div class="folder"></div> <span id="<%=folder.getFolderPath()%>"
						onclick="getFileSystem(this.id)"><%=folder.getFolderPath().substring(
							folder.getFolderPath().lastIndexOf('/') + 1)%></span>
						<div class="subfolder_onhover mydocument_subfolder listdiv<%=folder.getFolderPath().replace('/', '_')
							 			.replace('.', '_').replaceFirst("@avi","_avi").replace(" ","_spc_spc_")%>" >
						</div>
					</li>
					<%
						} else {
					%>
					<li>
						<div class="folder"></div> <span id="<%=folder.getFolderPath()%>"
						onclick="getFileSystem(this.id)"><%=folder.getFolderPath().substring(
							folder.getFolderPath().lastIndexOf('/') + 1)%></span>
					</li>
					<%
						}
						}
					%>


				</ul>
                                                       
