
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="edms.wsdl.File"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
        <!---------------/// USER NEW SEND STRAED HERE ------------->
<script type="text/javascript" src="js/user_send.js"></script>
<script type="text/javascript" src="js/group_send.js"></script>
<link href="css/user_send.css" type="text/css" rel="stylesheet"/>
<link href="css/group_send.css" type="text/css" rel="stylesheet"/>
<link rel="stylesheet" href="css/jquery_popup.css" />
<link rel="stylesheet" href="css/new_icon.css" />
<link rel="stylesheet" href="css/new_changes.css" />
<script src="js/new_chnages.js"></script>
<!----------------/// USER NEW SEND END HERE ---------------> 

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
                                           <div class="right_create_folder"><img src="images/create_folder_icon.png" /></div>
                                           <div class="right_upload_folder"><img src="images/upload.png" /></div>
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
                                                          <li>download</li>
                                                          <li>create</li>
                                                          <li>upload</li>
                                                          <li>create</li>
                                                          <li>edit</li>
                                                          <li>share</li>
                                                          <li>delete</li>
                                                       
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
                                                 <li class="share_people share_link"><img src="images/48094.png" /></li>
                                                 <li class="share_link preview_file"><img src="images/eye-24-256.png"/></li>
                                                 <li class="more_delete"><img src="images/delete.png"/></li>
                                                 <li class="new_more_icon_folder"><img src="images/more_icon.png" /></li>
                                              </ul>
                                        
                                                <!------/// MORE NEW OPTION FOR FOLDER -------->
                                                <div class="new_more_file">
                                                       <ul>
                                                          <li>download</li>
                                                          <li>create</li>
                                                          <li>upload</li>
                                                          <li>create</li>
                                                          <li>edit</li>
                                                          <li>share</li>
                                                          <li>delete</li>
                                                       
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
						ondblclick="getFileSystem(this.id)">
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
						id="<%=file.getFilePath()%>" ondblclick="getFileContent(this.id)">

						<!-- <img src="images/ms_excel_big.png" />
										<div class="clear"></div>
										 -->
						<%
							if(file.getFileName().contains(".pdf")){
						%>
						<div class="pdf_icon"></div> <%
 	}else if(file.getFileName().contains(".doc")){
 %>
						<div class="msoffice_icon"></div> <%
 	}else if(file.getFileName().contains(".xls")){
						%>
						<div class="msexcel_icon"></div> <%
 	}else if(file.getFileName().contains(".ppt")){
						%>
						<div class="ppt_icon"></div> <%
 	}else{
 %>
						<div class="pdf_icon"></div> <%
 	}
 %> <span><%=file.getFileName()%>
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
					ondblclick="getFileSystem(this.id)">
					<li>
							<%
							if(file.getFileName().contains(".pdf")){
						%>
						<div class="doc_pdf"></div> <%
 	}else if(file.getFileName().contains(".doc")){
 %>
						<div class="msoffice_icon"></div> <%
 	}else if(file.getFileName().contains(".xls")){
						%>
						<div class="msexcel_icon"></div> <%
 	}else if(file.getFileName().contains(".ppt")){
						%>
						<div class="ppt_icon"></div> <%
 	}else{
 %>
						<div class="pdf_icon"></div> <%
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


	</div>
	<!-------------/// MIDDLE END HERE ---------------->

	<div class="claer"></div>
</div>

<!-----------------//// BOTTOM VIEW STARTED HERE ------------------>

<!-------------------------/// RIGHT PANNEL END ----------------->

<!-- All Popups of header starts here -->
<!---------// NEW SHARES FILE -------------->
<div class="web_dialog_overlay"></div>
<!---------// NEW SHARES FILE -------------->
<div class="share_option">
	<div class="shared_top">
		<img src="images/cancel.png" class="close_user_box">
	</div>
	<!-----------------/// TEST STARED HERE USER AND ROLE -------------->
	<div class="main_div_user">


		<div class="user_top_tap">
			<div class="user_tab active_user">Users</div>
			<div class="roles_tab">Groups</div>
			<!--<div class="close_user_box">x</div>-->

		</div>
		<div class="clear"></div>
		<!-----------/// USER TAB CONTENT ------------>
		<div class="user_tab_content">

			<!------------/// LEFT PART ---------->
			<div class="left_part">
				<!----// NEW ---->
				<div class="new_1">sanjay@avi-oil.com</div>
				<!----/// NEW ---->
				<!----// NEW ---->
				<div class="new_1">santosh@avi-oil.com</div>
				<!----/// NEW ---->
				<!----// NEW ---->
				<div class="new_1">janak@avi-oil.com</div>
				<!----/// NEW ---->

			</div>
			<!---------// LEFT PART END ------------>
			<!------------/// MID PART ------------->
			<div class="mid_part">

				<div class="go_here">
					<img src="images/right_arrow_user.png" />
				</div>
				<div class="clear"></div>
				<div class="come_here">
					<img src="images/left_arrow.png" />
				</div>


			</div>
			<!------------/// MID PART END HERE ------->
			<!------------/// LEFT PART ---------->
			<div class="right_part">
				<table class="user_table">
					<tbody>
						<tr class="user_heading_1">
							<td class="user_table_heading">User</td>
							<td>Read</td>
							<td>Write</td>
							<td>Delete</td>
							<td>Security</td>
						</tr>
					</tbody>
				</table>
				<table class="right_part_1">
					<%
						List<String>   users=currentFolder.getUserRead();
					                                                   String[] user=users.toString().split(",");
					                                                       for(String str:user){
					                                                    	   str=str.replace("]", "");
					                                                    	   str=str.replace("[", "");
					                                                    	   System.out.println(str+(str.equals(",")||str.equals("")||str.equals(" ")||str.equals("]")||str.equals("[")));
					                                                    	   if((str.equals(",")||str.equals("")||str.equals(" ")||str.equals("]")||str.equals("["))){}else{
					%>
					<tr class="right_text">
						<td class="go_text"><%=str%></td>
						<td><input type="checkbox"
							onclick="assignPermissions(this.value)" name="userpermission"
							value="<%=str%>,ur"
							id="<%=str.replace("@", "")
														.replace(".", "")%>ur"
							checked="checked" /></td>
						<td>
							<%
								if(currentFolder.getUserWrite().toString().contains(str)){
							%> <input
							type="checkbox" onclick="assignPermissions(this.value)"
							name="userpermission" value="<%=str%>,uw"
							id="<%=str.replace("@", "")
														.replace(".", "")%>uw"
							checked="checked" /> <%
 	}else{
 %> <input type="checkbox"
							onclick="assignPermissions(this.value)" name="userpermission"
							value="<%=str%>,uw"
							id="<%=str.replace("@", "")
														.replace(".", "")%>uw" />
							<%
								}
							%>
						</td>
						<td>
							<%
								if(currentFolder.getUserDelete().toString().contains(str)){
							%> <input
							type="checkbox" onclick="assignPermissions(this.value)"
							name="userpermission" value="<%=str%>,ud"
							id="<%=str.replace("@", "")
														.replace(".", "")%>ud"
							checked="checked" /> <%
 	}else{
 %> <input type="checkbox"
							onclick="assignPermissions(this.value)" name="userpermission"
							value="<%=str%>,ud"
							id="<%=str.replace("@", "")
														.replace(".", "")%>ud" />
							<%
								}
							%>
						</td>
						<td>
							<%
								if(currentFolder.getUserSecurity().toString().contains(str)){
							%>
							<input type="checkbox" onclick="assignPermissions(this.value)"
							name="userpermission" value="<%=str%>,us"
							id="<%=str.replace("@", "")
														.replace(".", "")%>us"
							checked="checked" /> <%
 	}else{
 %> <input type="checkbox"
							onclick="assignPermissions(this.value)" name="userpermission"
							value="<%=str%>,us"
							id="<%=str.replace("@", "")
														.replace(".", "")%>us" />
							<%
								}
							%>

						</td>
					</tr>
					<%
						}}
					%>

				</table>

				<div class="clear"></div>
			</div>
			<!---------// LEFT PART END ------------>
		</div>
		<!-----------/// USER TAB CONTENT END ------------>
		<!-----------/// ROLE TAB CONTENT ------------>
		<div class="role_tab_content">

			<!------------/// LEFT PART ---------->
			<div class="left_part1">
				<!----// NEW ---->
				<div class="new_11">Finanace</div>
				<!----/// NEW ---->
				<!----// NEW ---->
				<div class="new_11">Accounts</div>
				<!----/// NEW ---->
				<!----// NEW ---->
				<div class="new_11">HR</div>
				<!----/// NEW ---->

				<div class="clear"></div>

			</div>
			<!---------// LEFT PART END ------------>
			<!------------/// MID PART ------------->
			<div class="mid_part">

				<div class="go_here1">
					<img src="images/right_arrow_user.png" />
				</div>
				<div class="clear"></div>
				<div class="come_here1">
					<img src="images/left_arrow.png" />
				</div>


			</div>
			<!------------/// MID PART END HERE ------->
			<!------------/// LEFT PART ---------->
			<div class="right_part1">
				<table class="user_table1">
					<tbody>
						<tr class="user_heading_11">
							<td>User</td>
							<td>Read</td>
							<td>Write</td>
							<td>Delete</td>
							<td>Security</td>
						</tr>
					</tbody>
				</table>
				<table class="right_part_11">
				</table>

				<div class="clear"></div>
			</div>
			<!---------// LEFT PART END ------------>
		</div>
		<!-----------/// ROLE TAB CONTENT END ------------>


		<div class="clear"></div>


	</div>
	<!----------------/// TEST END HERE ------------------------------>

</div>
<!--------// NEW SHARES END HERE ------------>
<!--------// NEW SHARES END HERE ------------>

<!---------------//// ADD GROUP USER POP UP ----------->
<div id="contactdiv_66">
	<form class="form" action="#" id="contact">
		<h3>Create Folder</h3>
		<p>
			Please enter a new Folder name <span>*</span>
		</p>
		<input type="text" id="folderName" /> <input type="hidden"
			id="parentfolderName" value='<%=currentFolder.getFolderPath()%>' />
		<br />
		<div class="clear"></div>
		<input type="button" value="Create" onclick="createFolder()" /> <input
			type="button" id="cancel" value="Cancel" /> <br />
		<script type="text/javascript">
			function createFolder() {
				var folder = $('#folderName').val();
				//alert(folder);
				$.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/createFolder",
					data : {
						'folderName' : folder
					},
					contentType : "application/json",
					async : false,
					success : function(data) {
						$("#folderThumbView>ul").append(data);
						// alert(data);
					}

				});
				$("#contactdiv_66").css("display", "none");
				getDocProperties($('#parentfolderName').val());
			}
		</script>
	</form>
