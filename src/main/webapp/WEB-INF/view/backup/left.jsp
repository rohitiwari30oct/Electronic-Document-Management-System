<%-- <%@page import="edms.webservice.client.FolderClient"%>
<%@page import="edms.wsdl.Folder"%>
<%@page import="java.util.List"%>
<%@page import="edms.wsdl.GetFolderResponse"%>
<%@page import="edms.wsdl.HasChildResponse"%>
<%@page import="edms.core.Config"%>
<script type="text/javascript">
	function getSubFolders(folderPath) {
		var divFolder = folderPath.substring(6);
		var divContent = $("#listdiv" + divFolder).html();
		alert(divContent);
		if (divContent.length > 6) {
		} else {
			var folderId = "#" + folderPath;
			$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/getSubFolders",
				data : {
					'path' : folderPath
				},
				contentType : "application/json",
				async : false,
				success : function(data) {
					$("#listdiv" + divFolder).html(data);
				}
			});
		}
	}
</script>
<div class="left-pane document_page_left_height new_cheat">
	<div class="left_heading">
		<h1>Document Library</h1>
	</div>
	<div class="left_sub_menu">
		<ul>
			<li class="file_system tab_header" onClick="tab_left()"><a
				href="index_testing.htm">MY DOCUMENT</a>
				<div class="icon"></div></li>
			<div class="content_left">
				<ul>
					<%
						FolderClient folderClient = (FolderClient) request
								.getAttribute("folderClient");

						List<Folder> folderList = (List<Folder>) request.getAttribute("folderList");
						for (Folder folder : folderList) {
							HasChildResponse hasChild = folderClient.hasChild(folder
									.getFolderPath());

							//if(!folder.getFolderName().equals(Config.JCR_SYSTEM)&&(!folder.getFolderProperty(JcrConstants.JCR_PRIMARYTYPE).getString().equals(JcrConstants.NT_RESOURCE))){
							/*  		if(folder.getFolderPrimaryNodeType().getName().equals(JcrConstants.NT_FOLDER)){ */
					%>
					<%
						if (hasChild.isHasChild()) {
					%>
					<li
						id="listli<%=folder.getFolderPath().replace('/', '_')
							.replace(' ', '*')%>"
						onclick="getSubFolders(this.id)">
						<div class="subfolder_sign"></div>
						<div class="folder"></div> <span id="<%=folder.getFolderPath()%>"
						onclick="getFileSystem(this.id)"><%=folder.getFolderPath().substring(
							folder.getFolderPath().lastIndexOf('/') + 1)%></span>
						<div class='subfolder_onhover mydocument_subfolder'>
							<ul
								id="listdiv<%=folder.getFolderPath().replace('/', '_')
							.replace(' ', '*')%>">
							</ul>
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
			</div>


			<div class="content_left"></div>
			<li class="create_view tab_header document_library"><a
				href="shared.htm">SHARED</a></li>
			<li class="recent_open tab_header document_library"><a
				href="recently.htm">RECENTLY ACCESSED</a> <!------- <div class="icon"></div>-------->
			</li>
			<div class="content_left"></div>
			<li class="my_doc tab_header document_library"><a
				href="trash.htm">TRASH</a> <!--- <div class="icon"></div>---></li>
			<div class="content_left"></div>
		</ul>
	</div>
	<!------------/// Chat Stared Here ------------------>

	<div class="chat_box">
		<!-----------//// CHAT DOWN AROW -------->
		<div class="all_chat_option">
			<div class="chat_search_11">

				<!-----//// Chat Search Content ----->
				<div class="chat_downarrow">
					<!--------------//// Chat Down Main Page ------------->
					<div class="chat_down_main">
						<div class="chat_down_top">
							<div class="chat_down_left">
								<img src="images/photo.jpg" />
							</div>
							<div class="chat_down_right">
								Hariom Srivastava <span>hari@silvereye.co</span>
							</div>
							<div class="clear"></div>
						</div>
						<div class="clear"></div>
						<ul>
							<li class="chat_status_menu"><a href="#">Chat Status </a></li>
							<li class="invites_menu"><a href="#">Invites</a></li>
							<li class="blocked_menu"><a href="#">Blocked People </a></li>
							<li class="share_your_menu"><a href="#"> Share your
									status </a></li>
						</ul>
						<div class="clear"></div>
						<div class="chat_out">Sign out of Chat</div>
					</div>
					<!------------------/// Chat Down Menu End ------------->

				</div>
				<!--------/// Chat Search End -------->
				<!------------/// Chat Sub menu ----------->
				<div class="chat_down_submenu">
					<!-------------// Chat Status box Stared here----------->
					<div class="chat_status">
						<!--------///Chat Haeding ---->
						<div class="chat_subheading">
							<div class="chat_main_menu">
								<img src="images/portlet-remove-icon.png" />
							</div>
							<p>Chat Status</p>
							<div class="clear"></div>
						</div>
						<!-----------/// Chat Heading End Here ----->
						<!----------/// Chat Status Content ------->
						<div class="chat_status_content">

							<ul>
								<li><input type="radio" /><span>Online</span>
									<div class="online"></div></li>
								<li><input type="radio" /><span>Offline</span>
									<div class="offline"></div></li>
								<li><input type="radio" /><span>Busy</span>
									<div class="busy"></div></li>
								<li><input type="radio" /><span>Away</span>
									<div class="away"></div></li>
							</ul>


						</div>
						<!-----------/// Chat Status  End Here ----->
					</div>
					<!-------------/// Chat Status Box End Here--------->
					<!-------------// Invites box Stared here----------->
					<div class="Blocked_status">
						<!--------///Chat Haeding ---->
						<div class="chat_subheading">
							<div class="chat_main_menu">
								<img src="images/portlet-remove-icon.png" />
							</div>
							<p>Invites</p>
							<div class="clear"></div>
						</div>
						<!-----------/// Chat Heading End Here ----->
						<!----------/// Chat Status Content ------->
						<div class="chat_status_content">
							<!----------/// Main ROW Content ---------->
							<div class="chat_row_content">
								<!-----------/// INVITE ROW FIRST STARED HERE ---------->
								<div class="invite_row">
									<!---------------/// INVITE LEFT PART -------->
									<div class="invite_left">Rohit Tiwari</div>
									<!--------------/// INVITE LEFT END HERE -------->
									<!---------------/// INVITE RIGHT PART -------->
									<div class="invite_right">
										<a href="#">Unblock</a>
									</div>
									<!--------------/// INVITE RIGHT END HERE -------->
									<div class="clear"></div>
								</div>
								<!-------------/// INVITE Row END HERE -------------->
								<!-----------/// INVITE ROW FIRST STARED HERE ---------->
								<div class="invite_row">
									<!---------------/// INVITE LEFT PART -------->
									<div class="invite_left">Rohit Tiwari</div>
									<!--------------/// INVITE LEFT END HERE -------->
									<!---------------/// INVITE RIGHT PART -------->
									<div class="invite_right">
										<a href="#">Unblock</a>
									</div>
									<!--------------/// INVITE RIGHT END HERE -------->
									<div class="clear"></div>
								</div>
								<!-------------/// INVITE Row END HERE -------------->
								<!-----------/// INVITE ROW FIRST STARED HERE ---------->
								<div class="invite_row">
									<!---------------/// INVITE LEFT PART -------->
									<div class="invite_left">Rohit Tiwari</div>
									<!--------------/// INVITE LEFT END HERE -------->
									<!---------------/// INVITE RIGHT PART -------->
									<div class="invite_right">
										<a href="#">Unblock</a>
									</div>
									<!--------------/// INVITE RIGHT END HERE -------->
									<div class="clear"></div>
								</div>
								<!-------------/// INVITE Row END HERE -------------->
								<!-----------/// INVITE ROW FIRST STARED HERE ---------->
								<div class="invite_row">
									<!---------------/// INVITE LEFT PART -------->
									<div class="invite_left">Rohit Tiwari</div>
									<!--------------/// INVITE LEFT END HERE -------->
									<!---------------/// INVITE RIGHT PART -------->
									<div class="invite_right">
										<a href="#">Unblock</a>
									</div>
									<!--------------/// INVITE RIGHT END HERE -------->
									<div class="clear"></div>
								</div>
								<!-------------/// INVITE Row END HERE -------------->
							</div>
							<!----------/// Main Row Content End Here ---------->
							<div class="clear"></div>
						</div>
						<!-----------/// Chat Status  End Here ----->
						<div class="clear"></div>
					</div>
					<!-------------/// Invites Box End Here--------->
					<!-------------// Blocked People  box Stared here----------->
					<div class="Invites_status">
						<!--------///Chat Haeding ---->
						<div class="chat_subheading">
							<div class="chat_main_menu">
								<img src="images/portlet-remove-icon.png" />
							</div>
							<p>Blocked People</p>
							<div class="clear"></div>
						</div>
						<!-----------/// Chat Heading End Here ----->
						<!----------/// Chat Status Content ------->
						<div class="chat_status_content">
							<!----------/// Main ROW Content ---------->
							<div class="chat_row_content">
								<!-----------/// INVITE ROW FIRST STARED HERE ---------->
								<div class="invite_row">
									<!---------------/// INVITE LEFT PART -------->
									<div class="invite_left">Rohit Tiwari</div>
									<!--------------/// INVITE LEFT END HERE -------->
									<!---------------/// INVITE RIGHT PART -------->
									<div class="invite_right">
										<a href="#">Unblock</a>
									</div>
									<!--------------/// INVITE RIGHT END HERE -------->
									<div class="clear"></div>
								</div>
								<!-------------/// INVITE Row END HERE -------------->
								<!-----------/// INVITE ROW FIRST STARED HERE ---------->
								<div class="invite_row">
									<!---------------/// INVITE LEFT PART -------->
									<div class="invite_left">Rohit Tiwari</div>
									<!--------------/// INVITE LEFT END HERE -------->
									<!---------------/// INVITE RIGHT PART -------->
									<div class="invite_right">
										<a href="#">Unblock</a>
									</div>
									<!--------------/// INVITE RIGHT END HERE -------->
									<div class="clear"></div>
								</div>
								<!-------------/// INVITE Row END HERE -------------->
								<!-----------/// INVITE ROW FIRST STARED HERE ---------->
								<div class="invite_row">
									<!---------------/// INVITE LEFT PART -------->
									<div class="invite_left">Rohit Tiwari</div>
									<!--------------/// INVITE LEFT END HERE -------->
									<!---------------/// INVITE RIGHT PART -------->
									<div class="invite_right">
										<a href="#">Unblock</a>
									</div>
									<!--------------/// INVITE RIGHT END HERE -------->
									<div class="clear"></div>
								</div>
								<!-------------/// INVITE Row END HERE -------------->
								<!-----------/// INVITE ROW FIRST STARED HERE ---------->
								<div class="invite_row">
									<!---------------/// INVITE LEFT PART -------->

									<div class="invite_left">Rohit Tiwari</div>
									<!--------------/// INVITE LEFT END HERE -------->
									<!---------------/// INVITE RIGHT PART -------->
									<div class="invite_right">
										<a href="#">Unblock</a>
									</div>
									<!--------------/// INVITE RIGHT END HERE -------->
									<div class="clear"></div>
								</div>
								<!-------------/// INVITE Row END HERE -------------->
							</div>
							<!----------/// Main Row Content End Here ---------->
						</div>
						<!-----------/// Chat Status  End Here ----->
					</div>
					<!-------------/// Blocked People  Box End Here--------->
					<!-------------// Blocked People  box Stared here----------->
					<div class="Share_status">
						<!--------///Chat Haeding ---->
						<div class="chat_subheading">
							<div class="chat_main_menu">
								<img src="images/portlet-remove-icon.png" />
							</div>
							<p>Share your status</p>
							<div class="clear"></div>
						</div>
						<!-----------/// Chat Heading End Here ----->
						<!----------/// Chat Status Content ------->
						<div class="chat_status_content">


							<!----------/// Chat --------->
							<!----------/// Main ROW Content ---------->
							<div class="chat_row_content">
								<!-----------/// INVITE ROW FIRST STARED HERE ---------->
								<div class="invite_row">
									<!---------------/// INVITE LEFT PART -------->
									<div class="invite_left">Rohit Tiwari</div>
									<!--------------/// INVITE LEFT END HERE -------->
									<!---------------/// INVITE RIGHT PART -------->
									<div class="invite_right">
										<a href="#">Unblock</a>
									</div>
									<!--------------/// INVITE RIGHT END HERE -------->
									<div class="clear"></div>
								</div>
								<!-------------/// INVITE Row END HERE -------------->
								<!-----------/// INVITE ROW FIRST STARED HERE ---------->
								<div class="invite_row">
									<!---------------/// INVITE LEFT PART -------->
									<div class="invite_left">Rohit Tiwari</div>
									<!--------------/// INVITE LEFT END HERE -------->
									<!---------------/// INVITE RIGHT PART -------->
									<div class="invite_right">
										<a href="#">Unblock</a>
									</div>
									<!--------------/// INVITE RIGHT END HERE -------->
									<div class="clear"></div>
								</div>
								<!-------------/// INVITE Row END HERE -------------->
								<!-----------/// INVITE ROW FIRST STARED HERE ---------->
								<div class="invite_row">
									<!---------------/// INVITE LEFT PART -------->
									<div class="invite_left">Rohit Tiwari</div>
									<!--------------/// INVITE LEFT END HERE -------->
									<!---------------/// INVITE RIGHT PART -------->
									<div class="invite_right">
										<a href="#">Unblock</a>
									</div>
									<!--------------/// INVITE RIGHT END HERE -------->
									<div class="clear"></div>
								</div>
								<!-------------/// INVITE Row END HERE -------------->
								<!-----------/// INVITE ROW FIRST STARED HERE ---------->
								<div class="invite_row">
									<!---------------/// INVITE LEFT PART -------->
									<div class="invite_left">Rohit Tiwari</div>

									<!--------------/// INVITE LEFT END HERE -------->
									<!---------------/// INVITE RIGHT PART -------->
									<div class="invite_right">
										<a href="#">Unblock</a>
									</div>
									<!--------------/// INVITE RIGHT END HERE -------->
									<div class="clear"></div>
								</div>
								<!-------------/// INVITE Row END HERE -------------->
							</div>
							<!----------/// Main Row Content End Here ---------->
							<!----------/// Chat End -------->

						</div>
						<!-----------/// Chat Status  End Here ----->
					</div>
					<!-------------/// Blocked People  Box End Here--------->
				</div>
				<!---------------//// Chat Down Sub Menu ---------->

			</div>
			<!-------------//// CHAT SEARCH OPTION ------->

			<div class="chat_search">
				<div class="heading_caht">
					<input type="text" placeholder="Search for people" />
				</div>
				<!-----//// Chat Search Content ----->
				<div class="chat_search_content">

					<!------------//// FIRST ROW --------->
					<div class="cheat_row_11">
						<div class="small_images">
							<img src="images/blank_man.jpg">
						</div>
						<div class="contact_information">
							<p>
								<strong>Jonathan Smith</strong><br> Work for fun
							</p>
						</div>
						<div class="online_file">
							<img src="images/online_file.png">
						</div>
					</div>
					<!-----------/// FIRST ROW -------------->
					<!------------//// FIRST ROW --------->
					<div class="cheat_row_11">
						<div class="small_images">
							<img src="images/blank_man.jpg">
						</div>
						<div class="contact_information">
							<p>
								<strong>Jonathan Smith</strong><br> Work for fun
							</p>
						</div>
						<div class="online_file">
							<img src="images/online_file.png">
						</div>
					</div>
					<!-----------/// FIRST ROW -------------->
					<!------------//// FIRST ROW --------->
					<div class="cheat_row_11">
						<div class="small_images">
							<img src="images/blank_man.jpg">
						</div>
						<div class="contact_information">
							<p>
								<strong>Jonathan Smith</strong><br> Work for fun
							</p>
						</div>
						<div class="online_file">
							<img src="images/online_file.png">
						</div>
					</div>
					<!-----------/// FIRST ROW -------------->
					<!------------//// FIRST ROW --------->
					<div class="cheat_row_11">
						<div class="small_images">
							<img src="images/blank_man.jpg">
						</div>
						<div class="contact_information">
							<p>
								<strong>Jonathan Smith</strong><br> Work for fun
							</p>
						</div>
						<div class="online_file">
							<img src="images/online_file.png">
						</div>
					</div>
					<!-----------/// FIRST ROW -------------->
					<!------------//// FIRST ROW --------->
					<div class="cheat_row_11">
						<div class="small_images">
							<img src="images/blank_man.jpg">
						</div>
						<div class="contact_information">
							<p>
								<strong>Jonathan Smith</strong><br> Work for fun
							</p>
						</div>
						<div class="online_file">
							<img src="images/online_file.png">
						</div>
					</div>
					<!-----------/// FIRST ROW -------------->
					<!------------//// FIRST ROW --------->
					<div class="cheat_row_11">
						<div class="small_images">
							<img src="images/blank_man.jpg">
						</div>
						<div class="contact_information">
							<p>
								<strong>Jonathan Smith</strong><br> Work for fun
							</p>
						</div>
						<div class="online_file">
							<img src="images/online_file.png">
						</div>
					</div>
					<!-----------/// FIRST ROW -------------->
					<!------------//// FIRST ROW --------->
					<div class="cheat_row_11">
						<div class="small_images">
							<img src="images/blank_man.jpg">
						</div>
						<div class="contact_information">
							<p>
								<strong>Jonathan Smith</strong><br> Work for fun
							</p>
						</div>
						<div class="online_file">
							<img src="images/online_file.png">
						</div>
					</div>
					<!-----------/// FIRST ROW -------------->
					<!------------//// FIRST ROW --------->
					<div class="cheat_row_11">
						<div class="small_images">
							<img src="images/blank_man.jpg">
						</div>
						<div class="contact_information">
							<p>
								<strong>Jonathan Smith</strong><br> Work for fun
							</p>
						</div>
						<div class="online_file">
							<img src="images/online_file.png">
						</div>
					</div>
					<!-----------/// FIRST ROW -------------->
					<!------------//// FIRST ROW --------->
					<div class="cheat_row_11">
						<div class="small_images">
							<img src="images/blank_man.jpg">
						</div>
						<div class="contact_information">
							<p>
								<strong>Jonathan Smith</strong><br> Work for fun
							</p>
						</div>
						<div class="online_file">
							<img src="images/online_file.png">
						</div>
					</div>
					<!-----------/// FIRST ROW -------------->
					<!------------//// FIRST ROW --------->
					<div class="cheat_row_11">
						<div class="small_images">
							<img src="images/blank_man.jpg">
						</div>
						<div class="contact_information">
							<p>
								<strong>Jonathan Smith</strong><br> Work for fun
							</p>
						</div>
						<div class="online_file">
							<img src="images/online_file.png">
						</div>
					</div>
					<!-----------/// FIRST ROW -------------->
					<!------------//// FIRST ROW --------->
					<div class="cheat_row_11">
						<div class="small_images">
							<img src="images/blank_man.jpg">
						</div>
						<div class="contact_information">
							<p>
								<strong>Jonathan Smith</strong><br> Work for fun
							</p>
						</div>
						<div class="online_file">
							<img src="images/online_file.png">
						</div>
					</div>
					<!-----------/// FIRST ROW -------------->
					<!------------//// FIRST ROW --------->
					<div class="cheat_row_11">
						<div class="small_images">
							<img src="images/blank_man.jpg">
						</div>
						<div class="contact_information">
							<p>
								<strong>Jonathan Smith</strong><br> Work for fun
							</p>
						</div>
						<div class="online_file">
							<img src="images/online_file.png">
						</div>
					</div>
					<!-----------/// FIRST ROW -------------->
					<!------------//// FIRST ROW --------->
					<div class="cheat_row_11">
						<div class="small_images">
							<img src="images/blank_man.jpg">
						</div>
						<div class="contact_information">
							<p>
								<strong>Jonathan Smith</strong><br> Work for fun
							</p>
						</div>
						<div class="online_file">
							<img src="images/online_file.png">
						</div>
					</div>
					<!-----------/// FIRST ROW -------------->
					<!------------//// FIRST ROW --------->
					<div class="cheat_row_11">
						<div class="small_images">
							<img src="images/blank_man.jpg">
						</div>
						<div class="contact_information">
							<p>
								<strong>Jonathan Smith</strong><br> Work for fun
							</p>
						</div>
						<div class="online_file">
							<img src="images/online_file.png">
						</div>
					</div>
					<!-----------/// FIRST ROW -------------->
					<!------------//// FIRST ROW --------->
					<div class="cheat_row_11">
						<div class="small_images">
							<img src="images/blank_man.jpg">
						</div>
						<div class="contact_information">
							<p>
								<strong>Jonathan Smith</strong><br> Work for fun
							</p>
						</div>
						<div class="online_file">
							<img src="images/online_file.png">
						</div>
					</div>
					<!-----------/// FIRST ROW -------------->
					<!------------//// FIRST ROW --------->
					<div class="cheat_row_11">
						<div class="small_images">
							<img src="images/blank_man.jpg">
						</div>
						<div class="contact_information">
							<p>
								<strong>Jonathan Smith</strong><br> Work for fun
							</p>
						</div>
						<div class="online_file">
							<img src="images/online_file.png">
						</div>
					</div>
					<!-----------/// FIRST ROW -------------->
					<!------------//// FIRST ROW --------->
					<div class="cheat_row_11">
						<div class="small_images">
							<img src="images/blank_man.jpg">
						</div>
						<div class="contact_information">
							<p>
								<strong>Jonathan Smith</strong><br> Work for fun
							</p>
						</div>
						<div class="online_file">
							<img src="images/online_file.png">
						</div>
					</div>
					<!-----------/// FIRST ROW -------------->
					<!------------//// FIRST ROW --------->
					<div class="cheat_row_11">
						<div class="small_images">
							<img src="images/blank_man.jpg">
						</div>
						<div class="contact_information">
							<p>
								<strong>Jonathan Smith</strong><br> Work for fun
							</p>
						</div>
						<div class="online_file">
							<img src="images/online_file.png">
						</div>
					</div>
					<!-----------/// FIRST ROW -------------->

				</div>
				<!--------/// Chat Search End -------->

			</div>

			<!-------------/// CHAT SEARCH OPTION END -------->
			<!-----------/// ALL INFO BOX STARTED HERE ------->
			<!-------------/// Chat Info Box Stared here -------->
			<div class="chat_info">
				<div class="chat_info_left">
					<p class="name_1">Hariom Srivastava</p>
					<span>hari@silvereye.co</span>
					<p class="com">Opportunities don't happen,you create them..</p>
				</div>
				<div class="chat_info_right">
					<img src="images/photo_1.jpg" />

				</div>
				<div class="clear"></div>
				<div class="bottom_option">
					<!-------/// Bottom _Left_part--->
					<div class="left_bottom">
						<ul>
							<li><a href="#">Contact info</a></li>
							<li><a href="#">Emails</a></li>
						</ul>
					</div>
					<!----------/// Bottom Left Part End --->
					<!--------/// Bottom Right part Stared Here ------>
					<div class="right_bottom">
						<ul>
							<li class="chat_mail"><a href="#"></a></li>
							<li class="contact_mail"><a href="#"></a></li>
							<li><a href="#"></a></li>

						</ul>

					</div>
					<!---------------/// Bottom  Right Part End Here -------->

				</div>

			</div>
			<!------------//// Chat Info Box End Here ----------->

			<!-----------------//// Chat Search option Here --------->
			<div class="chat_info_1">
				<div class="chat_info_left">
					<p class="name_1">Hariom Srivastava</p>
					<span>hari@silvereye.co</span>
					<p class="com">Opportunities don't happen,you create them..</p>
				</div>
				<div class="chat_info_right">
					<img src="images/photo_1.jpg" />

				</div>
				<div class="clear"></div>
				<div class="bottom_option">
					<!-------/// Bottom _Left_part--->
					<div class="left_bottom">
						<ul>
							<li><a href="#">Add to contacts</a></li>
							<li><a href="#">Emails</a></li>
						</ul>
					</div>
					<!----------/// Bottom Left Part End --->
					<!--------/// Bottom Right part Stared Here ------>
					<div class="right_bottom">
						<ul>
							<li class="chat_mail"><a href="#"></a></li>
							<li class="contact_mail"><a href="#"></a></li>
							<li><a href="#"></a></li>

						</ul>

					</div>
					<!---------------/// Bottom  Right Part End Here -------->

				</div>

			</div>
			<!---------------/// Chat Search End Here ----------->
			<!-----------/// ALL INFO BOX END HERE -------->


		</div>
		<!------------/// CHAT DOWN AROW--------->



		<div class="chat_box_inner">
			<div class="chat_heading">
				<div class="chat_h_left">
					<img src="images/photo.jpg" class="h_name" />
					<div class="chat_h_name">Hariom Srivastava</div>
					<div class="h_drop">
						<img src="images/down_mail.png" />
					</div>
				</div>
				<div class="chat_h_right">
					<img src="images/search_1.jpg" />
				</div>
			</div>

			<div class="chat_inner_content">
				<!---------------/// FIRST ROW STARTED HERE --------->
				<div class="cheat_row">
					<div class="small_images">
						<img src="images/blank_man.jpg" />
					</div>
					<div class="contact_information">
						<p>
							<strong>Jonathan Smith</strong><br> Work for fun
						</p>
					</div>
					<div class="online_file">
						<img src="images/online_file.png">
					</div>
				</div>

				<!--------------/// FIRST ROW END HERE --------------->





				<!---------------/// FIRST ROW STARTED HERE --------->
				<div class="cheat_row">
					<div class="small_images">
						<img src="images/blank_man.jpg" />
					</div>
					<div class="contact_information">
						<p>
							<strong>Jonathan Smith</strong><br> Work for fun
						</p>
					</div>
					<div class="online_file">
						<img src="images/online_file.png">
					</div>
				</div>
				<!--------------/// FIRST ROW END HERE --------------->
				<!---------------/// FIRST ROW STARTED HERE --------->
				<div class="cheat_row">
					<div class="small_images">
						<img src="images/blank_man.jpg" />
					</div>
					<div class="contact_information">
						<p>
							<strong>Jonathan Smith</strong><br> Work for fun
						</p>
					</div>
					<div class="online_file">
						<img src="images/online_file.png">
					</div>
				</div>
				<!--------------/// FIRST ROW END HERE --------------->
				<!---------------/// FIRST ROW STARTED HERE --------->
				<div class="cheat_row">
					<div class="small_images">
						<img src="images/blank_man.jpg" />
					</div>
					<div class="contact_information">
						<p>
							<strong>Jonathan Smith</strong><br> Work for fun
						</p>
					</div>
					<div class="online_file">
						<img src="images/online_file.png">
					</div>
				</div>
				<!--------------/// FIRST ROW END HERE --------------->
				<!---------------/// FIRST ROW STARTED HERE --------->
				<div class="cheat_row">
					<div class="small_images">
						<img src="images/blank_man.jpg" />
					</div>
					<div class="contact_information">
						<p>
							<strong>Jonathan Smith</strong><br> Work for fun
						</p>
					</div>
					<div class="online_file">
						<img src="images/online_file.png">
					</div>
				</div>
				<!--------------/// FIRST ROW END HERE --------------->
				<!---------------/// FIRST ROW STARTED HERE --------->
				<div class="cheat_row">
					<div class="small_images">
						<img src="images/blank_man.jpg" />
					</div>
					<div class="contact_information">
						<p>
							<strong>Jonathan Smith</strong><br> Work for fun
						</p>
					</div>
					<div class="online_file">
						<img src="images/online_file.png">
					</div>
				</div>
				<!--------------/// FIRST ROW END HERE --------------->
				<!---------------/// FIRST ROW STARTED HERE --------->
				<div class="cheat_row">
					<div class="small_images">
						<img src="images/blank_man.jpg" />
					</div>
					<div class="contact_information">
						<p>
							<strong>Jonathan Smith</strong><br> Work for fun
						</p>
					</div>
					<div class="online_file">
						<img src="images/online_file.png">
					</div>
				</div>
				<!--------------/// FIRST ROW END HERE --------------->
				<!---------------/// FIRST ROW STARTED HERE --------->
				<div class="cheat_row">
					<div class="small_images">
						<img src="images/blank_man.jpg" />
					</div>
					<div class="contact_information">
						<p>
							<strong>Jonathan Smith</strong><br> Work for fun
						</p>
					</div>
					<div class="online_file">
						<img src="images/online_file.png">
					</div>
				</div>
				<!--------------/// FIRST ROW END HERE --------------->



			</div>

		</div>
		<!---------------//// CHAT SINGH IN ----------->
		<div class="chat_sign_box">
			<div class="chat_sign_images">
				<img src="images/chat-4-xxl.png" />
			</div>
			<div class="chat_sign_1_box">Sign in</div>
		</div>
		<!-----------------//// CHAT SINGH IN END ------->





	</div>
</div>
<!------------/// Chat End Here ------------->
<!----------------------/// left PANNEL ------------------> --%>