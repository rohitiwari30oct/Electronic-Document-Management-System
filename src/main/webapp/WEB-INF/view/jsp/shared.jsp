                        <!---// RIGHT --->
                        <%@page import="java.util.List"%>
<%@page import="edms.wsdl.Folder"%>


<div class="other_pages">
                                  <!---------------ALL SHARED FOLDER CONTENT ---------->
                                  <div class="path shared_menu">
                                  <%
                                  List<Folder> folderList = (List<Folder>) request.getAttribute("folderList"); 
                                  List<edms.wsdl.File> fileList = (List<edms.wsdl.File>) request.getAttribute("fileList"); 
	                  				String breadcum=(String)request.getAttribute("breadcum");
                    				Folder currentFolder=(Folder)request.getAttribute("currentFolder");
                    				String userid=(String)request.getAttribute("userid");
                                  %>
	<span> 
		<%
		if(userid=="admin"){
		%>
			<span id='/'
			style='cursor: pointer' onclick='getFileSystem(this.id)'>
			Home >>
			</span>
			<%
			String[] breadcm=currentFolder.getFolderPath().split("/");
			String bdm="/"+userid;
			for(int i=1;i<breadcm.length;i++){
				System.out.println("clicked on Bread cum "+breadcm[i]);
				bdm+="/"+breadcm[i];
				%>
			<span id='<%=bdm %>'
			style='cursor: pointer' onclick='getSharedFileSystem(this.id)'>
			<%=breadcm[i] %> >>
			</span>
			<%} 
		}else{
			%>
			<span id='/<%=userid %>'
			style='cursor: pointer' onclick='getSharedFileSystem(this.id)'>
			Home >>
			</span>
			<%
			String[] breadcm=currentFolder.getFolderPath().split("/");
			String bdm="/"+userid;
			for(int i=2;i<breadcm.length;i++){
				System.out.println("clicked on Bread cum "+breadcm[i]);
				bdm+="/"+breadcm[i];
				%>
			<span id='<%=bdm %>'
			style='cursor: pointer' onclick='getSharedFileSystem(this.id)'>
			<%=breadcm[i] %> >>
			</span>
			<%} }%>
		
		
			</span>
		<!-- <span class="path_color">Main Folder</span> -->
		 <div class="clear"></div>     
	</div>
                                  <!-- <div class="shared_menu">
                                     <h1>Shared By Others</h1>  
                                     <div class="clear"></div>                                    
                                 </div> -->
                                     <div class="hindden_tab_22 shared_option">
                                          <ul>
                                             <li class="delete_option"></li>
                                             <li class="simple_line"> |  </li>
                                             <li class="edit_option"></li>
                                          
                                          </ul>
                                     </div>
                                     <div class="clear"></div>
                                     <div class="shared_row shared_title_fixed">
                                        <!--------------TITLE ----------------->
                                          <div class="shared_title">
                                            <!--  <input type="checkbox" class="shared_option"> --><span> Title </span>
                                          </div>
                                        <!-----------------Title----------------->
                                        <!--------------TITLE ----------------->
                                         <div class="shared_date">
                                                  <div class="shared_person_name border_shared">Shared By </div>
                                                  <!-- <div class="shared_person_date"> Date </div> -->
                                         </div>
                                    <!-----------------Title----------------->
                                    </div>
                                    
                                    <!----------// SHARED FOLDER INNER CONTENT -------->
                                    <div class="shared_content shared_content_scroll" id="sharedviewdata">
      
      				<%				
      				if(folderList!=null){
      				for (Folder folder : folderList) {
      					%>
                        <!------------------/// ROW FIRST STARED HERE --------------->
                        <div style="display: none;" id="folderPermissions<%=folder.getFolderPath() %>" ><%=folder.getUserRead().toString().contains(userid)%>,<%=folder.getUserWrite().toString().contains(userid)%>,<%=folder.getUserSecurity().toString().contains(userid)%></div>
               					<div class="shared_row_1 rightClickClassForFolder">
               					<div ondblclick="getSharedFileSystem(this.id)"  oncontextmenu="getRightMenuFolder(this.id)" style="cursor: pointer;/* width: 100%; */height: 32px;" id="<%=folder.getFolderPath()%>" >
                                <!--------------TITLE ----------------->
                                <div class="shared_title_1" >
                                    	<!--  <input type="checkbox" class="shared_option"> -->
                                     	<img src="images/folder.png">
                                     	<span style="text-transform: none;"><%=folder.getFolderName() %></span>
                                </div>
                                <!-----------------Title----------------->
                                  <!--------------TITLE ----------------->
                                <div class="shared_date">
                                    <div class="shared_person_name">
                                    <img src="images/missing_avatar.png">
                                    <%=folder.getCreatedBy() %></div>
                                   	<!--  <div class="shared_person_date">Oct 1</div> -->
                                </div>
                                <!-----------------Title----------------->
                                <div class="claer"></div>
                                </div>
              					</div>
            <!-------------------/// ROW END HERE ---------------->
            <%} }%>
            <script type="text/javascript">
            function getRightMenuFolder(folderid){
            	getDocProperties(folderid);
           		var permis=document.getElementById('folderPermissions'+folderid).innerHTML;
            	var permissions=permis.split(',');
			if(permissions[0]=="true"){
				$('#folderRightMenuSharing').css('display','none');
				$('#folderRightMenuCreateFolder').css('display','none');
				$('#folderRightMenuGetLink').css('display','none');
				$('#folderRightMenuRename').css('display','none');
				$('#folderRightMenuRemove').css('display','none');
			}

			if(permissions[1]=="true"){
				$('#folderRightMenuSharing').css('display','none');
				$('#folderRightMenuCreateFolder').css('display','block');
				$('#folderRightMenuGetLink').css('display','none');
				$('#folderRightMenuRename').css('display','none');
				$('#folderRightMenuRemove').css('display','block');
			}
			if(permissions[2]=="true"){
				$('#folderRightMenuSharing').css('display','block');
				$('#folderRightMenuCreateFolder').css('display','block');
				$('#folderRightMenuGetLink').css('display','block');
				$('#folderRightMenuRename').css('display','none');
				$('#folderRightMenuRemove').css('display','block');
			}
            
            }
            </script>
            
            
            