</div>
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
				});
				$("#contactdiv_666").css("display", "none");
				getDocProperties($('#parentfolderName').val());
			}
		</script>
	</form>
</div>
<!-----------------/// ADD GROUP POP UP  END HERE ---------->

<script type="text/javascript">
	/*    $(document).ready(function() {
	   $('input[name="userpermission"]').click(function(event) { */
	function assignPermissions(values) {
		var vale = values;
		var valu = vale.split(",");
		var user = "";
		vale = valu[1];
		var checking = values.replace("@", "").replace(".", "")
				.replace(",", "");
		// alert(checking);
		//alert(document.getElementById(checking).checked);
		if (document.getElementById(checking).checked) {
			user = valu[0];
			value = valu[1];
		} else {
			user = valu[0];
			value = "n" + valu[1];
		}
		if (value == "nur") {
			checking = checking.substring('0', checking.length - 2) + "uw";
			//alert(checking);
			document.getElementById(checking).checked = false;
			checking = checking.substring('0', checking.length - 2) + "ud";
			document.getElementById(checking).checked = false;
			checking = checking.substring('0', checking.length - 2) + "us";
			document.getElementById(checking).checked = false;
		}

		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/assignSinglePermission",
			data : {
				'user' : user,
				'value' : value,
			},
			contentType : "application/json",
			async : false,
			success : function(data) {
				//$("#folderView>.row_content>ul").append(data);
				alert(data);
			}

		});

	}
	//  });
