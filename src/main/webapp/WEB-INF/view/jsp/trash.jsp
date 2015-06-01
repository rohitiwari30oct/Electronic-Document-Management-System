                        <!---// RIGHT --->
                        <%@page import="edms.wsdl.File"%>
<%@page import="edms.wsdl.Folder"%>
<%@page import="java.util.List"%>
<div class="other_pages">
                                  <!-------------/// TRASH PAGES STARED HERE --------->
                                  
                                       <!--------/// TRASH MENU STARTED HERE --------->
                                           <div class="trash_menu">
                                               <h1>Recycle Bin</h1>
                                               <div class="trash_right">
                                                   <ul>
                                                      <!--  <li class="trash_1" ><a href="javascript:void(0);"></a></li>
                                                       <li class="trash_2"><a href="javascript:void(0);"></a></li> -->
                                                       <li class="trash_3" title="Restore" onclick="restoreFolder()"><a href="javascript:void(0);"></a></li>
                                                       <li class="trash_4" title="Delete forever"onclick="deleteFolder()"><a href="javascript:void(0);"></a></li>
                                                   </ul>
                                               </div>
                                           </div>
                                       <!--------------/// TRASH MENU END HERE ------------>
                                    <div class="trash_sroll_content">
                                       <!--------/// TRASH CONTENT STARED HERE ------------->
                                       <div class="trash_content">
                                       <%
                                       List<Folder> folderList = (List<Folder>) request.getAttribute("folderList"); 
                                       List<File> fileList = (List<File>) request.getAttribute("fileList"); 
                        				
                                       %>
                                                <ul>
	                                        	<%				
	      				
									      				for (Folder folder : folderList) {
									      					%>
                                                        <li title=<%=folder.getFolderName() %> class="select_box target" onclick="setFolderPath(this.id)" id='<%=folder.getFolderPath()%>'>
                                                          <div class="folder_icon"></div>
                                                          <span><%=folder.getFolderName() %></span> </li>
                                                      
                                                        <%} %>
	                                        	<%				
	      				
									      				for (File file : fileList) {
									      					%>
                                                        <li title=<%=file.getFileName() %> class="select_box target" onclick="setFolderPath(this.id)" id='<%=file.getFilePath()%>'>
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
	<div class="blank_image"></div> <%
}else if(file.getFileName().contains(".ico")){
	%>
	<div class="new_ico"></div> <%
}else{
 %>
						<div class="blank_image"></div> <%
 	} %>
                                                          <span><%=file.getFileName() %></span> </li>
                                                      
                                                        <%} %>
                                                </ul>
                                                <input type="hidden" id="clickedFolder" value=""/>
                                                <script type="text/javascript">
                                                function setFolderPath(clickedFolder){
                                                	//alert(clickedFolder);
                                                	$('#clickedFolder').val(clickedFolder);
                                                	//alert($('#clickedFolder').val());
                                                }
                                                </script>
                                                <script type="text/javascript">
                                                function deleteFolder(){
                                                	if(confirm('Do you really want to permanently delete this item ?')){
                                                	var folderPath=$('#clickedFolder').val();
                                                	//alert(folderPath);
                                                	
                                                	
													var myVar=setTimeout(myFunctionl,500);
                                                	$.ajax({
                                        					type : "GET",
                                        					url : "${pageContext.request.contextPath}/deleteDoc",
                                        					data : {
                                        						'folderPath':$('#clickedFolder').val(),
                                        					},
                                        					contentType : "application/json",
                                        					async : false,
                                        					success : function(data) {
                                             					if(data=="true"){
                                          							location.href="index";
                                          						}
                                        						//alert(data);
                                        						
                                        						getPage('trash');

                                        						myStopFunction(myVar);
                                        					}
                                        				}); }
                                                }
                                                
                                                </script>
                                                <script type="text/javascript">
                                                function restoreFolder(){

                                                	if(confirm('Do you really want to restore this item ?')){
                                                	var folderPath=$('#clickedFolder').val();
                                                	alert(folderPath);
                                                
													var myVar=setTimeout(myFunctionl,500);
                                                	$.ajax({
                                        					type : "GET",
                                        					url : "${pageContext.request.contextPath}/restoreDoc",
                                        					data : {
                                        						'folderPath':$('#clickedFolder').val(),
                                        					},
                                        					contentType : "application/json",
                                        					async : false,
                                        					success : function(data) {
                                             					if(data=="true"){
                                          							location.href="index";
                                          						}
                                        						//alert(data);
                                        						getPage('trash');
                                        						myStopFunction(myVar);
                                        					}
                                        				}); }
                                                }
                                                
                                                </script>
                                         </div>
                                       <!-----------/// TRASEH CONTENT END HERE ------------->
                                  
                                </div>
                                  
                                  <!-------------/// TRASH PAGES END HERE ------------>
                                  
                        </div>
                        <!----// RIGHT END HERE -->
              <script type="text/javascript">
          var recent_win_he = $(window).height();
          //alert(recent_win_he);
          $('.other_pages').css('height',recent_win_he-129);
          

          $('.trash_sroll_content').css('height',recent_win_he-129);
			</script>
            