       <%@page import="java.util.ArrayList"%>
<%@page import="edms.wsdl.VersionDetail"%>
<%@page import="edms.wsdl.Folder"%>
<%@page import="java.util.List"%>
<%List<Folder> folderList = (List<Folder>) request.getAttribute("folderList"); 
String breadcum=(String)request.getAttribute("breadcum");
Folder currentFolder=(Folder)request.getAttribute("currentFolder");
String userid=(String)request.getAttribute("userid");
%>
       
        <!----------------/// RIGHT PART STARTED HERE ------------------->
                                            <div class="right-pane">
                                              <ul class="icon_left_descri">
                                                <li class="padding_less"> <a href="#" onClick="left_icon()">
                                                  <div class="left_icon"></div>
                                                  </a> </li>
                                                <li class="peroperty right_tab" > <a href="#">PROPERTIES</a>
                                                  <div class="icon_right icon_right_minus"></div>
                                                </li>
                                                <div class="content_right" style="display: block;">
                                                      <table>
                                                          <tr>
                                                              <td class="proper_heading">Name </td>
                                                              <td><%=currentFolder.getFolderName() %></td>
                                                          </tr>
                                                          <tr>
                                                               <td class="proper_heading">Parent</td>
                                                               <%
                                                               String parent=currentFolder.getFolderPath().substring(0,currentFolder.getFolderPath().lastIndexOf("/"));
                                                               parent=parent.substring(parent.lastIndexOf("/")+1);
                                                               if(parent.equals("")||parent.equals(userid)){parent="Home";}
                                                               %>
                                                               <td ><%=parent %></td>
                                                          </tr>
                                                          <tr>
                                                               <td class="proper_heading">Creation Date</td>
                                                               <td><%=currentFolder.getCreationDate() %></td>
                                                          </tr>
                                                          <tr>
                                                               <td class="proper_heading">Owner</td>
                                                               <td> <%=currentFolder.getCreatedBy() %></td>
                                                          </tr>
                                                           <tr>
                                                               <td class="proper_heading">Folders</td>
                                                               <td><%=currentFolder.getNoOfFolders() %></td>
                                                          </tr>
                                                          <tr>
                                                               <td class="proper_heading">Documents</td>
                                                               <td><%=currentFolder.getNoOfDocuments() %></td>
                                                          </tr>
                                                      </table>
                                                </div>
                                              <!--   <li class="note right_tab"><a href="#">NOTES</a>
                                                  <div class="icon_right"></div>
                                                </li>
                                                <div class="content_right">
                                                     <table>
                                                        <tr>
                                                           <td class="note_heading">user 0 <img src="images/cancel.png" /></td>
                                                        </tr>
                                                        <tr>
                                                           <td>vxmsa</td>
                                                        </tr>
                                                        <tr>
                                                           <td>
                                                               <div class="note_book">
                                                                     <span>Add Note</span>
                                                                     <div class="clear"></div>
                                                                  <textarea>
                                                                  </textarea>
                                                                     <div class="add_note">
                                                                           <img src="images/add.png" /> Add
                                                                     </div>
                                                               </div>
                                                           </td>
                                                        </tr>
                                                     </table>   
                                                </div> -->
                                                <li class="keyword right_tab"><a href="#">KEYWORDS</a>
                                                  <div class="icon_right"></div>
                                                </li>
                                                <div class="content_right"><%=currentFolder.getKeywords() %> </div>
                                                <li class="history_right right_tab"><a href="#">HISTORY</a>
                                                  <div class="icon_right"></div>
                                                </li>
                                                <div class="content_right">
                                                      <table> <tr class="history_content">
                                                               <td>Version</td>
                                                               <td>Date</td>
                                                               <td>Author</td>
                                                               <td>Details</td>
                                                               <td>Action</td>
                                                             </tr>
                                                      <%
                                                      List<VersionDetail> versionDetails=currentFolder.getVersionsHistory();
                                                      for(VersionDetail versionDetail:versionDetails){
                                                      %>
                                                           <tr>
                                                                <td><%=versionDetail.getVersionName() %></td>
                                                                <td><%=versionDetail.getCreationDate() %></td>
                                                                <td><%=versionDetail.getCreatedBy() %></td>
                                                                <td><%=versionDetail.getDetails() %></td>
                                                                <td><a href="#" id="<%=currentFolder.getFolderPath() %>,<%=versionDetail.getVersionName() %>" class="" onclick="restoreVersion(this.id)">Restore</a></td>
                                                             </tr>
                                                             <%} %>
                                                             
                                                              
                                                      </table>
                                                <script type="text/javascript">
                                                	function restoreVersion(folderPath){
                                                		alert(folderPath);
                                                		folderPath=folderPath.split(',');
                                                		
                                                		  $.ajax({
                                          					type : "GET",
                                          					url : "${pageContext.request.contextPath}/restoreVersion",
                                          					data : {
                                          						'folderPath' : folderPath[0],
                                                    			'versionName' : folderPath[1]
                                          					},
                                          					contentType : "application/json",
                                          					async : false,
                                          					success : function(data) {
                                          						//$("#folderView>.row_content>ul").append(data);
                                          						 alert(data);
                                          					}

                                          				}); 
                                                	
                                                	}
                                                
                                                </script>
                                                </div>
                                                <li class="prew right_tab"><a href="#">PREVIEW</a>
                                                  <div class="icon_right"> </div>
                                                </li>      
                                                <div class="content_right"></div>
                                                <li class="prew right_tab permi"><a href="#">PERMISSION</a>
                                                  <div class="icon_right"> </div>
                                                </li>      
                                                <div class="content_right">
                                                      <div class="group_shared_bottom user_details permission_tab">
                                                           
                                                           <div class="group_shared permission_content">
                                                              <table>
                                                                     <tr class="permission_heading">
                                                                             <td align="top">User</td>
                                                                             <td align="top">Read</td>
                                                                             <td>Write</td>
                                                                             <td>Delete</td>
                                                                             <td>Security Access</td>
                                                                     </tr>
                                                                               <%
                                                       List<String> users=currentFolder.getUserRead();
                                                       String[] user=users.toString().split(",");
                                                       for(String str:user){
                                                    	   str=str.replace("]", "");
                                                    	   str=str.replace("[", "");
                                                    	   System.out.println(str+(str.equals(",")||str.equals("")||str.equals(" ")||str.equals("]")||str.equals("[")));
                                                    	   if((str.equals(",")||str.equals("")||str.equals(" ")||str.equals("]")||str.equals("["))){}else{
                                                    	   %>
                                                    <tr class="right_text"> 
                                                    <td class="go_text"><%=str %> </td>
													<td><input type="checkbox" onclick="assignPermissions(this.value)" name="userpermission" value="<%=str%>,ur" id="<%=str.replace("@", "")
														.replace(".", "")%>ur" checked="checked"/>
														
													</td>
													<td>
													<%if(currentFolder.getUserWrite().toString().contains(str)){ %>
														<input type="checkbox" onclick="assignPermissions(this.value)"  name="userpermission" value="<%=str%>,uw" id="<%=str.replace("@", "")
														.replace(".", "")%>uw" checked="checked"/>
														<%}else{ %>
														<input type="checkbox" onclick="assignPermissions(this.value)"  name="userpermission" value="<%=str%>,uw" id="<%=str.replace("@", "")
														.replace(".", "")%>uw"/>
														<%} %>
													</td>
													<td>
													<%if(currentFolder.getUserDelete().toString().contains(str)){ %>

														<input type="checkbox" onclick="assignPermissions(this.value)"  name="userpermission"  value="<%=str%>,ud" id="<%=str.replace("@", "")
														.replace(".", "")%>ud" checked="checked"/>
														<%}else{ %>

														<input type="checkbox" onclick="assignPermissions(this.value)"  name="userpermission"  value="<%=str%>,ud" id="<%=str.replace("@", "")
														.replace(".", "")%>ud"/>
														<%} %>
													</td>
													<td>
													<%if(currentFolder.getUserSecurity().toString().contains(str)){ %>
														<input type="checkbox" onclick="assignPermissions(this.value)"  name="userpermission" value="<%=str%>,us" id="<%=str.replace("@", "")
														.replace(".", "")%>us" checked="checked"/>
														<%}else{ %>
														<input type="checkbox" onclick="assignPermissions(this.value)"  name="userpermission" value="<%=str%>,us" id="<%=str.replace("@", "")
														.replace(".", "")%>us"/>
														<%} %>

													</td></tr>
                                                       <%}} %>
                                                       </table>
                                                           </div>
                                                      </div>
                                                    
                                                </div>
                                              </ul>
                                            </div>
                                            
                                            <!------------------------------/// LEFT ICON ONLY --------------->
                                            <div class="left_icon_only">
                                              <div class="only_left_icon"> <a href="#" onClick="left_icon()">
                                                <div class="left_icon back_pos"></div>
                                                </a>
                                                <div class="claer"></div>
                                                <ul class="icon_left_descri new_icon_view">
                                                  <li class="peroperty right_tab" ></li>
                                                  <li class="note right_tab"> </li>
                                                  <li class="keyword right_tab"></li>
                                                  <li class="perim right_tab"></li>
                                                  <li class="history_right right_tab"></li>
                                                  <li class="prew right_tab"></li>
                                                </ul>
                                              </div>
                                            </div>
                                            
                                            <!------------------------------/// LEFT ICON ONLY END  ---------------> 
                                            
                                          
                                          <!----------------/// RIGHT PART END HERE -------------------> 
                                             <script src="js/jquery-1.7.2.min.js" type="application/javascript" ></script>