</script>

<!-------------/// RIGHT CLICK JS STRTED HERE --------------->
<script type="text/javascript">
	$().ready(function() {

		var option = {
			width : 150,
			items : [ {
				text : "Open",
				icon : "images/right_click/create_folder_new.png",
				alias : "1-6",
				action : menuAction
			},
			/* , type: "group", width: 180, items: [
			    { text: "Folder", icon: "images/right_click/folder.png", alias: "4-1", action: menuAction },
			    { text: "Documents", icon: "images/right_click/document_new.png", alias: "4-2", action: menuAction },] */
			{
				text : "Rename",
				icon : "images/right_click/rename.png",
				alias : "1-2",
				action : menuAction
			}, {
				text : "Share",
				icon : "images/right_click/share.png",
				alias : "1-3",
				action : menuAction
			}, {
				text : "Delete",
				icon : "images/right_click/Delete_Icon.png",
				alias : "1-3",
				action : menuAction
			},
			// { type: "splitLine" },
			// { text: "Group One", icon: "sample-css/wi0009-16.gif", alias: "1-4", type: "group", width: 170, items: [
			//  { text: "Group Three", icon: "sample-css/wi0054-16.gif", alias: "2-2", type: "group", width: 190, items: [
			//   { text: "Group3 Item One", icon: "sample-css/wi0062-16.gif", alias: "3-1", action: menuAction },
			//   { text: "Group3 Item Tow", icon: "sample-css/wi0063-16.gif", alias: "3-2", action: menuAction }
			//  ]
			//   },
			//   { text: "Group Two Item1", icon: "sample-css/wi0096-16.gif", alias: "2-1", action: menuAction },
			//   { text: "Group Two Item1", icon: "sample-css/wi0111-16.gif", alias: "2-3", action: menuAction },
			//   { text: "Group Two Item1", icon: "sample-css/wi0122-16.gif", alias: "2-4", action: menuAction }
			//  ]
			//   },
			//   { type: "splitLine" },
			//   { text: "Item Four", icon: "sample-css/wi0124-16.gif", alias: "1-5", action: menuAction },
			//   { text: "Group Three", icon: "sample-css/wi0062-16.gif", alias: "1-6", type: "group", width: 180, items: [
			//  { text: "Item One", icon: "sample-css/wi0096-16.gif", alias: "4-1", action: menuAction },
			//   { text: "Item Two", icon: "sample-css/wi0122-16.gif", alias: "4-2", action: menuAction }
			// ]
			//  }
			],
			onShow : applyrule,
			onContextMenu : BeforeContextMenu
		};
		function menuAction() {
			alert($(this).text());
			if (this.data.alias == "1-6") {

				alert($(this).text());
				getFileSystem(folderPath);
			}

		}
		function applyrule(menu) {
			alert(menu);
			alert($(this).text());
			// NEW TEST STRED 
			$('li.new_select_box').removeClass('new_select_box');
			//$('.select_box').find('.select_box').alert('By')
			$(this).addClass('new_select_box');

			// NEW TEST END              
			if (this.id == "target2") {
				menu.applyrule({
					name : "target2",
					disable : true,
					items : [ "1-2", "2-3", "2-4", "1-6" ]
				});
			} else {
				menu.applyrule({
					name : "all",
					disable : true,
					items : []
				});
			}
		}
		function BeforeContextMenu() {
			return this.id != "target3";

		}
		$("#target,#target2,#target3").contextmenu(option);
	});
