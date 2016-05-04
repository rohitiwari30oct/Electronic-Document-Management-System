<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="edms.wsdl.File"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

				<script type="text/javascript">
		function getRightClickMenuFolder(folderid) {
			
			var myVar=setTimeout(myFunctionl,500);
			var docPath=document.getElementById("multiPath").value;
			var mul=docPath.split(",");
			
			var flagview="false";
			var flagwrite="false";
			var flagmanage="false";
			
			if(docPath!=null&&mul!=null&&mul.length>1){
				for(var v=0;v<mul.length;v++){
					var prmission=$('#folderPermissions'
							+ mul[v]).html();
					if(prmission!=null){
					var prmissions = prmission.split(',');
					if (prmissions[0] == "true") {
						flagview="true";
					}

					if (prmissions[1] == "true") {
						flagwrite="true";
					}

					if (prmissions[2] == "true") {
						flagmanage="true";
					}
				}}
				if (flagview == "true") {
					$('#folderRightMenuSharing').css('display', 'none');
					$('#folderRightMenuCreateFolder').css('display', 'none');
					//$('#folderRightMenuGetLink').css('display', 'none');
					$('#folderRightMenuRename').css('display', 'none');
					$('#folderRightMenuCut').css('display', 'none');
					$('#folderRightMenuCopy').css('display', 'none');
					$('#folderRightMenuPaste').css('display', 'none');
					$('#folderRightMenuRemove').css('display', 'none');
				}

				if (flagwrite == "true") {
					$('#folderRightMenuSharing').css('display', 'none');
					$('#folderRightMenuCreateFolder').css('display', 'none');
					//$('#folderRightMenuGetLink').css('display', 'none');
					$('#folderRightMenuRename').css('display', 'none');
					$('#folderRightMenuCut').css('display', 'none');
					$('#folderRightMenuCopy').css('display', 'none');
					$('#folderRightMenuPaste').css('display', 'none');
					$('#folderRightMenuRemove').css('display', 'none');
				}
				if (flagmanage == "true") {
					$('#folderRightMenuSharing').css('display', 'none');
					$('#folderRightMenuCreateFolder').css('display', 'none');
				//	$('#folderRightMenuGetLink').css('display', 'none');
					$('#folderRightMenuRename').css('display', 'none');
					/* $('#folderRightMenuCut').css('display', 'block'); */
					$('#folderRightMenuCopy').css('display', 'block');
					$('#folderRightMenuPaste').css('display', 'block');
					$('#folderRightMenuRemove').css('display', 'none');
				}
				//alert(flagview+flagwrite+flagmanage);
				if(flagview == "false"&&flagwrite == "false"&&flagmanage == "false"){

					$('#folderRightMenuSharing').css('display', 'none');
					$('#folderRightMenuCreateFolder').css('display', 'none');
					//$('#folderRightMenuGetLink').css('display', 'none');
					$('#folderRightMenuRename').css('display', 'none');
					$('#folderRightMenuCut').css('display', 'block');
					$('#folderRightMenuCopy').css('display', 'block');
					$('#folderRightMenuPaste').css('display', 'none');
					$('#folderRightMenuRemove').css('display', 'block');
				}
				
				
			}else{

				getDocProperties(folderid);
			var permis = document.getElementById('folderPermissions'
					+ folderid).innerHTML;
			
			
			
		//	alert(permis);
			var permissions = permis.split(',');
			if (permissions[0] == "true") {
				$('#folderRightMenuSharing').css('display', 'none');
				$('#folderRightMenuCreateFolder').css('display', 'none');
			//	$('#folderRightMenuGetLink').css('display', 'none');
				$('#folderRightMenuRename').css('display', 'none');
				$('#folderRightMenuCut').css('display', 'none');
				$('#folderRightMenuCopy').css('display', 'none');
				$('#folderRightMenuPaste').css('display', 'none');
				$('#folderRightMenuRemove').css('display', 'none');
			}

			if (permissions[1] == "true") {
				$('#folderRightMenuSharing').css('display', 'none');
				$('#folderRightMenuCreateFolder').css('display', 'none');
			//	$('#folderRightMenuGetLink').css('display', 'none');
				$('#folderRightMenuRename').css('display', 'block');
				$('#folderRightMenuCut').css('display', 'none');
				$('#folderRightMenuCopy').css('display', 'none');
				$('#folderRightMenuPaste').css('display', 'none');
				$('#folderRightMenuRemove').css('display', 'none');
			}
			if (permissions[2] == "true") {
				$('#folderRightMenuSharing').css('display', 'block');
				$('#folderRightMenuCreateFolder').css('display', 'block');
			//	$('#folderRightMenuGetLink').css('display', 'block');
				$('#folderRightMenuRename').css('display', 'block');
				/* $('#folderRightMenuCut').css('display', 'block'); */
				$('#folderRightMenuCopy').css('display', 'block');
				$('#folderRightMenuPaste').css('display', 'block');
				$('#folderRightMenuRemove').css('display', 'block');
			}
if(permissions[0] == "false"&&permissions[1] == "false"&&permissions[2] == "false"){

	$('#folderRightMenuSharing').css('display', 'block');
	$('#folderRightMenuCreateFolder').css('display', 'block');
//	$('#folderRightMenuGetLink').css('display', 'block');
	$('#folderRightMenuRename').css('display', 'block');
	$('#folderRightMenuCut').css('display', 'block');
	$('#folderRightMenuCopy').css('display', 'block');
	$('#folderRightMenuPaste').css('display', 'block');
	$('#folderRightMenuRemove').css('display', 'block');
}}
			
			myStopFunction(myVar);
		}
		</script>
			
	<script type="text/javascript">
			function getRightClickMenuFile(folderid) {
				
				var myVar=setTimeout(myFunctionl,500);
				var docPath=document.getElementById("multiPath").value;
				var mul=docPath.split(",");
				
				var flagview="false";
				var flagwrite="false";
				var flagmanage="false";
				
				if(mul.length>1){
					for(var v=0;v<mul.length;v++){
						var prmission=document.getElementById('filePermissions'
								+ mul[v]).innerHTML;
						var prmissions = prmission.split(',');
						if (prmissions[0] == "true") {
							flagview="true";
						}

						if (prmissions[1] == "true") {
							flagwrite="true";
						}

						if (prmissions[2] == "true") {
							flagmanage="true";
						}
					}
					if (flagview == "true") {
						$('#fileRightMenuSharing').css('display', 'none');
						$('#fileRightMenuGetLink').css('display', 'none');
						$('#folderRightMenuRename').css('display', 'none');
						$('#fileRightMenuRemove').css('display','none');
						$('#fileRightMenuDownload').css('display', 'none');
						$('#fileRightMenuPreview').css('display', 'none');
						$('#fileRightMenuCut').css('display', 'none');
						$('#fileRightMenuCopy').css('display', 'none');
						$('#fileRightMenuPaste').css('display', 'none');
					}

					if (flagwrite == "true") {
						$('#fileRightMenuSharing').css('display', 'none');
						$('#fileRightMenuGetLink').css('display', 'none');
						$('#fileRightMenuRename').css('display', 'none');
						$('#fileRightMenuRemove').css('display','none');
						$('#fileRightMenuDownload').css('display', 'none');
						$('#fileRightMenuPreview').css('display', 'none');
						$('#fileRightMenuPreviewNewTab').css('display', 'none');
						$('#fileRightMenuCut').css('display', 'none');
						$('#fileRightMenuCopy').css('display', 'none');
						$('#fileRightMenuPaste').css('display', 'none');
					}
					if (flagmanage == "true") {
						$('#fileRightMenuSharing').css('display', 'none');
						$('#fileRightMenuGetLink').css('display', 'block');
						$('#fileRightMenuRename').css('display', 'block');
						$('#fileRightMenuRemove').css('display','block'); 
						$('#fileRightMenuDownload').css('display', 'none');
						$('#fileRightMenuPreviewNewTab').css('display', 'none');
						$('#fileRightMenuPreview').css('display', 'none');
						/* $('#fileRightMenuCut').css('display', 'block'); */
						$('#fileRightMenuCopy').css('display', 'block');
						$('#fileRightMenuPaste').css('display', 'none');
					}

					if(flagview == "false"&&flagwrite == "false"&&flagmanage == "false"){
						//	alert("sdfdds");
						$('#fileRightMenuSharing').css('display', 'none');
						$('#fileRightMenuGetLink').css('display', 'none');
						$('#fileRightMenuRename').css('display', 'none');
						$('#fileRightMenuRemove').css('display','block'); 
						$('#fileRightMenuDownload').css('display', 'none');
						$('#fileRightMenuPreviewNewTab').css('display', 'none');
						$('#fileRightMenuPreview').css('display', 'none');
						$('#fileRightMenuCut').css('display', 'block');
						$('#fileRightMenuCopy').css('display', 'block');
						$('#fileRightMenuPaste').css('display', 'none');
					}
				}else{
				//alert("not multiple");
				getFileProperties(folderid);
				var permis = document.getElementById('filePermissions'+ folderid).innerHTML;
				//alert(permis);
				var permit = permis.split(',');
			//	alert("permit[0] "+permit[0]);
				if (permit[0]=="true") {
					$('#fileRightMenuSharing').css('display', 'none');
					$('#fileRightMenuGetLink').css('display', 'none');
					$('#fileRightMenuRename').css('display', 'none');
					$('#fileRightMenuRemove').css('display','none');
					$('#fileRightMenuPreview').css('display', 'block');
					$('#fileRightMenuPreviewNewTab').css('display', 'block');
					$('#fileRightMenuCut').css('display', 'none');
					$('#fileRightMenuCopy').css('display', 'none');
					$('#fileRightMenuPaste').css('display', 'none');
					$('#fileRightMenuDownload').css('display', 'none');
					//alert("view");
				}
				if (permit[1]=="true") {
				//	alert(permission[1]);
					//alert("edit");
					$('#fileRightMenuSharing').css('display', 'none');
					$('#fileRightMenuGetLink').css('display', 'none');
					$('#fileRightMenuRename').css('display', 'block');
					$('#fileRightMenuRemove').css('display','none');
					$('#fileRightMenuDownload').css('display', 'none');
					$('#fileRightMenuPreview').css('display', 'block');
					$('#fileRightMenuPreviewNewTab').css('display', 'block');
					$('#fileRightMenuCut').css('display', 'none');
					$('#fileRightMenuCopy').css('display', 'none');
					$('#fileRightMenuPaste').css('display', 'none');
				}
				if (permit[2]=="true") {
					//alert("manage");right_upload_folder1
					$('#fileRightMenuSharing').css('display', 'block');
					$('#fileRightMenuGetLink').css('display', 'block');
					$('#fileRightMenuRename').css('display', 'block');
					$('#fileRightMenuRemove').css('display','block'); 
					$('#fileRightMenuDownload').css('display', 'block');
					$('#fileRightMenuPreviewNewTab').css('display', 'block');
					$('#fileRightMenuPreview').css('display', 'block');
					/* $('#fileRightMenuCut').css('display', 'block'); */
					$('#fileRightMenuCopy').css('display', 'block');
					$('#fileRightMenuPaste').css('display', 'none');
				}
				//alert(permissions[0] == "false"&&permissions[1] == "false"&&permissions[2] == "false");
				if(permit[0] == "false"&&permit[1] == "false"&&permit[2] == "false"){
				//	alert("sdfs");
					$('#fileRightMenuSharing').css('display', 'block');
					$('#fileRightMenuGetLink').css('display', 'block');
					$('#fileRightMenuRename').css('display', 'block');
					$('#fileRightMenuRemove').css('display','block'); 
					$('#fileRightMenuDownload').css('display', 'block');
					$('#fileRightMenuPreviewNewTab').css('display', 'block');
					$('#fileRightMenuPreview').css('display', 'block');
					$('#fileRightMenuCut').css('display', 'block');
					$('#fileRightMenuCopy').css('display', 'block');
					$('#fileRightMenuPaste').css('display', 'none');
				}
				}
				myStopFunction(myVar);
			}
		</script>



