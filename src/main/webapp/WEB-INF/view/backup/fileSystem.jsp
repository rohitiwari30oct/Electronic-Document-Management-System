<%@page import="edms.wsdl.Folder"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="edms.core.Config"%>
<!-----------------------/// RIGHT PANNEL ------------------->

<%

	
	//System.out.println("path is : "+request.getParameter("path"));
	List<Folder> folderList=(List<Folder>)request.getAttribute("folderList");
	String breadcum=(String)request.getAttribute("breadcum");
%>
<div class="strip_details">
	<div class="home_heading"></div>
	<div class="path">
		<span>Path &nbsp; :</span><span><span id='<%=breadcum %>'
			style='cursor: pointer' onclick='getFileSystem(this.id)'> Home</span></span>
		<!-- <span class="path_color">Main Folder</span> -->
	</div>
	<a href="userDashboard">
		<div class="dasboard">DASHBOARD</div>
	</a>
	<div class="right_icon">
		<div class="thum_view" onClick="tile_view();" title="Folder View"></div>
		<div class="list_view" onClick="list_view();" title="List View"></div>
		<span>&nbsp;</span>
		<div class="right_view right_view_color" onClick="left_view();"
			title="Right View"></div>
		<div class="bottom_view" onClick="bottom_view();" title="Bottom View"></div>
	</div>
</div>

