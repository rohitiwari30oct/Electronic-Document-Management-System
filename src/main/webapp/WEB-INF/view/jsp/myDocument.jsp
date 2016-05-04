<%@page import="edms.core.Principal"%>
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
					
					
					if(principal.getName().contains("@")){
						userid=principal.getName();
						}else{
							userid=principal.getName()+Config.EDMS_DOMAIN;
						}
									DocumentModuleClient folderClient = (DocumentModuleClient) request
											.getAttribute("folderClient");
									List<Folder> folderList = (List<Folder>) request.getAttribute("folderList");
									for (Folder folder : folderList) {
										HasChildResponse hasChild = folderClient.hasChild(folder
												.getFolderPath(),userid,principal.getPassword());

					
						if (hasChild.isHasChild()) {
					%>
					<li
						class="subfolder_11"><div   id="listli<%=folder.getFolderPath().replace("_", "pahlesetha").replace('/', '_')
							.replace('.', '_').replaceFirst("@","_avi").replace(" ","_spc_spc_")%>"
						onclick="getSubFolders(this.id)"><div class="subfolder_sign"  style="background-color: #e3e3e3;" id="sign<%=folder.getFolderPath().replace("_", "pahlesetha").replace('/', '_')
							.replace('.', '_').replaceFirst("@","_avi").replace(" ","_spc_spc_")%>"></div>
						</div>
						<div class="folder"></div> <span id="<%=folder.getFolderPath()%>"
						onclick="getFileSystem(this.id)"><%=folder.getFolderPath().substring(
							folder.getFolderPath().lastIndexOf('/') + 1)%></span>
						<div class="subfolder_onhover mydocument_subfolder" id="listdiv<%=folder.getFolderPath().replace("_", "pahlesetha").replace('/', '_')
							 			.replace('.', '_').replaceFirst("@","_avi").replace(" ","_spc_spc_")%>" >
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
                                                       
