                        <!---// RIGHT --->
                        <%@page import="edms.wsdl.File"%>
<%@page import="edms.wsdl.Folder"%>
<%@page import="java.util.List"%>
<div class="recentaly_bottom">
                                  <!-------------// RECENT ALL CONTENT STARTED HERE ---------->
                               
                                   <div class="trash_menu">
                                     <h1>Recently Accessed Document</h1>
                                   </div>
                               <div class="recently_main_div">
                                   <div class="row_content_folder">
                                       <ul>
                                         <%
                                       List<Folder> folderList = (List<Folder>) request.getAttribute("folderList"); 
                                       List<File> fileList = (List<File>) request.getAttribute("fileList"); 
					      				for (Folder folder : folderList) {
				      					%>
                                         <li title=<%=folder.getFolderName() %> >
                                           <div class="folder_icon"></div>
                                           <span><%=folder.getFolderName() %></span> 
                                           
                                           </li>
                                        
                                        <%} 
					      				for (File file : fileList) {
				      					%>
                                          <li title=<%=file.getFileName() %>>
                                             <%if(file.getFileName().contains(".pdf")){ %> 
										<div class="pdf_icon"></div>
										<%}else if(file.getFileName().contains(".doc")){ %>
										<div class="msoffice_icon"></div>
										
										<%} %><%else if(file.getFileName().contains(".xls")){ %>
										<div class="msexcel_icon"></div>
										
										<%} %><%else if(file.getFileName().contains(".ppt")){ %>
										<div class="ppt_icon"></div>
										
										<%}else{ %>
										<div class="pdf_icon"></div>
										
										<%} %>
                                            <span><%=file.getFileName() %></span> 
                                            
                                            </li>
                                         
                                         <%} %>
                                       </ul>
                                       <div class="clear"></div>
                                   </div>
                              </div>
                                  <!------------/// RECENT ALL CONTENT END HERE --------------->
                        </div>
                        <!----// RIGHT END HERE -->
              <!------/// FOOTER STARTED HERE ------>
              
              <!-----------/// FOOTER STARTED HERE ------>
                                                            </div>
          <script type="text/javascript">
          var recent_win_he = $(window).height();
          //alert(recent_win_he);
          $('.recently_main_div').css('height',recent_win_he-129);
			</script>
