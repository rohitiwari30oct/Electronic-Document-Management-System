<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" ></script>
<jsp:include page="header.jsp" />
<div id="head">
<!----------------/// Header End Here ----------> 
<!------------// Testing CONTENT STARTED HERE ------------------>
<div id="content"> 
<jsp:include page="left.jsp" />  
 <!--                                                -------------// TOP ARROW -----------
      <div class="uparrowdiv">
        <div class="login_photo">
          <div class="change_photo">Change photo</div>
        </div>
        <div class="right_box"> <strong>Hariom Srivastava</strong> <span>hariom15791@gmail.com</span>
            <img src="images/Progress_Bar.png" />
          <div class="claer"></div>
          <div class="full_profile">View profile</div>
      
          <div class="sign_out">Sign out</div> </div>
      </div>
      ------------// TOP ARROW END ---------- 
   -->
<div id="fileSystem">
   
<jsp:include page="fileSystem.jsp" />
</div>
  <!-----------------//// BOTTOM VIEW STARTED HERE ------------------> 
  
  <!-------------------------/// RIGHT PANNEL END -----------------> 
  
</div>

<script type="text/javascript">
function getFileSystem(folderPath){
	//alert(folderPath);
	 $.ajax({
         type: "GET",
         url: "${pageContext.request.contextPath}/getFileSystem",
         data: {'path':folderPath},
         contentType: "application/json",
         async: false,
         success: function (data) {
             $("#fileSystem").html(data);
         }
     });
	
}
</script>
<!-----------------/// Testing Content End Here ------------------> 
  <!---------------//// ADD GROUP USER POP UP ----------->
  <div id="contactdiv_6">
   	<form:form class="form" action="uploadDocument" method="post"
				id="contact" commandName="fileupload" enctype="multipart/form-data">
				<img src="images/button_cancel.png" class="img" id="cancel" alt="" />
				<h3>Add New Documents</h3>
				<hr />
				<br />
				<label>File Name: <span>*</span></label>
				<br />
				<input type="file" class="custom-file-input" name="filedata"
					multiple="multiple" />
				<br />
				<br />
				<div class="claer"></div>
				<!-- <input type="checkbox" />
				<label>Notify to users</label> -->
				<br />
				<br />
				<input type="submit" id="send" value="Upload" />
				<input type="button" id="cancel" value="Cancel" />
				<br />
			</form:form>
  </div>
  <!-----------------/// ADD GROUP POP UP  END HERE ----------> 

    <!---------------//// ADD GROUP USER POP UP ----------->
  <div id="contactdiv_66">
    <form class="form" action="#" id="contact">
      <h3>Create Folder</h3>
        <p >Please enter a new Folder name <span>*</span></p>
      <input type="text" id="folderName" />
       <br/>
      <input type="button" id="send" value="Create" onclick="createFolder()"/>
      <input type="button" id="cancel" value="Cancel"/>
      <br/>
      <script type="text/javascript">
      function createFolder(){
    	 var folder=$('#folderName').val();
   	  		//alert(folder);
    	 $.ajax({
             type: "GET",
             url: "${pageContext.request.contextPath}/createFolder",
             data: {'folderName':folder},
             contentType: "application/json",
             async: false,
             success: function (data) {
                 $("#folderView>.row_content>ul").append(data);
            	// alert(data);
             }

         });
         $("#contactdiv_66").css("display", "none");
      }
      
      </script>
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