<div class="user_dasboard_1">

	<!--------------//// ALLL CHAT SUB HTML PAGES HERE STARED HERE ------------>





	<!-------/// Chat Downarrow option--------->

	<!------------/// Chat Downarrow Option End ------>
	<!--------------- ALL CHAT SUB HTML FOLDER END HERE ---------------->


	<div class="middle-pane middle-pane_new left_border">

		<!-------------/// ROW FIRST CONTENT STARTED HERE ---------------------->
		<div class="thum_view_middle new_width" id="folderView">
			<div class="row_text middle_tab ">
				<div class="white">
					<div class="icon_folder"></div>
					<div class="folder_text">Folder View</div>
				</div>
			</div>
			<div class="claer"></div>
			<div class="row_content">
				<ul>
					<%
						System.out.println("check in 0 ");
							for (Folder folder:folderList) {
					%>
					<li id="<%=folder.getFolderPath()%>" ondblclick="getFileSystem(this.id)">
						<div class="folder_icon"></div> <span> <%=folder.getFolderName()%></span>
					</li>
					<%
						}
							//	root.getNode("childNode").remove();
							//	root.getNode("childNode[3]").remove();
							//	root.getNode("childNode[4]").remove();
							//	root.getNode("childNode[5]").remove();
							//	root.getNode("childNode[6]").remove();
					%>

				</ul>
			</div>
		</div>
		<div class="thum_view_middle new_width" id="fileView">
			<div class="row_text middle_tab ">
				<div class="white">
					<div class="icon_folder"></div>
					<div class="folder_text">File View</div>
				</div>
			</div>
			<div class="claer"></div>
			<div class="row_content">
				<ul><%-- 
					<%
						System.out.println("check in 0 ");
							for (NodeIterator nit = root.getNodes(); nit.hasNext();) {
								Node node = nit.nextNode();
								Property prp = node
										.getProperty(JcrConstants.JCR_PRIMARYTYPE);
								if (!(node.getProperty(JcrConstants.JCR_PRIMARYTYPE)
										.getString().equals(JcrConstants.NT_RESOURCE))) {
									//System.out.println(node.getProperty(JcrConstants.JCR_LASTMODIFIED).getDate());
								}
								//if(!node.getName().equals(JcrConstants.JCR_SYSTEM)&&(!node.getProperty(JcrConstants.JCR_PRIMARYTYPE).getString().equals(JcrConstants.NT_RESOURCE))){
								//System.out.println("node type is : "+node.getPrimaryNodeType().getName());	
								if (node.getPrimaryNodeType().getName()
										.equals(JcrConstants.NT_FILE)) {
									for (PropertyIterator pit = node.getProperties(); pit
											.hasNext();) {
										Property prop = pit.nextProperty();
										if (prop.isMultiple()) {
											Value[] prp1 = prop.getValues();
											for (int j = 0; j < prp1.length; j++) {
												Value val = prp1[j];
												//System.out.println(val+" property value is : "+val.getString());
											}
										} else {
											//	System.out.println(prop+" property value is : "+prop.getValue().getString());
											//System.out.println(node.getProperty(JcrConstants.JCR_CREATED).getDate());
										}
									}
					%>
					<li id="<%=node.getPath()%>" ondblclick="getFileSystem(this.id)">
						<div class="folder_icon"></div> <span> <%=node.getPath().substring(
								node.getPath().lastIndexOf('/') + 1)%></span>
					</li>
					<%
						}
							}
							//	root.getNode("childNode").remove();
							//	root.getNode("childNode[3]").remove();
							//	root.getNode("childNode[4]").remove();
							//	root.getNode("childNode[5]").remove();
							//	root.getNode("childNode[6]").remove();
					%> --%>

				</ul>
			</div>
		</div>

		<!-------------------/// ROW FIRST CONTENT END HERE ----------------------->

		<!------------------/// LIST VIEW STARTED HERE ------------------------->

		<div class="list_view_middle">
			<div class="list_view_information">
				<ul>
					<li>&nbsp;</li>
					<li>Name</li>
					<li>Size</li>
					<li>Date Modified</li>
					<li>Author</li>
				</ul>
			</div>
			<div class="list_view_content">
				<%-- <%
					//	System.out.println("check in 2 ");
						for (NodeIterator nit = root.getNodes(); nit.hasNext();) {
							Node node = nit.nextNode();
							Property prp = node
									.getProperty(JcrConstants.JCR_PRIMARYTYPE);
							if (!(node.getProperty(JcrConstants.JCR_PRIMARYTYPE)
									.getString().equals(JcrConstants.NT_RESOURCE))) {
								//System.out.println(node.getProperty(JcrConstants.JCR_LASTMODIFIED).getDate());
							}
							//if(!node.getName().equals(Config.JCR_SYSTEM)&&(!node.getProperty(JcrConstants.JCR_PRIMARYTYPE).getString().equals(JcrConstants.NT_RESOURCE))){
							if (node.getPrimaryNodeType().getName()
									.equals(JcrConstants.NT_FOLDER)) {
								//System.out.println("node type is : "+node.getPrimaryNodeType().getName());
								for (PropertyIterator pit = node.getProperties(); pit
										.hasNext();) {
									Property prop = pit.nextProperty();
									//System.out.println(prop+" property value is : "+prop.getValue().getString());
									//System.out.println(node.getProperty(JcrConstants.JCR_CREATED).getDate());

								}
				%>
				<ul>
					<li><div class="icon_list"></div></li>
					<li><%=node.getPath().substring(
								node.getPath().lastIndexOf('/') + 1)%></li>
					<li></li>
					<li></li>
					<li></li>
				</ul>
				<%
					}
						}
						//	child.setProperty("anyProperty","Blah 5");
						//	child.getSession().move(child.getPath(), child.getParent().getPath() + "" + "newName3");
						//	root.getNode("world[2]").remove();
					} finally {
						//	jcrsession.save();
						jcrsession.logout();
					}
				%> --%>

			</div>
		</div>

		<!---------------/// LIST VIEW END HERE ----------------------------------->

		<!----------------/// RIGHT PART STARTED HERE ------------------->
		<div class="right_icon_main option_left">
			<div class="right-pane">
				<ul class="icon_left_descri">
					<li class="padding_less"><a href="#" onClick="left_icon()">
							<div class="left_icon"></div>
					</a></li>
					<li class="peroperty right_tab"><a href="#">PROPERTIES</a>
						<div class="icon_right"></div></li>
					<div class="content_right"></div>
					<li class="note right_tab"><a href="#">NOTES</a>
						<div class="icon_right"></div></li>
					<div class="content_right"></div>
					<li class="keyword right_tab"><a href="#">KEYWORDS</a>
						<div class="icon_right"></div></li>
					<div class="content_right"></div>
					<li class="history_right right_tab"><a href="#">HISTORY</a>
						<div class="icon_right"></div></li>
					<div class="content_right"></div>
					<li class="prew right_tab"><a href="#">PREVIEW</a>
						<div class="icon_right"></div></li>
					<div class="content_right"></div>
				</ul>
			</div>

			<!------------------------------/// LEFT ICON ONLY --------------->
			<div class="left_icon_only">
				<div class="only_left_icon">
					<a href="#" onClick="left_icon()">
						<div class="left_icon back_pos"></div>
					</a>
					<div class="claer"></div>
					<ul class="icon_left_descri new_icon_view">
						<li class="peroperty right_tab"></li>
						<li class="note right_tab"></li>
						<li class="keyword right_tab"></li>
						<li class="perim right_tab"></li>
						<li class="history_right right_tab"></li>
						<li class="prew right_tab"></li>
					</ul>
				</div>
			</div>

			<!------------------------------/// LEFT ICON ONLY END  --------------->

		</div>

		<!----------------/// RIGHT PART END HERE ------------------->

	</div>
	<!-------------/// MIDDLE END HERE ---------------->

	<div class="claer"></div>
</div>