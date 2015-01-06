<jsp:include page="header.jsp" />
<div id="head">

<!----------------/// Header End Here ----------> 
<!------------// Testing CONTENT STARTED HERE ------------------>
<div id="content"> 
   <jsp:include page="left.jsp" />  
  <!-----------------/// LEFT PANNEL ------------------>
  
    <div class="right_pannel"> 
                <div class="right_part_started">
                         <!-------------------/// Right Heading Started Here -------->
                              <div class="strip_details">
                                <div class="home_heading_11"></div>
                                <span>Location</span><span> > </span><div class="path">Document</div>
                                <div class="claer"></div>
                              </div>
                              
                              <div class="main_document_content">
                               <!-----------/// DOCUMENT VIEW LEFT PART ------------->
                                       <div class="document_right">
            <div class="docu_pre_heading">
              <div class="doc_pdf"></div>
              COMPANY_MAIN_DOCUMENT.PDF
              <div class="full_scren_view">
                <div class="full_screen_icon"></div>
                </div>
            </div>
            <div class="document_option">
              <div class="preview">Prev</div>
              <span>Page 1 to 10</span>
              <div class="next_doc">Next</div>
              <span>Jump to Page</span>
              <input type="text" />
            </div>
            <img src="images/pdf_imges.png" /> </div>
                               <!--------------/// DOCUMENT LEFT PART ----------------> 
                               
                               <!----------------/// RIGHT PART CONTENT STARED HERE -------------->
                               <!-----------/// DOCUMENT RIGHT VIEW ---------------->
                                                   <div class="document_left"> 
            
            <!------------/// DOCUMENT ACTION ------------>
            <div class="document_action"> 
              <!----------/// Document_Action_Haeding --------->
              <div class="document_heading"> DOCUMENT ACTION </div>
              <!-------------/// Document Action Haeding End --->
              <ul>
                <li class="download_document">Download</li>
                <li class="edit_document">Edit Metadata</li>
                <li class="asign_document">Assign Workflow</li>
                <li class="copy_to_document">Copy To</li>
                <li class="move_to_document">Move To</li>
                 <li class="delete_document">Delete</li>
                <li class="delete_document_1">Save</li>
              </ul>
            </div>
            <!------------// DOCUMENT ACTION --------------->
            <div class="mata_data"> 
              
              <!----------/// META_DATA_Action_Haeding --------->
              <div class="document_heading"> METADATA </div>
              <!-------------/// META_DATA Action Haeding End --->
              
              <ul>
                <li>
                  <div class="meta_name">Name</div>
                  : </li>
                <li>
                  <div class="meta_name">Content</div>
                  : </li>
                <li>
                  <div class="document_sub_heading">Document</div>
                </li>
                <li>
                  <div class="meta_name">Title</div>
                  : </li>
                <li>
                  <div class="meta_name">Description</div>
                  : </li>
                <li>
                  <div class="document_sub_heading">Marketing Meeting</div>
                </li>
                <li>
                  <div class="meta_name">Size</div>
                  : </li>
                <li>
                  <div class="meta_name">Creator</div>
                  : </li>
                <li>
                  <div class="meta_name">Creator on</div>
                  : </li>
                <li>
                  <div class="meta_name">Modifier</div>
                  : </li>
                <li>
                  <div class="meta_name">Modified on</div>
                  : </li>
              </ul>
              <div class="claer"></div>
            </div>
          </div>
          <div class="claer"></div>
          <!-----------/// DOCUMENT END HERE --------------->
          </div>
                               <!-----------------/// RIGHT PART END HERE ------------------->
                        <!-------------------// Right Heading End Here ------------->
                        
                
                
                
                </div>
    </div>
  
  <div class="clear"></div>
  <!-----------------/// Testing Content End Here ------------------> 
  <!---------------//// ADD GROUP USER POP UP ----------->
  <div id="contactdiv_6">
    <form class="form" action="#" id="contact">
      <h3>Add New Documents</h3>
      <p>File Name: <span>*</span></p>
      <input type="file" class="custom-file-input attachment_file">
       <div class="claer"></div>
       <input type="checkbox" class="form_bottom_space" /><label>Notify to users</label>
       <div class="claer"></div>
      <input type="button" id="send" value="Add"/>
      <input type="button" id="cancel" value="Cancel"/>
      <br/>
    </form>
  </div>
  <!-----------------/// ADD GROUP POP UP  END HERE ----------> 

    <!---------------//// ADD GROUP USER POP UP ----------->
  <div id="contactdiv_66">
    <form class="form" action="#" id="contact">
      <h3>Create Folder</h3>
        <p >Please enter a new Folder name <span>*</span></p>
      <input type="text" id="name" />
       <br/>
      <input type="button" id="send" value="Create"/>
      <input type="button" id="cancel" value="Cancel"/>
      <br/>
    </form>
  </div>
  <!-----------------/// ADD GROUP POP UP  END HERE ----------> 
  
     <!---------------//// Delete USER POP UP ----------->
  <div id="contactdiv_77">
    <form class="form" action="#" id="contact">
      <h3>  Confirmation </h3>
       <p class="form_bottom_space">Do you really want to delete this folder ?</p>
      <input type="button" id="send" value="Delete"/>
      <input type="button" id="cancel" value="Cancel"/>
    </form>
  </div>
  <!-----------------/// DELETE POP UP  END HERE ----------> 

<!-------------------/// CHAT BOX CONTENT STARED HERE -------------->
<!-----------------/// TESTING FOOTER STARTED HERE ------------>
<jsp:include page="footer.jsp" />