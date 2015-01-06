<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title> EDMS DESIGN </title>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/interface/ReverseClass.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>

<!--jQuery and jQuery UI with jQuery Chat-->
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<link type="text/css" href="css/jquery.ui.chatbox.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.ui.chatbox.js"></script>

<script src="js/jquery-1.7.2.min.js" type="application/javascript" ></script>
<script src="js/left_event.js" type="application/javascript"></script>
<script src="js/jquery_popup.js"></script>
<script type="text/javascript">
/* <![CDATA[ */
$(document).ready(function(){
	$("#tabs li").click(function() {
		//	First remove class "active" from currently active tab
		$("#tabs li").removeClass('active');

		//	Now add class "active" to the selected/clicked tab
		$(this).addClass("active");

		//	Hide all tab content
		$(".tab_content").hide();

		//	Here we get the href value of the selected tab
		var selected_tab = $(this).find("a").attr("href");

		//	Show the selected tab content
		$(selected_tab).fadeIn();

		//	At the end, we add return false so that the click on the link is not executed
		return false;
	});
});
/* ]]> */
</script>
<script type="text/javascript">


$(document).ready(function() {

	$(".tab_content_1").hide();
	$(".tab_content_1:first").show(); 

	$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("active");
		$(this).addClass("active");
		$(".tab_content_1").hide();
		var activeTab = $(this).attr("rel"); 
		$("#"+activeTab).fadeIn(); 
	});
});

</script>
<!-- <script type="text/javascript" src="js/milonic_src.js"></script>
<script type="text/javascript" src="js/mmenudom.js"></script>
<script type="text/javascript" src="js/menu_data.js"></script>
<script type="text/javascript" src="js/contextmenu.js"></script> -->

<link href="css/style.css" type="text/css" rel="stylesheet"/>
<link rel="stylesheet" href="css/jquery_popup.css" />

<script type="text/javascript">
function getActivitiDiagramsPage(){
	jQuery.get("header_activity", function( data ) {
		 $( "#variedPagesHere" ).html( data );
		});
	jQuery.get("header_activitydiagrams", function( data ) {
		 $( "#activitiForms" ).html( data );
		});
}
</script>
<script type="text/javascript">
	function getPage(requestPage) {
		//alert(requestPage);
		/* 	$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/getFileSystem",
			data : {
				'path' : folderPath
			},
			contentType : "application/json",
			async : false,
			success : function(data) {
				$("#fileSystem").html(data);
			}
		}); */
		/*  jQuery.get("myDocument", function( data ) {
			 $( "#variedPagesHere" ).html( data );
			});  */
		jQuery.get(requestPage, 
		/* 		 {
			'path' : folderPath
		}, */
			function( data ) {
	         $( ".right" ).html( data );
	        });
	}
</script>
 <script type="text/javascript">
	function getSubFolders(folderPath) {
		var divFolder = folderPath.substr(6);
	     if($(".listdiv" + divFolder).css('display')=='none')
		  {
			  $(".listdiv" + divFolder).addClass('subfolder_open');
			  $("#sign" + divFolder).addClass('subfolder_minus');

	      }
		  else
		  {
			  $(".listdiv" + divFolder).removeClass('subfolder_open');
			  $("#sign" + divFolder).removeClass('subfolder_minus');
		  }
		
		//alert(folderPath);
		//alert(divFolder);
	 	var divContent = $(".listdiv" + divFolder).html();
		//alert(divContent.length);
		if (divContent.length > 30) {
		} else {

			//alert(divContent);
			var folderId = "#" + folderPath;
			$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/getSubFolders",
				data : {
					'path' : folderPath
				},
				success : function(data) {
					//alert(data);
					//$(".mydocument_subfolder").html(data);
					divFolder=".listdiv" + divFolder;

					//alert(divFolder);
					$(divFolder).html(data);
				}
			});
		}
	//	getFileSystem(folderPath);
		}
</script>
<script type="text/javascript">
	function getFileSystem(folderPath) {
	//	alert(folderPath);
	/* 	$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/getFileSystem",
			data : {
				'path' : folderPath
			},
			contentType : "application/json",
			async : false,
			success : function(data) {
				$("#fileSystem").html(data);
			}
		}); */


		/*  jQuery.get("myDocument", function( data ) {
			 $( "#variedPagesHere" ).html( data );
			});  */
		jQuery.get("getFileSystem", 
				 {
			'path' : folderPath
		},
				function( data ) {
	         $( ".right" ).html( data );
	        });
	}
</script>
<script type="text/javascript">
	function getDocProperties(folderPath) {
	//	alert(folderPath);
	/* 	$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/getFileSystem",
			data : {
				'path' : folderPath
			},
			contentType : "application/json",
			async : false,
			success : function(data) {
				$("#fileSystem").html(data);
			}
		}); */


		/*  jQuery.get("myDocument", function( data ) {
			 $( "#variedPagesHere" ).html( data );
			});  */
		jQuery.get("getDocProperties", 
				 {
			'path' : folderPath
		},
				function( data ) {
	         $( ".right_icon_main" ).html( data );
	        });
	}
