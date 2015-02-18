
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title> EDMS DESIGN </title>
<!--jQuery and jQuery UI with jQuery Chat-->
<script src="js/jquery-1.7.2.min.js" type="application/javascript" ></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/interface/ReverseClass.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>

<script type="text/javascript" src="js/jquery-ui.js"></script>
<link type="text/css" href="css/jquery.ui.chatbox.css" rel="stylesheet" />
<link type="text/css" href="css/new_icon.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.ui.chatbox.js"></script>

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

<link href="css/style.css" type="text/css" rel="stylesheet"/>
<link rel="stylesheet" href="css/jquery_popup.css" />
<link rel="stylesheet" href="css/new_icon.css" />
<link rel="stylesheet" href="css/new_changes.css" />
<script src="js/new_chnages.js"></script>
<link rel="stylesheet" href="css/keyword.css" />
<script src="js/keyword.js"></script>
<link rel="stylesheet" href="css/right_click.css" />
<script src="js/right_click.js"></script>
<link rel="stylesheet" href="css/share_drop_down.css" />
<script src="js/share_drop_down.js"></script>
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
/* 
			alert(divContent);
			var folderId = "#" + folderPath;
			alert(folderId); */
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
		getLeftDocument();
	}
</script>
<script type="text/javascript">
function getLeftDocument(){
	jQuery.get("getLeftDocument", 
			
			function( data ) {
        $( ".content_left_block" ).html( data );
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

<script  src="js/share_js.js"></script>
</head>
      <body>
              <div class="main_div">
                        <!----// HEADER --->
                        <div class="main_header">
                                  <div class="header">
                                     <div onclick="getPage('fileSystem')" style="cursor: pointer;" class="logo_space">
                                          <!---/// LOGO --->
                                           <img src="images/logo.png" />
                                            <!---//LOGO END -->
                                     </div>
                                    <!--------// SEARCH HERE --------->
                                  <div class="search_main">  
                                      <div class="search_main_div">
                                          <div class="search_icon"> <img src="images/search.png"> </div>
                                          <div class="serach_top" >
                                               <input type="text" />
                                               <span><img src="images/arrow_down.png" /></span>
                                          
                                           </div>
                                          <div class="clear"></div>
                                    </div>
                                    <div class="search_box_details"> 
                          <!-------Tab Content Here -------------->
                         <div id="tabs_wrapper">
                                <div id="tabs_container">
                                        <ul id="tabs">
                                              <li class="active"><a href="#tab1">BASIC</a></li>
                                             <!--  <li><a class="icon_accept" href="#tab2">ADVANCED</a></li> -->
                                             <!--  <li><a href="#tab3">RECENT SEARCH</a></li> -->
                                        </ul>
                               </div>
                         <div id="tabs_content_container">
                                      <div id="tab1" class="tab_content" style="display: block;"> 
                                      <!-------------// Tab Content Started Here ----------------->
                                              <ul>
                                                     <!--  <li>GROUP</li>
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
                                                      </li> -->
                                                      <li>File or Folder Name</li>
                                                      <li>
                                                      <input  type="text" onblur="getDocsByName(this.value)" />
                                                      <script type="text/javascript">
                                                      	function getDocsByName(docName){
                                                      		//alert(docName);
                                                      		
                                                      		$('.search_icon_tab').attr('id','searchDocByName,'+docName);
                                                      		/* jQuery.get("searchDocByName", 
                                                   				 	{
                                                   					'name' : docName
                                                   					},
                                                   				function( data ) {
                                                   	         		$( ".right" ).html( data );
                                                   	        		}); */
                                                      		
                                                      	}
                                                      
                                                      </script>
                                                      </li>
                                                      <li>KEYWORDS</li>
                                                      <li>
                                                        <input  type="text" onblur="getDocsByKeyWords(this.value)" />
                                                      <script type="text/javascript">
                                                      	function getDocsByKeyWords(docName){
                                                      		//alert(docName);
                                                      		$('.search_icon_tab').attr('id','getDocsByKeyWords,'+docName);
                                                      	
                                                      		/* jQuery.get("getDocsByKeyWords", 
                                                   				 	{
                                                   					'name' : docName
                                                   					},
                                                   				function( data ) {
                                                   	         		$( ".right" ).html( data );
                                                   	        		}); */
                                                      		
                                                      	}
                                                      
                                                      </script>
                                                      </li>
                                                     <!--  <li>DATE</li> -->
                                                      <li></li>
                                                      <li>Show Documents of : </li>
                                                      <li>
                                                        <select onchange="getDocsByDate(this.value)">
                                                          <option value="yyyy">Last Year</option>
                                                          <option value="mm">Last Month</option>
                                                          <option value="dd">Last Day</option>
                                                          <option value="hh">Last Hour</option>
                                                        </select>
                                                        <script type="text/javascript">
                                                      	function getDocsByDate(timeType){
                                                      		//alert(docName);
                                                      		$('.search_icon_tab').attr('id','getDocsByDate,'+docName);
                                                      		/* jQuery.get("getDocsByDate", 
                                                   				 	{
                                                   					'name' : timeType
                                                   					},
                                                   				function( data ) {
                                                   	         		$( ".right" ).html( data );
                                                   	        		}); */
                                                      		
                                                      	}
                                                      
                                                      </script>
                                                      </li>
                                                      <li>
                                                        <div onclick="finalSearch(this.id)" class="search_icon_tab"> <img src="images/search.png" /> </div>
                                                    <script type="text/javascript">
                                                    function finalSearch(urltext){
                                                    	urltext=urltext.split(',');
                                                    	alert(urltext[1]);
                                                    	jQuery.get(urltext[0], 
                                               				 	{
                                               					'name' : urltext[1]
                                               					},
                                               				function( data ) {
                                               	         		$( ".right" ).html( data );
                                               	        		});
                                                    	$('.search_box_details').css('display','none');
                                                    }
                                                    
                                                    </script>
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
                                          <div class="user_details_left"> <!-- Welcome : <strong>Hariom Srivastava</strong> -->
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
                       <!--  <div class="menu_right">
                                        <ul>
                                                 <li data-tooltip="Home">
                                                    <a href="#" id="fileSystem"  onclick="getPage(this.id)"><div class="home"></div> Home<div class="claer"></div></a> 
                                                 </li>
                                                 <li data-tooltip="Download"> 
                                                    <a href="#"><div class="download"></div>Download</a>
                                                 </li>
                                                 <li class="add_folder " data-tooltip="Create"> 
                                                    <a href="#"><div class="create"></div> CREATE</a> 
                                                 </li>
                                                 <li class="folder_icon_1" data-tooltip="Upload"> 
                                                    <a href="#"><div class="upload"></div>UPLOAD</a>
                                                 </li>
                                                 <li > 
                                                    <a href="#" title="Create"><div class="create_doc"></div>CREATE</a>
                                                 </li>
                                                 <li data-tooltip="Rename" > 
                                                   <a href="#"class="renameFolder"><div class="edit"></div>Rename</a> 
                                                 </li>
                                                 <li class="share" data-tooltip="Share"> 
                                                   <a href="#"><div class="update"></div>SHARE</a> 
                                                 </li>
                                                <li class="delete_folder"  data-tooltip="Delete"> 
                                                   <a href="#" title="Delete"><div class="delet"></div>DELETE</a> 
                                                </li>
                                                <li rel="tab22" data-tooltip="User Statistics">
                                                    <a href="#" id='userStatistics' onclick="getPage(this.id)"><div class="graph_user_1"></div>STATISTICS</a>
                                                </li>
                                                <li data-tooltip="Calender" >
                                                   <a href="#" id='calender'onclick="getPage(this.id)"><div class="calender_user_1" ></div>CALENDAR</a>
                                                </li>
                                                <li data-tooltip="Activity">
                                                   <a href='#' onclick="getActivitiDiagramsPage()"><div class="contact_user_1"></div>ACTIVITY</a>
                                                </li>
                                                <li data-tooltip="Shared with me">
                                                   <a href="#" id='shared' onclick="getPage(this.id)"><div class="create_view"></div>SHARED</a>
                                                </li>
                                                <li data-tooltip="Recently Modified Documents">
                                                   <a href="#" id='recently' onclick="getPage(this.id)"><div class="recent_open"></div>RECENTLY</a>
                                                </li>
                                                <li data-tooltip="Trash" >
                                                   <a href="#" id='trash'onclick="getPage(this.id)"><div class="my_doc"></div>RECYCLE</a>
                                                </li>
                                      </ul>
                                   </div> -->
                        <!---/// HEADER END -->
           
          
           

<%-- 	<form class="form" action="#" id="contact">
		<h3>Add New Documents</h3>
		<p>
			File Name: <span>*</span>
		</p>
		<input type="file" class="custom-file-input attachment_file" id='file_browse' name="filedata" multiple />
		<div class="claer"></div>
		<input type="checkbox" class="form_bottom_space" /><label>Notify
			to users</label>
		<div class="clear"></div>
		<input type="button" id="send" value="Add" /> <input type="button"
			id="cancel" value="Cancel" /> <br />
	</form> 
</div>--%>
<!-----------------/// ADD GROUP POP UP  END HERE ---------->

<!---------// SHARING PAGES STARTED---------->
<div class="sharing_mange">
   <h1>Sharing and Security <div class="mange_can_top">X</div></h1>
   <div class="table_append">
                   <table class="append_tr">
                      <!--  <tr>
                           <td colspan="2">Link to share (only accessible by collaborators)</td>
                       </tr>
                       <tr>
                           <td colspan="2"><input type="text"  class="link_share"/></td>
                       </tr> 
                       <tr class="share_bottom">
                           <td colspan="2">Who has access</td>
                       </tr>
                       <tr>
                           <td>Hari Om Srivastava (you)<span class="email_share">hari@silvereye.co</span></td>
                           <td class="text_right">Is Owner</td>
                       </tr>-->
                       <tr class="share_bottom">
                           <td colspan="2">Invite people:</td>
                       </tr>
                       <tr>
                           <td><input type="text"  class="initive_people" id="userforshare"  /></td>
                           
                           
                           <td>
                                      <!--// SHARE OPTION --->
<!-- <div class="share_option_dropdown">
<div class="for_share_icon">
-// ADD NEW -
<img src="images/eye-24-256.png" class="view_icon" />
<img src="images/edite.png" class="edite_icon" />
<img src="images/comment.png" class="comment_icon" />
-// ADD NEW ICON END -
<div class="clear"></div>
</div>
<span class="view_text">Can View</span>
<span class="can_text">Can Edit</span>
<span class="comment_text">Can Manage</span><div class="down_arrow_share"><img src="images/cal-open.png" /></div></div>

                                              <div class="share_menu_dropdown">
<ul>
<li class="can_view"> <span>&#x2714;</span> <div>Can View</div></li>
<li class="can_edit"> <span>&#x2714;</span> <div>Can Edit</div></li>
<li class="can_comment"> <span>&#x2714;</span> <div>Can Manage</div></li>
</ul>
</div>
             -->                          
                                      
                                      <div style="float: left;">
                                           <select style="width: 100px;height: 28px;" id="permissionsforshare">
                                               <option value="ur">Can View </option>
                                               <option value="uw">Can Edit </option>
                                               <option value="us">Can Manage </option>
                                           </select>
                                      </div>
                                      
                                     
                          </td>
                       </tr>
                   </table>
                  
                    <script type="text/javascript">
$(function() {
var availableTags = [
"ActionScript",
"AppleScript",
"Asp",
"BASIC",
"C",
"C++",
"Clojure",
"COBOL",
"ColdFusion",
"Erlang",
"Fortran",
"Groovy",
"Haskell",
"Java",
"JavaScript",
"Lisp",
"Perl",
"PHP",
"Python",
"Ruby",
"Scala",
"Scheme"
];
$( "#userforshare" ).autocomplete({
source: availableTags
});
});
</script>
                   <div class="clear"></div>
   
        </div>
        <!--   <table>
            <tr>
           <td colspan="2"><input type="checkbox" />Notify people via email<a href="#">Add message</a></td>
          </tr>
   </table>  -->
                 <div>
                     <!--   <div class="your_self"><input type="checkbox"/><a href="#">Send a copy to myself </a></div>
                     -->   <div class="share_right">
                               <div class="share_more">Add More</div>
                               <div class="cancel_share mange_can">Cancel</div>
                               <div class="send_share" onclick="assignSinglePermissions()" >Send</div>
                       </div>
            
                 </div>
          
             <div class="clear"></div>    
                 
</div>
<div class="web_dialog_overlay" ></div>
<!---------// SHARING PAGES END---------->

<!-- All Popups of header starts here -->


<script type="text/javascript">
	/*    $(document).ready(function() {
	   $('input[name="userpermission"]').click(function(event) { */
	function assignPermissions(values) {
		var vale = values;
		var valu = vale.split(",");
		var user = "";
		vale = valu[1];
		var checking = values.replace("@", "").replace(".", "")
				.replace(",", "");
		// alert(checking);
		//alert(document.getElementById(checking).checked);
		if (document.getElementById(checking).checked) {
			user = valu[0];
			value = valu[1];
		} else {
			user = valu[0];
			value = "n" + valu[1];
		}
		if (value == "nur") {
			checking = checking.substring('0', checking.length - 2) + "uw";
			//alert(checking);
			document.getElementById(checking).checked = false;
			checking = checking.substring('0', checking.length - 2) + "ud";
			document.getElementById(checking).checked = false;
			checking = checking.substring('0', checking.length - 2) + "us";
			document.getElementById(checking).checked = false;
		}

		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/assignSinglePermission",
			data : {
				'user' : user,
				'value' : value,
			},
			contentType : "application/json",
			async : false,
			success : function(data) {
				//$("#folderView>.row_content>ul").append(data);
				alert(data);
			}

		});

	}
	//  });
</script>
<!-- assiging permissions using new view -->

<script type="text/javascript">
	/*    $(document).ready(function() {
	   $('input[name="userpermission"]').click(function(event) { */
	function assignSinglePermissions() {
	   	alert('');
	   	var values=$('#userforshare').val()+','+ $('#permissionsforshare').val();
	   	alert(values);
		var vale = values;
		var valu = vale.split(",");
		var user = "";
		vale = valu[1];
		// alert(checking);
		//alert(document.getElementById(checking).checked);
			user = valu[0];
			value = valu[1];
	
		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/assignSinglePermission",
			data : {
				'user' : user,
				'value' : value,
			},
			contentType : "application/json",
			async : false,
			success : function(data) {
				//$("#folderView>.row_content>ul").append(data);
				alert(data);
			}

		});

	}
	//  });
