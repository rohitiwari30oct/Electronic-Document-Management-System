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
               					<div class="shared_row_1">
               					<div ondblclick="getSharedFileSystem(this.id)"  style="cursor: pointer;/* width: 100%; */height: 32px;" id="<%=folder.getFolderPath()%>" >
                                <!--------------TITLE ----------------->
                                <div class="shared_title_1" >
                                    <!--  <input type="checkbox" class="shared_option"> -->
                                     <img src="images/folder.png">
                                     <span><%=folder.getFolderName() %></span>
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
            
            
<%				
      				if(fileList!=null){
      				for (edms.wsdl.File file : fileList) {
      					%>
                        <!------------------/// ROW FIRST STARED HERE --------------->
               					<div class="shared_row_1">
               					<div ondblclick="getSharedFileSystem(this.id)"  style="cursor: pointer;/* width: 100%; */height: 32px;" id="<%=file.getFilePath()%>" >
                                <!--------------TITLE ----------------->
                                <div class="shared_title_1" >
                                    <!--  <input type="checkbox" class="shared_option"> -->
                                     <img src="images/folder.png">
                                     <span><%=file.getFileName() %></span>
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
            
            
        
                                             
                                    </div>
                                    <!-----------/// SHARED FOLDER INNER CONTENT END ------->

                                  <!-------------- ALL SHARED FOLDER CONTENT END HERE -->
                        </div>
                        <!----// RIGHT END HERE -->
              <!------/// FOOTER STARTED HERE ------>
              
              <!-----------/// FOOTER STARTED HERE ------>
     
                                                            
                                                            </div>
                                                            
 <!---------------//// ADD GROUP USER POP UP ----------->
<div id="contactdiv_66">
	<form class="form" action="#" id="contact">
		<h3>Create Folder</h3>
		<p>
			Please enter a new Folder name <span>*</span>
		</p>
		<input type="text" id="folderName" /> <br />
		<div class="clear"></div>
		<input type="button" value="Create" onclick="createFolder()" />
		<input type="button" id="cancel" value="Cancel" /> <br />
		<script type="text/javascript">
			function createFolder() {
				var folder = $('#folderName').val();
				//alert(folder);
				$.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/createSharedFolder",
					data : {
						'folderName' : folder
					},
					contentType : "application/json",
					async : false,
					success : function(data) {
						$("#sharedviewdata").append(data);
						// alert(data);
					}

				});
				$("#contactdiv_66").css("display", "none");
				
			}
		</script>
	</form>
</div>
 <script type="text/javascript">
          var recent_win_he = $(window).height();
          //alert(recent_win_he);
          $('.other_pages').css('height',recent_win_he-129);
			</script>
            
<!-----------------/// ADD GROUP POP UP  END HERE ---------->         
    </body>
</html>