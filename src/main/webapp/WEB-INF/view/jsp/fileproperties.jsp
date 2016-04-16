<%@page import="java.io.IOException"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="org.apache.commons.io.IOUtils"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="edms.wsdl.Folder"%>
<%@page import="java.util.ArrayList"%>
<%@page import="edms.wsdl.FileVersionDetail"%>
<%@page import="edms.wsdl.File"%>
<%@page import="java.util.List"%>

<%List<File> folderList = (List<File>) request.getAttribute("fileList"); 
String breadcum=(String)request.getAttribute("breadcum");
File currentFolder=(File)request.getAttribute("currentFolder");
String userid=(String)request.getAttribute("userid");

String size="";
long sizee=0;
if(currentFolder.getFileSize()/1024>1024){
	sizee=(currentFolder.getFileSize()/(1024*1024));
	size=sizee+" MB";
}else if(currentFolder.getFileSize()>1024){
	sizee=(currentFolder.getFileSize()/1024);
	size=sizee+" KB";						
}else{
	size=currentFolder.getFileSize()+" Byte";
}
%>
       
       										<!----------------/// RIGHT PART STARTED HERE ------------------->
                                            <div class="right-pane">
                                              <ul class="icon_left_descri">
                                                <li class="padding_less"> <a href="javascript:void(0);" onClick="left_icon()">
                                                  <div class="left_icon"></div>
                                                  </a> </li>
                                                <li class="peroperty right_tab" > <a href="javascript:void(0);">PROPERTIES</a>
                                                  <div class="icon_right icon_right_minus"></div>
                                                </li>
                                                <div class="content_right" style="display: block;">
                                                      <table>
                                                          <tr>
                                                              <td class="proper_heading">Name </td>
                                                              <td><%=currentFolder.getFileName() %></td>
                                                          </tr>
                                                          <tr>
                                                              <td class="proper_heading">Size </td>
                                                              <td><%=size %></td>
                                                          </tr>
                                                          <tr>
                                                               <td class="proper_heading">Parent</td>
                                                               <%
                                                               String parent=currentFolder.getFilePath().substring(0,currentFolder.getFilePath().lastIndexOf("/"));
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
                                                               <td class="proper_heading">Created By</td>
                                                               <td> <%=currentFolder.getCreatedBy() %></td>
                                                          </tr>
                                                         <%--  <tr>
                                                               <td class="proper_heading">Size</td>
                                                               <td> <%=currentFolder.getFileSize() %></td>
                                                          </tr> --%>
														  <%-- <tr>
                                                               <td class="proper_heading">Folders</td>
                                                               <td><%=currentFolder.getNoOfFolders() %></td>
                                                          </tr>
                                                          <tr>
                                                               <td class="proper_heading">Documents</td>
                                                               <td><%=currentFolder.getNoOfDocuments() %></td>
                                                          </tr> --%>
                                                      </table>
                                                </div>
                                                <li class="note right_tab"><a href="javascript:void(0);">NOTES</a>
                                                  <div class="icon_right"></div>
                                                </li>
                                                <div class="content_right">
                                                     <table>
                                                        
                                                       <tr>
                                                           <td>
                                                               <div class="note_book">
                                                                   
                                                                     <div class="clear"></div>
                                                                     <%String nottes= "";
                                                           if((currentFolder.getNotes()!=null)&&(currentFolder.getNotes()!="")){
                                                        	   nottes=currentFolder.getNotes();
                                                           } %>
                                                                     
																<textarea id="notesnote"><%=nottes %></textarea>
                                                                  
                                                                     <div class="add_note">
                                                                           <img src="images/add.png" /> Save
                                                                     </div>
                                                               </div>
                                                           </td>
                                                        </tr>
                                                     
                                                      
                                                     </table>   
                                                </div>
                                               <li class="keyword right_tab"><a href="javascript:void(0);">KEYWORDS</a>
                                                      <!---// ADD ICON HERE --->
                                                      
                                                      <%if(currentFolder.getUserRead().toString().indexOf(userid)>=0&&currentFolder.getUserWrite().toString().indexOf(userid)<0&&currentFolder.getUserSecurity().toString().indexOf(userid)<0){}else{ %>
                                                      <div class="keyword_add">
                                                           <img src="images/create_folder_icon.png" />
                                                      </div>
                                                      <%} %>
                                                      <!-----// ADD ICON END HERE ---->
                                                  <div class="icon_right"> </div>
                                                </li>
                                                <div class="content_right">
                                                        <!------/// INNER KEYWORD ------>
                                                        <div class="inner_keyword">
                                                                    <ul>
                                                             <%
                                                             List<String> keywords=currentFolder.getKeywords();
                                                             for(String str:keywords){
                                                            	 String[] key=str.split(",");
                                                            	 for(int i=0;i<key.length;i++){
                                                            	 if(key[i]!=""&&(!key[i].equals(""))){
                                                             %>
                                                             <li><span><%=key[i] %></span>
                                                               <%if(currentFolder.getUserRead().toString().indexOf(userid)>=0&&currentFolder.getUserWrite().toString().indexOf(userid)<0&&currentFolder.getUserSecurity().toString().indexOf(userid)<0){}else{ %>
                                                    
                                                             <img class="keyword_del" src="images/delete_icon_file.png" id="<%=key[i] %>">
                                                             <img  class="keyword_edit" onclick="editKeyword(this.id)"  id="edit<%=key[i] %>" src="images/edit-icon.png" id="<%=key[i] %>">
                                                             <%} %>
                                                             
                                                              <div class="clear"></div><div class="clear"></div></li>
                                                           <%} }}%>
                                                             </ul>
                                                        
                                                        </div>
                                                        <!-----/// INNER KEYWORD -------->
                                                <script type="text/javascript">
                                                function editKeyword(keyword){
                                                	var key=keyword.substring(4);
                                                	var keyVal=key.split(":");
                                                	 if(keyVal[0]!="Date"){
                                                		 $('.datepicker').attr("id","");
                                                		 $('.Datepicker_33').attr("id","add_keywordid");
                                                		 $('.datepicker').css("display","none");
                                                		 $('.Datepicker_33').css("display","block");
                                                	 }else{
                                                		 $('.datepicker').attr("id","add_keywordid");
                                                		 $('.Datepicker_33').attr("id","");
                                                		 $('.datepicker').css("display","block");
                                                		 $('.Datepicker_33').css("display","none");
                                                	 }
                                                	//alert(keyVal[0]);
                                                	$("#add_keywordkey").val(keyVal[0]);
                                                	$("#add_keywordid").val(keyVal[1]);
                                                	$(".add_keyword").attr('class','edit_keyword');
                                                	$(".add_keyword_exit").attr('class','edit_keyword_exit');
                                                	$(".add_keyword").attr('class','edit_keyword');
                                                	//$(".edit_keyword").addClass('edit_keyword');
                                                	$("#edit_keywordid").val(key);
                                                }
                                                </script>
                                                </div>
                                               <%--  <li class="history_right right_tab"><a href="javascript:void(0);">VERSIONING</a>
                                                  <div class="icon_right"></div>
                                                </li>
                                                <div class="content_right">
                                                     <%
                                                     List<FileVersionDetail> versionDetails=currentFolder.getFileVersionsHistory();
                                                     int i=0;
                                                     for(FileVersionDetail versionDetail:versionDetails){
                                                     if(i>0){
                                                     %>
                                                        <td><%=versionDetail.getVersionName() %></td>
                                                       <td><%=versionDetail.getCreatedBy() %></td>
                                                     <!------------/// Row_STARTED HERE ----------->
                                                     <div style="margin-left: 20px;" class="row_recent">
           											 <!--  <div class="recnt_pdf_doc"> </div> -->
           											 <%=versionDetail.getDetails() %> by<a href="javascript:void(0);" class="second"><%=versionDetail.getCreatedBy() %></a> on <a href="javascript:void(0);" class="second"><%=versionDetail.getCreationDate() %></a> </div>
                                                        
                                                     <a href="javascript:void(0);" id="<%=currentFolder.getFilePath() %>,<%=versionDetail.getVersionName() %>" class="" onclick="restoreVersion(this.id)">Restore</a>
                                                           
                                                     <%}i++;} %>
                                                </div> --%>
                                                <!--  <li class="prew right_tab" onclick="getPreviewDoc()"><a href="javascript:void(0);">PREVIEW</a>
                                                  <div class="icon_right">
                                                  <script type="text/javascript">
                                                  function getPreviewDoc(){
													//alert('sdf');                                                	  
                                                		 $.ajax({
                                              				type : "GET",
                                              				url : "${pageContext.request.contextPath}/getPreview",
                                              				contentType : "application/json",
                                              				async : false,
                                              				success : function(data) {
                                              					$('#contentPreviewRight').html(data);
                                              				}
                                                  			});
                                                		 }
                                                  </script>
                                                   </div>
                                                </li>      
                                                <div class="content_right" id="contentPreviewRight">
                                                </div> -->
                                                <li class="prew right_tab permi"><a href="javascript:void(0);">SHARING AND SECURITY</a>
                                                  <div class="icon_right"> </div>
                                                </li>      
                                                <div class="content_right">
                                                      <div class="group_shared_bottom user_details permission_tab">
                                                           
                                                           <div class="group_shared permission_content">
                                                              <table>
                                                                    
                                                                               <%
                                                       List<String> users=currentFolder.getUserRead();
                                                       String[] user=users.toString().split(",");
                                                       int ii=1;
                                                       for(String str:user){
                                                    	   if(ii>1){
                                                    		   
                                                    	   if(str!="admin"){
                                                    	   str=str.replace("]", "");
                                                    	   str=str.replace("[", "");
                                                    	   System.out.println(str+(str.equals(",")||str.equals("")||str.equals(" ")||str.equals("]")||str.equals("[")));
                                                    	   if((str.equals(",")||str.equals("")||str.equals(" ")||str.equals("]")||str.equals("["))){}else{
                                                    		   String flag="Can View";
                                                    		   if(currentFolder.getUserWrite().toString().contains(str)){
                                                    			   flag="Can Edit";
                                                    		   }
                                                    		   if(currentFolder.getUserSecurity().toString().contains(str)){
																	flag="Can Manage"  ;                                                  			   
                                                    		   }
                                                    	   %>
                                                    <tr class="right_text"> 
                                                    <td style="text-transform: none;"  class="go_text"><%=str.toLowerCase() %> </td>
													<td> : <%=flag %>
													</td>
													<%-- <td>
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

													</td> --%></tr>
                                                       <%}}} 
                                                    	   ii=2;
                                                       }%>
                                                       </table>
                                                           </div>
                                                      </div>
                                                    
                                                </div>
                                              </ul>
                                            </div>
                                            
                                            <!------------------------------/// LEFT ICON ONLY --------------->
                                            <div class="left_icon_only">
                                              <div class="only_left_icon"> <a href="javascript:void(0);" onClick="left_icon()">
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
                                            
                                          
                                        
                                         