</script>

<script type="text/javascript">
	function getDocProperties(folderPath) {
		$('#oldFolderName').val(folderPath);

		jQuery.post("setCurrentFolder", {
			'path' : folderPath
		}, function(data) {
		});
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
		jQuery.get("getDocProperties", {
			'path' : folderPath
		}, function(data) {
			$(".right_icon_main").html(data);
		});
	}
</script>

<script type="text/javascript">
	function getFileProperties(folderPath) {
		
	
		$('#oldFolderName').val(folderPath);

		jQuery.post("setCurrentFile", {
			'path' : folderPath
		}, function(data) {
		});
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
		jQuery.get("getFileProperties", {
			'path' : folderPath
		}, function(data) {
			$(".right_icon_main").html(data);
		});

			$(".downloadFolder").attr('id',folderPath);
			$(".download_right").attr('id',folderPath);
		
	}
</script>
<div id="contactdiv_6">

	<form:form id="contact" class="form" method="post"
		action="uploadDocumentByJcr" commandName="fileupload"
		enctype="multipart/form-data">
		<h3>Add New Documents</h3>
		<p>
			File Name: <span>*</span>
		</p>
		<input class="custom-file-input attachment_file cc_clear"  name="file2" id="file2" multiple type="file"
			 />
		<%-- <form:hidden path="filename" value="sdff"/>