<%				
      				if(fileList!=null){
      				for (edms.wsdl.File file : fileList) {
      					%>
<div style="display: none;" id="filePermissions<%=file.getFilePath() %>" ><%=file.getUserRead().toString().contains(userid)%>,<%=file.getUserWrite().toString().contains(userid)%>,<%=file.getUserSecurity().toString().contains(userid)%></div>
               				
                        <!------------------/// ROW FIRST STARED HERE --------------->
               					<div class="shared_row_1 rightClickClassForFile">
               					<div  oncontextmenu="getRightMenuFile(this.id)"   style="cursor: pointer;/* width: 100%; */height: 32px;" id="<%=file.getFilePath()%>" >
                                <!--------------TITLE ----------------->
                                <div class="shared_title_1" >
                                    <!--  <input type="checkbox" class="shared_option"> -->
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
	<div class="new_gif16"></div> <%
}else if(file.getFileName().contains(".xml")||file.getFileName().contains(".vcf")||file.getFileName().contains(".pod")||file.getFileName().contains(".ics")){
	%>
	<div class="new_txt16"></div> <%
}else if(file.getFileName().contains(".txt")){
	%>
	<div class="new_txt16"></div> <%
}else if(file.getFileName().contains(".bmp")){
	%>
	<div class="new_bmp16"></div> <%
}else if(file.getFileName().contains(".ico")){
	%>
	<div class="new_ico16"></div> <%
}else{
 %>
						<div class="blank_image16"></div> <%
 	}
					%>
                                     <span style="text-transform: none;"><%=file.getFileName() %></span>
                                </div>
                                <!-----------------Title----------------->
                                  <!--------------TITLE ----------------->
                                <div class="shared_date">
                                    <div class="shared_person_name">
                                    <img src="images/missing_avatar.png">
                                    <%=file.getCreatedBy() %></div>
                                   <!--  <div class="shared_person_date">Oct 1</div> -->
                                </div>
                                <!-----------------Title----------------->
                                <div class="claer"></div>
                                </div>
              </div>
            <!-------------------/// ROW END HERE ---------------->
            <%}} %>
            
            <script type="text/javascript">
            function getRightMenuFile(folderid){
            	getFileProperties(folderid);
            var permis=document.getElementById('filePermissions'+folderid).innerHTML;
            var permissions=permis.split(',');
			if(permissions[0]=="true"){
				$('#fileRightMenuSharing').css('display','none');
				$('#fileRightMenuPreview').css('display','block');
				$('#fileRightMenuGetLink').css('display','none');
				$('#folderRightMenuRename').css('display','none');
				$('#fileRightMenuRemove').css('display','none');
				$('#fileRightMenuDownload').css('display','none');
			}

			if(permissions[1]=="true"){
				$('#fileRightMenuSharing').css('display','none');
				$('#fileRightMenuPreview').css('display','block');
				$('#fileRightMenuGetLink').css('display','none');
				$('#fileRightMenuRename').css('display','none');
				$('#fileRightMenuRemove').css('display','block');
				$('#fileRightMenuDownload').css('display','block');
			}
			if(permissions[2]=="true"){
				$('#fileRightMenuSharing').css('display','block');
				$('#fileRightMenuPreview').css('display','block');
				$('#fileRightMenuGetLink').css('display','block');
				$('#fileRightMenuRename').css('display','none');
				$('#fileRightMenuRemove').css('display','block');
				$('#fileRightMenuDownload').css('display','block');
			}
            
            }
            </script>
            
            
        
                                             
                                    </div>
                                    <!-----------/// SHARED FOLDER INNER CONTENT END ------->

                                  <!-------------- ALL SHARED FOLDER CONTENT END HERE -->
                        </div>
                        <!----// RIGHT END HERE -->
              <!------/// FOOTER STARTED HERE ------>
              
              <!-----------/// FOOTER STARTED HERE ------>
     
                                                            
                                                            </div>
                                              
 											<!----------/// RIGHT CLICK MENU STRED HERE ---------->
                                            <div class="right_click_menu">
                                                   <ul>
                                                       <li id="folderRightMenuCreateFolder" class="new_folder right_create_folder"><div class="right_images"><img src="images/create_folder_icon.png" /><div class="clear"></div></div><span>new folder</span><div class="clear"></div></li>
                                                       <li id="folderRightMenuSharing"  class="share_right mange_sharing"><div class="right_images"><img src="images/48094.png" /><div class="clear"></div></div><span>share</span><div class="clear"></div></li>
                                                       <li id="folderRightMenuGetLink"  class="get_link"><div class="right_images"><img src="images/share_linl.png" /><div class="clear"></div></div><span>get link</span><div class="clear"></div></li>
                                                       <li id="folderRightMenuRename"  class="rename_right renameFolder"><div class="right_images"><img src="images/rename.png" /><div class="clear"></div></div><span>rename</span><div class="clear"></div></li>
                                                      	<!--  <li class="download_right"><div class="right_images"><img src="images/download.png"/><div class="clear"></div></div><span>download</span><div class="clear"></div></li> -->
                                                       <li id="folderRightMenuRemove"  class="remove_right more_delete"><div class="right_images"><img src="images/delete_icon_file.png" /><div class="clear"></div></div><span>remove</span><div class="clear"></div></li>
                                                      
                                                   </ul>
                                             </div>
                                             <!----------/// RIGHT CLICK MENU END HERE --------------->
                                             <!----------/// RIGHT CLICK MENU STRED HERE FOR FILE  ---------->
                                             <div class="right_click_menu_file">
                                                   <ul>
                                                      	<!-- <li class="new_folder"><div class="right_images"><img src="images/create_folder_icon.png" /><div class="clear"></div></div><span>new folder</span><div class="clear"></div></li>-->
                                                       	<li id="fileRightMenuSharing"  class="share_right mange_sharing"><div class="right_images"><img src="images/48094.png" /><div class="clear"></div></div><span>share</span><div class="clear"></div></li>
                                                       	<li id="fileRightMenuGetLink"  class="get_link"><div class="right_images"><img src="images/share_linl.png" /><div class="clear"></div></div><span>get link</span><div class="clear"></div></li>
                                                       	<li id="fileRightMenuRename"  class="rename_right renameFolder"><div class="right_images"><img src="images/rename.png" /><div class="clear"></div></div><span>rename</span><div class="clear"></div></li>
                                                   		<li id="fileRightMenuPreview"  class="previewPopup prew_right_click"><div class="right_images"><div class="clear"></div></div><span>Preview</span><div class="clear"></div></li>
                                                       	<li id="fileRightMenuDownload"  onclick="getFileContent(this.id)" class="download_right"><div class="right_images"><img src="images/download.png"/><div class="clear"></div></div><span>download</span><div class="clear"></div></li>
                                                       	<li id="fileRightMenuRemove"  class="remove_right more_delete"><div class="right_images"><img src="images/delete_icon_file.png" /><div class="clear"></div></div><span>remove</span><div class="clear"></div></li>
                                                      
                                                   </ul>
                                             </div>
  
                                             <!----------/// RIGHT CLICK MENU END HERE  FOR FILE--------------->
                                                          

 <script type="text/javascript">
          var recent_win_he = $(window).height();
          //alert(recent_win_he);
          $('.other_pages').css('height',recent_win_he-129);
			</script>
            