<script src="js/left_event.js" type="application/javascript"></script>
<script src="js/jquery_popup.js"></script>

<link href="css/style.css" type="text/css" rel="stylesheet"/>
<link rel="stylesheet" href="css/jquery_popup.css" />
                                              <link href="css/page.css" rel="stylesheet" type="text/css" />
    
    <link href="css/contextmenu.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    
    </style>
   <!--- <script src="src/jquery.js" type="text/javascript"></script>-->
    <script src="js/jquery.contextmenu.js" type="text/javascript"></script>  
    
    <!--code highlighter file import-->
    <script src="js/shCore.js" type="text/javascript"></script>
    <script src="js/shBrushJScript.js" type="text/javascript"></script>
    <script src="js/shBrushCss.js" type="text/javascript"></script>  
    <link href="css/shCore.css" rel="stylesheet" type="text/css" />
    <link href="css/shThemeDefault.css" rel="stylesheet" type="text/css" /> 
    <script type="text/javascript">
        SyntaxHighlighter.config.clipboardSwf = '../js/clipboard.swf';
    	  SyntaxHighlighter.all();
	  </script>
    <!--end code highlighter-->

      <!---------------/// USER NEW SEND STRAED HERE ------------->
<script type="text/javascript" src="js/user_send.js"></script>
<script type="text/javascript" src="js/group_send.js"></script>
<link href="css/user_send.css" type="text/css" rel="stylesheet"/>
<link href="css/group_send.css" type="text/css" rel="stylesheet"/>
<!----------------/// USER NEW SEND END HERE --------------->  