</script>



<script type="text/javascript">
	function getSharedFileSystem(folderPath) {
		jQuery.get("getSharedFileSystem", 
				 {
			'path' : folderPath
		},
				function( data ) {
	         $( ".right" ).html( data );
	        });
	}
</script>
</head>
      <body>
              <div class="main_div">
                        <!----// HEADER --->
                        <div class="main_header">
                                  <div class="header">
                                     <div class="logo_space">
                                          <!---/// LOGO --->
                                           <img src="images/logo.png" />
                                            <!---//LOGO END -->
                                     </div>
                                    <!--------// SEARCH HERE --------->
                                  <div class="search_main">  
                                    <div class="search_main_div">
                                          <div class="search_icon"> <img src="images/search.png"> </div>
                                          <div class="serach_top" onclick="tab_search()"> </div>
                                          <div class="clear"></div>
                                    </div>
                                    <div class="search_box_details"> 
                          <!-------Tab Content Here -------------->
                         <div id="tabs_wrapper">
                                <div id="tabs_container">
                                        <ul id="tabs">
                                              <li class="active"><a href="#tab1">BASIC</a></li>
                                              <li><a class="icon_accept" href="#tab2">ADVANCED</a></li>
                                              <li><a href="#tab3">RECENT SEARCH</a></li>
                                        </ul>
                               </div>
                         <div id="tabs_content_container">
                                      <div id="tab1" class="tab_content" style="display: block;"> 
                                      <!-------------// Tab Content Started Here ----------------->
                                              <ul>
                                                      <li>GROUP</li>
                                                      <li>
                                                        <select>
                                                          <option> Group 1</option>
                                                          <option> Group 2</option>
                                                          <option> Group 3</option>
                                                        </select>
                                                      </li>
                                                      <li>USER</li>
                                                      <li>
                                                        <input  type="text" />
                                                      </li>
                                                      <li>TITLE</li>
                                                      <li>
                                                        <input  type="text" />
                                                      </li>
                                                      <li>KEYWORDS</li>
                                                      <li>
                                                        <input  type="text" />
                                                      </li>
                                                      <li>DATE</li>
                                                      <li></li>
                                                      <li>LAST MONTH</li>
                                                      <li>
                                                        <select>
                                                          <option> Group 1</option>
                                                          <option> Group 2</option>
                                                          <option> Group 3</option>
                                                        </select>
                                                      </li>
                                                      <li>
                                                        <div class="search_icon_tab"> <img src="images/search.png" /> </div>
                                                      </li>
                                              </ul>
                                      <!--------------/// Tab End Here ---------------------------> 
                                    </div>
                                      <div id="tab2" class="tab_content"> 
                                            <!-----------TABN CONTENT STARED HERE ---------------->
                                         <ul>
                                                    <li>FOLDER</li>
                                                    <li>
                                                      <input  type="text" />
                                                    </li>
                                                    <li>TYPE</li>
                                                    <li>
                                                      <input type="checkbox" />
                                                      <label>DOCUMENT</label>
                                                      <input type="checkbox" />
                                                      <label>FOLDER</label>
                                                      </li>
                                                      <div class="claer"></div>
                                                    <li>FILE TYPE</li>
                                                    <li>
                                                      <select>
                                                        <option>Select File Type</option>
                                                        <option>.PDF</option>
                                                        <option>.DOC</option>
                                                        <option>.EXE</option>
                                                        <option>.EXECl</option>
                                                      </select>
                                                    </li>
                                                    <li>NOTES</li>
                                                    <li>
                                                      <input  type="text" />
                                                    </li>
                                                    <li>
                                                      <div class="search_icon_tab"> <img src="images/search.png" /> </div>
                                                    </li>
                                        </ul>
                                            <!------------TAB CONTENT END HERE ----------------------> 
                              </div>
                                       <div id="tab3" class="tab_content">
                                <p>Suspendisse blandit velit eget erat suscipit in malesuada odio venenatis.</p>
                              </div>
                        </div>
        </div>
        <!------------------Tab Content End Here ------------------> 
      </div>
                                     <div class="clear"></div>
                                  </div>
                                    <!---------/// SEARCH END HERE ---------->
                                    <div class="user_deatils">
                                          <div class="user_details_left"> Welcome : <strong>Hariom Srivastava</strong>
                                          <div class="claer"></div> 
                                    </div>
                                    <div class="user_images"> </div>
                                    <!----/// TOP PROFILE STARTED HERE ----------->
                                    <div class="uparrowdiv">
                                        <div class="login_photo">
                                          <div class="change_photo">Change photo</div>
                                        </div>
                                        <div class="right_box"> 
                                              <div class="info_1">
                                              <strong>Hariom Srivastava</strong> 
                                              <span>hariom15791@gmail.com</span>
                                              </div>
                                              <img src="images/Progress_Bar.png" />
                                              <div class="claer"></div>
                                              <div class="bottom_info">
                                                   <div class="full_profile">View profile</div>
                                                   <div class="sign_out">Sign out</div> </div>
                                                   <div class="clear"></div>
                                              </div>
                                       </div>
                                       <div class="claer"></div>
                                  </div>
                                  <!----------/// TOP PROFILE END HERE ------------->
                                  <!---------/// SEARCH PANNEL STARTED HERE ---------->
                                  
      <!-------------/// HEADER MENU SECTON END HERE -----------------> 
                          </div>
                                  <!-----------/// SEARCH PANNEL END HERE ------->
                                  <!--------/// MENU STARTED HERE -------->
                                  <!----------/// MENU STARTED HERE ------------>
                                   
                                  <!------------// MENU END HERE ---------->
                         <!-------/// SEARCH BOX PANNEL STARTED HERE ----------->
                        </div>
                        <div class="menu_right">
                                        <ul>
                                                 <li>
                                                    <a href="#" title="Home" id="fileSystem"  onclick="getPage(this.id)"><div class="home"></div> Home<div class="claer"></div></a> 
                                                 </li>
                                                 <li> 
                                                    <a href="#" title="Download"><div class="download"></div>Download</a>
                                                 </li>
                                                 <li class="add_folder "> 
                                                    <a href="#" title="Create"><div class="create"></div> CREATE</a> 
                                                 </li>
                                                 <li class="folder_icon_1"> 
                                                    <a href="#" title="Upload"><div class="upload"></div>UPLOAD</a>
                                                 </li>
                                                <!--  <li > 
                                                    <a href="#" title="Create"><div class="create_doc"></div>CREATE</a>
                                                 </li> -->
                                                 <li> 
                                                   <a href="#" title="Edit"><div class="edit"></div>Edit</a> 
                                                 </li>
                                                 <li class="share"> 
                                                   <a href="#" title="Update"><div class="update"></div>SHARE</a> 
                                                 </li>
                                                <li class="delete_folder"> 
                                                   <a href="#" title="Delete"><div class="delet"></div>DELETE</a> 
                                                </li>
                                                <li rel="tab22">
                                                    <a href="#" id='userStatistics' title="Delete" onclick="getPage(this.id)"><div class="graph_user_1"></div>STATISTICS</a>
                                                </li>
                                                <li>
                                                   <a href="#" id='calender' title="Delete" onclick="getPage(this.id)"><div class="calender_user_1" ></div>CALENDAR</a>
                                                </li>
                                                <li>
                                                   <a href='#' title="ACTIVITY" onclick="getActivitiDiagramsPage()"><div class="contact_user_1"></div>ACTIVITY</a>
                                                </li>
                                                <li>
                                                   <a href="#" id='shared' title="Shared with me" onclick="getPage(this.id)"><div class="create_view"></div>SHARED</a>
                                                </li>
                                                <li>
                                                   <a href="#" id='recently' title="Recently Accessed Documents" onclick="getPage(this.id)"><div class="recent_open"></div>RECENTLY</a>
                                                </li>
                                                <li>
                                                   <a href="#" id='trash' title="Trash" onclick="getPage(this.id)"><div class="my_doc"></div>RECYCLE</a>
                                                </li>
                                      </ul>
                                   </div>
                        <!---/// HEADER END -->
           
          
              <!---------------//// ADD GROUP USER POP UP ----------->
