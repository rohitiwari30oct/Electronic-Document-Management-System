<%@page import="java.security.Principal"%>
<%@page import="edms.webservice.client.FolderClient"%>
<%@page import="edms.wsdl.Folder"%>
<%@page import="java.util.List"%>
<%@page import="edms.wsdl.GetFolderResponse"%>
<%@page import="edms.wsdl.HasChildResponse"%>
<%@page import="edms.core.Config"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>

		<!-- 	<li class="file_system tab_header" onClick="tab_left()"><a
				href="index_testing.htm">MY DOCUMENT</a>
				<div class="icon"></div></li> -->
				<ul>
					<%

					Principal principal=(Principal)request.getAttribute("principal");
						FolderClient folderClient = (FolderClient) request
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
							.replace('.', '_').replaceFirst("@avi","_avi")%>"
						onclick="getSubFolders(this.id)">
						<div class="subfolder_sign" id="sign<%=folder.getFolderPath().replace('/', '_')
							.replace('.', '_').replaceFirst("@avi","_avi")%>"></div></div>
						<div class="folder"></div> <span id="<%=folder.getFolderPath()%>"
						onclick="getFileSystem(this.id)"><%=folder.getFolderPath().substring(
							folder.getFolderPath().lastIndexOf('/') + 1)%></span>
						<div class="subfolder_onhover mydocument_subfolder listdiv<%=folder.getFolderPath().replace('/', '_')
							 			.replace('.', '_').replaceFirst("@avi","_avi")%>" >
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
                                                       
                                  
                                
</body>
</html>