<form:hidden path="filedetails" value="sdf"/> --%>
		<input type="button" value="Upload" onclick="uploadFormData()"/>
		<input type="button" value="Cancel" class="cancle" onclick="hideUpload()" />
	</form:form>


	<script type="text/javascript">
		function uploadFormData() {
			var oMyForm = new FormData();
			for (var i = 0; i < file2.files.length; i++) {
				oMyForm.append("file" + i, file2.files[i]);
			}
			$.ajax({
				url : '${pageContext.request.contextPath}/uploadDocumentByJcr',
				data : oMyForm,
				dataType : 'text',
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data) {
					var alt=data.substring(data.lastIndexOf(",")+1);
					data=data.substring(0,data.lastIndexOf(","));
					$("#fileThumbView>ul").append(data);
					alert(alt);
				}
			});
			$('.cc_clear').val('');
	$("#contactdiv_6").css("display", "none");
		}
function hideUpload(){
	$("#contactdiv_6").css("display", "none");
}
	</script>


</div>

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



<!---------------//// ADD GROUP USER POP UP ----------->
<div id="contactdiv_66">
	<form class="form" action="#" id="contact">
		<h3>Create Folder</h3>
		<p>
			Please enter a new Folder name <span>*</span>
		</p>
		<input type="text" id="folderName" /> <%-- <input type="hidden"
			id="parentfolderName" value='<%=currentFolder.getFolderPath()%>' /> --%>
		<br />
		<div class="clear"></div>
		<input type="button" value="Create" onclick="createFolder()" /> <input
			type="button" id="cancel" value="Cancel" /> <br />
		<script type="text/javascript">
			function createFolder() {
				var folder = $('#folderName').val();
				//alert(folder);
				$.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/createFolder",
					data : {
						'folderName' : folder
					},
					contentType : "application/json",
					async : false,
					success : function(data) {
						$("#folderThumbView>ul").append(data);
						// alert(data);
					}

				});
				$('#folderName').val("");
				$("#contactdiv_66").css("display", "none");
				getDocProperties($('#parentfolderName').val());
			}
		</script>
	</form>
