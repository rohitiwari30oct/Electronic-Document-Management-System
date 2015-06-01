
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="edms.wsdl.File"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<style>

.active{ background:#f00;}
.hide_this{ display:none;}
.submit{ width:100px; text-align:center; padding:5px; background:#666; border:#ccc 1px solid ;}
.By{display:none;}
.get_all_select{ display:none;}
</style>

<%
	List<Folder> folderList = (List<Folder>) request.getAttribute("folderList"); 

List<File> fileList = (List<File>) request.getAttribute("fileList");
System.out.println(fileList.size());
//String breadcum=(String)request.getAttribute("breadcum");
Folder currentFolder=(Folder)request.getAttribute("currentFolder");
String userid=(String)request.getAttribute("userid");
%>
<!-----------------------/// RIGHT PANNEL ------------------->
<%@page import="edms.wsdl.Folder"%>
<div class="strip_details index_heading">
	<!-- <div class="home_heading"></div> -->
	<div class="path" style="padding-left: 5px;">
		<span> <%
 	if(userid=="admin"){
 %> <!-- <span id='/' style='cursor: pointer'
			onclick='getFileSystem(this.id)'> Home /</span> --> <%-- <%
 	String[] breadcm=currentFolder.getFolderPath().split("/");
  	String bdm="";
  	for(int i=0;i<breadcm.length;i++){
  		System.out.println("clicked on Bread cum "+breadcm[i]);
  		bdm+="/"+breadcm[i];
 %> --%><%--  <span id='<%=bdm%>' style='cursor: pointer'
			onclick='getFileSystem(this.id)'> <%=breadcm[i]%> /
		</span> --%> <%
 	/* }  */
  		}else{
 %> <%-- <span id='/<%=userid%>' style='cursor: pointer'
			onclick='getFileSystem(this.id)'> Home / </span>  --%><%
 	String[] breadcm=currentFolder.getFolderPath().split("/");
  	String bdm="";
  	for(int i=1;i<breadcm.length;i++){
  		System.out.println("clicked on Bread cum "+breadcm[i]);
  		bdm+="/"+breadcm[i];
  		
  		if(i==1){
  			 %>
  			 <span id='<%="/"+userid%>' style='cursor: pointer'
  						onclick='getFileSystem(this.id)'>Home /</span> 
  						<script type="text/javascript">

  						//var myVar=setTimeout(myFunctionl,500);
		getSubFoldersFromDoc("listli<%=userid%>");

		//myStopFunction(myVar);
		</script>
  						
  						<%	
  		}else{
 %>
 <span id='<%=bdm%>' style='cursor: pointer'
			onclick='getFileSystem(this.id)'><%=breadcm[i]%> /
			<%} %>
		</span><script type="text/javascript">
		//var myVar=setTimeout(myFunctionl,500);
		getSubFoldersFromDoc("listli<%=bdm%>");
		//myStopFunction(myVar);
		</script> <%
 	} }
 %>


		</span>
		<!-- <span class="path_color">Main Folder</span> -->
	</div>
	<!-- <a href="javascript:void(0);" id='userDashboard' onclick="getPage(this.id)">
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
		<div class="right_create_folder right_create_folder1">
			<img src="images/create_folder_icon.png" />
		</div>
		<div class="right_upload_folder right_upload_folder1">
			<img src="images/upload.png" />
		</div>
	</div>
	<!--------/// NEW TWO ICON ------------>
	<!-------/// NEW CHANGES FOR FOLDER AND FILE VIEW ********** -->

	<!------/// NEW CHANGES FOR FOLDER STRED HERE ------>
	<div class="new_option_folder">
		<ul>
			<li class="share_link link_share"><img
				src="images/share_linl.png" /></li>
			<li class="share_people share_link mange_sharing"><img
				src="images/48094.png" /></li>
			<li class="more_delete"><img src="images/delete.png" /></li>
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
                                                    <a href="javascript:void(0);" id="fileSystem"  onclick="getPage(this.id)"><div class="home"></div> Home<div class="claer"></div></a> 
                                                 </li>
                                                 <li data-tooltip="Download"> 
                                                    <a href="javascript:void(0);"><div class="download"></div>Download</a>
                                                 </li>
                                                 <li class="add_folder " data-tooltip="Create"> 
                                                    <a href="javascript:void(0);"><div class="create"></div> CREATE</a> 
                                                 </li>
                                                 <li class="folder_icon_1" data-tooltip="Upload"> 
                                                    <a href="javascript:void(0);"><div class="upload"></div>UPLOAD</a>
                                                 </li>
                                                 <li > 
                                                    <a href="javascript:void(0);" title="Create"><div class="create_doc"></div>CREATE</a>
                                                 </li>
                                                 <li data-tooltip="Rename" > 
                                                   <a href="javascript:void(0);"class="renameFolder"><div class="edit"></div>Rename</a> 
                                                 </li>
                                                 <li class="share" data-tooltip="Share"> 
                                                   <a href="javascript:void(0);"><div class="update"></div>SHARE</a> 
                                                 </li>
                                                <li class="delete_folder"  data-tooltip="Delete"> 
                                                   <a href="javascript:void(0);" title="Delete"><div class="delet"></div>DELETE</a> 
                                                </li> -->

	<!------/// NEW CHANGES FOR file STRED HERE ------>
	<div class="new_option_file">
		<ul>
			<li class="share_link link_share"><img
				src="images/share_linl.png" /></li>
			<li class="share_people share_link mange_sharing"><img
				src="images/48094.png" /></li>
			<li class="share_link preview_file "><img
				src="images/eye-24-256.png" /></li>
			<li class="more_delete"><img src="images/delete.png" /></li>
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

		<div class="thum_view_middle1  folder_only"  style="position: absolute;
height: 100%;
width: 100%;"  onclick="getDocProperties(this.id)" 
						id="<%=currentFolder.getFolderPath()%>"
						oncontextmenu="getDocProperties(this.id)"      ></div>
			<div class="row_text middle_tab ">
				<div class="white">
					<div class="icon_folder"></div>
					<div class="folder_text">Folder View</div>
				</div>
			</div>
			
			<div id="folderThumbView" class="row_content folder_only">
				<ul class="select-toggle">
					<%
						for (Folder folder : folderList) {
					%>
					<li
						title="Name: <%=folder.getFolderPath().substring(folder.getFolderPath().lastIndexOf("/")+1)%> &#013;Type: Folder &#013;Author: <%=folder.getCreatedBy()%> &#013;Date: <%=folder.getCreationDate().replace('T', ' ').substring(0,folder.getCreationDate().indexOf("."))%>"
					ondblclick="getFileSystem(this.id)"	onclick="getDocProperties(this.id)" class="space select_box target folderContextMenuClass"
						id="<%=folder.getFolderPath()%>"
						oncontextmenu="getDocProperties(this.id)">
						<div class="folder_icon inner_val"></div> <span>
						<%if(folder.getFolderName().length()>50){ %>
						 <%=folder.getFolderName().substring(0,50)+"..."%>
						 <%} else{
						 %>
							 <%=folder.getFolderName()%>
						<% }%>
						 
						 </span>
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
			<div id="fileThumbView" class="row_content file_only">
				<ul>
					<%
						for (File file : fileList) {
							String size="";
							long sizee=0;
							if(file.getFileSize()/1024>1024){
								sizee=(file.getFileSize()/(1024*1024));
								size=sizee+" MB";
							}else if(file.getFileSize()>1024){
								sizee=(file.getFileSize()/1024);
								size=sizee+" KB";						
							}else{
								size=file.getFileSize()+" Byte";
							}
							
					
					
					%>
					<li  
						title="Name: <%=file.getFilePath().substring(file.getFilePath().lastIndexOf("/")+1)%> &#013;Type: File &#013;Size: <%=size %> &#013;Author: <%=file.getCreatedBy()%> &#013;Date: <%=file.getCreationDate().replace('T', ' ').substring(0,file.getCreationDate().indexOf("."))%>"
						onclick="getFileProperties(this.id)" class="space select_box target fileContextMenuClass"
						id="<%=file.getFilePath()%>"
						oncontextmenu="getFileProperties(this.id)">
						<!-- <img src="images/ms_excel_big.png" />
										<div class="clear"></div>
										 --> <%
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
 	}else if(file.getFileName().contains(".jpg")||file.getFileName().contains(".JPG")){
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
						<div class="blank_image"></div> <%
 	}else if(file.getFileName().contains(".ico")){
 %>
						<div class="new_ico"></div> <%
 	}else{
 %>
						<div class="blank_image"></div> <%
 	}
 %><span><%=file.getFileName()%> </span>
					</li>
					<%
						}
					%>

				</ul>


			</div>
		</div>
		<!-------------------/// ROW FIRST CONTENT END HERE ----------------------->

		<!------------------/// LIST VIEW STARTED HERE ------------------------->

		<div class="list_view_middle">
			<div class="list_view_information">
				<ul>
					<li>&nbsp;</li>
					<li>Title</li>
					<li style="width: 13%;">Size</li>
					<li style="width: 17%;">Date of Creation</li>
					<li>Author</li>
				</ul>
			</div>
			<div class="list_view_content">
				<%
					HttpSession hs = request.getSession(false);
						String folderName=(String) hs.getAttribute("currentFolder");
						if(folderName!=""){
							
						}else{
							folderName=(String) hs.getAttribute("currentFile");
						}

						//System.out.println("current folder or file value is : "+folderName);
							for (Folder folder : folderList) {
				%>
				<ul  
						title="Name: <%=folder.getFolderPath().substring(folder.getFolderPath().lastIndexOf("/")+1)%> &#013;Type: Folder &#013;Author: <%=folder.getCreatedBy()%> &#013;Date: <%=folder.getCreationDate().replace('T', ' ').substring(0,folder.getCreationDate().indexOf("."))%>" onclick="getDocProperties(this.id)"
					class="select_box target folder_only folderContextMenuClass"
					id="<%=folder.getFolderPath()%>"
					ondblclick="getFileSystem(this.id)"
						oncontextmenu="getDocProperties(this.id)" >
					<li>
						<div class="icon_list"></div>
					</li>
					<li><%=folder.getFolderName()%></li>
					<li style="width: 7%;">--</li>
					<li style="width: 17%;"><%=folder.getCreationDate().replace('T', ' ').substring(0,folder.getCreationDate().indexOf("."))%></li>
					<li><%=folder.getCreatedBy()%></li>
				</ul>
				<%
					}
				%>


				<%
					for (File file : fileList) {
						String size="";
						long sizee=0;
						if(file.getFileSize()/1024>1024){
							sizee=(file.getFileSize()/(1024*1024));
							size=sizee+" MB";
						}else if(file.getFileSize()>1024){
							sizee=(file.getFileSize()/1024);
							size=sizee+" KB";						
						}else{
							size=file.getFileSize()+" Byte";
						}
				%>
				<ul 
						title="Name: <%=file.getFilePath().substring(file.getFilePath().lastIndexOf("/")+1)%> &#013;Type: File &#013;Size: <%=size %> &#013;Author: <%=file.getCreatedBy()%> &#013;Date: <%=file.getCreationDate().replace('T', ' ').substring(0,file.getCreationDate().indexOf("."))%>"
						onclick="getFileProperties(this.id)" class="select_box target fileContextMenuClass"
						id="<%=file.getFilePath()%>"
						oncontextmenu="getFileProperties(this.id)">
					<li>
						<%
							if(file.getFileName().contains(".pdf")){
						%>
						<div class="new_pdf16"></div> <%
 	}else if(file.getFileName().contains(".doc")){
 %>
						<div class="new_word16"></div> <%
 	}else if(file.getFileName().contains(".xls")||file.getFileName().contains(".csv")){
 %>
						<div class="new_msexcel16"></div> <%
 	}else if(file.getFileName().contains(".ppt")){
 %>
						<div class="new_ppt16"></div> <%
 	}else if(file.getFileName().contains(".jpg")){
 %>
						<div class="new_jpg16"></div> <%
 	}else if(file.getFileName().contains(".png")){
 %>
						<div class="new_png16"></div> <%
 	}else if(file.getFileName().contains(".gif")){
 %>
						<div class="new_png16"></div> <%
 	}else if(file.getFileName().contains(".xml")||file.getFileName().contains(".vcf")||file.getFileName().contains(".pod")||file.getFileName().contains(".ics")){
 %>
						<div class="new_txt16"></div> <%
 	}else if(file.getFileName().contains(".txt")){
 %>
						<div class="new_txt16"></div> <%
 	}else if(file.getFileName().contains(".bmp")){
 %>
						<div class="new_png16"></div> <%
 	}else if(file.getFileName().contains(".ico")){
 %>
						<div class="new_png16"></div> <%
 	}else{
 %>
						<div class="blank_image16"></div> <%
 	}
 %>
					</li>
					<li><%=file.getFileName()%></li>
					<li style="width: 7%;">
					<%
					 size="";
					 sizee=0;
					if(file.getFileSize()/1024>1024){
						sizee=(file.getFileSize()/(1024*1024));
						size=sizee+" MB";
					}else if(file.getFileSize()>1024){
						sizee=(file.getFileSize()/1024);
						size=sizee+" KB";						
					}else{
						size=file.getFileSize()+" Byte";
					}
					
					%>
					
					<%=size%></li>
					<li style="width: 17%;"><%=file.getCreationDate().replace('T', ' ').substring(0,file.getCreationDate().indexOf("."))%></li>
					<li><%=file.getCreatedBy()%></li>
				</ul>
				<%
					}
				%>


			</div>
		</div>

<input type="hidden" id="multiPath" />
		<!---------------/// LIST VIEW END HERE ----------------------------------->

		<!----------------/// RIGHT PART STARTED HERE ------------------->
		<div class="right_icon_main option_left">
			<jsp:include page="properties.jsp" />
		</div>
		<!----------------/// RIGHT PART END HERE ------------------->
<!----------/// RIGHT CLICK MENU STRED HERE ---------->
		<div class="right_click_menu_blank">
			<ul>
				<li class="new_folder right_create_folder"><div
						class="right_images">
						<img src="images/create_folder_icon.png" />
						<div class="clear"></div>
					</div>
					<span>new folder</span>
				<div class="clear"></div></li>
				
			
				
				<li class="rename_right" onclick="pasteDocMenu()" ><div class="right_images">
						<img src="images/paste_icon.png" />
						<div class="clear"></div>
					</div>
					<span>paste</span>
				<div class="clear"></div></li>
				
			</ul>
		</div>
		<!----------/// RIGHT CLICK MENU END HERE --------------->
		<!----------/// RIGHT CLICK MENU STRED HERE ---------->
		<div class="right_click_menu">
			<ul>
				<li class="new_folder right_create_folder"><div
						class="right_images">
						<img src="images/create_folder_icon.png" />
						<div class="clear"></div>
					</div>
					<span>new folder</span>
				<div class="clear"></div></li>
				<li class="share_right mange_sharing"><div class="right_images">
						<img src="images/48094.png" />
						<div class="clear"></div>
					</div>
					<span>share</span>
				<div class="clear"></div></li>
				<li class="get_link"><div class="right_images">
						<img src="images/share_linl.png" />
						<div class="clear"></div>
					</div>
					<span>get link</span>
				<div class="clear"></div></li>
				<li class="rename_right renameFolder"><div class="right_images">
						<img src="images/rename.png" />
						<div class="clear"></div>
					</div>
					<span>rename</span>
				<div class="clear"></div></li>
				<li class="share_right cutDocMenu"><div class="right_images">
						<img src="images/cut.png" />
						<div class="clear"></div>
					</div>
					<span>cut</span>
				<div class="clear"></div></li>
				<li class="get_link copyDocMenu"><div class="right_images">
						<img src="images/copy.png" style="margin-top:3px;" />
						<div class="clear"></div>
					</div>
					<span>copy</span>
				<div class="clear"></div></li>
				<li class="rename_right" onclick="pasteDocMenu()" id="downloadButton" ><div class="right_images">
						<img src="images/paste_icon.png" />
						<div class="clear"></div>
					</div>
					<span>paste</span>
				<div class="clear"></div></li>
				<!--  <li class="download_right"><div class="right_images"><img src="images/download.png"/><div class="clear"></div></div><span>download</span><div class="clear"></div></li> -->
				<li class="remove_right more_delete"><div class="right_images">
						<img src="images/delete_icon_file.png" />
						<div class="clear"></div>
					</div>
					<span>remove</span>
				<div class="clear"></div></li>
			</ul>
		</div>
		<!----------/// RIGHT CLICK MENU END HERE --------------->
		<!----------/// RIGHT CLICK MENU STRED HERE FOR FILE  ---------->
		<div class="right_click_menu_file">
			<ul>
				<!-- <li class="new_folder"><div class="right_images"><img src="images/create_folder_icon.png" /><div class="clear"></div></div><span>new folder</span><div class="clear"></div></li>-->
				<li class="share_right mange_sharing"><div class="right_images">
						<img src="images/48094.png" />
						<div class="clear"></div>
					</div>
					<span>share</span>
				<div class="clear"></div></li>
				<li class="get_link"><div class="right_images">
						<img src="images/share_linl.png" />
						<div class="clear"></div>
					</div>
					<span>get link</span>
				<div class="clear"></div></li>
				<li class="rename_right renameFolder"><div class="right_images">
						<img src="images/rename.png" />
						<div class="clear"></div>
					</div>
					<span>rename</span>
				<div class="clear"></div></li>
				<li class="previewPopup prew_right_click"><div
						class="right_images">
						<div class="clear"></div>
					</div>
					<span>Preview</span>
				<div class="clear"></div></li>
				<li class="previewInNewTab prew_right_click"><div
						class="right_images">
						<div class="clear"></div>
					</div>
					<span>Preview in New Tab</span>
				<div class="clear"></div></li>
				<!-- Add an optional button to open the popup -->
				<li onclick="getFileContent(this.id)" class="download_right"><div
						class="right_images">
						<img src="images/download.png" />
						<div class="clear"></div>
					</div>
					<span>download</span>
				<div class="clear"></div></li>
					<li class="share_right cutDocMenu"><div class="right_images">
						<img src="images/cut.png" />
						<div class="clear"></div>
					</div>
					<span>cut</span>
				<div class="clear"></div></li>
				<li class="get_link copyDocMenu"><div class="right_images">
						<img src="images/copy.png" />
						<div class="clear"></div>
					</div>
					<span>copy</span>
				<div class="clear"></div></li>
				<li class="rename_right" onclick="pasteDocMenu()"  id="downloadButton" ><div class="right_images">
						<img src="images/paste_icon.png"  style="margin-top:3px;" />
						<div class="clear"></div>
					</div>
					<span>paste</span>
				<div class="clear"></div></li>
				<li class="remove_right more_delete"><div class="right_images">
						<img src="images/delete_icon_file.png" />
						<div class="clear"></div>
					</div>
					<span>remove</span>
				<div class="clear"></div></li>
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
		<!-- <p>
			Folder name <span>*</span>
		</p> -->
		<input type="text" style="display: none;" id="oldFolderName"
			value='<%=currentFolder.getFolderPath()%>' />
		<p>
			Please enter a new name for the item: <span>*</span>
		</p>

		<input type="text" id="newFolderName"
			value='<%=currentFolder.getFolderName()%>' /> <input type="hidden"
			id="parentfolderName" value='<%=currentFolder.getFolderPath()%>' />
		<br />
		<div class="clear"></div>
		<input type="button" value="Rename" onclick="renameFolder()" /> <input
			type="button" id="cancel" value="Cancel" /> <br />
		<script type="text/javascript">
			function renameFolder() {

				$("#contactdiv_666").css("display", "none");
				var myVar=setTimeout(myFunctionl,500);
				var oldfolder = $('#oldFolderName').val();
				var newfolder = $('#newFolderName').val();
				//alert(oldfolder);
				//alert(newfolder);
				if (newfolder != "") {
					//alert(folder);
					$
							.ajax({
								type : "GET",
								url : "${pageContext.request.contextPath}/renameFolder",
								data : {
									'oldFolderName' : oldfolder,
									'newFolderName' : newfolder
								},
								contentType : "application/json",
								async : true,
								success : function(data) {
									if (data == "true") {
										location.href="ajaxTrue";
									}
									//var pathhh=$('#parentfolderName').val()+"/"+newfolder;
									//alert(($("#"+oldfolder+" > span")).text("sdgfsd"));
									//$("#"+oldfolder).find("span").text("your text");
									jQuery.post("getFileSystem", {
										'path' : data
									}, function(data) {
										if (data == "true") {
											location.href="ajaxTrue";
										}
										$(".right").html(data);
									});
									// alert(data);
								}
							});
				} else {
					alert("Please give new name");
				}

				//	$("#message"
				$("#" + $('#parentfolderName').val() + ">span").html(newfolder);
				getDocProperties($('#parentfolderName').val());
				myStopFunction(myVar);
				 
			}
		</script>
	</form>
</div>
<!-----------------/// ADD GROUP POP UP  END HERE ---------->


