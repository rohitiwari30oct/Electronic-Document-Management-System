                      <%@page import="edms.wsdl.Folder"%>
<%@page import="edms.wsdl.File"%>
<%@page import="java.util.List"%>
<%
List<File> lastMonthModifiedFileList		=	(List<File>)request.getAttribute("lastMonthModifiedFileList");
List<Folder> lastMonthModifiedFolderList	=	(List<Folder>)request.getAttribute("lastMonthModifiedFolderList");
List<File> lastMonthCreatedFileList			=	(List<File>)request.getAttribute("lastMonthCreatedFileList");
List<Folder> lastMonthCreatedFolderList		=	(List<Folder>)request.getAttribute("lastMonthCreatedFolderList");
%>
                        <!---// RIGHT --->
                        <div class="other_pages_statice">
                         <div class="trash_menu">
                                     <h1>User Statistics</h1>
                                   </div>
                                  <!-------------/// STATICE PAGE ALL CONTENT STARED HERE ----------->
                                    <div class="statice_srcoll_content">
                                                   <div class="statice_inner_content">
                                                          <!----------// FIRST BOX STARED HERE ----->
                                                   <div class="statical_graph">
                                    <div class="static_heading">
                             Last Month Modified Documents
                             </div>
                                <div class="statistics_inner_content">
                                    
                                    
                                  <%for(File file:lastMonthModifiedFileList){ %>  
                                  <div class="row_recent">
                  					<%
 	if(file.getFileName().contains(".pdf")){
 %>
						<div class="new_pdf32"></div> <%
 	}else if(file.getFileName().contains(".doc")){
 %>
						<div class="new_doc32"></div> <%
 	}else if(file.getFileName().contains(".xls")||file.getFileName().contains(".csv")){
 %>
						<div class="new_xls32"></div> <%
 	}else if(file.getFileName().contains(".ppt")){
 %>
						<div class="new_ppt32"></div> <%
 	}else if(file.getFileName().contains(".jpg")){
 %>
						<div class="new_jpg32"></div> <%
 	}else if(file.getFileName().contains(".png")){
 %>
						<div class="new_png32"></div> <%
 	}else if(file.getFileName().contains(".gif")){
 %>
						<div class="new_jpg32"></div> <%
 	}else if(file.getFileName().contains(".xml")||file.getFileName().contains(".vcf")||file.getFileName().contains(".pod")||file.getFileName().contains(".ics")||file.getFileName().contains(".java")){
 %>
						<div class="new_txt32"></div> <%
 	}else if(file.getFileName().contains(".txt")){
 %>
						<div class="new_txt32"></div> <%
 	}else if(file.getFileName().contains(".bmp")){
 %>
						<div class="new_jpg32"></div> <%
 	}else if(file.getFileName().contains(".ico")){
 %>
						<div class="new_ico32"></div> <%
 	}else{
 %>
						<div class="blank_image32"></div> <%
 	}
 %>
                  					<a href="javascript:void(0);"  id="<%=file.getFilePath() %>" onclick="getFileContent(this.id)" ><%=file.getFileName() %></a><span> Created by : <%=file.getCreatedBy() %></span>  </div>
                   					<%} %>
                               <div class="claer"></div>
                               </div>
                                    <a href="javascript:void(0);" class="bottom_link">
                            <div class="botom_view_more"> View All </div>
                            </a> 
                                                 </div>
                                       <!----------// FIRST BOX END HERE -------->
                                                       <!---------//  BOX STARTED HERE --------->
   					<div class="statical_graph">
                  	<div class="static_heading">Last month modified folder</div>
                    <div class="statistics_inner_content">
		                 <%for(Folder folder:lastMonthModifiedFolderList){ %>  
		                 
			                  <div class="row_recent">
		    	                <div class="width_32_folder"></div>
		        	            <a href="javascript:void(0);"  id="<%=folder.getFolderPath() %>" onclick="getFileSystem(this.id)" ><%=folder.getFolderName() %></a> <span> Created by : <%=folder.getCreatedBy() %></span> </div>
		                 
		                 <%} %>
                 <div class="claer"></div>
                  </div>
                  <a href="javascript:void(0);" class="bottom_link">
                  <div class="botom_view_more"> View All </div>
                  </a> </div>
                                         <!---------//  BOX END HERE ------------->
                                  <!----------// BOX STARED HERE ------->
                                                                    <div class="statical_graph">
                  <div class="static_heading">Last month created documents</div>
                   <div class="statistics_inner_content">
                    <%for(File file:lastMonthCreatedFileList){ %>  
                                  <div class="row_recent">
 <%
 	if(file.getFileName().contains(".pdf")){
 %>
						<div class="new_pdf32"></div> <%
 	}else if(file.getFileName().contains(".doc")){
 %>
						<div class="new_doc32"></div> <%
 	}else if(file.getFileName().contains(".xls")||file.getFileName().contains(".csv")){
 %>
						<div class="new_xls32"></div> <%
 	}else if(file.getFileName().contains(".ppt")){
 %>
						<div class="new_ppt32"></div> <%
 	}else if(file.getFileName().contains(".jpg")){
 %>
						<div class="new_jpg32"></div> <%
 	}else if(file.getFileName().contains(".png")){
 %>
						<div class="new_png32"></div> <%
 	}else if(file.getFileName().contains(".gif")){
 %>
						<div class="new_jpg32"></div> <%
 	}else if(file.getFileName().contains(".xml")||file.getFileName().contains(".vcf")||file.getFileName().contains(".pod")||file.getFileName().contains(".ics")||file.getFileName().contains(".java")){
 %>
						<div class="new_txt32"></div> <%
 	}else if(file.getFileName().contains(".txt")){
 %>
						<div class="new_txt32"></div> <%
 	}else if(file.getFileName().contains(".bmp")){
 %>
						<div class="new_jpg32"></div> <%
 	}else if(file.getFileName().contains(".ico")){
 %>
						<div class="new_ico32"></div> <%
 	}else{
 %>
						<div class="blank_image32"></div> <%
 	}
 %>
                  					<a href="javascript:void(0);"  id="<%=file.getFilePath() %>" onclick="getFileContent(this.id)" ><%=file.getFileName() %></a><span> Created on : <%=file.getCreationDate().replace('T', ' ').substring(0,file.getCreationDate().indexOf("."))%></span> </div>
                   					<%} %>
                 
                 <div class="claer"></div>
                  </div>
                  <a href="javascript:void(0);" class="bottom_link">
                  <div class="botom_view_more"> View All </div>
                  </a> </div>
                                         <!-----------// BOX END HERE -------->
                                             <!-----------// BOX STARED ----------->
                                                                                <div class="statical_graph">
                  <div class="static_heading">Last month created folders</div>
                   <div class="statistics_inner_content">
                   <%for(Folder folder:lastMonthCreatedFolderList){ %>  
	                  <div class="row_recent">
    	                <div class="width_32_folder"></div>
        	            <a href="javascript:void(0);"  id="<%=folder.getFolderPath() %>" onclick="getFileSystem(this.id)" ><%=folder.getFolderName() %></a><span> Created by : <%=folder.getCreatedBy() %> </span></div>
                 
                 	<%}%></div>   
                  <div class="claer"></div>
                  <a href="javascript:void(0);" class="bottom_link">
                  <div class="botom_view_more"> View All </div>
                  </a> </div>
                 <!------------/// BOX END HERE -------->
                 <!------------/// BOX STARTED HERE -------->
                	<!--   <div class="statical_graph">
                  <div class="static_heading">Top 20 recently downloaded documents</div>
                  <div class="statistics_inner_content">
                  <div class="row_recent">
                    <div class="recnt_pdf"></div>
                    <a href="javascript:void(0);">Setting Ad Budget-A Sorcoic</a>downloaded by<a href="javascript:void(0);" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                  <div class="row_recent">
                    <div class="recnt_pdf_pdf"></div>
                    <a href="javascript:void(0);">Setting Ad Budget-A Sorcoic</a>downloaded by<a href="javascript:void(0);" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                  <div class="row_recent">
                    <div class="recnt_pdf_pdf"></div>
                    <a href="javascript:void(0);">Setting Ad Budget-A Sorcoic</a>downloaded by<a href="javascript:void(0);" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                  <div class="row_recent">
                    <div class="recnt_pdf_doc"></div>
                    <a href="javascript:void(0);">Setting Ad Budget-A Sorcoic</a>downloaded by<a href="javascript:void(0);" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                  <div class="row_recent">
                    <div class="recnt_pdf_pdf"></div>
                    <a href="javascript:void(0);">Setting Ad Budget-A Sorcoic</a>downloaded by<a href="javascript:void(0);" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                  <div class="row_recent">
                    <div class="recnt_pdf_doc"></div>
                    <a href="javascript:void(0);">Setting Ad Budget-A Sorcoic Budget-A Budget-A Sorcoic</a>downloaded by<a href="javascript:void(0);" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                    <div class="space_extra"></div>
                  <div class="claer"></div>
                  </div>
                  <a href="javascript:void(0);" class="bottom_link">
                  <div class="botom_view_more"> View All </div>
                  </a> </div> -->
                                         <!------------// BOX END HERE ------------>
                                <!-----------/// BOX STARED HERE ----------->
                                                                               <!--  <div class="statical_graph">
                  <div class="static_heading">Locked documents</div>
                  <div class="statistics_inner_content">
                  <div class="row_recent">
                    <div class="recnt_pdf"></div>
                    <a href="javascript:void(0);">Setting Ad Budget-A Sorcoic</a>Locked by<a href="javascript:void(0);" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                  <div class="row_recent">
                    <div class="recnt_pdf_pdf"></div>
                    <a href="javascript:void(0);">Setting Ad Budget-A Sorcoic</a>Locked by<a href="javascript:void(0);" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                  <div class="row_recent">
                    <div class="recnt_pdf_pdf"></div>
                    <a href="javascript:void(0);">Setting Ad Budget-A Sorcoic</a>Locked by<a href="javascript:void(0);" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                  <div class="row_recent">
                    <div class="recnt_pdf_doc"></div>
                    <a href="javascript:void(0);">Setting Ad Budget-A Sorcoic</a>Locked by<a href="javascript:void(0);" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                  <div class="row_recent">
                    <div class="recnt_pdf_pdf"></div>
                    <a href="javascript:void(0);">Setting Ad Budget-A Sorcoic</a>Locked by<a href="javascript:void(0);" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                  <div class="row_recent">
                    <div class="recnt_pdf_doc"></div>
                    <a href="javascript:void(0);">Setting Ad Budget-A Sorcoic</a>Locked by<a href="javascript:void(0);" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                  <div class="row_recent">
                    <div class="recnt_pdf_doc"></div>
                    <a href="javascript:void(0);">Setting Ad Budget-A Sorcoic</a>Locked by<a href="javascript:void(0);" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                  <div class="row_recent">
                    <div class="recnt_pdf_doc"></div>
                    <a href="javascript:void(0);">Setting Ad Budget-A Sorcoic</a>Locked by<a href="javascript:void(0);" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                  </div>   
                  <div class="claer"></div>
                  <a href="javascript:void(0);" class="bottom_link">
                  <div class="botom_view_more"> View All </div>
                  </a> </div> -->
                                         <!-------------/// BOX END HERE ------------>
                                                   </div>
                                                <div class="clear"></div>
                                    </div>
                                  
                                  
                                  <!-------------/// STATICE PAGES END HERE ------------------->
                        </div>
                        <!----// RIGHT END HERE -->
           
              
                                                          </div>
          <script type="text/javascript">
          var recent_win_he = $(window).height();
          //alert(recent_win_he);
          $('.statice_srcoll_content').css('height',recent_win_he-129);
          
          
</script>
                                       
            
    </body>
</html>