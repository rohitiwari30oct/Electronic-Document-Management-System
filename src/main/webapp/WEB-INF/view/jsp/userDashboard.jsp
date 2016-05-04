<div id="activitiForms">
<%
%>
<div class="right other_pages_user">
   	<!--------/// MID CONTENT STARTED HERE ---------->
	<div id="head">
		<!----------------/// Header End Here ---------->
		<!------------// Testing CONTENT STARTED HERE ------------------>
		<div id="content">
			<div id="fileSystem">
			<jsp:include page="fileSystem.jsp" />
			</div>
			<!-----------------/// Testing Content End Here ------------------>
			<!-------/// ALL POP UP STATED HERE ------>
			<!---// RIGHT END here ---->
			<div class="clear"></div>
		</div>
	</div>
                         <%-- 
                         <div class="trash_menu">
                         <%
                        String userid= (String)request.getAttribute("userid");
                         %>
                                     <h1>User Dashboard (<%=userid %>)</h1>
                                   </div>
                                 <!----------// USER DASBOARD STARED HERE --------->
                                 <div class="user_dasboard_scroll">
                                      <!-------/// INNER CONTENT STARTED HERE -------->
                                      <div class="user_dasboard_inner">
                                      
                                                <div class="dasboard_updates">
                                                      <div class="dasboard_updates_heading"> UPDATES </div>
                                                      <!--------------//LIVE CHEAT LIST------------>
                                                  <!--      <div class="dasboard_updates_content">
                                                           <p>Your Leave Application Has Been Approved.</p>
                                                           <p>Your Medical Claim Has Been Processed.</p>
                                                           <p>Your Travel Expense Pending with Account Department.</p>
                                                           <p>Your Medical Claim Has Been Processed.</p>
                                                           <p>Your Leave Application Has Been Approved.</p>
                                                           <p>Your Leave Application Has Been Approved.</p>
                                                           <p>Your Medical Claim Has Been Processed.</p>
                                                           <p>Your Travel Expense Pending with Account Department.</p>
                                                           <p>Your Medical Claim Has Been Processed.</p>
                                                           <p>Your Leave Application Has Been Approved.</p>  
                                                      </div> -->
                                                      
                                                      <!-------------// LIVE CHEAT LIST END -------> 
                                            </div>
                                                <div class="tasks">
                                                     <div class="tasks_heading">
                                                      <span>TASKS</span>
                                                      <!--  <div class="heaing_top_tab"> 
                                                         <a href="javascript:void(0);">Month</a> 
                                                         <a href="javascript:void(0);">Week</a> 
                                                         <a href="javascript:void(0);">Day</a>
                                                       </div> -->
                                                      </div>
        <!------------/// Appoint Tab Content Started ---------->
                                                    <div class="tasks_tab">
                                                       <table>
                                                          <tr>
                                                             <td class="tab_menu_1 tab_menu_1_bg border_right_td"><a href="javascript:void(0);">Active Tasks</a></td>
                                                             <td class="tab_menu_2"><a href="javascript:void(0);">Completed Task</a></td>
                                                          </tr>
                                                       </table>
                                                       <div class="claer"></div>
                                                       <div class="appoment_tab_1 tasks_tab_1">
                                             <!--  <div class="event_box">
                                                   <ul class="event_scroll_1">
                                                    <li>The lifetime achievement award is presented to J R Nanda,by V K Saraswat, DG DRDO
                                                      ..</li>
                                                    <li>The lifetime achievement award is presented to J R Nanda,by V K Saraswat, DG DRDO
                                                      ..</li>
                                                    <li>The lifetime achievement award is presented to J R Nanda,by V K Saraswat, DG DRDO
                                                      ..</li>
                                                    <li>The lifetime achievement award is presented to J R Nanda,by V K Saraswat, DG DRDO
                                                      ..</li>
                                                  </ul>
                                                  <a href="javascript:void(0);" class="bottom_link">
                                                       <div class="botom_view_more"> View All </div>
                                                  </a> 
                                              </div>-->
                                                       </div>
                                                         <div class="appoment_tab_2 tasks_tab_2">
                                                                <!-- <div class="event_box">
                                                     <ul class="event_scroll">
                                                  <li>The   Completed Task lifetime achievement award is presented to J R Nanda,by V K Saraswat, DG DRDO
                                                    ..</li>
                                                  <li>The lifetime achievement award is presented to J R Nanda,by V K Saraswat, DG DRDO
                                                    ..</li>
                                                  <li>The lifetime achievement award is presented to J R Nanda,by V K Saraswat, DG DRDO
                                                    ..</li>
                                                  <li>The lifetime achievement award is presented to J R Nanda,by V K Saraswat, DG DRDO
                                                    ..</li>
                                                </ul>
                                                     <a href="javascript:void(0);" class="bottom_link">
                                                <div class="botom_view_more"> View All </div>
                                                </a>
                                             </div> -->
                                                         </div>
                                                    </div>
        <!----------/// Appoinment End --------------------------> 
        
                                               </div>
                                            
                                      <!-------/// INNER CONTENT END HERE ------------>
                                         <div class="clear"></div>
                                      
                                               <div class="mid_deletde_iteam">
                                            <div class="recently_deleted_document_heading"> RECENTLY DELETED DOCUMENTS </div>
        <!-----------------// RECENTALY DOCUMENT ------------------>
                                            <div class="deleted_item_doc">
                                            <!-- <table>
                                                  <tr>
                                                     <td class="text_align border_right_td">Type</td>
                                                     <td class="text_align border_right_td name_length">Name</td>
                                                     <td colspan="3">Delete On</td>
                                                  </tr>
                                                  <tr>
                                                     <td><div class="recnt_pdf_pdf"></div></td>
                                                     <td class="name_length">Main_folder_for_office</td>
                                                     <td>18-09-2014</td>
                                                     <td><div class="restore"></div></td>
                                                     <td><div class="delete"></div></td>
                                                  </tr>
                                                   <tr>
                                                     <td><div class="recnt_pdf_pdf"></div></td>
                                                     <td class="name_length">Main_folder_for_office</td>
                                                     <td>18-09-2014</td>
                                                     <td><div class="restore"></div></td>
                                                     <td><div class="delete"></div></td>
                                                  </tr>
                                                   <tr>
                                                     <td><div class="recnt_pdf_pdf"></div></td>
                                                     <td class="name_length">Main_folder_for_office</td>
                                                     <td>18-09-2014</td>
                                                     <td><div class="restore"></div></td>
                                                     <td><div class="delete"></div></td>
                                                  </tr>
                                                   <tr>
                                                     <td><div class="recnt_pdf_pdf"></div></td>
                                                     <td class="name_length">Main_folder_for_office</td>
                                                     <td>18-09-2014</td>
                                                     <td><div class="restore"></div></td>
                                                     <td><div class="delete"></div></td>
                                                  </tr>
                                                   <tr>
                                                     <td><div class="recnt_pdf_pdf"></div></td>
                                                     <td class="name_length">Main_folder_for_office</td>
                                                     <td>18-09-2014</td>
                                                     <td><div class="restore"></div></td>
                                                     <td><div class="delete"></div></td>
                                                  </tr>
                                                   <tr>
                                                     <td><div class="recnt_pdf_pdf"></div></td>
                                                     <td class="name_length">Main_folder_for_office</td>
                                                     <td>18-09-2014</td>
                                                     <td><div class="restore"></div></td>
                                                     <td><div class="delete"></div></td>
                                                  </tr>
                                                   <tr>
                                                     <td><div class="recnt_pdf_pdf"></div></td>
                                                     <td class="name_length">Main_folder_for_office</td>
                                                     <td>18-09-2014</td>
                                                     <td><div class="restore"></div></td>
                                                     <td><div class="delete"></div></td>
                                                  </tr>
                                                   <tr>
                                                     <td><div class="recnt_pdf_pdf"></div></td>
                                                     <td class="name_length">Main_folder_for_office</td>
                                                     <td>18-09-2014</td>
                                                     <td><div class="restore"></div></td>
                                                     <td><div class="delete"></div></td>
                                                  </tr>
                                                   <tr>
                                                     <td><div class="recnt_pdf_pdf"></div></td>
                                                     <td class="name_length">Main_folder_for_office</td>
                                                     <td>18-09-2014</td>
                                                     <td><div class="restore"></div></td>
                                                     <td><div class="delete"></div></td>
                                                  </tr>
                                                   <tr>
                                                     <td><div class="recnt_pdf_pdf"></div></td>
                                                     <td class="name_length">Main_folder_for_office</td>
                                                     <td>18-09-2014</td>
                                                     <td><div class="restore"></div></td>
                                                     <td><div class="delete"></div></td>
                                                  </tr>
                                                  <tr>
                                                     <td><div class="recnt_pdf_pdf"></div></td>
                                                     <td class="name_length">Main_folder_for_office</td>
                                                     <td>18-09-2014</td>
                                                     <td><div class="restore"></div></td>
                                                     <td><div class="delete"></div></td>
                                                  </tr>
                                                  <tr>
                                                     <td><div class="recnt_pdf_pdf"></div></td>
                                                     <td class="name_length">Main_folder_for_office</td>
                                                     <td>18-09-2014</td>
                                                     <td><div class="restore"></div></td>
                                                     <td><div class="delete"></div></td>
                                                  </tr>
                                                   <tr>
                                                     <td><div class="recnt_pdf_pdf"></div></td>
                                                     <td class="name_length">Main_folder_for_office</td>
                                                     <td>18-09-2014</td>
                                                     <td><div class="restore"></div></td>
                                                     <td><div class="delete"></div></td>
                                                  </tr>
                                              
                                            </table> -->
      <!---  <ul class="delete_heading">
          <li>
            <div class="del_1 type">Type</div>
            <div class="del_2">Name</div>
            <div class="del_3 deletd_on">Delete On</div>
            <div class="del_4"></div>
          </li>
        </ul>
        <ul class="delete_scroll">
          <li>
            <div class="del_1 recnt_pdf_pdf user_margin"></div>
            <div class="del_2">Main_folder_for_office</div>
            <div class="del_3">18-09-2014</div>
            <div class="del_4 restore"></div>
            <div class="del_5 delete"></div>
          </li>
          <li>
            <div class="del_1 recnt_pdf_doc user_margin"></div>
            <div class="del_2">Main_folder_for_office</div>
            <div class="del_3">18-09-2014</div>
            <div class="del_4 restore"></div>
            <div class="del_5 delete"></div>
          </li>
          <li>
            <div class="del_1 recnt_pdf_doc user_margin"></div>
            <div class="del_2">Main_folder_for_office</div>
            <div class="del_3">18-09-2014</div>
            <div class="del_4 restore"></div>
            <div class="del_5 delete"></div>
          </li>
          <li>
            <div class="del_1 recnt_pdf_doc user_margin"></div>
            <div class="del_2">Main_folder_for_office</div>
            <div class="del_3">18-09-2014</div>
            <div class="del_4 restore"></div>
            <div class="del_5 delete"></div>
          </li>
          <li>
            <div class="del_1 doc_icon user_margin"></div>
            <div class="del_2">Main_folder_for_office</div>
            <div class="del_3">18-09-2014</div>
            <div class="del_4 restore"></div>
            <div class="del_5 delete"></div>
          </li>
          <li>
            <div class="del_1 recnt_pdf_pdf user_margin"></div>
            <div class="del_2">Main_folder_for_office</div>
            <div class="del_3">18-09-2014</div>
            <div class="del_4 restore"></div>
            <div class="del_5 delete"></div>
          </li>
          <li>
            <div class="del_1 recnt_pdf_pdf user_margin"></div>
            <div class="del_2">Main_folder_for_office</div>
            <div class="del_3">18-09-2014</div>
            <div class="del_4 restore"></div>
            <div class="del_5 delete"></div>
          </li>
          <li>
            <div class="del_1 recnt_pdf_pdf user_margin"></div>
            <div class="del_2">Main_folder_for_office</div>
            <div class="del_3">18-09-2014</div>
            <div class="del_4 restore"></div>
            <div class="del_5 delete"></div>
          </li>
          <li>
            <div class="del_1 recnt_pdf_pdf user_margin"></div>
            <div class="del_2">Main_folder_for_office</div>
            <div class="del_3">18-09-2014</div>
            <div class="del_4 restore"></div>
            <div class="del_5 delete"></div>
          </li>
          <li>
            <div class="del_1 doc_icon"></div>
            <div class="del_2">Main_folder_for_office</div>
            <div class="del_3">18-09-2014</div>
            <div class="del_4 restore"></div>
            <div class="del_5 delete"></div>
          </li>
          <li>
            <div class="del_1 doc_icon"></div>
            <div class="del_2">Main_folder_for_office</div>
            <div class="del_3">18-09-2014</div>
            <div class="del_4 restore"></div>
            <div class="del_5 delete"></div>
          </li>
          <li>
            <div class="del_1 doc_icon"></div>
            <div class="del_2">Main_folder_for_office</div>
            <div class="del_3">18-09-2014</div>
            <div class="del_4 restore"></div>
            <div class="del_5 delete"></div>
          </li>
          <li>
            <div class="del_1 doc_icon"></div>
            <div class="del_2">Main_folder_for_office</div>
            <div class="del_3">18-09-2014</div>
            <div class="del_4 restore"></div>
            <div class="del_5 delete"></div>
          </li>
          </ul>--->
          </div>
        
           <!--                                  <a href="javascript:void(0);" class="bottom_link">
        <div class="botom_view_more"> View All </div>
        </a> --> 
                                           </div>
            
                                               <div class="dasboard_event">
                                                    <div class="dasboard_event_heading"> EVENTS </div>
      
                                    <!--------------//LIVE CHEAT LIST------------>
                                                   <!-- <div class="dasboard_event_box">
                                                        <ul class="dasboard_event_box_scroll">
          <li> 
               <strong>Lorem Ipsum is simply dummy</strong>
               <div class="claer"></div>
                        <span>OCT 1, 2014,17:30AM</span>
                        <div class="claer"></div>
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it
                        <a href="javascript:void(0);">Read More..</a>
          </li>
           <li> 
               <strong>Lorem Ipsum is simply dummy</strong>
               <div class="claer"></div>
                        <span>OCT 1, 2014,17:30AM</span>
                        <div class="claer"></div>
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it
                        <a href="javascript:void(0);">Read More..</a>
          </li>
            <li> 
               <strong>Lorem Ipsum is simply dummy</strong>
               <div class="claer"></div>
                        <span>OCT 1, 2014,17:30AM</span>
                        <div class="claer"></div>
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it
                        <a href="javascript:void(0);">Read More..</a>
          </li>
            <li> 
               <strong>Lorem Ipsum is simply dummy</strong>
               <div class="claer"></div>
                        <span>OCT 1, 2014,17:30AM</span>
                        <div class="claer"></div>
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it
                        <a href="javascript:void(0);">Read More..</a>
          </li>
            <li> 
               <strong>Lorem Ipsum is simply dummy</strong>
               <div class="claer"></div>
                        <span>OCT 1, 2014,17:30AM</span>
                        <div class="claer"></div>
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it
                        <a href="javascript:void(0);">Read More..</a>
          </li>
            <li> 
               <strong>Lorem Ipsum is simply dummy</strong>
               <div class="claer"></div>
                        <span>OCT 1, 2014,17:30AM</span>
                        <div class="claer"></div>
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it
                        <a href="javascript:void(0);">Read More..</a>
          </li>
            <li> 
               <strong>Lorem Ipsum is simply dummy</strong>
               <div class="claer"></div>
                        <span>OCT 1, 2014,17:30AM</span>
                        <div class="claer"></div>
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it
                        <a href="javascript:void(0);">Read More..</a>
          </li>
            <li> 
               <strong>Lorem Ipsum is simply dummy</strong>
               <div class="claer"></div>
                        <span>OCT 1, 2014,17:30AM</span>
                        <div class="claer"></div>
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it
                        <a href="javascript:void(0);">Read More..</a>
          </li>  <li> 
               <strong>Lorem Ipsum is simply dummy</strong>
               <div class="claer"></div>
                        <span>OCT 1, 2014,17:30AM</span>
                        <div class="claer"></div>
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it
                        <a href="javascript:void(0);">Read More..</a>
          </li>
            <li> 
               <strong>Lorem Ipsum is simply dummy</strong>
               <div class="claer"></div>
                        <span>OCT 1, 2014,17:30AM</span>
                        <div class="claer"></div>
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it
                        <a href="javascript:void(0);">Read More..</a>
          </li>
            <li> 
               <strong>Lorem Ipsum is simply dummy</strong>
               <div class="claer"></div>
                        <span>OCT 1, 2014,17:30AM</span>
                        <div class="claer"></div>
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it
                        <a href="javascript:void(0);">Read More..</a>
          </li>
            <li> 
               <strong>Lorem Ipsum is simply dummy</strong>
               <div class="claer"></div>
                        <span>OCT 1, 2014,17:30AM</span>
                        <div class="claer"></div>
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it
                        <a href="javascript:void(0);">Read More..</a>
          </li>
        </ul>
                                                  </div> -->
      
                                    <!-------------// LIVE CHEAT LIST END -------> 
      
                                                </div>
                                            
                                             <!--  <div class="recently_modified_documents">
                                                  <div class="recently_modified_document_heading"> RECENTLY MODIFIED DOCUMENTS </div>
                                                   <div class="recently_modified_document_scroll">
                                                           ----------/// Row_STARTED HERE ---------
                                                               <div class="row_recent">
            <div class="recnt_pdf"> </div>
            <a href="javascript:void(0);">Setting Ad Budget-A Sorcoic</a>Modified by<a href="javascript:void(0);" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                                                           -----------// ROW STARTED HERE ------------ 
                                                           ----------/// Row_STARTED HERE ---------
                                                               <div class="row_recent">
            <div class="recnt_pdf_pdf"> </div>
            <a href="javascript:void(0);">Setting Ad Budget-A Sorcoic</a>Modified by<a href="javascript:void(0);" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                                                           -----------// ROW STARTED HERE ------------ 
                                                           ----------/// Row_STARTED HERE ---------
                                                               <div class="row_recent">
            <div class="recnt_pdf_pdf"> </div>
            <a href="javascript:void(0);">Setting Ad Budget-A Sorcoic</a>Modified by<a href="javascript:void(0);" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                                                           -----------// ROW STARTED HERE ------------ 
                                                           ----------/// Row_STARTED HERE ---------
                                                               <div class="row_recent">
            <div class="recnt_pdf_doc"> </div>
            <a href="javascript:void(0);">Setting Ad Budget-A Sorcoic</a>Modified by<a href="javascript:void(0);" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                                                           -----------// ROW STARTED HERE ------------ 
                                                           ----------/// Row_STARTED HERE ---------
                                                                <div class="row_recent">
            <div class="recnt_pdf_doc"> </div>
            <a href="javascript:void(0);">Setting Ad Budget-A Sorcoic</a>Modified by<a href="javascript:void(0);" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                                                           -----------// ROW STARTED HERE ------------ 
                                                           ----------/// Row_STARTED HERE ---------
                                                                <div class="row_recent">
            <div class="recnt_pdf_doc"> </div>
            <a href="javascript:void(0);">Setting Ad Budget-A Sorcoic</a>Modified by<a href="javascript:void(0);" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                                                           -----------// ROW STARTED HERE ------------ 
                                                  </div> -->
                                                  <!--  <a href="javascript:void(0);" class="bottom_link">
                                                   <div class="botom_view_more"> View All </div>
                                                   </a> 
                                             </div>
                                              <div class="clear"></div>
                                      </div>-->
                                           <div class="clear"></div>
                                 </div>
                                 <!-----------/// USER DASBOARD END HERE ------------> --%>
                        </div>
                        <!----// RIGHT END HERE -->
                                                            
             </div>
 <script type="text/javascript">

jQuery.get("fileSystem", 
		function( data ) {
		if(data=="true"){
			location.href="ajaxTrue";
		}else{
         $( ".right" ).html( data );
        
        }});
</script> 