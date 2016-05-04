                        <!---// RIGHT --->
                        <%@page import="edms.wsdl.File"%>
<%@page import="edms.wsdl.Folder"%>
<%@page import="java.util.List"%>
<div class="recentaly_bottom">
                                  <!-------------// RECENT ALL CONTENT STARTED HERE ---------->
                               
                                   <div class="trash_menu">
                                     <h1>Recently Modified Document</h1>
                                   </div>
                               <div class="recently_main_div">
                                   <div class="row_content_folder">
                                       <ul>
                                         <%
                                       List<Folder> folderList = (List<Folder>) request.getAttribute("folderList"); 
                                       List<File> fileList = (List<File>) request.getAttribute("fileList"); 
					      				for (Folder folder : folderList) {
					      					if(!folder.getCreatedBy().equals("admin")){
					      					if(folder.getFolderName().equals("trash")){}{
				      					%>
                                         <li title=<%=folder.getFolderName() %> >
                                           <div class="folder_icon"></div>
                                           <span><%=folder.getFolderName() %></span> 
                                           
                                           </li>
                                        
                                        <%} }}
					      				for (File file : fileList) {
					      					if(!file.getCreatedBy().equals("admin")){
				      					%>
                                          <li title=<%=file.getFileName() %>>
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
 	} %>
                                            <span><%=file.getFileName() %></span> 
                                            
                                            </li>
                                         
                                         <%} }%>
                                       </ul>
                                       <div class="clear"></div>
                                   </div>
                              </div>
                                  <!------------/// RECENT ALL CONTENT END HERE --------------->
                        </div>
                        <!----// RIGHT END HERE -->
              <!------/// FOOTER STARTED HERE ------>
              
              <!-----------/// FOOTER STARTED HERE ------>
                                                            </div>
          <script type="text/javascript">
          var recent_win_he = $(window).height();
          //alert(recent_win_he);
          $('.recently_main_div').css('height',recent_win_he-129);
			</script>