<div id="contactdiv_6">
	<form class="form" action="#" id="contact">
		<h3>Add New Documents</h3>
		<p>
			File Name: <span>*</span>
		</p>
		<input type="file" class="custom-file-input attachment_file">
		<div class="claer"></div>
		<input type="checkbox" class="form_bottom_space" /><label>Notify
			to users</label>
		<div class="clear"></div>
		<input type="button" id="send" value="Add" /> <input type="button"
			id="cancel" value="Cancel" /> <br />
	</form>
</div>
<!-----------------/// ADD GROUP POP UP  END HERE ---------->



<!---------------//// Delete USER POP UP ----------->
<div id="contactdiv_77">
	<form class="form" action="#" id="contact">
		<h3>Confirmation</h3>
		<p class="form_bottom_space">Do you really want to delete this
			folder ?</p>
		<div class="clear"></div>
		<input type="button" id="deleteDoc" value="Delete" /> <input type="button"
			id="cancel" value="Cancel" />
	</form>
	    <script type="text/javascript">
                      $(document).ready(function() {
                    	  var folderPath="";
                      $('#deleteDoc').click(function(event) {
                    	  $.ajax({
          					type : "GET",
          					url : "${pageContext.request.contextPath}/recycleDoc",
          					contentType : "application/json",
          					async : false,
          					success : function(data) {
          						
          						//$("#folderView>.row_content>ul").append(data);
          						 folderPath=data;
          					//alert(folderPath);
          					$("#contactdiv_77").css("display", "none");
                        	jQuery.get("getFileSystem", 
                   				 	{
                   					'path' : folderPath
                   					},
                   				function( data ) {
                   	         		$( ".right" ).html( data );
                   	        		});
          					}
          				}); 
                      });
                      });
                  	
       </script>
                      
	
</div>
<!-----------------/// DELETE POP UP  END HERE ---------->
