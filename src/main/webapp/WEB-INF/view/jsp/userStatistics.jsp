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
                  					<div class="recnt_pdf"></div>
                  					<a href="#"><%=file.getFileName() %></a> Modified on <a href="#" class="second"></a> <%=file.getModificationDate() %> </div>
                   					<%} %>
                               <div class="claer"></div>
                               </div>
                                    <a href="#" class="bottom_link">
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
    	                <div class="recnt_pdf"></div>
        	            <a href="#"><%=folder.getFolderName() %></a> Modified on <a href="#" class="second"></a> <%=folder.getModificationDate() %> </div>
                 
                 <%} %>
                 <div class="claer"></div>
                  </div>
                  <a href="#" class="bottom_link">
                  <div class="botom_view_more"> View All </div>
                  </a> </div>
                                         <!---------//  BOX END HERE ------------->
                                  <!----------// BOX STARED HERE ------->
                                                                    <div class="statical_graph">
                  <div class="static_heading">Last month created documents</div>
                   <div class="statistics_inner_content">
                    <%for(File file:lastMonthCreatedFileList){ %>  
                                  <div class="row_recent">
                  					<div class="recnt_pdf"></div>
                  					<a href="#"><%=file.getFileName() %></a> Created on <a href="#" class="second"></a> <%=file.getCreationDate()%> </div>
                   					<%} %>
                 
                 <div class="claer"></div>
                  </div>
                  <a href="#" class="bottom_link">
                  <div class="botom_view_more"> View All </div>
                  </a> </div>
                                         <!-----------// BOX END HERE -------->
                                             <!-----------// BOX STARED ----------->
                                                                                <div class="statical_graph">
                  <div class="static_heading">Last month created folders</div>
                   <div class="statistics_inner_content">
                   <%for(Folder folder:lastMonthCreatedFolderList){ %>  
	                  <div class="row_recent">
    	                <div class="recnt_pdf"></div>
        	            <a href="#"><%=folder.getFolderName() %></a> Created on <a href="#" class="second"></a> <%=folder.getModificationDate() %> </div>
                 
                 	<%}%></div>   
                  <div class="claer"></div>
                  <a href="#" class="bottom_link">
                  <div class="botom_view_more"> View All </div>
                  </a> </div>
                                         <!------------/// BOX END HERE -------->
                                           <!------------/// BOX STARTED HERE -------->
                <!--   <div class="statical_graph">
                  <div class="static_heading">Top 20 recently downloaded documents</div>
                  <div class="statistics_inner_content">
                  <div class="row_recent">
                    <div class="recnt_pdf"></div>
                    <a href="#">Setting Ad Budget-A Sorcoic</a>downloaded by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                  <div class="row_recent">
                    <div class="recnt_pdf_pdf"></div>
                    <a href="#">Setting Ad Budget-A Sorcoic</a>downloaded by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                  <div class="row_recent">
                    <div class="recnt_pdf_pdf"></div>
                    <a href="#">Setting Ad Budget-A Sorcoic</a>downloaded by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                  <div class="row_recent">
                    <div class="recnt_pdf_doc"></div>
                    <a href="#">Setting Ad Budget-A Sorcoic</a>downloaded by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                  <div class="row_recent">
                    <div class="recnt_pdf_pdf"></div>
                    <a href="#">Setting Ad Budget-A Sorcoic</a>downloaded by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                  <div class="row_recent">
                    <div class="recnt_pdf_doc"></div>
                    <a href="#">Setting Ad Budget-A Sorcoic Budget-A Budget-A Sorcoic</a>downloaded by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                    <div class="space_extra"></div>
                  <div class="claer"></div>
                  </div>
                  <a href="#" class="bottom_link">
                  <div class="botom_view_more"> View All </div>
                  </a> </div> -->
                                         <!------------// BOX END HERE ------------>
                                <!-----------/// BOX STARED HERE ----------->
                                                                               <!--  <div class="statical_graph">
                  <div class="static_heading">Locked documents</div>
                  <div class="statistics_inner_content">
                  <div class="row_recent">
                    <div class="recnt_pdf"></div>
                    <a href="#">Setting Ad Budget-A Sorcoic</a>Locked by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                  <div class="row_recent">
                    <div class="recnt_pdf_pdf"></div>
                    <a href="#">Setting Ad Budget-A Sorcoic</a>Locked by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                  <div class="row_recent">
                    <div class="recnt_pdf_pdf"></div>
                    <a href="#">Setting Ad Budget-A Sorcoic</a>Locked by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                  <div class="row_recent">
                    <div class="recnt_pdf_doc"></div>
                    <a href="#">Setting Ad Budget-A Sorcoic</a>Locked by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                  <div class="row_recent">
                    <div class="recnt_pdf_pdf"></div>
                    <a href="#">Setting Ad Budget-A Sorcoic</a>Locked by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                  <div class="row_recent">
                    <div class="recnt_pdf_doc"></div>
                    <a href="#">Setting Ad Budget-A Sorcoic</a>Locked by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                  <div class="row_recent">
                    <div class="recnt_pdf_doc"></div>
                    <a href="#">Setting Ad Budget-A Sorcoic</a>Locked by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                  <div class="row_recent">
                    <div class="recnt_pdf_doc"></div>
                    <a href="#">Setting Ad Budget-A Sorcoic</a>Locked by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                  </div>   
                  <div class="claer"></div>
                  <a href="#" class="bottom_link">
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