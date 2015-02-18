
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="edms.wsdl.File"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>


<%
	List<Folder> folderList = (List<Folder>) request.getAttribute("folderList"); 

List<File> fileList = (List<File>) request.getAttribute("fileList");
System.out.println(fileList.size());
String breadcum=(String)request.getAttribute("breadcum");
Folder currentFolder=(Folder)request.getAttribute("currentFolder");
String userid=(String)request.getAttribute("userid");
%>
<!-----------------------/// RIGHT PANNEL ------------------->
<%@page import="edms.wsdl.Folder"%>
<div class="strip_details index_heading">
	<!-- <div class="home_heading"></div> -->
	<div class="path" style="padding-left:5px;" >
		<span> <%
 	if(userid=="admin"){
 %> <span id='/' style='cursor: pointer'
			onclick='getFileSystem(this.id)'> Home / </span> <%
 	String[] breadcm=currentFolder.getFolderPath().split("/");
 	String bdm="/"+userid;
 	for(int i=1;i<breadcm.length;i++){
 		System.out.println("clicked on Bread cum "+breadcm[i]);
 		bdm+="/"+breadcm[i];
 %> <span id='<%=bdm%>' style='cursor: pointer'
			onclick='getFileSystem(this.id)'> <%=breadcm[i]%> /
		</span> <%
 	} 
 		}else{
 %> <span id='/<%=userid%>' style='cursor: pointer'
			onclick='getFileSystem(this.id)'> Home / </span> <%
 	String[] breadcm=currentFolder.getFolderPath().split("/");
 	String bdm="/"+userid;
 	for(int i=2;i<breadcm.length;i++){
 		System.out.println("clicked on Bread cum "+breadcm[i]);
 		bdm+="/"+breadcm[i];
 %> <span id='<%=bdm%>' style='cursor: pointer'
			onclick='getFileSystem(this.id)'> <%=breadcm[i]%> /
		</span> <%
 	} }
 %>


		</span>
		<!-- <span class="path_color">Main Folder</span> -->
	</div>
	<!-- <a href="#" id='userDashboard' onclick="getPage(this.id)">
		<div class="dasboard">DASHBOARD</div>
	</a> -->
	  <div class="right_icon">
                                          <div class="thum_view" onClick="tile_view();" title="Folder View"></div>
                                          <div class="list_view" onClick="list_view();" title="List View"></div>
                                       <!--   <div class="right_view right_view_color" onClick="left_view();" title="Right View"></div>-->
                                          <div class="bottom_view" onClick="bottom_view();" title="Bottom View"></div>

                                        </div>
                                        
                                          <!-------/// NEW TWO ICON ------->
                                        <div class="new_folder_icon">
                                           <div class="right_create_folder right_create_folder1"><img src="images/create_folder_icon.png" /></div>
                                           <div class="right_upload_folder right_upload_folder1"><img src="images/upload.png" /></div>
                                         </div>
                                        <!--------/// NEW TWO ICON ------------>  
                                        <!-------/// NEW CHANGES FOR FOLDER AND FILE VIEW ********** -->
                                        
                                        <!------/// NEW CHANGES FOR FOLDER STRED HERE ------>
                                        <div class="new_option_folder">
                                              <ul>
                                                 <li class="share_link link_share"><img src="images/share_linl.png" /></li>
                                                 <li class="share_people share_link mange_sharing"><img src="images/48094.png" /></li>
                                                 <li class="more_delete"  ><img src="images/delete.png"/></li>
                                                 <li class="new_more_icon_folder"><img src="images/more_icon.png" /></li>
                                              </ul>
                                        
                                                <!------/// MORE NEW OPTION FOR FOLDER -------->
                                                <div class="new_more_folder">
                                                      <ul>
                                                          <li class="renameFolder">rename</li>
                                                       </ul>
                                                </div>
                                                <!------/// MORE NEW OPTION  FOLDER END HERE ---->
                                        
                                        
                                        </div>
                                        <!-------// NEW CHANGES FOR FOLDER END HERE ---------->
                                        
                                        <!--  <li data-tooltip="Home">
                                                    <a href="#" id="fileSystem"  onclick="getPage(this.id)"><div class="home"></div> Home<div class="claer"></div></a> 
                                                 </li>
                                                 <li data-tooltip="Download"> 
                                                    <a href="#"><div class="download"></div>Download</a>
                                                 </li>
                                                 <li class="add_folder " data-tooltip="Create"> 
                                                    <a href="#"><div class="create"></div> CREATE</a> 
                                                 </li>
                                                 <li class="folder_icon_1" data-tooltip="Upload"> 
                                                    <a href="#"><div class="upload"></div>UPLOAD</a>
                                                 </li>
                                                 <li > 
                                                    <a href="#" title="Create"><div class="create_doc"></div>CREATE</a>
                                                 </li>
                                                 <li data-tooltip="Rename" > 
                                                   <a href="#"class="renameFolder"><div class="edit"></div>Rename</a> 
                                                 </li>
                                                 <li class="share" data-tooltip="Share"> 
                                                   <a href="#"><div class="update"></div>SHARE</a> 
                                                 </li>
                                                <li class="delete_folder"  data-tooltip="Delete"> 
                                                   <a href="#" title="Delete"><div class="delet"></div>DELETE</a> 
                                                </li> -->
                                        
                                             <!------/// NEW CHANGES FOR file STRED HERE ------>
                                        <div class="new_option_file">
                                              <ul>
                                                 <li class="share_link link_share"><img src="images/share_linl.png" /></li>
                                                 <li class="share_people share_link mange_sharing"><img src="images/48094.png" /></li>
                                                 <li class="share_link preview_file "><img src="images/eye-24-256.png"/></li>
                                                 <li class="more_delete"><img src="images/delete.png"/></li>
                                                 <li class="new_more_icon_file"><img src="images/more_icon.png" /></li>
                                              </ul>
                                        
                                                <!------/// MORE NEW OPTION FOR FOLDER -------->
                                                <div class="new_more_file">
                                                       <ul>
                                                          <li class="downloadFolder" onclick="getFileContent(this.id)">download</li>
                                                          <li class="renameFolder">rename</li>
                                                       </ul>
                                                </div>
                                                <!------/// MORE NEW OPTION  file END HERE ---->
                                        </div>
                                        <!-------// NEW CHANGES FOR FOLDER END HERE ---------->
                                        
                                        <!-------/// NEW CHANGES FOR FOLDER AND FILE VIEW ********** -->