<!-----------------/// ADD GROUP POP UP  END HERE ---------->     

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
		
		<input type="text" id="newFolderName"	value='<%=currentFolder.getFolderName()%>' /> 
		<input type="hidden" id="parentfolderName" value='<%=currentFolder.getFolderPath()%>' />
		<br />
		<div class="clear"></div>
		<input type="button" value="Rename" onclick="renameFolder()" /> <input
			type="button" id="cancel" value="Cancel" /> <br />
		<script type="text/javascript">
			function renameFolder() {
				var oldfolder = $('#oldFolderName').val();
				var newfolder = $('#newFolderName').val();
				//alert(oldfolder);
				//alert(newfolder);
				if(newfolder!=""){
				//alert(folder);
				$.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/renameFolder",
					data : {
						'oldFolderName' : oldfolder,
						'newFolderName' : newfolder
					},
					contentType : "application/json",
					async : false,
					success : function(data) {
     					if(data=="true"){
  							location.href="index";
  						}
					}
				});}else{
					alert("Please give new name");
				}
				$("#contactdiv_666").css("display", "none");
				
			//	$("#message"
			//	$("#"+$('#parentfolderName').val()+">span").html(newfolder);
				//getDocProperties($('#parentfolderName').val());
			}
		</script>
	</form>
</div>
<!-----------------/// ADD GROUP POP UP  END HERE ---------->

    
      
    </body>
</html>