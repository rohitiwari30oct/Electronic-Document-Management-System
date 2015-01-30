                        <!---// RIGHT --->
                        <%@page import="edms.wsdl.File"%>
<%@page import="edms.wsdl.Folder"%>
<%@page import="java.util.List"%>
<div class="other_pages">
                                  <!-------------/// TRASH PAGES STARED HERE --------->
                                  
                                       <!--------/// TRASH MENU STARTED HERE --------->
                                           <div class="trash_menu">
                                               <h1>Trash</h1>
                                               <div class="trash_right">
                                                   <ul>
                                                       <li class="trash_1" ><a href="#"></a></li>
                                                       <li class="trash_2"><a href="#"></a></li>
                                                       <li class="trash_3" title="restore" onclick="restoreFolder()"><a href="#"></a></li>
                                                       <li class="trash_4" title="delete forever"onclick="deleteFolder()"><a href="#"></a></li>
                                                   </ul>
                                               </div>
                                           </div>
                                       <!--------------/// TRASH MENU END HERE ------------>
                                    <div class="trash_sroll_content">
                                       <!--------/// TRASH CONTENT STARED HERE ------------->
                                       <div class="trash_content">
                                       <%
                                       List<Folder> folderList = (List<Folder>) request.getAttribute("folderList"); 
                                       List<File> fileList = (List<File>) request.getAttribute("fileList"); 
                        				
                                       %>
                                                <ul>
	                                        	<%				
	      				
									      				for (Folder folder : folderList) {
									      					%>
                                                        <li title=<%=folder.getFolderName() %> class="select_box target" onclick="setFolderPath(this.id)" id='<%=folder.getFolderPath()%>'>
                                                          <div class="folder_icon"></div>
                                                          <span><%=folder.getFolderName() %></span> </li>
                                                      
                                                        <%} %>
	                                        	<%				
	      				
									      				for (File file : fileList) {
									      					%>
                                                        <li title=<%=file.getFileName() %> class="select_box target" onclick="setFolderPath(this.id)" id='<%=file.getFilePath()%>'>
                                                          <%if(file.getFileName().contains(".pdf")){ %> 
										<div class="pdf_icon"></div>
										<%}else if(file.getFileName().contains(".doc")){ %>
										<div class="msoffice_icon"></div>
										
										<%} %><%else if(file.getFileName().contains(".xls")){ %>
										<div class="msexcel_icon"></div>
										
										<%} %><%else if(file.getFileName().contains(".ppt")){ %>
										<div class="ppt_icon"></div>
										
										<%}else{ %>
										<div class="msexcel_icon"></div>
										
										<%} %>
                                                          <span><%=file.getFileName() %></span> </li>
                                                      
                                                        <%} %>
                                                </ul>
                                                <input type="hidden" id="clickedFolder" value=""/>
                                                <script type="text/javascript">
                                                function setFolderPath(clickedFolder){
                                                	//alert(clickedFolder);
                                                	$('#clickedFolder').val(clickedFolder);
                                                	//alert($('#clickedFolder').val());
                                                }
                                                </script>
                                                <script type="text/javascript">
                                                function deleteFolder(){
                                                	
                                                	var folderPath=$('#clickedFolder').val();
                                                	alert(folderPath);
                                                	$.ajax({
                                        					type : "GET",
                                        					url : "${pageContext.request.contextPath}/deleteDoc",
                                        					data : {
                                        						'folderPath':$('#clickedFolder').val(),
                                        					},
                                        					contentType : "application/json",
                                        					async : false,
                                        					success : function(data) {
                                        						alert(data);
                                        						getPage('trash');
                                        					}
                                        				}); 
                                                }
                                                
                                                </script>
                                                <script type="text/javascript">
                                                function restoreFolder(){
                                                	
                                                	var folderPath=$('#clickedFolder').val();
                                                	alert(folderPath);
                                                	$.ajax({
                                        					type : "GET",
                                        					url : "${pageContext.request.contextPath}/restoreDoc",
                                        					data : {
                                        						'folderPath':$('#clickedFolder').val(),
                                        					},
                                        					contentType : "application/json",
                                        					async : false,
                                        					success : function(data) {
                                        						alert(data);
                                        						getPage('trash');
                                        					}
                                        				}); 
                                                }
                                                
                                                </script>
                                         </div>
                                       <!-----------/// TRASEH CONTENT END HERE ------------->
                                  
                                </div>
                                  
                                  <!-------------/// TRASH PAGES END HERE ------------>
                                  
                        </div>
                        <!----// RIGHT END HERE -->
              <script type="text/javascript">
          var recent_win_he = $(window).height();
          //alert(recent_win_he);
          $('.other_pages').css('height',recent_win_he-167);
			</script>
            