</script>
<script type="text/javascript">
	function getDocProperties(folderPath) {
		$('#oldFolderName').val(folderPath);

		jQuery.post("setCurrentFolder", {
			'path' : folderPath
		}, function(data) {
		});
		//	alert(folderPath);
		/* 	$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/getFileSystem",
				data : {
					'path' : folderPath
				},
				contentType : "application/json",
				async : false,
				success : function(data) {
					$("#fileSystem").html(data);
				}
			}); */

		/*  jQuery.get("myDocument", function( data ) {
			 $( "#variedPagesHere" ).html( data );
			});  */
		jQuery.get("getDocProperties", {
			'path' : folderPath
		}, function(data) {
			$(".right_icon_main").html(data);
		});
	}
</script>

<script type="text/javascript">
	function getFileProperties(folderPath) {
		$('#oldFolderName').val(folderPath);

		jQuery.post("setCurrentFile", {
			'path' : folderPath
		}, function(data) {
		});
		//	alert(folderPath);
		/* 	$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/getFileSystem",
				data : {
					'path' : folderPath
				},
				contentType : "application/json",
				async : false,
				success : function(data) {
					$("#fileSystem").html(data);
				}
			}); */

		/*  jQuery.get("myDocument", function( data ) {
			 $( "#variedPagesHere" ).html( data );
			});  */
		jQuery.get("getFileProperties", {
			'path' : folderPath
		}, function(data) {
			$(".right_icon_main").html(data);
		});
	}