</div>


  
              <!-----------/// ADD KEYWORD STRED HERE ---------->
              <div class="key_word_box">
                <h1>Add Keyword</h1>
                  <!--// ADD BOX -------->
                     <div class="keyword_box">
                               <ul>
                     <li>Keyword </li>
                     <li><input type="text" class="keyword_name" id="add_keywordid" maxlength="35" /></li>
                 
                  </ul>
                                <div class="keyword_text">
                       <!---// ADD --->
                       <div class="add_keyword" >Save</div>
                       <!----/// ADD -->
                       <!---// ADD --->
                       <div class="add_keyword_exit" >save and cancel</div>
                       <!----/// ADD -->
                       
                       <!--// CANCEL --->
                        <div class="cancel_keyword">cancel</div>
                       <!--// CANCEL =--->
                   
                   </div>
                     
                    <div class="clear"></div>
                     </div>
                  <!------// ADD BOX ---->
                  <div class="clear"></div>
              </div>
              <div class="web_dialog_overlay" ></div>
              <!-----------/// ADD KEYWORD END HERE ------------------>
              <script type="text/javascript">
          	// ADD KEY WORD 
          	$(document).on("click",".add_keyword",function(){
          		 ///var keyword = $('#add_keywordid').val();
          		//	alert($('.keyword_name').val());
          			$.ajax({
          				type : "GET",
          				url : "${pageContext.request.contextPath}/addKeyword",
          				data : {
          					'keyword' : $('.keyword_name').val()
          				},
          				contentType : "application/json",
          				async : false,
          				success : function(data) {
          					//$("#folderThumbView>ul").append(data);
          					// alert(data);
          				}

          			});
          			var keywordname = $('.keyword_name').val()
          			if($('.keyword_name').val()=='')
          			{
          				alert('PLease Enter The Value !')
          				
          			} else {
          			$('.inner_keyword >ul').append('<li><span>'+ keywordname +'</span><img src="images/delete_icon_file.png"><div class="clear"></div><div class="clear"></div></li>');
          		        }
          			$('.keyword_name').val('');
          			
          			
          			});
          		
          		// ADD KEY WORD 
          		
          		/// SAVE AND CALCEL STRED HERE 
	$(document).on("click",".add_keyword_exit",function(){
		//alert($('.keyword_name').val());
		$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/addKeyword",
				data : {
					'keyword' : $('.keyword_name').val()
				},
				contentType : "application/json",
				async : false,
				success : function(data) {
					//$("#folderThumbView>ul").append(data);
					// alert(data);
				}

			});
			var keywordname = $('.keyword_name').val()
			if($('.keyword_name').val()=='')
			{
				alert('PLease Enter The Value !')
				
			} else {
			$('.inner_keyword >ul').append('<li><span>'+ keywordname +'</span><img src="images/delete_icon_file.png"><div class="clear"></div><div class="clear"></div></li>');
		        }
			$('.keyword_name').val('');
			$('.key_word_box').hide();
			$('.web_dialog_overlay').hide();
			
			
			});
		
		/// SAVE AND CANCEL END HERE 
	
	
              </script>