</div>

<div class="user_dasboard_1">

	<!--------------//// ALLL CHAT SUB HTML PAGES HERE STARED HERE ------------>
	<!-------/// Chat Downarrow option--------->

	<!------------/// Chat Downarrow Option End ------>
	<!--------------- ALL CHAT SUB HTML FOLDER END HERE ---------------->


	<div class="middle-pane middle-pane_new left_border">

		<!-------------/// ROW FIRST CONTENT STARTED HERE ---------------------->
		<div class="thum_view_middle new_width">
			<div class="row_text middle_tab ">
				<div class="white">
					<div class="icon_folder"></div>
					<div class="folder_text">Folder View</div>
				</div>
			</div>
			<div class="claer"></div>
			<div id="folderThumbView" class="row_content folder_only">
				<ul>
					<%
						for (Folder folder : folderList) {
					%>
					<li onclick="getDocProperties(this.id)" class="select_box target"
						id="<%=folder.getFolderPath()%>"
						ondblclick="getFileSystem(this.id)" oncontextmenu="getFileProperties(this.id)" >
						<div class="folder_icon"></div> <span> <%=folder.getFolderName()%></span>
					</li>
					<%
						}
					%>
				</ul>
			</div>
			<input type="hidden" id="clickedFolder" value="" />
			<div class="clear"></div>
			<div class="row_text middle_tab ">
				<div class="white">
					<div class="icon_folder"></div>
					<div class="folder_text">File View</div>
				</div>
			</div>
			<div class="claer"></div>
			<div id="fileThumbView"  class="row_content file_only">
				<ul>
					<%
						for (File file : fileList) {
					%>
					<li onclick="getFileProperties(this.id)" class="select_box target"
						id="<%=file.getFilePath()%>" oncontextmenu="getFileProperties(this.id)" >

						<!-- <img src="images/ms_excel_big.png" />
										<div class="clear"></div>
										 -->
					<%
							if(file.getFileName().contains(".pdf")){
						%>
						<div class="new_pdf"></div> <%
 	}else if(file.getFileName().contains(".doc")){
 %>
						<div class="new_word"></div> <%
 	}else if(file.getFileName().contains(".xls")||file.getFileName().contains(".csv")){
						%>
						<div class="new_msexcel"></div> <%
 	}else if(file.getFileName().contains(".ppt")){
		%>
		<div class="new_ppt"></div> <%
}else if(file.getFileName().contains(".jpg")){
	%>
	<div class="new_jpg"></div> <%
}else if(file.getFileName().contains(".png")){
	%>
	<div class="new_png"></div> <%
}else if(file.getFileName().contains(".gif")){
	%>
	<div class="new_gif"></div> <%
}else if(file.getFileName().contains(".xml")||file.getFileName().contains(".vcf")||file.getFileName().contains(".pod")||file.getFileName().contains(".ics")){
	%>
	<div class="new_txt"></div> <%
}else if(file.getFileName().contains(".txt")){
	%>
	<div class="new_txt"></div> <%
}else if(file.getFileName().contains(".bmp")){
	%>
	<div class="new_bmp"></div> <%
}else if(file.getFileName().contains(".ico")){
	%>
	<div class="new_ico"></div> <%
}else{
 %>
						<div class="blank_image"></div> <%
 	}
					%><span><%=file.getFileName()%>
					</span>
					</li>
					<%
						}
					%>

				</ul>
				<script type="text/javascript">
					function getFileContent(folderPath) {
						location.href = "${pageContext.request.contextPath}/getFileContent?folderPath="
								+ folderPath;
						//	alert(folderPath);
						/* $.ajax({
							type : "GET",
							url : ,
							data : {
								'folderPath' : folderPath
							},
							contentType : "application/json",
							async : false,
							success : function(data) {
								//$("#folderThumbView>ul").append(data);
								 alert(data);
							}

						}); */
					}
				</script>
				
			</div>
		</div>
		<!-------------------/// ROW FIRST CONTENT END HERE ----------------------->

		<!------------------/// LIST VIEW STARTED HERE ------------------------->

		<div class="list_view_middle">
			<div class="list_view_information">
				<ul>
					<li>&nbsp;</li>
					<li>Title</li>
					<li style="width: 7%;">Size</li>
					<li style="width: 17%;">Date Modified</li>
					<li>Author</li>
				</ul>
			</div>
			<div class="list_view_content">
				<%
					for (Folder folder : folderList) {
				%>
				<ul onclick="getDocProperties(this.id)" class="select_box target"
					id="<%=folder.getFolderPath()%>"
					ondblclick="getFileSystem(this.id)">
					<li>
						<div class="icon_list"></div>
					</li>
					<li><%=folder.getFolderName()%></li>
					<li style="width: 7%;">--</li>
					<li style="width: 17%;"><%=folder.getModificationDate()%></li>
					<li><%=folder.getCreatedBy()%></li>
				</ul>
				<%
					}
				%>


				<%
					for (File file : fileList) {
				%>
				<ul onclick="getDocProperties(this.id)" class="select_box target"
					id="<%=file.getFilePath()%>"
					onclick="setFileContent(this.id)">
					<li>
							<%
							if(file.getFileName().contains(".pdf")){
						%>
						<div class="new_pdf"></div> <%
 	}else if(file.getFileName().contains(".doc")){
 %>
						<div class="new_word"></div> <%
 	}else if(file.getFileName().contains(".xls")){
						%>
						<div class="new_msexcel"></div> <%
 	}else if(file.getFileName().contains(".ppt")){
						%>
						<div class="new_ppt"></div> <%
 	}else{
 %>
						<div class="blank_image"></div> <%
 	}
					%>
					</li>
					<li><%=file.getFileName()%></li>
					<li style="width: 7%;">--</li>
					<li style="width: 17%;"><%=file.getModificationDate()%></li>
					<li><%=file.getCreatedBy()%></li>
				</ul>
				<%
					}
				%>


			</div>
		</div>

		<!---------------/// LIST VIEW END HERE ----------------------------------->

		<!----------------/// RIGHT PART STARTED HERE ------------------->
		<div class="right_icon_main option_left">
			<jsp:include page="properties.jsp" />
		</div>
		<!----------------/// RIGHT PART END HERE ------------------->

 <!----------/// RIGHT CLICK MENU STRED HERE ---------->
                                             <div class="right_click_menu">
                                                   <ul>
                                                       <li class="new_folder right_create_folder"><div class="right_images"><img src="images/create_folder_icon.png" /><div class="clear"></div></div><span>new folder</span><div class="clear"></div></li>
                                                       <li class="share_right mange_sharing"><div class="right_images"><img src="images/48094.png" /><div class="clear"></div></div><span>share</span><div class="clear"></div></li>
                                                       <li class="get_link"><div class="right_images"><img src="images/share_linl.png" /><div class="clear"></div></div><span>get link</span><div class="clear"></div></li>
                                                       <li class="rename_right renameFolder"><div class="right_images"><img src="images/rename.png" /><div class="clear"></div></div><span>rename</span><div class="clear"></div></li>
                                                      <!--  <li class="download_right"><div class="right_images"><img src="images/download.png"/><div class="clear"></div></div><span>download</span><div class="clear"></div></li> -->
                                                       <li class="remove_right more_delete"><div class="right_images"><img src="images/delete_icon_file.png" /><div class="clear"></div></div><span>remove</span><div class="clear"></div></li>
                                                      
                                                   </ul>
                                             </div>
                                             <!----------/// RIGHT CLICK MENU END HERE --------------->
                                               <!----------/// RIGHT CLICK MENU STRED HERE FOR FILE  ---------->
                                                 <div class="right_click_menu_file">
                                                   <ul>
                                                      <!-- <li class="new_folder"><div class="right_images"><img src="images/create_folder_icon.png" /><div class="clear"></div></div><span>new folder</span><div class="clear"></div></li>-->
                                                       <li class="share_right mange_sharing"><div class="right_images"><img src="images/48094.png" /><div class="clear"></div></div><span>share</span><div class="clear"></div></li>
                                                       <li class="get_link"><div class="right_images"><img src="images/share_linl.png" /><div class="clear"></div></div><span>get link</span><div class="clear"></div></li>
                                                       <li class="rename_right renameFolder"><div class="right_images"><img src="images/rename.png" /><div class="clear"></div></div><span>rename</span><div class="clear"></div></li>
                                                       <li class="download_right"><div class="right_images"><img src="images/download.png"/><div class="clear"></div></div><span>download</span><div class="clear"></div></li>
                                                       <li class="remove_right more_delete"><div class="right_images"><img src="images/delete_icon_file.png" /><div class="clear"></div></div><span>remove</span><div class="clear"></div></li>
                                                      
                                                   </ul>
                                             </div>
                                             <!----------/// RIGHT CLICK MENU END HERE  FOR FILE--------------->
                                          
                                          
	</div>
	<!-------------/// MIDDLE END HERE ---------------->

	<div class="claer"></div>