</script>
<!--------------/// RIGHT CLICK JS STRED END HERE ---------------->
<!---------------//// ADD GROUP USER POP UP ----------->
<div id="contactdiv_6">

	<form:form id="contact" class="form" method="post"
		action="uploadDocumentByJcr" commandName="fileupload"
		enctype="multipart/form-data">
		<h3>Add New Documents</h3>
		<p>
			File Name: <span>*</span>
		</p>
		<input class="custom-file-input attachment_file"  name="file2" id="file2" multiple type="file"
			 />
		<%-- <form:hidden path="filename" value="sdff"/>
<form:hidden path="filedetails" value="sdf"/> --%>
		<input type="button" value="Upload" class="upload"  onclick="uploadFormData()"/>
		<input type="button" value="Cancel" class="cancle" />
	</form:form>


	<script type="text/javascript">
		function uploadFormData() {
			var oMyForm = new FormData();
			for (var i = 0; i < file2.files.length; i++) {
				oMyForm.append("file" + i, file2.files[i]);
			}
			$.ajax({
				url : '${pageContext.request.contextPath}/uploadDocumentByJcr',
				data : oMyForm,
				dataType : 'text',
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data) {
					var alt=data.substring(data.lastIndexOf(",")+1);
					data=data.substring(0,data.lastIndexOf(","));
					$("#fileThumbView>ul").append(data);
					alert(alt);
				}
			});
	$("#contactdiv_6").css("display", "none");
		}

	</script>


</div>

<!---------------//// Delete USER POP UP ----------->
<div id="contactdiv_77">
	<form class="form" action="#" id="contact">
		<h3>Confirmation</h3>
		<p class="form_bottom_space">Do you really want to delete this
			folder ?</p>
		<div class="clear"></div>
		<input type="button" id="deleteDoc" value="Delete" /> <input type="button"
			id="cancel" value="Cancel" />
	</form>
	    <script type="text/javascript">
                      $(document).ready(function() {
                    	  var folderPath="";
                      $('#deleteDoc').click(function(event) {
                    	  $.ajax({
          					type : "GET",
          					url : "${pageContext.request.contextPath}/recycleDoc",
          					contentType : "application/json",
          					async : false,
          					success : function(data) {
          						
          						//$("#folderView>.row_content>ul").append(data);
          						 folderPath=data;
          					//alert(folderPath);
          					$("#contactdiv_77").css("display", "none");
                        	jQuery.get("getFileSystem", 
                   				 	{
                   					'path' : folderPath
                   					},
                   				function( data ) {
                   	         		$( ".right" ).html( data );
                   	        		});
          					}
          				}); 
                      });
                      
                  
                      });
                  	
       </script>
</div>
<!-----------------/// DELETE POP UP  END HERE ---------->

