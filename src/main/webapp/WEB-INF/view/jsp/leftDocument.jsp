<%@page import="java.security.Principal"%>
<%@page import="edms.webservice.client.FolderClient"%>
<%@page import="edms.wsdl.Folder"%>
<%@page import="java.util.List"%>
<%@page import="edms.wsdl.GetFolderResponse"%>
<%@page import="edms.wsdl.HasChildResponse"%>
<%@page import="edms.core.Config"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 
</head>

<body>
<!---/// LEFT --->
                         <div class="left">
                              <div class="left-pane document_page_left_height new_cheat" >
                                <!---------/// LEFT PART TOP STARTED HERE ---------->
                                      <div class="left_top_part" id="variedPagesHere">
                                      <div class="left_sub_menu">
                                               <ul>
                                                        <li class="file_system tab_header" onClick="tab_left()"> <a href="index.html" >MY DOCUMENT</a>
                                                        </li>
                                                        <div class="content_left content_left_block">
                                            <jsp:include page="myDocument.jsp" />
                                             </div>
                                                        <div class="content_left"> </div>
                                             </ul>
                                  </div>
                                      </div>
                                 <!------------/// LEFT PART TOP END HERE ------------>       
                                    
</body>
</html>