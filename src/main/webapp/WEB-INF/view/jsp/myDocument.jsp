<%@page import="java.security.Principal"%>
<%@page import="edms.webservice.client.DocumentModuleClient"%>
<%@page import="edms.wsdl.Folder"%>
<%@page import="java.util.List"%>
<%@page import="edms.wsdl.GetFolderResponse"%>
<%@page import="edms.wsdl.HasChildResponse"%>
<%@page import="edms.core.Config"%>
 

<!-- 	<li class="file_system tab_header" onClick="tab_left()"><a
				href="index_testing.htm">MY DOCUMENT</a>
				<div class="icon"></div></li> -->
				<ul>
					<%
					Principal principal=(Principal)request.getAttribute("principal");
					String userid="";
					HttpSession mydoc=request.getSession(false);
					String currentFolder=(String)mydoc.getAttribute("currentFolder");
					System.out.println(currentFolder.replace("_", "pahlesetha").replace('/', '_')
							.replace('.', '_').replaceFirst("@avi","_avi").replace(" ","_spc_spc_")+" is the current folder to expand");
					
					
					if(principal.getName().contains("@")){
						userid=principal.getName();
						}else{
							userid=principal.getName()+Config.EDMS_DOMAIN;
						}
					System.out.println("userid is "+userid);
									DocumentModuleClient folderClient = (DocumentModuleClient) request
											.getAttribute("folderClient");
									System.out.println("check 0");
									List<Folder> folderList = (List<Folder>) request.getAttribute("folderList");
									System.out.println("check 1 :"+folderList.size());
									for (Folder folder : folderList) {
										HasChildResponse hasChild = folderClient.hasChild(folder
												.getFolderPath(),userid);

										//System.out.println("folderPath is "+folder.getFolderPath());
										//if(!folder.getFolderName().equals(Config.JCR_SYSTEM)&&(!folder.getFolderProperty(JcrConstants.JCR_PRIMARYTYPE).getString().equals(JcrConstants.NT_RESOURCE))){
										/*  		if(folder.getFolderPrimaryNodeType().getName().equals(JcrConstants.NT_FOLDER)){ */
					%>
					<%
						if (hasChild.isHasChild()) {
					%>
					<li
						class="subfolder_11"><div   id="listli<%=folder.getFolderPath().replace("_", "pahlesetha").replace('/', '_')
							.replace('.', '_').replaceFirst("@avi","_avi").replace(" ","_spc_spc_")%>"
						onclick="getSubFolders(this.id)"><div class="subfolder_sign"  style="background-color: #e3e3e3;" id="sign<%=folder.getFolderPath().replace("_", "pahlesetha").replace('/', '_')
							.replace('.', '_').replaceFirst("@avi","_avi").replace(" ","_spc_spc_")%>"></div>
						</div>
						<div class="folder"></div> <span id="<%=folder.getFolderPath()%>"
						onclick="getFileSystem(this.id)"><%=folder.getFolderPath().substring(
							folder.getFolderPath().lastIndexOf('/') + 1)%></span>
						<div class="subfolder_onhover mydocument_subfolder" id="listdiv<%=folder.getFolderPath().replace("_", "pahlesetha").replace('/', '_')
							 			.replace('.', '_').replaceFirst("@avi","_avi").replace(" ","_spc_spc_")%>" >
						</div>
					</li>
					<%
						} else {
					%>
					<li class="subfolder_11" >
						<div class="folder"></div> <span  id="<%=folder.getFolderPath()%>"
						onclick="getFileSystem(this.id)"><%=folder.getFolderPath().substring(
							folder.getFolderPath().lastIndexOf('/') + 1)%></span>
					</li>
					<%
						}
						}
					%>


				</ul>
                                                       
