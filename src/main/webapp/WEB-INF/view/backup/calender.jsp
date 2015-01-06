<jsp:include page="header.jsp" />
<div id="content" class="user_dasboard user_dasboard_left top_space">

<!----------------/// Left Portion started Here ------------>
 <jsp:include page="left.jsp" />  
<!----------------/// LEft Portion End Here ----------------->
 <div id="tab22" class="user_static tab_content_1">

      <div class="main_statical main_statical_new"> 
              
              <img src="images/calender.jpg" class="calender_images" />
              
            
                 <div class="claer"></div>
            </div>



<div class="claer"></div>

</div>



<div class="claer"></div>

</div>
<!------------------------/// Tab 22 END ----------------->


</div> <!-- .tab_container --> 

</div>

</div>

<div class="claer"></div>
</div>
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
<jsp:include page="footer.jsp" />