</div>

<!-----------------//// BOTTOM VIEW STARTED HERE ------------------>

<!-------------------------/// RIGHT PANNEL END ----------------->


<div id="contactdiv_666">
	<form class="form" action="#" id="contact">
		<h3>Rename Folder</h3>
		<p>
			Folder name <span>*</span>
		</p>
		<input type="text" id="oldFolderName"
			value='<%=currentFolder.getFolderPath()%>' />
		<p>
			Please enter a new Folder name <span>*</span>
		</p>
		<input type="text" id="newFolderName" /> <input type="hidden"
			id="parentfolderName" value='<%=currentFolder.getFolderPath()%>' />
		<br />
		<div class="clear"></div>
		<input type="button" value="Rename" onclick="renameFolder()" /> <input
			type="button" id="cancel" value="Cancel" /> <br />
		<script type="text/javascript">
			function renameFolder() {
				var oldfolder = $('#oldFolderName').val();
				var newfolder = $('#newFolderName').val();
				if(newfolder!=""){
				//alert(folder);
				$.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/renameDoc",
					data : {
						'oldFolderName' : oldfolder,
						'newFolderName' : newfolder
					},
					contentType : "application/json",
					async : false,
					success : function(data) {
						jQuery.get("getFileSystem", {
							'path' : data
						}, function(data) {
							$(".right").html(data);
						});
						// alert(data);
					}
				});}else{
					alert("Please give new name");
				}
				$("#contactdiv_666").css("display", "none");
				getDocProperties($('#parentfolderName').val());
			}
		</script>
	</form>
</div>
<!-----------------/// ADD GROUP POP UP  END HERE ---------->