<style>

/* .active{ background:#f00;} */
.hide_this{ display:none;}
.submit{ width:100px; text-align:center; padding:5px; background:#666; border:#ccc 1px solid ;}
.By{display:none;}
.get_all_select{ display:none;}
</style>

<%
List<Folder> folderList = (List<Folder>) request.getAttribute("folderList"); 
List<File> fileList = (List<File>) request.getAttribute("fileList");
Folder currentFolder=(Folder)request.getAttribute("currentFolder");
String userid=(String)request.getAttribute("userid");
	String[] breadcm=((String)request.getAttribute("breadcumPath")).split("/");
%>
<!-----------------------/// RIGHT PANNEL ------------------->
<%@page import="edms.wsdl.Folder"%>
<input type="hidden" id="breadcumPathHome" value="<%=(String)request.getAttribute("breadcumPath") %>" />
	



<input type="hidden" id="currentDirectory" value="<%=currentFolder.getFolderPath() %>" />
<div class="strip_details index_heading">
	<!-- <div class="home_heading"></div> -->
	<div class="path" style="padding-left: 5px;">
			<span> 
				<%
			 	if(userid=="admin"){
			  		}else{
			  	String bdm="";
			  	for(int i=1;i<breadcm.length;i++){
			  		bdm+="/"+breadcm[i];
				  		if(i==1){
				  			 %>
		  			 			<span id='<%="/"+userid%>' style='cursor: pointer' onclick='getFileSystem(this.id)'>Home /</span> 
		  						
		  						<script type="text/javascript">
								getSubFoldersFromDoc("listli<%=userid%>");
								</script>
		  					<%	
			  		}else{
			 		%>
		 			<span id='<%=bdm%>' style='cursor: pointer'	onclick='getFileSystem(this.id)'><%=breadcm[i]%> /
					<%} %>
					</span>
				<script type="text/javascript">
					getSubFoldersFromDoc("listli<%=bdm%>");
				</script> 
				<%
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
 	<div class="new_folder_icon" style="display: block;">
		<!-- <div class="right_create_folder right_create_folder1">
			<img src="images/create_folder_icon.png" />
		</div> -->
		<%if(breadcm.length>2){
		if(currentFolder.getUserSecurity().toString().contains(userid)||(currentFolder.getFolderPath().indexOf(userid)>=0)){
		%>
			<div class="right_upload_folder right_upload_folder1">
			<img src="images/upload.png" />
			</div>
		<%} }else{%>
		<div class="right_upload_folder right_upload_folder1">
			<img src="images/upload.png" />
			</div>
		
		<%} %>
	</div> 
	<!--------/// NEW TWO ICON ------------>
	<!-------/// NEW CHANGES FOR FOLDER AND FILE VIEW ********** -->

	<!------/// NEW CHANGES FOR FOLDER STRED HERE ------>
	<!-- <div class="new_option_folder">
		<ul>
			<li class="share_link link_share"><img
				src="images/share_linl.png" /></li>
			<li class="share_people share_link mange_sharing"><img
				src="images/48094.png" /></li>
			<li class="more_delete"><img src="images/delete.png" /></li>
			<li class="new_more_icon_folder"><img src="images/more_icon.png" /></li>
		</ul>

		<div class="new_more_folder">
			<ul>
				<li class="renameFolder">rename</li>
			</ul>
		</div>


	</div> -->
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
<!-- 	<div class="new_option_file">
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

		<div class="new_more_file">
			<ul>
				<li class="downloadFolder" onclick="getFileContent(this.id)">download</li>
				<li class="renameFolder">rename</li>
			</ul>
		</div>
	</div> -->
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
<script type="text/javascript">
function hideOptions(){
	 $('.new_option_folder').css('display','none');
}
</script>
		<div class="thum_view_middle1  folder_only"  style="position: absolute;
height: 100%;
width: 100%;"  onclick="getDocProperties(this.id);hideOptions()" 
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
							
							
							String folPath="";
							String folPat=folder.getFolderPath().substring(1);
							/* if(folPat.indexOf("/")==folPat.lastIndexOf("/")){

								 folPath="/"+userid+"/"+folder.getFolderName();
							}else{ */
								folPath=folder.getFolderPath();
							/* } */
							//folPath=folPath.substring(folPath.indexOf("/"));
					if(folder.getUserRead().toString().indexOf(userid)>=0)
					{	
					%>
					
					<li
						title="Name: <%=folder.getFolderPath().substring(folder.getFolderPath().lastIndexOf("/")+1)%> &#013;Type: Folder &#013;Author: <%=folder.getCreatedBy()%> &#013;Date: <%=folder.getCreationDate()%>"
					ondblclick="getSharedFileSystem(this.id)"	onclick="getDocProperties(this.id)" class="space select_box target folderContextMenuClass"
						id="<%=folPath%>"
						oncontextmenu="getDocProperties(this.id);getRightClickMenuFolder(this.id)">
						
						<div style="display: none;"
			id="folderPermissions<%=folPath%>"><%=folder.getUserRead().toString().indexOf(userid)>=0%>,<%=folder.getUserWrite().toString().indexOf(userid)>=0%>,<%=folder.getUserSecurity().toString().indexOf(userid)>=0%></div>
		
						
						
						<div class="folder_icon inner_val"></div> <span><%if(folder.getFolderName().length()>50){ %><%=folder.getFolderName().substring(0,50)+"..."%><%} else{%><%=folder.getFolderName()%><% }%></span>
					</li>
					<%
					}else{
						%>
						
					<li
						title="Name: <%=folder.getFolderPath().substring(folder.getFolderPath().lastIndexOf("/")+1)%> &#013;Type: Folder &#013;Author: <%=folder.getCreatedBy()%> &#013;Date: <%=folder.getCreationDate()%>"
					ondblclick="getFileSystem(this.id)"	onclick="getDocProperties(this.id)" class="space select_box target folderContextMenuClass"
						id="<%=folPath%>"
						oncontextmenu="getDocProperties(this.id);getRightClickMenuFolder(this.id)">
						
						<div style="display: none;"
			id="folderPermissions<%=folPath%>"><%=folder.getUserRead().toString().indexOf(userid)>=0%>,<%=folder.getUserWrite().toString().indexOf(userid)>=0%>,<%=folder.getUserSecurity().toString().indexOf(userid)>=0%></div>
		
						
						
						<div class="folder_icon inner_val"></div> <span><%if(folder.getFolderName().length()>50){ %><%=folder.getFolderName().substring(0,50)+"..."%><%} else{%><%=folder.getFolderName()%><% }%></span>
					</li>
						<%
					}
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
					<li ondblclick="getPrevious()" 
						title="Name: <%=file.getFilePath().substring(file.getFilePath().lastIndexOf("/")+1)%> &#013;Type: File &#013;Size: <%=size %> &#013;Author: <%=file.getCreatedBy()%> &#013;Date: <%=file.getCreationDate()%>"
						onclick="getFileProperties(this.id)" class="space select_box target fileContextMenuClass"
						id="<%=file.getFilePath()%>"
						oncontextmenu="getFileProperties(this.id);getRightClickMenuFile(this.id)">
						<div style="display: none;"
			id="filePermissions<%=file.getFilePath()%>"><%=file.getUserRead().toString().contains(userid)%>,<%=file.getUserWrite().toString().contains(userid)%>,<%=file.getUserSecurity().toString().contains(userid)%></div>
						
						
						
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
					<li style="width: 21%;">Date of Creation</li>
					<li> Owner</li>
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

							for (Folder folder : folderList) {
				%>
				<ul  
						title="Name: <%=folder.getFolderPath().substring(folder.getFolderPath().lastIndexOf("/")+1)%> &#013;Type: Folder &#013;Author: <%=folder.getCreatedBy()%> &#013;Date: <%=folder.getCreationDate()%>" onclick="getDocProperties(this.id)"
					class="select_box target folder_only folderContextMenuClass"
					id="<%=folder.getFolderPath()%>"
					ondblclick="getFileSystem(this.id)"
						oncontextmenu="getDocProperties(this.id);getRightClickMenuFolder(this.id)" >
					<li>
						<div class="icon_list"></div>
					</li>
					<li><%=folder.getFolderName()%></li>
					<li style="width: 7%;">4 KB</li>
					<li style="width: 17%;"><%=folder.getCreationDate()%></li>
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
						title="Name: <%=file.getFilePath().substring(file.getFilePath().lastIndexOf("/")+1)%> &#013;Type: File &#013;Size: <%=size %> &#013;Author: <%=file.getCreatedBy()%> &#013;Date: <%=file.getCreationDate()%>"
						onclick="getFileProperties(this.id)" class="select_box target fileContextMenuClass"
						id="<%=file.getFilePath()%>"
						oncontextmenu="getFileProperties(this.id);getRightClickMenuFile(this.id)">
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
					<%-- <li style="width: 17%;"><%=file.getCreationDate().replace('T', ' ').substring(0,file.getCreationDate().indexOf("."))%></li> --%>
					<li style="width: 17%;"><%=file.getCreationDate()%></li>
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
			
			<%
			if(!currentFolder.getCreatedBy().equalsIgnoreCase(userid)&&!currentFolder.getCreatedBy().equalsIgnoreCase("admin")&&!currentFolder.getFolderPath().contains(userid)){
					if(currentFolder.getUserSecurity().toString().contains(userid)){
					
				%>
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
			<%}}else{ %>
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
			
				<%} %>
				<li class="rename_right" id="refresh<%=currentFolder.getFolderPath() %>"   onclick="getFileSystem(this.id.substring(7))" ><div class="right_images">
						<img src="images/paste_icon.png" />
						<div class="clear"></div>
					</div>
					<span>refresh</span>
				<div class="clear"></div></li>
				
			</ul>
		</div>
		<!----------/// RIGHT CLICK MENU END HERE --------------->
		<!----------/// RIGHT CLICK MENU STRED HERE ---------->
		<div class="right_click_menu">
			<ul>
				<!-- <li id="folderRightMenuCreateFolder" class="new_folder right_create_folder"><div
						class="right_images">
						<img src="images/create_folder_icon.png" />
						<div class="clear"></div>
					</div>
					<span>new folder</span>
				<div class="clear"></div></li> -->
				<li  id="folderRightMenuSharing" class="share_right mange_sharing"><div class="right_images">
						<img src="images/48094.png" />
						<div class="clear"></div>
					</div>
					<span>share</span>
				<div class="clear"></div></li>
				<!-- <li id="folderRightMenuGetLink" class="get_link"><div class="right_images">
						<img src="images/share_linl.png" />
						<div class="clear"></div>
					</div>
					<span>get link</span>
				<div class="clear"></div></li> -->
				<li id="folderRightMenuRename" class="rename_right renameFolder"><div class="right_images">
						<img src="images/rename.png" />
						<div class="clear"></div>
					</div>
					<span>rename</span>
				<div class="clear"></div></li>
				<li id="folderRightMenuCut" class="share_right cutDocMenu"><div class="right_images">
						<img src="images/cut.png" />
						<div class="clear"></div>
					</div>
					<span>cut</span>
				<div class="clear"></div></li>
				<li id="folderRightMenuCopy" class="get_link copyDocMenu"><div class="right_images">
						<img src="images/copy.png" style="margin-top:3px;" />
						<div class="clear"></div>
					</div>
					<span>copy</span>
				<div class="clear"></div></li>
				<li id="folderRightMenuPaste" class="rename_right" onclick="pasteDocMenu()" id="downloadButton" ><div class="right_images">
						<img src="images/paste_icon.png" />
						<div class="clear"></div>
					</div>
					<span>paste</span>
				<div class="clear"></div></li>
				<!--  <li class="download_right"><div class="right_images"><img src="images/download.png"/><div class="clear"></div></div><span>download</span><div class="clear"></div></li> -->
				<li id="folderRightMenuRemove" class="remove_right more_delete"><div class="right_images">
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
				<li id="fileRightMenuSharing" class="share_right mange_sharing"><div class="right_images">
						<img src="images/48094.png" />
						<div class="clear"></div>
					</div>
					<span>share</span>
				<div class="clear"></div></li>
				<li id="fileRightMenuGetLink"  class="get_link set_link_give_link"><div class="right_images">
						<img src="images/share_linl.png" />
						<div class="clear"></div>
					</div>
					<span>get link</span>
				<div class="clear"></div></li>
				<li id="fileRightMenuRename" class="rename_right renameFolder"><div class="right_images">
						<img src="images/rename.png" />
						<div class="clear"></div>
					</div>
					<span>rename</span>
				<div class="clear"></div></li>
				<li id="fileRightMenuPreview" class="previewPopup prew_right_click"><div
						class="right_images">
						<div class="clear"></div>
					</div>
					<span>Preview</span>
				<div class="clear"></div></li>
				<li id="fileRightMenuPreviewNewTab" class="previewInNewTab prew_right_click"><div
						class="right_images">
						<div class="clear"></div>
					</div>
					<span>Preview in New Tab</span>
				<div class="clear"></div></li>
				<!-- Add an optional button to open the popup -->
				<li id="fileRightMenuDownload" onclick="getFileContent(this.id)" class="download_right"><div
						class="right_images">
						<img src="images/download.png" />
						<div class="clear"></div>
					</div>
					<span>download</span>
				<div class="clear"></div></li>
					<li id="fileRightMenuCut" class="share_right cutDocMenu"><div class="right_images">
						<img src="images/cut.png" />
						<div class="clear"></div>
					</div>
					<span>cut</span>
				<div class="clear"></div></li>
				<li id="fileRightMenuCopy" class="get_link copyDocMenu"><div class="right_images">
						<img src="images/copy.png" />
						<div class="clear"></div>
					</div>
					<span>copy</span>
				<div class="clear"></div></li>
				<li id="fileRightMenuPaste" class="rename_right" onclick="pasteDocMenu()"  id="downloadButton" ><div class="right_images">
						<img src="images/paste_icon.png"  style="margin-top:3px;" />
						<div class="clear"></div>
					</div>
					<span>paste</span>
				<div class="clear"></div></li>
				<li id="fileRightMenuRemove" class="remove_right more_delete"><div class="right_images">
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
		<%-- <%=currentFolder.getFolderName() %> --%>
		<input type="text" id="newFolderName"
			value='<%=currentFolder.getFolderName()%>' /> <input type="hidden"
			id="parentfolderName" value='<%=currentFolder.getFolderPath()%>' />
		<br />
		<div class="clear"></div>
		<input type="button" value="Rename" onclick="renameFolder()" id="rerename" /> <input
			type="button" id="cancel" value="Cancel" /> <br />
		<script type="text/javascript">
			function renameFolder() {
				$("#contactdiv_666").css("display", "none");
				var myVar=setTimeout(myFunctionl,500);
				var oldfolder = $('#oldFolderName').val();
				var newfolder = $('#newFolderName').val();
				//alert(newfolder);
				if(newfolder.indexOf('@')>=0||newfolder.indexOf(',')>=0
						||newfolder.indexOf('*')>=0||newfolder.indexOf('>')>=0
						||newfolder.indexOf('<')>=0||newfolder.indexOf(')')>=0
						||newfolder.indexOf('(')>=0||newfolder.indexOf("'")>=0
						||newfolder.indexOf('&')>=0||newfolder.indexOf('.')>=0
						||newfolder.indexOf('/')>=0||newfolder.indexOf('\\')>=0){
							showMsg('error','Please do not use characters like ./,@<>()*');
				}else{
				//alert(oldfolder);
				//alert(newfolder);
				if (newfolder != "") {
					//alert(folder);
					$.ajax({
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
									showMsg("success","Renamed Successfully");
									var breadcumPath=$('#breadcumPathHome').val();
									//alert(typeof(breadcumPath) == "undefined");
									if(typeof(breadcumPath) == "undefined")
									{	
										breadcumPath="";
									}
									jQuery.post("getFileSystem", {
										'path' : data,
										'breadcumPath':breadcumPath
										
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
					showMsg("error","Please give new name");
				}

				//	$("#message"
				$("#" + $('#parentfolderName').val() + ">span").html(newfolder);
				getDocProperties($('#parentfolderName').val());
				//myStopFunction(myVar);
				}

				myStopFunction(myVar);
			}
		</script>
		<script type="text/javascript">
			function renameFile() {
				$("#contactdiv_666").css("display", "none");
				var myVar=setTimeout(myFunctionl,500);
				var oldfolder = $('#oldFolderName').val();
				var newfolder = $('#newFolderName').val()+oldfolder.substring(oldfolder.lastIndexOf("."));
				//alert(newfolder);
				if(newfolder.indexOf('@')>=0||newfolder.indexOf(',')>=0
						||newfolder.indexOf('*')>=0||newfolder.indexOf('>')>=0
						||newfolder.indexOf('<')>=0||newfolder.indexOf(')')>=0
						||newfolder.indexOf('(')>=0||newfolder.indexOf("'")>=0
						||newfolder.indexOf('/')>=0||newfolder.indexOf('\\')>=0
						||newfolder.indexOf('&')>=0){
							showMsg('error','Please do not use characters like /,@<>()*');
				}else{
				//alert(oldfolder);
				//alert(newfolder);
				if (newfolder != "") {
					//alert(folder);
					$.ajax({
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
									showMsg("success","Renamed Successfully");
									var breadcumPath=$('#breadcumPathHome').val();
									//alert(typeof(breadcumPath) == "undefined");
									if(typeof(breadcumPath) == "undefined")
									{	
										breadcumPath="";
									}
									jQuery.post("getFileSystem", {
										'path' : data,
										'breadcumPath':breadcumPath
										
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
				//myStopFunction(myVar);
				}

				myStopFunction(myVar);
			}
		</script>
	</form>
</div>
<!-----------------/// ADD GROUP POP UP  END HERE ---------->

<div id="contactdiv_66">
	<form class="form" action="#" id="contact">
		<h3>Create Folder</h3>
		<p>
			Please enter a new Folder name <span>*</span>
		</p>
		<input type="text" id="folderName"  onkeypress="return runScript(event)" /> <%-- <input type="hidden"
			id="parentfolderName" value='<%=currentFolder.getFolderPath()%>' /> --%>
		<br />
		<div class="clear"></div>
		<input type="button" value="Create" onclick="createFolder()"   /> 
                                             <script type="text/javascript">
                                             function runScript(e) {
                                            	    if (e.keyCode == 13) {
                                            	    	createFolder();
                                            	        return false;
                                            	    }
                                            	}
                                             </script>
                                             
		<input type="button" id="cancel" value="Cancel" /> <br />
		<script type="text/javascript">
			function createFolder() {
				var myVar=setTimeout(myFunctionl,500);
				var folder = $('#folderName').val();
				$.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/checkDocExist",
					data : {
						'docPath' : folder.substring(folder.lastIndexOf("/")),
					},
					contentType : "application/json",
					async : true,
					success : function(data) {
						if(data=="true"){
						if(confirm("Already Exist ! Do you want to make a copy of it ?"))
							{
							if(folder.indexOf('.')>=0||folder.indexOf('.')>=0
									||folder.indexOf('@')>=0||folder.indexOf(',')>=0
									||folder.indexOf('*')>=0||folder.indexOf('>')>=0
									||folder.indexOf('<')>=0||folder.indexOf(')')>=0
									||folder.indexOf('(')>=0||folder.indexOf("'")>=0
									||folder.indexOf('/')>=0||folder.indexOf('\\')>=0
									||folder.indexOf('&')>=0){
									
										showMsg('error','Please do not use characters like ./,@<>()*');
							}else{
								$("#contactdiv_66").css("display", "none");
							//alert(folder);
							$.ajax({
								type : "GET",
								url : "${pageContext.request.contextPath}/createFolder",
								data : {
									'folderName' : folder
								},
								contentType : "application/json",
								async : true,
								success : function(data) {
									
									if(data=="true"){location.href="ajaxTrue";}else{
									if(data=="false"){
										showMsg("success","Folder created successfully");
									}
									else{
										
										var breadcumPath=$('#breadcumPathHome').val();
										//alert(typeof(breadcumPath) == "undefined");
										if(typeof(breadcumPath) == "undefined")
										{	
											breadcumPath="";
										}
										jQuery.post("getFileSystem", {
											'path' : data,
											'breadcumPath':breadcumPath
										}, function(data) {
											if (data == "true") {
												location.href = "index";
											}
											$(".right").html(data);
										});
										}
									}
								
								}
							});
							}
							$('#folderName').val("");
							getDocProperties($('#parentfolderName').val());
							myStopFunction(myVar);
							}						
						}else{
							if(folder.indexOf('.')>=0||folder.indexOf('.')>=0
									||folder.indexOf('@')>=0||folder.indexOf(',')>=0
									||folder.indexOf('*')>=0||folder.indexOf('>')>=0
									||folder.indexOf('<')>=0||folder.indexOf(')')>=0
									||folder.indexOf('(')>=0||folder.indexOf("'")>=0
									||folder.indexOf('/')>=0||folder.indexOf('\\')>=0
									||folder.indexOf('&')>=0){
										showMsg('error','Please do not use characters like ./,@<>()*');
							}else{
								$("#contactdiv_66").css("display", "none");
							//alert(folder);
							$.ajax({
								type : "GET",
								url : "${pageContext.request.contextPath}/createFolder",
								data : {
									'folderName' : folder
								},
								contentType : "application/json",
								async : true,
								success : function(data) {
									if(data=="true"){location.href="ajaxTrue";}else{
										var breadcumPath=$('#breadcumPathHome').val();
										//alert(typeof(breadcumPath) == "undefined");
										if(typeof(breadcumPath) == "undefined")
										{	
											breadcumPath="";
										}
										jQuery.post("getFileSystem", {
											'path' : data,
											'breadcumPath':breadcumPath
										}, function(data) {
											if (data == "true") {
												location.href = "index";
											}
											$(".right").html(data);
										});
									}
								}
							});}
							$('#folderName').val("");
							getDocProperties($('#parentfolderName').val());
							myStopFunction(myVar);
						}
					}
				});
			}
		</script>
	</form>
</div>

<div id="contactdiv_getLink">
	<form class="form" action="#" id="contact">
		<h3>Public link</h3>
<label>		<input type="radio" name="publiclinkflag" value="1" />On</label>
<label>		<input type="radio" name="publiclinkflag" value="0"/>Off</label>	
		<input type="text" id="publicLink"  readonly="readonly"  /> 
		<br />
		<div class="clear"></div>
		
		<input type="button" id="cancel" value="Cancel" /> <br />
	</form>
</div>

