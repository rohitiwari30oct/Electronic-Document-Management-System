<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-----------------// FROM MAIN INDEX PAGES -------------->
<link href="css/style.css" rel="stylesheet" type="text/css" />
<!----<link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>---->
<script src="js/jquery-1.7.2.min.js" type="application/javascript" ></script>
<script src="js/left_event.js" type="application/javascript"></script>
<link rel="stylesheet" href="css/jquery_popup.css" />
<script src="js/jquery_popup.js"></script>
<link rel="stylesheet" type="text/css" href="tabs.css" />
<!-------------------/// FOR TAB ONLY --------------------->
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
<link rel="stylesheet" type="text/css" href="tabs.css" />
<script type="text/javascript" src="jquery.js"></script>
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

<!----------------------// FOR TAB END HERE ---------------->

<!-----------------// FROM MAIN INDEX PAGES END HERE ------>

</head>
<body>
<div class="header_main bottom_space_11"> 
  <!--------------// HEADER STARED HERE -------------->
  <div class="header">
    <div class="logo"></div>
    <!----------------// SEARCH HERE ----------------------->
    <div class="serach_top" onclick="tab_search()"> </div>
    <div class="search_icon"> <img src="images/search.png" /> </div>
    <!------------------/// SEARCH END HERE ------------------>
    
    <div class="user_deatils">
      <div class="user_details_left"> Welcome : <strong>Hariom Srivastava</strong>
        <div class="claer"></div>
        
        <!--<span>My Account</span><div class="drop_down"></div> <span>| &nbsp;&nbsp;Logout</span>
                                                ---> 
        
      </div>
      <div class="user_images"> </div>
      <!---------------// TOP ARROW ------------->
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
      <!--------------// TOP ARROW END ------------> 
    </div>
    <div class="claer"></div>
  </div>
  
  <!-------------// HEADER END HERE -------------------------> 
  <!-------------/// Header Menu Section Stared Here --------------->
  <div class="header_menu">
    <div class="menu_left"> <span>5 GB Available</span> <span class="font_weight"> Upgrade! </span>
      <div class="prgress_bar"></div>
    </div>
    <div class="menu_right">
       <ul>
            <li><a href="index_testing.htm" title="Home" >
              <div class="home"></div>
              Home
              <div class="claer"></div>
              </a> 
              
              </li>
            <li> <a href="#" title="Directory">
              <div class="digtory"></div>
              DIRECTORY</a> </li>
            <!--<li> <a href="#" title="Find">
              <div class="find"></div>
              Find</a> 
              </li>-->
            <li> <a href="#" title="Download">
              <div class="download"></div>
              Download</a> </li>
           <!-- <li> <a href="#" title="Print">
              <div class="printer"></div>
              PRINT</a> </li>-->
            <li> <a href="#" title="Lock">
              <div class="lock"></div>
              LOCK</a> </li>
            <li> <a href="#" title="Unlock">
              <div class="unlock"></div>
              UNLOCK</a> </li>
            <li > <a href="#" title="Create">
              <div class="create"></div>
              CREATE</a> </li>
            <li> <a href="#" title="Upload">
              <div class="upload"></div>
              UPLOAD</a> </li>
            <li class="onclick_4"> <a href="#" title="Create">
              <div class="create_doc"></div>
              CREATE</a> </li>
            <li> <a href="#" title="Edit">
              <div class="edit"></div>
              Edit</a> </li>
            <li> <a href="#" title="Update">
              <div class="update"></div>
              UPDATE</a> </li>
            <!--<li> <a href="#" title="Cancel Edit">
              <div class="cancel_edit"></div>
              CANCEL EDIT</a> </li>--->
            <li> <a href="#" title="Delete">
              <div class="delet"></div>
              DELETE</a> </li>
            <!--<li class="onclick"> <a href="#" title=" Add Group">
              <div class="add_in"></div>
              ADD GROUP</a> </li>-->
           <!--- <li class="onclick_3"> <a href="#" title="Remove Group">
              <div class="remove_group"></div>
              REMOVE GROUP</a> </li>-->
            <!--<li> <a href="#" title="History">
              <div class="history"></div>
              HISTORY</a> </li>-->
              <li rel="tab22">
                 <a href="statice.htm" title="Delete">
                          <div class="graph_user_1"></div>
                          STATISTICS
                 </a>
              </li>
              <li>
                 <a href="calender.htm" title="Delete">
                          <div class="calender_user_1" ></div>
                          CALENDAR
                 </a>
              </li>
              <li>
                 <a href="form.htm" title="Delete">
                          <div class="contact_user_1"></div>
                         WORK FLOW 
                 </a>
              </li>
              

          </ul>
    </div>
    
    <!-----------------/// SEARCH BOX PANNEL STARTED HERE ----------------->
    <div class="search_box_details"> 
      
      <!-----------------Tab Content Here -=-------------------->
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
                DOCUMENT
                <input type="checkbox" />
                FOLDER</li>
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
    <!-------------/// HEADER MENU SECTON END HERE -----------------> 
  </div>
  <div class="claer"></div>
</div>
<!-----------/// Header Stared Here ------------>
<div id="head">

<!----------------/// Header End Here ----------> 
<!------------// Testing CONTENT STARTED HERE ------------------>
<div id="content" class="top_space_1">

<!-----------------/// LEFT PANNEL ------------------>
<div class="left-pane document_page_left_height new_cheat">
     
     <div class="main_left">
            <div class="left_heading left_heading_2">
    <h1>Document Library</h1>
  </div>
            <div class="left_sub_menu">
    <ul>
      <li class="file_system tab_header" onClick="tab_left()"> <a href="index_testing.htm" >MY DOCUMENT</a>
        <div class="icon"></div>
      </li>
      <div class="content_left">
    <ul>
            <li>
              <div class="folder"></div>
              <span>Sales Department</span></li>
            <li>
              <div class="folder"></div>
              <span>Marketing</span></li>
            <li>
              <div class="folder"></div>
              <span>HR</span></li>
            <li>
              <div class="folder"></div>
              <span>IT Department</span></li>
            <li>
              <div class="folder"></div>
              <span>Advertisment</span></li>
            <li>
              <div class="folder"></div>
              <span>Purchasess</span></li>
            <li>
              <div class="folder"></div>
              <span>CEO</span></li>
            <li>
              <div class="folder"></div>
              <span>Invoice</span></li>
            <li>
              <div class="folder"></div>
              <span>Purchases Order</span></li>
            <li>
              <div class="folder"></div>
              <span>Presentation</span></li>
            <li>
              <div class="folder"></div>
              <span>Video</span></li>
            <li>
              <div class="folder"></div>
              <span>Word Document</span></li>
          </ul>
      </div>
      <div class="content_left"> </div>
      <li class="create_view tab_header document_library shared_event"> <a href="shared.htm" >SHARED</a>
      </li>
      
      <li class="recent_open tab_header document_library recently_opended"> <a href="recently.htm" >RECENTLY ACCESSED</a> 
        <!------- <div class="icon"></div>--------> 
      </li>
      <div class="content_left"> </div>
      <li class="my_doc tab_header document_library trash" > <a href="trash.htm" >TRASH</a> 
        <!--- <div class="icon"></div>---> 
      </li>
      <div class="content_left"> </div>
    </ul>
  </div>
            <div class="chaet_option " >
    <div class="cheat_heading"> Contact Online(5) </div>
    <div class="chaet_scroll cheat_height_big" id="test"> 
      <!-------- // CHEAT ROW STARTED HERE ------------->
      <div class="cheat_row">
        <div class="small_images"> <img src="images/photo.jpg" /> </div>
        <div class="contact_information">
          <p><strong>Jonathan Smith</strong><br/>
            Work for fun</p>
        </div>
        <div class="online_file"> <img src="images/online_file.png" /> </div>
      </div>
      <div class="chat_info">
        <div class="left_part_chaet"> <img src="images/photo_login.jpg" /> </div>
        <div class="right_part_chat"> <span>Hariom Srivastava</span> <br/>
          hari@silvereye.co
          <div class="depart">Information Technology</div>
        </div>
      </div>
      <!--------/// Cheat Row End Here -----------------> 
      <!-------- // CHEAT ROW STARTED HERE ------------->
      <div class="cheat_row">
        <div class="small_images"> <img src="images/man_blank.jpg" /> </div>
        <div class="contact_information">
          <p><strong>Jonathan Smith</strong><br/>
            Work for fun</p>
        </div>
        <div class="online_file"> <img src="images/online_file.png" /> </div>
      </div>
      <div class="chat_info">
        <div class="left_part_chaet"> <img src="images/photo_login.jpg" /> </div>
        <div class="right_part_chat"> <span>Hariom Srivastava</span> <br/>
          hari@silvereye.co
          <div class="depart">Information Technology</div>
        </div>
      </div>
      
      <!--------/// Cheat Row End Here -----------------> 
      <!-------- // CHEAT ROW STARTED HERE ------------->
      <div class="cheat_row">
        <div class="small_images"> <img src="images/man_blank.jpg" /> </div>
        <div class="contact_information">
          <p><strong>Jonathan Smith</strong><br/>
            Work for fun</p>
        </div>
        <div class="online_file"> <img src="images/online_file.png" /> </div>
      </div>
      <div class="chat_info">
        <div class="left_part_chaet"> <img src="images/photo_login.jpg" /> </div>
        <div class="right_part_chat"> <span>Hariom Srivastava</span> <br/>
          hari@silvereye.co
          <div class="depart">Information Technology</div>
        </div>
      </div>
      <!--------/// Cheat Row End Here -----------------> 
      <!-------- // CHEAT ROW 2 STARTED HERE ------------->
      <div class="cheat_row">
        <div class="small_images"> <img src="images/man_blank.jpg" /> </div>
        <div class="contact_information">
          <p><strong>Jonathan Smith</strong><br/>
            Work for fun</p>
        </div>
        <div class="online_file"> <img src="images/off_line.png"  /> </div>
      </div>
      <div class="chat_info">
        <div class="left_part_chaet"> <img src="images/photo_login.jpg" /> </div>
        <div class="right_part_chat"> <span>Hariom Srivastava</span> <br/>
          hari@silvereye.co
          <div class="depart">Information Technology</div>
        </div>
      </div>
      <!--------/// Cheat Row 2 End Here -----------------> 
      
      <!-------- // CHEAT ROW STARTED HERE ------------->
      <div class="cheat_row">
        <div class="small_images"> <img src="images/photo.jpg" /> </div>
        <div class="contact_information">
          <p><strong>Jonathan Smith</strong><br/>
            Work for fun</p>
        </div>
        <div class="online_file"> <img src="images/online_file.png" /> </div>
      </div>
      <div class="chat_info">
        <div class="left_part_chaet"> <img src="images/photo_login.jpg" /> </div>
        <div class="right_part_chat"> <span>Hariom Srivastava</span> <br/>
          hari@silvereye.co
          <div class="depart">Information Technology</div>
        </div>
      </div>
      <!--------/// Cheat Row End Here -----------------> 
      <!-------- // CHEAT ROW STARTED HERE ------------->
      <div class="cheat_row">
        <div class="small_images"> <img src="images/photo.jpg" /> </div>
        <div class="contact_information">
          <p><strong>Jonathan Smith</strong><br/>
            Work for fun</p>
        </div>
        <div class="online_file"> <img src="images/online_file.png" /> </div>
      </div>
      <div class="chat_info">
        <div class="left_part_chaet"> <img src="images/photo_login.jpg" /> </div>
        <div class="right_part_chat"> <span>Hariom Srivastava</span> <br/>
          hari@silvereye.co
          <div class="depart">Information Technology</div>
        </div>
      </div>
      <!--------/// Cheat Row End Here -----------------> 
      <!-------- // CHEAT ROW STARTED HERE ------------->
      <div class="cheat_row">
        <div class="small_images"> <img src="images/photo.jpg" /> </div>
        <div class="contact_information">
          <p><strong>Jonathan Smith</strong><br/>
            Work for fun</p>
        </div>
        <div class="online_file"> <img src="images/online_file.png" /> </div>
      </div>
      <div class="chat_info">
        <div class="left_part_chaet"> <img src="images/photo_login.jpg" /> </div>
        <div class="right_part_chat"> <span>Hariom Srivastava</span> <br/>
          hari@silvereye.co
          <div class="depart">Information Technology</div>
        </div>
      </div>
      <!--------/// Cheat Row End Here -----------------> 
      <!-------- // CHEAT ROW STARTED HERE ------------->
      <div class="cheat_row">
        <div class="small_images"> <img src="images/photo.jpg" /> </div>
        <div class="contact_information">
          <p><strong>Jonathan Smith</strong><br/>
            Work for fun</p>
        </div>
        <div class="online_file"> <img src="images/online_file.png" /> </div>
      </div>
      <div class="chat_info">
        <div class="left_part_chaet"> <img src="images/photo_login.jpg" /> </div>
        <div class="right_part_chat"> <span>Hariom Srivastava</span> <br/>
          hari@silvereye.co
          <div class="depart">Information Technology</div>
        </div>
      </div>
      <!--------/// Cheat Row End Here -----------------> 
      
    </div>
  </div>
    </div>

</div>
<!----------------------/// left PANNEL ------------------> 

<!-----------------------/// RIGHT PANNEL ------------------->

<div class="bottom">
  <div class="bottom_icon">
    <div class="bottom_top_view">
      <div class="bottom_strip"> 
        <!----------------------// LEFT VIEW ARE HERE ------------------------------> 
      </div>
      <!-------------/// ROW FIRST CONTENT STARTED HERE ---------------------->
      <div class="thum_view_middle left_folder">
        <div class="row_text middle_tab " >
          <div class="white">
            <div class="icon_folder" ></div>
            <div class="folder_text">Folder View</div>
          </div>
        </div>
        <div class="claer"></div>
        <div class="row_content">
          <ul>
            <li>
              <div class="folder_icon"></div>
              <span>admin_user_<br/>
              list_perimission_5</span> </li>
            <li>
              <div class="folder_icon"></div>
              <span>admin_user_<br/>
              list_perimission_5</span> </li>
            <li>
              <div class="folder_icon"></div>
              <span>admin_user_<br/>
              list_perimission_5</span> </li>
            <li>
              <div class="folder_icon"></div>
              <span>admin_user_<br/>
              list_perimission_5</span> </li>
            <li>
              <div class="folder_icon"></div>
              <span>admin_user_<br/>
              list_perimission_5</span> </li>
            <li>
              <div class="folder_icon"></div>
              <span>admin_user_<br/>
              list_perimission_5</span> </li>
            <li>
              <div class="folder_icon"></div>
              <span>admin_user_<br/>
              list_perimission_5</span> </li>
            <li>
              <div class="folder_icon"></div>
              <span>admin_user_<br/>
              list_perimission_5</span> </li>
            <li>
              <div class="folder_icon"></div>
              <span>admin_user_<br/>
              list_perimission_5</span> </li>
            <li>
              <div class="folder_icon"></div>
              <span>admin_user_<br/>
              list_perimission_5</span> </li>
            <li>
              <div class="folder_icon"></div>
              <span>admin_user_<br/>
              list_perimission_5</span> </li>
            <li>
              <div class="folder_icon"></div>
              <span>admin_user_<br/>
              list_perimission_5</span> </li>
          </ul>
        </div>
      </div>
      <!-------------------/// ROW FIRST CONTENT END HERE -----------------------> 
      
      <!------------------/// LIST VIEW STARTED HERE ------------------------->
      
      <div class="list_view_middle left_list">
        <div class="list_view_information">
          <ul>
            <li>Name</li>
            <li>Name</li>
            <li>Title</li>
            <li>Size</li>
            <li>Date Modified </li>
            <li>Author</li>
          </ul>
        </div>
        <div class="list_view_content">
          <ul>
            <li>
              <div class="icon_list"></div>
            </li>
            <li>Main_Folder</li>
            <li>Main</li>
            <li>20kb</li>
            <li>26/07/2020</li>
            <li>Admin</li>
          </ul>
          <ul class="gray">
            <li>
              <div class="icon_list"></div>
            </li>
            <li>Name</li>
            <li>Title</li>
            <li>Size</li>
            <li>Date Modified </li>
            <li>Author</li>
          </ul>
          <ul>
            <li>
              <div class="icon_list"></div>
            </li>
            <li>Name</li>
            <li>Title</li>
            <li>Size</li>
            <li>Date Modified </li>
            <li>Author</li>
          </ul>
        </div>
      </div>
      
      <!---------------/// LIST VIEW END HERE ----------------------------------->
      <table style="display:none;">
        <tr >
          <td>Name
            <div class="border_left"></div></td>
          <td>Date
            <div class="border_left"></div></td>
          <td>Type
            <div class="border_left"></div></td>
          <td>Size
            <div class="border_left"></div></td>
          <td>Tags
            <div class="border_left"></div></td>
          <td>File version</td>
        </tr>
        <tr class="space">
          <td class="first_text left_potion"><div class="ms_office"></div>
            Main Folder</td>
          <td>21-09-2014</td>
          <td>Folder Type</td>
          <td>20 Kb</td>
          <td></td>
          <td>.doc</td>
        </tr>
        <tr >
          <td class="first_text left_potion"><div class="ms_office"></div>
            Main Folder</td>
          <td>21-09-2014</td>
          <td>Folder Type</td>
          <td>20 Kb</td>
          <td></td>
          <td>.doc</td>
        </tr>
      </table>
    </div>
  </div>
  <div class="claer"></div>
  <div class="bottom_tab"> 
    
    <!-------------------/// TAB STARTED HERE -------------------->
    
    <div id="container">
      <ul class="tabs">
        <li class="active" rel="tab4">
          <div class="peroperty_1"></div>
          PROPERTIES</li>
        <li rel="tab5">
          <div class="note_1"></div>
          NOTE</li>
        <li rel="tab6">
          <div class="keyword_1"></div>
          KEYWORDS</li>
        <li rel="tab7">
          <div class="perim_1"></div>
          PERMISSION</li>
        <li rel="tab8">
          <div class="history_right_1"></div>
          HISTORY</li>
        <li rel="tab9">
          <div class="prew_1"></div>
          PREVIEW</li>
        <a href="#">
        <div class="arrow_tab" onclick="tab_arrow();"></div>
        </a>
      </ul>
      <div class="tab_container">
        <div id="tab4" class="tab_content_1">
          <table>
            <tr>
              <td class="table_heading">UUID</td>
              <td>a0da7cc-017</td>
            </tr>
            <tr>
              <td class="table_heading"> Name</td>
              <td>Main Document folder</td>
            </tr>
            <tr>
              <td class="table_heading">Style</td>
              <td>folder icon</td>
            </tr>
            <tr>
              <td class="table_heading">Created</td>
              <td>15/07/2014 14:05 by Administrator</td>
            </tr>
            <tr>
              <td class="table_heading">Subscribed</td>
              <td>No</td>
            </tr>
          </table>
        </div>
        <!-- #tab1 -->
        <div id="tab5" class="tab_content_1">
          <p><img src="images/mortal combat.jpg"> <br />
            <strong> Mortal Kombat returns after a lengthy hiatus and puts players
            back into the Tournament for 2D fighting with gruesome combat. </strong> </p>
        </div>
        <!-- #tab2 -->
        <div id="tab6" class="tab_content_1">
          <p><img src="images/halo.jpg"> <br />
            <strong> Halo: Reach is the culmination of the superlative combat, sensational
            multiplayer, and seamless online integration that are the hallmarks
            of this superb series. </strong> </p>
        </div>
        <!-- #tab3 -->
        <div id="tab7" class="tab_content_1">
          <p><img src="images/portal.jpg"> <br />
            <strong> Portal 2 is an action shooter game from Valve Software that draws 
            from the original formula of innovative gameplay, story, and music,
            which earned the original Portal more than 70 industry accolades. </strong> </p>
        </div>
        <!-- #tab4 -->
        
        <div id="tab8" class="tab_content_1">
          <p><img src="images/portal.jpg"> <br />
            <strong> Portal 2 is an action shooter game from Valve Software that draws 
            from the original formula of innovative gameplay, story, and music,
            which earned the original Portal more than 70 industry accolades. </strong> </p>
        </div>
        <!-- #tab4 -->
        
        <div id="tab9" class="tab_content_1">
          <p><img src="images/portal.jpg"> <br />
            <strong> Portal 2 is an action shooter game from Valve Software that draws 
            from the original formula of innovative gameplay, story, and music,
            which earned the original Portal more than 70 industry accolades. </strong> </p>
        </div>
        <!-- #tab4 --> 
        
      </div>
      <!-- .tab_container --> 
      
    </div>
    <!-- #container --> 
    <!-------------------// TAB END HERE -------------------------->
    
    <div class="claer"></div>
  </div>
</div>
<!---------BottOm_End -------------->
<div class="form_tab table_menu_height_1">
  <ul class="tabs user_tab_1 table_menu_height">
    <li class="active table_menu" rel="tab31">

        Customer Creation Form 
    </li>
    <li rel="tab32" class="table_menu">
        Master Vendor Database
    </li>
    <li rel="tab33" class="table_menu">
        Vender Creation Form 
    </li>
    <li rel="tab34" class="table_menu">
        Cash Payment Voucher 
    </li>
    <li rel="tab35" class="table_menu">
        Leave Application Form 
    </li>
    <li rel="tab36" class="table_menu travel">
        Travel Expenses Reimbursement Claim 
    </li>
      <li rel="tab37" class="table_menu medical_expenses">
        Reimbursement of Medical Expenses 
    </li>
      <li rel="tab38" class="table_menu">
        Purchase Requisition
    </li>
      <li rel="tab39" class="table_menu memo">
        Inter Office Memo
    </li>
  </ul>
  <div class="claer"></div>
</div>
<!-----------------//// BOTTOM VIEW STARTED HERE ------------------>
<div  class="user_dasboard_1 ">
          <div class="all_form_tab">
            <div class="tab_container user_tab_container"></div>
            <!-------------------------//// TAB 22 Started Here ------------------->
            <div id="tab34" class="user_static_6 tab_content_1" >
            <!------------------/// TABLE SAVE OPTION HERE -------------->
                <div class="table_save">
                         <div class="table_right">
                                  <!----------/// ADD USER ----------->
                                  <div class="Logged_User_tab add_user_js add_user_bg">SAVE</div>
                                  <!----------/// ADD USER END --------> 
                                  <!----------/// User List ----------->
                                  <div class="Logged_User_tab  onclick">CANCEL</div>
                                  <!----------/// User List END --------> 
                            
                          </div>
                          <!-------------------/// USER LIST RIGHT END ------------>
                          <div class="claer"></div>
                 </div>
                                <!------------------/// TABLE SAVE OPTION -------------->
                    
                               <div class="from_main">
                                    
                                    <table>
              <tr>
                <td colspan="3" class="table_heading">CASH PAYMENT VOUCHER </td>
                  <td width="128" class="voucher">
                    VOUCHER NO.
                    <input type="text" placeholder=" VOUCHER NO" />
                 </td>
              </tr>
              <tr class="cash_1">
                <td width="169">DATE</td>
                <td colspan="2">PARTICULARS .</td>
                <td>
                          <table class="rupee">
                              <tr>
                                <td class="table_border">Rs</td>
                                <td>P.</td>
                              </tr>
                          </table>
                </td>
              </tr>
              <tr>
                <td><input type="date" /></td>
                <td colspan="2"><input type="text" class="particular" placeholder="PARTICULARS "/></td>
                <td class="rupee_td">
                          <table class="rupee">
                              <tr>
                                 <td><input type="text" placeholder="Rs." /></td>
                                <td><input type="text" placeholder="P." /></td>
                              </tr>
                          </table>
              
              </td>
              </tr>
                <tr>
                                <td class="rupee_td" colspan="4">
                                           <div class="addanddelete">
                                                     <div class="add_table"></div>
                                                     <div class="delete_table"></div>
                                            </div>
                                
                                
                                 </td>
              </tr>
              <tr>
                <td colspan="2">AMOUNT IN WORDS:RUPEES <input type="text" class="particular" placeholder="Amount in Words"></td>
                <td colspan="2"><div class="payment"> <input type="text" placeholder="Total">TOTAL</div></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td colspan="2">&nbsp;</td>
              </tr>
              <tr>
                <td><div class="payment"><input type="text" placeholder="PAYMENT AUTHORISED" >PAYMENT </div> </td>
                <td><div class="payment">  <input type="text" class="particular" placeholder="PAYMENT RELEASED"><div class="claer"></div>PAYMENT RELEASED</div></td>
                <td colspan="2"> <div class="payment"><input type="text" placeholder="RECEIVED BY" >RECEIVED BY</div></td>
              </tr>
            </table>
            <div class="claer"></div>
                        </div>
                    </div>
            <!------------------------/// Tab 22 END ----------------->
            <!-------------------------//// TAB 22 Started Here ------------------->
            <div id="tab31" class="user_static_7 tab_content_1 first_tab">
            
            <div class="table_save">
                         <div class="table_right">
                                  <!----------/// ADD USER ----------->
                                  <div class="Logged_User_tab add_user_js add_user_bg">SAVE</div>
                                  <!----------/// ADD USER END --------> 
                                  <!----------/// User List ----------->
                                  <div class="Logged_User_tab  onclick">CANCEL</div>
                                  <!----------/// User List END --------> 
                            
                          </div>
                          <!-------------------/// USER LIST RIGHT END ------------>
                          <div class="claer"></div>
                 </div>
            
              <div class="from_main">
              
              <table>
              <tr>
                <td colspan="3" class="table_heading">NEW CUSTOMER ID CREATION FORM</td>
              </tr>
              <tr>
                <td colspan="3">Details required to be submitted for opening new customer by the end users:-</td>
              </tr>
              <tr>
                <td width="6%">S.No</td>
                <td width="34%">Check Points </td>
                <td width="60%">To be Filled up by the respective users who wants to create a new Customer</td>
              </tr>
              <tr>
                <td>1</td>
                <td>Old Customer code, if any:</td>
                <td class="new_customer"><input type="text" class="particular" placeholder="Enter Customer code Ex:EMS1286979" /></td>
              </tr>
              <tr>
                <td>2</td>
                <td>Name of the Company  OR Customer  : </td>
                <td class="new_customer"><input type="text" class="particular" placeholder="Enter Name of the Comapny" /></td>
              </tr>
              <tr>
                <td>3(a)</td>
                <td>Customer ’s Address: Registered Office</td>
                 <td class="new_customer"><input type="text" class="particular" placeholder="Enter Customer ’s Address: Registered Office" /></td>
              </tr>
              <tr>
                <td>3(b)</td>
                <td>Dispatch /Consignee Address, if any: </td>
                <td class="new_customer"><input type="text" class="particular flat_detele" placeholder="Enter Dispatch /Consignee Address, if any" />
                          <div class="addanddelete">
                                   <div class="add_table"></div>
                                   <div class="delete_table"></div>
                          </div>
                </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                  <div class="box_input_1"> 
                        <input type="text" class="small_box" placeholder="Enter Pin code Ex:910090" />
                        <div class="claer"></div>
                         Pin code
                  </div>
                  <div class="box_input_2">
                        <input type="text" class="small_box" placeholder="Enter City" />
                        <div class="claer"></div>
                        City 
                  </div>
                  </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                  <div class="box_input_1">
                        <input type="text" class="small_box" placeholder="Enter State" />
                        <div class="claer"></div>
                        State 
            
                  </div>
                  <div class="box_input_2">
                  <input type="text" class="small_box" placeholder="Enter Country" />
                    <div class="claer"></div>
                      Country 
                  </div>
                  </td>
              </tr>
              <tr>
                <td>4.</td>
                <td>Tel. no. of the Customer with STD code:</td>
                <td class="new_customer">
                  <input type="text" class="particular number std_phone" placeholder="Enter Tel. no. " />
                  <select>
                      <option>Country Code</option>
                      <option>+91</option>
                      <option>+92</option>
                      <option>+93</option>
                      <option>+94</option>
                      <option>+95</option>
                      <option>+96</option>    
                  </select>
                  <select>
                    <option>STD</option>
                    <option>01634</option>
                    <option>08732</option>
                    <option>08512</option>
                    <option>08513</option>
                    <option>08514</option>
                    <option>08515</option>
                    <option>08516</option>
                  </select>
                
            </td>
              </tr>
              <tr>
                <td>5.</td>
                <td>Fax no. of the Customer with STD Code: </td>
                <td class="new_customer">
                 <input type="text" class="particular number std_phone" placeholder="Enter Tel. no. " />
                  <select>
                      <option>Country Code</option>
                      <option>+91</option>
                      <option>+92</option>
                      <option>+93</option>
                      <option>+94</option>
                      <option>+95</option>
                      <option>+96</option>    
                  </select>
                  <select>
                    <option>STD</option>
                    <option>01634</option>
                    <option>08732</option>
                    <option>08512</option>
                    <option>08513</option>
                    <option>08514</option>
                    <option>08515</option>
                    <option>08516</option>
                  </select>
                
                
                </td>
              </tr>
              <tr>
                <td>6.</td>
                <td>Email ID:</td>
                <td class="new_customer"><input type="email"  class="particular" placeholder="Enter Email Id Ex:xxx@xx.com"/></td>
              </tr>
              <tr>
                <td>7.</td>
                <td>Website:</td>
                <td class="new_customer"><input type="text" class="particular" placeholder="Enter Website Ex:http://xxxxx.com" /></td>
              </tr>
              <tr>
                <td>8.</td>
                <td>Name of the Contact Person:</td>
                <td class="new_customer"><input type="text" class="particular" placeholder="Enter Name of the Contact Person"/></td>
              </tr>
              <tr>
                <td>9.</td>
                <td>PAN  (*Copy Attach)<div class="claer"></div>
            (If applied, IT acknowledged copy of Application is to be collected &amp; should <br />
                be given to respective VMGs. )</td>
                <td class="new_customer"><input type="file" class="particular" /></td>
              </tr>
              <tr>
                <td>10.</td>
                <td>Service Tax Registration No. &amp; Date:</td>
                <td class="new_customer"><input type="text" class="particular" placeholder="Enter Service Tax Registration No" /><input type="date" /></td>
              </tr>
              <tr>
                <td>11.</td>
                <td>Service tax category:</td>
                <td class="new_customer"><input type="text" class="particular" placeholder="Enter Service tax category"  />
                
                          <div class="addanddelete">
                                   <div class="add_table"></div>
                                   <div class="delete_table"></div>
                          </div>
                
                </td>
              </tr>
              <tr>
                <td>12(a).</td>
                <td>Old Sales Tax Registration no. with date:</td>
                <td class="new_customer"><input type="text" class="particular" placeholder="Enter Old Sales Tax Registration no" /><input type="date" /></td>
              </tr>
              <tr>
                <td>12(b)</td>
                <td>Local sales tax No: (* Copy Attach)</td>
                <td class="new_customer"><input type="file" class="particular" /></td>
              </tr>
              <tr>
                <td>12(c)</td>
                <td>Central sales tax No.: (*Copy Attach)</td>
                <td class="new_customer"><input type="file" class="particular" /></td>
              </tr>
              <tr>
                <td>12(d)</td>
                <td>WCT Regn. No. with date:</td>
                <td class="new_customer"><input type="text" class="particular" /><input type="date" /></td>
              </tr>
              <tr>
                <td>12(e)</td>
                <td>VAT TIN:  (*Copy Attach)</td>
                <td class="new_customer"><input type="file" class="particular"  /></td>
              </tr>
              <tr>
                <td>13.</td>
                <td>SSI Regn. No. &amp; date:</td>
                <td class="new_customer"><input type="text" class="particular" /> <input type="date" /></td>
              </tr>
              <tr>
                <td>14.</td>
                <td>SSI Validity till:</td>
                <td class="new_customer"><input type="file" class="particular" /></td>
              </tr>
              <tr>
                <td>15.</td>
                <td>EPF A/c No.:</td>
                <td class="new_customer"><input type="text" class="particular" placeholder="Enter EPF A/c No" /></td>
              </tr>
              <tr>
                <td>16</td>
                <td>Customer Type: Mfg./Service/Misc.:<div class="claer"></div>
                Category: Co./Non-co./Firm/Govt. agency/others</td>
                <td class="new_customer"><input type="text" class="particular" placeholder="Enter Customer Type" /></td>
              </tr>
              <tr>
                <td>17.</td>
                <td>Other (Please specify)</td>
                <td class="new_customer"><input type="text" class="particular" placeholder="Enter Other" /></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>Excise related details: </td>
                <td class="new_customer"><input type="text"  class="particular" placeholder="Enter Excise related details"/></td>
              </tr>
              <tr>
                <td>18.</td>
                <td>Excise Registration No.:</td>
                <td class="new_customer"><input type="text" class="particular" placeholder="Enter Excise Registration No" /></td>
              </tr>
                <tr>
                <td>19.</td>
                <td>ECC No.</td>
                <td class="new_customer"><input type="text" class="particular" placeholder="ECC No."/></td>
              </tr>
                <tr>
                <td>20.</td>
                <td>EXC Range</td>
               <td class="new_customer"><input type="text" class="particular" placeholder="Enter EXC Range" /></td>
              </tr>
                <tr>
                <td>21.</td>
                <td>EXC Division</td>
                <td class="new_customer"><input type="text" class="particular" placeholder="Enter EXC Division" /></td>
              </tr>
                <tr>
                <td>22.</td>
                <td>Commissionerate</td>
                <td class="new_customer"><input type="text" class="particular" placeholder="Enter Commissionerate"/></td>
              </tr>
                <tr>
                <td>23.</td>
                <td>Sign of the user submitting the above details</td>
                <td class="new_customer"><input type="text" class="particular" placeholder="user submitting" /></td>
              </tr>
                <tr>
                <td colspan="3">&nbsp;</td>
              </tr>
                <tr>
                <td colspan="3">For Office Use: (AVI-OIL INDIA [P] LTD.)</td>
              </tr>
                <tr>
                <td>24.</td>
                <td>Gen. Bus. Posting Group </td>
                <td class="new_customer small_cc">CC <input type="text" />DOM<input type="text" />FOR<input type="text" />JW<input type="text" />OSL<input type="text" /></td>
              </tr>
                <tr>
                <td>25.</td>
                <td>Excise Bus. Posting Group </td>
                <td class="new_customer small_cc">DOM<input type="text" />DOM-EX<input type="text" />EX-ZERO<input type="text" />FOR<input type="text" /></td>
              </tr>
                <tr>
                <td>26.</td>
                <td>Customer Posting Group </td>
                <td class="new_customer small_cc">CAV<input type="text" />CC<input type="text" />DEF-SEC<input type="text" />EXP<input type="text" />HAL<input type="text" />IAF<input type="text" />IAR<input type="text" />IDL<input type="text" />INV<input type="text" />OTH<input type="text" /></td>
              </tr>
                <tr>
                <td>27.</td>
                <td colspan="2">
                          <div class="twitten_seven_main">
                                 
                                   <input type="text" class="twitten_seven" placeholder="Enter Customer Code " />
                                   <div class="claer"></div>
                                   Customer Code 
                          
                          </div>
                          <div class="twitten_seven_main">
                                 <input type="text" class="twitten_seven" placeholder="Enter Payment Term Code" />
                                 <div class="claer"></div>
                                 Payment Term Code
                                 
                           </div> 
                   </td>
              </tr>
                <tr>
                <td>28.</td>
                <td>Customer Creation Date </td>
                <td><input type="date" class="particular" /></td>
              </tr>
                <tr>
                <td colspan="3">
                   <div class="box_input">
                           <input type="text" placeholder="Enter Dep. " />
                           <div class="claer"></div>
                           (Marketing Dep.) 
                   </div>  
                   <div class="box_input">
                            <input type="text" placeholder="Enter Dep. "  /> 
                            <div class="claer"></div>
                            (Information Technology Dep.)
                   </div>
                   <div class="box_input">
                            <input type="text" placeholder="Enter Dep. "  />
                            <div class="claer"></div>
                            (Accounts Dep.)
                    </div>
                    </td>
              </tr>
                <tr>
                <td colspan="3">
                     <div class="box_input">
                             <input type="text" placeholder="Indented by "/>
                             <div class="claer"></div>
                             Indented by 
                     </div>
                     <div class="box_input">
                             <input type="text" placeholder="Prepared by"/>
                             <div class="claer"></div>
                             Prepared by 
                     </div>
                     <div class="box_input">
                            <input type="text" placeholder="Checked by" />
                            <div class="claer"></div>
                            Checked by
                     </div>
                    </td>
                </tr>
                <tr>
                <td colspan="3">
                  <div class="box_input">
                           <input type="text" placeholder="Indent approved by" />
                           <div class="claer"></div>
                           Indent approved by 
                  </div> 
                  <div class="box_input">
                           <input type="text" placeholder="Verified by" />
                           <div class="claer"></div>
                           Verified by
                  </div> 
                  <div class="box_input">
                          <input type="text" placeholder=" Authorised by" />
                          <div class="claer"></div>
                          Authorised by
                  </div>
                   </td>
              </tr>
              
            </table>
              
              
              
              </div>
            
            </div>
            <!------------------------/// Tab 22 END ----------------->
            <!-------------------------//// TAB 22 Started Here ------------------->
            <div id="tab35" class="user_static_8 tab_content_1">
            <form:form method="post" action="submitLeaveForm" >
            <div class="table_save">
                         <div class="table_right">
                                  <!----------/// ADD USER ----------->
                                  <!-- <div class="Logged_User_tab add_user_js add_user_bg">SAVE</div> -->
                                  <div class="Logged_User_tab add_user_js add_user_bg">
                                  <input type="submit" value="SUBMIT">
                                  </div>
                                  <!----------/// ADD USER END --------> 
                                  <!----------/// User List ----------->
                                  <div class="Logged_User_tab  onclick">CANCEL</div>
                                  <!----------/// User List END --------> 
                            
                          </div>
                          <!-------------------/// USER LIST RIGHT END ------------>
                          <div class="claer"></div>
                 </div>
                 
            <div class="from_main_leave">
            <table >
              <tr>
                <td colspan="2" class="table_heading">LEAVE APPLICATION FORM</td>
              </tr>
              <tr>
                <td colspan="2">The application must be submitted at least 7 daysbefore the date on which Earned leave is to commence except in the case of unforseen circumstances.Sick Leave applicationmust be submitted with 2 working daysof rejoining.</td>
              </tr>
          
              <tr>
                <td>&nbsp;</td>
                <td>Date <input type="date" /></td>
              </tr>
              <tr>
                <td colspan="2" class="table_list">
                     <ul>
                          <li class="table_name">Name </li>
                          <li><input type="text" class="particular_1" placeholder="Enter Name" name="empname"/></li>
                          <li class="table_name">Emp.No. </li>
                          <li><input type="text"  class="particular_1" placeholder="Enter Emp.No." name="empid" /></li>
                    </ul>
                </td>
              </tr>
              <tr>
                <td colspan="2" class="table_list">
                  <ul>
                     <li class="table_name">Designation</li>
                     <li><input type="text" class="particular_1" placeholder="Enter Designation" /></li>
                     <li class="table_name">Dept./Section</li>
                     <li><input type="text" class="particular_1" placeholder="Enter Dept./Section" /></li>
                  </ul>
                  </td>
              </tr>
              <tr>
                <td colspan="2" class="nature_1"><label>Nature of Leave applied for :</label> <input type="checkbox" /><label>Earned Leave</label> <input type="checkbox" />Sick Leave (Attach Medical certificate for more than 2 days)</td>
              </tr>
              <tr>
                <td colspan="2" class="applied">Date applied for leave<input type="date" /> To<input type="date" /> No.of Days:<input type="text" placeholder="Enter No.of Days " name="noOfDays" /></td>
              </tr>
              <tr>
                <td colspan="2" class="nature_2"><label>Brief reasons for leave</label> <textarea placeholder="Brief reasons for leave" name="leavereason"></textarea>
                     <div class="addanddelete">
                                   <div class="add_table"></div>
                                   <div class="delete_table"></div>
                     </div>
                
                </td>
              </tr>
              <tr>
                <td colspan="2" class="nature_2"><label>Address while on leave</label> <textarea placeholder="Address while on leave"></textarea>
                          <div class="addanddelete">
                                   <div class="add_table"></div>
                                   <div class="delete_table"></div>
                          </div>
                </td>
              </tr>
              <tr>
                <td colspan="2" ><label>Telephone(s)(if any )</label>
            
                  <select class="country_code">
                      <option>Country Code</option>
                      <option>+91</option>
                      <option>+92</option>
                      <option>+93</option>
                      <option>+94</option>
                      <option>+95</option>
                      <option>+96</option>    
                  </select>
                  <select>
                    <option>STD</option>
                    <option>01634</option>
                    <option>08732</option>
                    <option>08512</option>
                    <option>08513</option>
                    <option>08514</option>
                    <option>08515</option>
                    <option>08516</option>
                  </select>
                        <input type="text" class="particular number std_phone" placeholder="Enter Tel. no. ">
                 Pin<input type="text" class="pin" placeholder="Pin" /></td>
              </tr>
              <tr>
                <td colspan="2">Recommended / Not Recommended due to :&nbsp;&nbsp;&nbsp;<input type="text" class="particular recpmmed" placeholder="Recommended / Not Recommended due to" /></td>
              </tr>
              <tr>
                <td >Recommending Authority <input type="text" placeholder="Recommending Authority" class="recomded" /></td>
                <td> <input type="file" /> <div class="claer"></div>Signature of the Applicant</td>
              </tr>
              <tr>
                <td colspan="2" class="leave"><label>Leave credit available</label><input type="text" placeholder="Leave credit" /> 
                <input type="text" placeholder="Leave credit" /> <input type="checkbox" placeholder="Leave credit"  /> <label>Leave granted with Pay/without pay</label></td>
              </tr>
              <tr>
                <td colspan="2" class="leave"><label>No.of times availed during the year</label><input type="text" placeholder="No.of times" /> 
                <input type="text" placeholder="No.of times"/> <input type="checkbox"  /> <label>Leave not granted</label></td>
              </tr>
              <tr>
                <td colspan="2" class="leave_1"><label>Personnel Officer</label><input type="text" placeholder="Personnel Officer" /><label> Date</label><input type="date" class="small_date" /> <label>Sanctioning Authority</label><input type="text"  placeholder="Sanctioning" /> <label>Date</label><input type="date" class="small_date" /></td>
              </tr>
              <tr>
                <td colspan="2">(For the Applicant)</td>
              </tr>
              <tr>
                <td colspan="2" class="table_list">
                     <ul>
                          <li class="table_name">Name </li>
                          <li><input type="text" class="particular_1" placeholder="Enter Name "></li>
                          <li class="table_name">Emp.No. </li>
                          <li><input type="text" class="particular_1" placeholder="Enter Emp.No."></li>
                    </ul>
                </td>
              </tr>
              <tr>
             <td colspan="2" class="table_list">
                  <ul>
                     <li class="table_name">Designation</li>
                     <li><input type="text" class="particular_1" placeholder="Enter Designation"></li>
                     <li class="table_name">Dept./Section</li>
                     <li><input type="text" class="particular_1" placeholder="Enter Dept./Section"></li>
                  </ul>
                  </td>
              </tr>
              <tr>
                <td colspan="2" class="emp_no"><label>You have been granted</label><input type="text" placeholder="Granted" />
                <label> day earned /sick leave from</label> <input type="text" /><label>to</label><input type="text" /></td>
              </tr>
              <tr>
                <td>upon your request dated </td>
                <td><input type="date" /></td>
              </tr>
              <tr>
                <td colspan="2" class="emp_no_1"><label>You have to your credit</label><input type="text" placeholder="Credit" /><label>days earned leave and</label><input type="text" placeholder="Days Earned" /><label> days Sick leave</label> <input type="text" placeholder="Days Sick Leave" /></td>
              </tr>
              <tr>
                <td>after account for the sanctioned leave </td>
                <td><input type="text" placeholder="Sanctioned Leave" /></td>
              </tr>
              <tr>
                <td colspan="2" class="emp_no_1"><label>Your request dated</label><input type="date" /><label> was considered but leave not granted due to exigencies of work. </label></td>
              </tr>
            </table>
            </div>
            </form:form>
            
            </div>
            <!------------------------/// Tab 22 END ----------------->
            <!-------------------------//// TAB 22 Started Here ------------------->
            <div id="tab32" class="user_static_9 tab_content_1">
            <div class="table_save">
                         <div class="table_right">
                                  <!----------/// ADD USER ----------->
                                  <div class="Logged_User_tab add_user_js add_user_bg">SAVE</div>
                                  <!----------/// ADD USER END --------> 
                                  <!----------/// User List ----------->
                                  <div class="Logged_User_tab  onclick">CANCEL</div>
                                  <!----------/// User List END --------> 
                            
                          </div>
                          <!-------------------/// USER LIST RIGHT END ------------>
                          <div class="claer"></div>
                 </div>
            <div class="from_main_leave">
            <table >
              <tr>
                <td colspan="2" class="table_heading">Master Vendor Database</td>
              </tr>
              <tr>
                <td width="57%">Full Name of the Company </td>
                <td width="43%"><input type="text" class="bank_name" placeholder="Full Name of the Company"  /></td>
              </tr>
              <tr>
                <td>Registration Number (if any)</td>
                <td><input type="text" class="bank_name" placeholder="Registration Number" /></td>
              </tr>
              <tr>
                <td>Full Address:</td>
                <td><input type="text" class="bank_name" placeholder="Full Address" />
                            <div class="addanddelete">
                                 <div class="add_table"></div>
                                 <div class="delete_table"></div>
                            </div>
               </td>
              </tr>
              <tr>
                <td colspan="2" class="for_inner">
                <table class="inner_table_data">
                  <tr>
                    <td><strong>Correspondence Address</strong></td>
                    <td><strong>Works/ Despatch Address</strong></td>
                    <td><strong>Invoicing Address</strong></td>
                  </tr>
                  <tr>
                    <td><textarea class="database" placeholder="Correspondence Address"></textarea></td>
                    <td><textarea class="database" placeholder="Works/ Despatch Address" ></textarea></td>
                    <td><textarea class="database"  placeholder="Invoicing Address"></textarea></td>
                  </tr>
                   <tr>
                    <td><strong>Contact Details</strong></td>
                    <td><strong>Sales  / Operations</strong></td>
                    <td><strong>Accounts</strong></td>
                  </tr>
                   <tr>
                    <td>Name</td>
                    <td><input type="text" placeholder="Enter Name" /></td>
                    <td><input type="text" placeholder="Enter Name" /></td>
                  </tr>
                   <tr>
                    <td>Title</td>
                    <td><input type="text" placeholder="Enter Title " /></td>
                    <td><input type="text" placeholder="Enter Title "  /></td>
                  </tr>
                   <tr>
                    <td>Direct Telephone / Hand phone</td>
                    <td><input type="text" placeholder="Enter phone No." /></td>
                    <td><input type="text" placeholder="Enter phone No." /></td>
                  </tr>
                </table>
                </td>
              </tr>
              <tr>
                <td colspan="2">Bank Details</td>
              </tr>
              <tr>
                <td>Currency</td>
                <td><input type="text" class="bank_name" placeholder="Enter Currency"/></td>
              </tr>
              <tr>
                <td>Bank Name</td>
                <td><input type="text" class="bank_name" placeholder="Enter Bank Name" /></td>
              </tr>
              <tr>
                <td>Bank Account Number</td>
                <td><input type="text" class="bank_name" placeholder="Enter Bank Account Number" /></td>
              </tr>
              <tr>
                <td>Bank Address</td>
                <td><input type="text" class="bank_name" placeholder="Enter Bank Address" />
                
                    <div class="addanddelete">
                         <div class="add_table"></div>
                         <div class="delete_table"></div>
                    </div>
                
                </td>
              </tr>
              <tr>
                <td>Bank Code</td>
                <td><input type="text" class="bank_name" placeholder="Enter Bank Code" /></td>
              </tr>
              <tr>
                <td>Swift Code (Mandatory)</td>
                <td><input type="text" class="bank_name" placeholder="Enter Swift Code" /></td>
              </tr>
              <tr>
                <td>RIB</td>
                <td><input type="text" class="bank_name" placeholder="Enter RIB" /></td>
              </tr>
              <tr>
                <td>IBAN (for Euro payments)</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>Fedwire routing number 
                (for USD payments)</td>
                <td><input type="text" class="bank_name" placeholder="Enter Fedwire routing number " /></td>
              </tr>
              <tr>
                <td>Sort Code (for GBP payments)</td>
                <td><input type="text" class="bank_name" placeholder="Enter Sort Code" /></td>
              </tr>
              <tr>
                <td>Name of Beneficiary Bank’s
                Correspondent</td>
                <td><input type="text" class="bank_name" placeholder="Name of Beneficiary Bank’s Correspondent" /></td>
              </tr>
              <tr>
                <td>Correspondent Bank’s Swift
                Code (Mandatory)</td>
                <td><input type="text" class="bank_name" placeholder="Correspondent Bank’s Swift Code" /></td>
              </tr>
              <tr>
                <td>Other (Please specify)</td>
                <td><input type="text" class="bank_name" placeholder="Other"/></td>
              </tr>
              <tr>
                <td colspan="2">For Office Use: (AVI-OIL INDIA [P] LTD.)</td>
              </tr>
              <tr>
                <td >Gen. Bus. Posting Group </td><td><input type="checkbox"/><label>CC</label><input type="checkbox"/><label>DOM</label>
                <input type="checkbox"/><label>FOR</label>
                <input type="checkbox"/><label>JW</label>
                <input type="checkbox"/><label>OSL</label></td>
              </tr>
              <tr>
                <td>Excise Bus. Posting Group</td>
                <td><input type="checkbox"/><label>DOM</label><input type="checkbox"/><label>FOR</label></td>
              </tr>
              <tr>
                <td>Vendor Posting Group</td>
                <td><input type="checkbox"/><label>IMP</label><input type="checkbox"/><label> DOM</label>
                <input type="checkbox"/><label> SRP</label>
                <input type="checkbox"/><label> CPC</label>
                <input type="checkbox"/><label> OTH</label>
                <input type="checkbox"/><label> CC</label></td>
              </tr>
              <tr>
                <td>Vendor code</td>
                <td><input type="text" class="bank_name" placeholder="Enter Vendor code" /></td>
              </tr>
              <tr>
                <td>Vendor Creation Date</td>
                <td><input type="date" class="bank_name" /></td>
              </tr>
            </table>
            </div>
            </div>
            <!------------------------/// Tab 22 END ----------------->
            <!-------------------------//// TAB 22 Started Here ------------------->
            <div id="tab37" class="user_static_10 tab_content_1">
            <div class="table_save">
                         <div class="table_right">
                                  <!----------/// ADD USER ----------->
                                  <div class="Logged_User_tab add_user_js add_user_bg">SAVE</div>
                                  <!----------/// ADD USER END --------> 
                                  <!----------/// User List ----------->
                                  <div class="Logged_User_tab  onclick">CANCEL</div>
                                  <!----------/// User List END --------> 
                            
                          </div>
                          <!-------------------/// USER LIST RIGHT END ------------>
                          <div class="claer"></div>
                 </div>
            <div class="from_main_leave_2">
            <table>
              <tr>
                <td colspan="6" class="table_heading">REIMBURSEMENT OF MEDICAL EXPENSES</td>
              </tr>
              <tr>
                <td width="224" >Name of the Employee</td>
                <td  colspan="2"><input type="text" class="emple_1" placeholder="Name of the Employee" /></td>
                <td width="144" >Employee No.</td>
                <td  colspan="2"><input type="text" class="small_medical" placeholder="Enter Employee No." /></td>
              </tr>
              <tr>
                <td>Designation</td>
                <td  colspan="2"><input type="text" class="emple_1" placeholder="Enter Designation" /></td>
                <td>Location</td>
                 <td  colspan="2"><input type="text" class="small_medical" placeholder="Location" /></td>
              </tr>
              <tr>
                <td colspan="6">Hospitalisation claim No,Yes No Yes (if yes  please indicate 'H' against Patient Name in Col.3 below)</td>
              </tr>
              <tr>
                <td colspan="6">If yes,Name of the Hospital: <input type="text" class="emple_1" placeholder="If yes,Name of the Hospita"/></td>
              </tr>
              <tr>
                <td>Name of the Patient</td>
                <td width="217">Age</td>
                <td width="167">Name of claim</td>
                <td>Relationship with the Employee</td>
                <td width="224">Nature of illness</td>
                <td width="168">Name of the Doctor</td>
              </tr>
              <tr>
                <td><input type="text" class="small_medical" placeholder="Enter Name" /></td>
                <td><input type="text" class="small_medical" placeholder="Enter Age" /></td>
                <td><input type="text" class="small_medical" placeholder="Enter Name" /></td>
                <td><input type="text" class="small_medical"  placeholder="Relationship"/></td>
                <td><input type="text" class="small_medical"  placeholder="Illness" /></td>
                <td><input type="text" class="small_medical" placeholder="Doctor" />
                </td>            
              </tr>
              <tr>
                 <td colspan="6">    
                             <div class="addanddelete">
                                         <div class="add_table"></div>
                                         <div class="delete_table"></div>
                            </div>
                
                </td>
              </tr>
              
              <tr>
                <td rowspan="3" colspan="3"><p>Duration of Treatment/Hospitalisation:From</p>
                <p> (To be given each patient)</p></td>
                <td colspan="3">(i) <input type="text" class="small_medical" placeholder="Duration"> To <input type="text" class="small_medical"placeholder="Duration"></td>
              </tr>
              <tr>
              <td colspan="3">(i) <input type="text" class="small_medical" placeholder="Duration"> To <input type="text" class="small_medical" placeholder="Duration"></td>
              </tr>
              <tr>
            <td colspan="3">(i) <input type="text" class="small_medical" placeholder="Duration"> To <input type="text" class="small_medical" placeholder="Duration"></td>
              </tr>
              <tr>
                <td colspan="1">Expenses incurred towards:</td>
                <td colspan="2">No.of Receipts</td>
                <td colspan="2">Receipt Nos.and dates</td>
                <td >Total Amount</td>
              </tr>
              <tr>
                <td>Consultation</td>
                <td colspan="2"><input type="text" class="emple_1" placeholder="Consultation"></td>
                <td colspan="2"><input type="text" class="small_medical" placeholder="Consultation"><input type="date" class="small_medical"></td>
                <td >
                <table >
                  <tr>
                    <td><input  type="text" class="rs money" placeholder="Rs."/></td>
                    <td><input  type="text" class="rs money" placeholder="p."/></td>
                  </tr>
                </table>
                </td>
              </tr>
              <tr>
                <td>Investigation</td>
                <td colspan="2"><input type="text" class="emple_1" placeholder="Investigation"></td>
                <td colspan="2"><input type="text" class="small_medical" placeholder="Receipt Nos"><input type="date" class="small_medical"></td>
                <td >
                <table >
                <tr>
                    <td><input  type="text" class="rs money" placeholder="Rs."/></td>
                    <td><input  type="text" class="rs money" placeholder="p."/></td>
                  </tr>
                </table>
                </td>
              </tr>
               <tr>
                <td>Medicines</td>
                <td colspan="2"><input type="text" class="emple_1" placeholder="Medicines"></td>
                <td colspan="2"><input type="text" class="small_medical" placeholder="Receipt Nos"><input type="date" class="small_medical"></td>
                <td >
                <table >
                 <tr>
                    <td><input  type="text" class="rs money" placeholder="Rs."/></td>
                    <td><input  type="text" class="rs money" placeholder="p."/></td>
                  </tr>
                </table>
                </td>
              </tr>
              <tr>
                <td>Hospital Charges</td>
                <td colspan="2"><input type="text" class="emple_1" placeholder="Hospital Charges"/></td>
                <td colspan="2"><input type="text" class="small_medical" placeholder="Receipt Nos"><input type="date" class="small_medical"/></td>
                <td >
                <table >
                  <tr>
                    <td><input  type="text" class="rs money" placeholder="Rs."/></td>
                    <td><input  type="text" class="rs money" placeholder="p."/></td>
                  </tr>
                </table>
                </td>
              </tr>
             <tr>
                <td>Other</td>
                <td colspan="2"><input type="text" class="emple_1" placeholder="Other"></td>
                <td colspan="2"><input type="text" class="small_medical" placeholder="Receipt Nos"><input type="date" class="small_medical"></td>
                <td>
                <table>
                <tr>
                    <td><input  type="text" class="rs money" placeholder="Rs."/></td>
                    <td><input  type="text" class="rs money" placeholder="p."/></td>
                  </tr>
                </table>
                </td>
              </tr>
              <tr>
                <td colspan="3" rowspan="2">Amount in Words:Rupees <input type="text" class="emple_1" /></td>
                <td>G.Total</td>
                <td><input type="text" class="small_medical" placeholder="G.Total" /></td>
                <td><input type="text" class="small_medical" placeholder="G.Total" /></td>
              </tr>
              <tr>
                <td>Rounded to</td>
                <td><input type="text" class="small_medical" placeholder="Rounded to"/></td>
                <td><input type="text" class="small_medical" placeholder="Rounded to" /></td>
              </tr>
              <tr>
                <td colspan="6">Certifled that the expenditure incurred as above has not been claimed/reimbursed through any other scheme such as medicalInsurance,scheme of spouse's organisation etc.The members of the family are dependent on me.</td>
              </tr>
              <tr>
                <td colspan="4" rowspan="2">Total No. of Enclosure
                (Employee to sign on the reverse of each Bill/Receipt)<input type="text" class="emple_1" placeholder="Total No. of Enclosure" /></td>
                <td colspan="2" >SIGNATURE OF THE EMPLOYEE<br /><input type="file" class="emple_1" /></td>
              </tr>
              <tr>
                <td colspan="2">Date <input type="date" class="emple_1" /></td>
              </tr>
              <tr>
                <td colspan="2" rowspan="2">A.Domiciliary Entitlement Block Year 20</td>
                <td>Eligibility</td>
                <td>Availed</td>
                <td>Balance Available</td>
                <td>Balance c/f</td>
              </tr>
              <tr>
                <td><input type="text" class="small_medical" placeholder="Eligibility"></td>
                <td><input type="text" class="small_medical" placeholder="Availed"></td>
                <td><input type="text" class="small_medical" placeholder="Balance Available"></td>
                <td><input type="text" class="small_medical" placeholder="Balance c/f"></td>
              </tr>
              <tr>
                <td colspan="3">B.Clam Verification</td>
                <td>Domiciliary</td>
                <td>Hospitalisation</td>
                <td>Total</td>
              </tr>
              <tr>
                <td colspan="3">Amount Claimed</td>
                <td><input type="text" class="small_medical" placeholder="Amount Claimed"></td>
                <td><input type="text" class="small_medical" placeholder="Amount Claimed"></td>
                <td><input type="text" class="small_medical" placeholder="Amount Claimed"></td>
              </tr>
              <tr>
                <td colspan="3">Claim admitted for </td>
                <td><input type="text" class="small_medical" placeholder="Claim admitted for"></td>
                <td><input type="text" class="small_medical" placeholder="Claim admitted for"></td>
                <td><input type="text" class="small_medical" placeholder="Claim admitted for"></td>
              </tr>
              <tr>
                <td colspan="3">Rupees</td>
                <td><input type="text" class="small_medical" placeholder="Rupees"></td>
                <td><input type="text" class="small_medical" placeholder="Rupees"></td>
                <td><input type="text" class="small_medical" placeholder="Rupees"></td>
              </tr>
              <tr>
                <td colspan="2">CLAIM VERIFIED DATE
                <input type="date" class="small_medical">
                </td>
                <td colspan="2">CLAIM APPROVED DATE
                 <input type="date" class="small_medical">
                </td>
                <td colspan="2">PAYMENT AUTHORISED DATE
                 <input type="date" class="small_medical">
                </td>
              </tr>
                
            </table>
            </div>
            <div class="claer"></div>
            </div>
            <!------------------------/// Tab 22 END ----------------->
            <!-------------------------//// TAB 22 Started Here ------------------->
            <div id="tab38" class="user_static_11 tab_content_1">
            <div class="table_save">
                         <div class="table_right">
                                  <!----------/// ADD USER ----------->
                                  <div class="Logged_User_tab add_user_js add_user_bg">SAVE</div>
                                  <!----------/// ADD USER END --------> 
                                  <!----------/// User List ----------->
                                  <div class="Logged_User_tab  onclick">CANCEL</div>
                                  <!----------/// User List END --------> 
                            
                          </div>
                          <!-------------------/// USER LIST RIGHT END ------------>
                          <div class="claer"></div>
                 </div>
                 <div class="from_main_leave left_space_two">
                        <table >
              <tr>
                <td colspan="5" rowspan="2" class="table_heading">PURCHASE REQUISITION</td>
                <td colspan="2">P.R.No: <input type="text" class="small_medical" placeholder="Enter P.R.No"></td>
              </tr>
              <tr>
                <td colspan="2">Date &nbsp;&nbsp;&nbsp;&nbsp;<input type="date" class="small_medical"></td>
              </tr>
              <tr>
                <td colspan="7"><input type="checkbox" /><label>MOST URGENT</label>  <input type="checkbox" /><label>IMMEDIATE</label>
                  <input type="checkbox" /><label>ROUTINE PURCHASE</label></td>
              </tr>
              <tr>
                <td colspan="7">From: <input type="text" class="small_medical" placeholder="From"> Dept. <input type="text" class="small_medical" placeholder="Dept"> Location<input type="text" class="small_medical" placeholder="Location"></td>
              </tr>
              <tr>
                <td colspan="5">To:COMMERCIAL/MATERIAL /ADMIN <input type="text" class="small_medical" placeholder="Enter Here"></td>
                <td colspan="2">PLANT /HO <input type="text" class="small_medical" placeholder="PLANT /HO"></td>
              </tr>
              <tr>
                <td colspan="7">Nature of Materials:<input type="checkbox" placeholder="Nature of Materials" /> <label>STOCK ITEM</label><input type="checkbox" placeholder="STOCK ITEM" />
                <label> LOCAL PURCHASE</label><input type="checkbox" placeholder="LOCAL PURCHASE" /><label> REGULAR PURCHASE</label></td>
              </tr>
              <tr>
                <td colspan="7"><input type="checkbox" placeholder="RAW MATERIALS" /><label>RAW MATERIALS</label><input type="checkbox" />
                <label> COMPONENTS &amp; SPARES ADMIN.STORES</label><input type="checkbox" /><label> PRODUCTION CONSUMABLES</label></td>
              </tr>
              <tr>
                <td colspan="7"><input type="checkbox" /><label>MAINTENANCE CONSUMABLES</label><input type="checkbox" /><label> MISC.STORES</label>
                <input type="checkbox" /><label> PACKAGING MATERIALS</label>
                <input type="checkbox" /><label> LAB MATLS</label></td>
              </tr>
              <tr>
                <td width="5%">S.No</td>
                <td width="19%">Item Code</td>
                <td width="20%">Description</td>
                <td width="12%">Unit</td>
                <td width="14%">Packing</td>
                <td width="14%">Quantity</td>
                <td width="16%"> Source<br />
                (For LPO/PO)</td>
              </tr>
              <tr class="serial_no_page">
                <td><input type="text" class="serial_no" placeholder="No" /></td>
                <td><input type="text" placeholder="Item Code" /></td>
                <td><input type="text" placeholder="Description"/></td>
                <td><input type="text" placeholder="Unit" /></td>
                <td><input type="text" placeholder="Packing" /></td>
                <td><input type="text" placeholder="Quantity"/></td>
                <td><input type="text" placeholder="Source" /></td>
              </tr>
              <tr>
                <td colspan="7">
                    <div class="addanddelete">
                           <div class="add_table"></div>
                           <div class="delete_table"></div>
                  </div>
                </td>
              </tr>
              <tr>
                <td colspan="4" class="indent_ul">
                   <ul>
                     <li class="indent">INDENTOR </li>
                     <li><input type="text" class="small_medical indent_input" placeholder="INDENTOR"></li>
                   </ul>
                </td>
                <td colspan="3" class="indent_ul">
                   <ul>
                     <li class="indent">INDENT AUTHORISED BY</li>
                     <li><input type="text" class="small_medical" placeholder="INDENT AUTHORISED "></li>
                   </ul>
                </td>
              </tr>
                <tr>
                <td colspan="4" class="indent_ul">
                   <ul>
                     <li class="indent">DATE</li>
                     <li><input type="date" class="small_medical"></li>
                   </ul>
                </td>
                <td colspan="3" class="indent_ul">
                  <ul>
                    <li class="indent"> DATE </li>
                    <li> <input type="date" class="small_medical"></li>
                  </ul>
                </td>
              </tr>
            </table>
            
                 <div class="claer"></div>
                 </div>
            </div>
            <!------------------------/// Tab 22 END ----------------->
            <!-------------------------//// TAB 22 Started Here ------------------->
            <div id="tab33" class="user_static_12 tab_content_1">
            <div class="table_save">
                         <div class="table_right">
                                  <!----------/// ADD USER ----------->
                                  <div class="Logged_User_tab add_user_js add_user_bg">SAVE</div>
                                  <!----------/// ADD USER END --------> 
                                  <!----------/// User List ----------->
                                  <div class="Logged_User_tab  onclick">CANCEL</div>
                                  <!----------/// User List END --------> 
                            
                          </div>
                          <!-------------------/// USER LIST RIGHT END ------------>
                          <div class="claer"></div>
                 </div>
            <div class="from_main_leave">
            <table>
              <tr>
                <td colspan="3" class="table_heading">VENDOR CREATION FORM</td>
              </tr>
              <tr>
                <td width="4%">S.No</td>
                <td width="46%">Description</td>
                <td width="50%">&nbsp;</td>
              </tr>
              <tr>
                <td>1</td>
                <td>Vendor Legacy code, if any:</td>
                <td><input type="text" class="vender" placeholder="Vendor Legacy code"/></td>
              </tr>
              <tr>
                <td>2(a)</td>
                <td>Vendor’s Name </td>
                <td><input type="text" class="vender" placeholder="Vendor’s Name" /></td>
              </tr>
              <tr>
                <td>2(b)</td>
                <td>Vendor’s  Address: </td>
                <td><input type="text" class="vender" placeholder="Vendor’s  Address" />
                      <div class="addanddelete">
                             <div class="add_table"></div>
                             <div class="delete_table"></div>
                     </div>
                
                
                </td>
              </tr>
              <tr>
                <td>2(c)</td>
                <td>Registered Office Address:</td>
                <td><input type="text" class="vender" placeholder="Registered Office Address" />
                     <div class="addanddelete">
                             <div class="add_table"></div>
                             <div class="delete_table"></div>
                     </div>
                
                </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="register_add">
                  <ul>
                    <li class="pin_text">Pin code</li>
                    <li><input type="text" placeholder="Pin Code"  /></li>
                    <li class="pin_text">City</li>
                    <li><input type="text" placeholder="City"  /></li>
                  </ul>
                </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="register_add">
                  <ul>
                    <li class="pin_text">State</li>
                    <li><input type="text" placeholder="State"/></li>
                    <li class="pin_text">Country</li>
                    <li><input type="text" placeholder="Country" /></li>
                  </ul>
                   </td>
              </tr>
              <tr>
                <td>2(d)</td>
                <td>Address on which Purchase Order to be raised :</td>
                <td><input type="text" class="vender" placeholder="Address on which Purchase Order to be raised" />
                      <div class="addanddelete">
                             <div class="add_table"></div>
                             <div class="delete_table"></div>
                     </div>
                
                </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                 <td class="register_add">
                  <ul>
                    <li class="pin_text">Pin code</li>
                    <li><input type="text" placeholder="Pin code"  /></li>
                    <li class="pin_text">City</li>
                    <li><input type="text" placeholder="City"/></li>
                  </ul>
                </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="register_add">
                  <ul>
                    <li class="pin_text">State</li>
                    <li><input type="text" placeholder="State" /></li>
                    <li class="pin_text">Country</li>
                    <li><input type="text"  placeholder="Country"/></li>
                  </ul>
               </td>
              </tr>
              <tr>
                <td>3</td>
                <td>Tel. no. of the vendor with STD code:</td>
                <td class="new_customer">
                
                  <select>
                      <option>Country Code</option>
                      <option>+91</option>
                      <option>+92</option>
                      <option>+93</option>
                      <option>+94</option>
                      <option>+95</option>
                      <option>+96</option>    
                  </select>
                  <select>
                    <option>STD</option>
                    <option>01634</option>
                    <option>08732</option>
                    <option>08512</option>
                    <option>08513</option>
                    <option>08514</option>
                    <option>08515</option>
                    <option>08516</option>
                  </select>
                    <input type="text"  placeholder="Enter Tel. no. ">
                
            </td>
              </tr>
              <tr>
                <td>4</td>
                <td>Fax no. of the vendor with STD Code: </td>
                <td class="new_customer">
            
                  <select>
                      <option>Country Code</option>
                      <option>+91</option>
                      <option>+92</option>
                      <option>+93</option>
                      <option>+94</option>
                      <option>+95</option>
                      <option>+96</option>    
                  </select>
                  <select>
                    <option>STD</option>
                    <option>01634</option>
                    <option>08732</option>
                    <option>08512</option>
                    <option>08513</option>
                    <option>08514</option>
                    <option>08515</option>
                    <option>08516</option>
                  </select>
                        <input type="text"  placeholder="Enter Tel. no. ">
                
            </td>
              </tr>
              <tr>
                <td>5</td>
                <td>Email ID:</td>
                <td><input type="text" class="vender"  placeholder="Enter Email ID"/></td>
              </tr>
              <tr>
                <td>6</td>
                <td>Website :</td>
                <td><input type="text" class="vender" placeholder="Enter Website" /></td>
              </tr>
              <tr>
                <td>7</td>
                <td>Name of the Contact Person:</td>
                <td><input type="text" class="vender" placeholder="Name of the Contact Person" /></td>
              </tr>
              <tr>
                <td>8</td>
                <td>PAN (*Mandatory &amp; Pan Card copy should be attached)
                  (If applied, IT acknowledged copy of Application is to be
                collected &amp; should be given to respective VMGs.) </td>
                <td><input type="file" class="vender" /></td>
              </tr>
              <tr>
                <td>9</td>
                <td>Service Tax Registration No. &amp; Date: (*Copy Attach)</td>
                <td><input type="text" class="service" placeholder="Registration N"/><input type="date"  /></td>
              </tr>
              <tr>
                <td>10.</td>
                <td>Service tax category :</td>
                <td><input type="text" class="vender" placeholder="Service tax category"/></td>
              </tr>
              <tr>
                <td>11.(a)</td>
                <td>Sales Tax Registration Details:</td>
                <td><input type="text" class="vender" placeholder="Sales Tax Registration Details" /></td>
              </tr>
              <tr>
                <td>11.(b)</td>
                <td>Local sales tax No: (*Enclose copy of registration Certificate)</td>
                <td><input type="text" class="vender" placeholder="Local sales tax No"/></td>
              </tr>
              <tr>
                <td>11.(c)</td>
                <td>Central Sales tax No.: (*Enclose copy of registration Certificate)</td>
                <td><input type="text" class="vender" placeholder="Central Sales tax No" /></td>
              </tr>
              <tr>
                <td>11(d)</td>
                <td>WCT Regn. No. with date:</td>
                <td><input type="text" class="wct"  /><input type="date"  /></td>
              </tr>
              <tr>
                <td>11(e)</td>
                <td>VAT TIN:  (*Enclose copy of registration Certificate)</td>
                <td><input type="text" class="vender" placeholder="Enter VAT TIN" /></td>
              </tr>
              <tr>
                <td>12</td>
                <td>Type of Industry : Micro, Small &amp; Medium Enterprises, if other
                  Please specify (*Enclose copy of registration Certificate)</td>
                <td><input type="text" class="vender" placeholder="Type of Industry" /></td>
              </tr>
              <tr>
                <td>13(a)</td>
                <td>Vendor Type: Manufacturer, Service Provider, other please Specify</td>
                <td><input type="text" class="vender" placeholder="Vendor Type" /></td>
              </tr>
              <tr>
                <td>13(b)</td>
                <td>Category: Company / Non-Company / Govt. Agency if other – Please specify</td>
                <td><input type="text" class="vender"  placeholder="Category"/></td>
              </tr>
                <tr>
                <td colspan="3">Bank Details: </td>
              </tr>
              <tr>
                <td>14(a)</td>
                <td>Currency</td>
                <td><input type="text" class="vender" placeholder="Currency" /></td>
              </tr>
              <tr>
                <td>14(b)</td>
                <td>Bank Name</td>
                <td><input type="text" class="vender" placeholder="Bank Name"/></td>
              </tr>
                <tr>
                <td>14(c)</td>
                <td>Bank Address</td>
                <td><input type="text" class="vender" placeholder="Bank Address" /></td>
              </tr>
              <tr>
                <td>14(d)</td>
                <td>Bank Account Number</td>
                <td><input type="text" class="vender" placeholder="Bank Account Number"/></td>
              </tr>
              <tr>
                <td>14</td>
                <td>Bank Code </td>
                <td><input type="text" class="vender" placeholder="Bank Code"/></td>
              </tr>  <tr>
                <td>14</td>
                <td>Branch Code </td>
                <td><input type="text" class="vender" placeholder="Branch Code"/></td>
              </tr>
              <tr>
                <td>14</td>
                <td>MICR Number </td>
                <td><input type="text" class="vender" placeholder="MICR Number"/></td>
              </tr>
              <tr>
                <td>14</td>
                <td>NEFT / IFSC CODE </td>
                <td><input type="text" class="vender" placeholder="NEFT / IFSC CODE"/></td>
              </tr>
                <tr>
                <td>14</td>
                <td>RTGS CODE </td>
                <td><input type="text" class="vender" placeholder="RTGS CODE"/></td>
              </tr>
              <tr>
                <td colspan="3">Excise related details: </td>
              </tr>
              <tr>
                <td>15</td>
                <td>Excise Registration No.: (*Enclose copy of registration Certificate)</td>
                <td><input type="text" class="vender" placeholder="Excise Registration No"/></td>
              </tr>  <tr>
                <td>&nbsp;</td>
                <td>ECC Number</td>
                <td><input type="text" class="vender" placeholder="ECC Number" /></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>EXC Range </td>
                <td><input type="text" class="vender" placeholder="EXC Range" /></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>EXC Division</td>
                <td><input type="text" class="vender" placeholder="EXC Division" /></td>
              </tr>
                <tr>
                <td>&nbsp;</td>
                <td>Commissionerate</td>
                <td><input type="text" class="vender" placeholder="Commissionerate" /></td>
              </tr>
              <tr>
                <td>16</td>
                <td>Name of person who submitting the above details</td>
                <td><input type="text" class="vender" placeholder="Name of person" /></td>
              </tr>
              <tr>
                <td>16</td>
                <td>Signature &amp; Company Seal</td>
                <td>&nbsp;</td>
              </tr>
                <tr>
                <td colspan="3">*Mandatory requriments</td>
              </tr>
              <tr>
                <td>1</td>
                <td>For Office Use: (AVI-OIL INDIA [P] LTD.)</td>
                <td><input type="text" class="vender" placeholder="For Office Use" /></td>
              </tr>
              <tr>
                <td>2</td>
                <td colspan="2">Gen. Bus. Posting Group <input type="checkbox" /><label>CC</label><input type="checkbox" /><label>DOM</label>         <input type="checkbox" /><label>FOR</label><input type="checkbox" /><label>JW</label><input type="checkbox" /><label>OSL</label></td>
              </tr>
                <tr>
                <td>3</td>
                <td>Excise Bus. Posting Group<input type="checkbox" /><label>DOM</label><input type="checkbox" /><label>FOR</label></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>4</td>
                <td colspan="2">Vendor Posting Group<input type="checkbox" /><label>IMP</label><input type="checkbox" /><label>DOM</label>        <input type="checkbox" /><label>SRP</label><input type="checkbox" /><label>CPC</label><input type="checkbox" /><label>OTH</label><input type="checkbox" /><label>CC</label></td>
              </tr>
              <tr>
                <td>5</td>
                <td>GTA</td>
                <td><input type="text" class="vender" placeholder="Enter GTA" /></td>
              </tr>
                <tr>
                <td>6</td>
                <td>Vendor code </td>
                <td><input type="text" class="vender" placeholder="Vendor code"/></td>
              </tr>
              <tr>
                <td>7</td>
                <td>Vendor Creation Date </td>
                <td><input type="date" class="vender" /></td>
              </tr>
              <tr>
                <td colspan="3">
                         <div class="by"><input type="text" placeholder="Indented by"  />Indented by </div>
                         <div class="by"><input type="text" placeholder="Prepared by" />Prepared by </div>
                         <div class="by"><input type="text" placeholder="Verified by (IT)"  />Verified by (IT)  </div>
                         <div class="by"><input type="text"  placeholder="Checked by" />Checked by</div>
                         <div class="by"><input type="text" placeholder="Authorised by" />Authorised by</div>
                </td>
              </tr>
               
            </table>
            </div>
            <div class="claer"></div>
            </div>
            <!------------------------/// Tab 22 END ----------------->
            <!-------------------------//// TAB 22 Started Here ------------------->
            <div id="tab36" class="user_static_13 tab_content_1">
            <div class="table_save">
                         <div class="table_right">
                                  <!----------/// ADD USER ----------->
                                  <div class="Logged_User_tab add_user_js add_user_bg">SAVE</div>
                                  <!----------/// ADD USER END --------> 
                                  <!----------/// User List ----------->
                                  <div class="Logged_User_tab  onclick">CANCEL</div>
                                  <!----------/// User List END --------> 
                            
                          </div>
                          <!-------------------/// USER LIST RIGHT END ------------>
                          <div class="claer"></div>
                 </div>
            <div class="from_main_leave left_space_one">
            <table>
              <tr>
                <td colspan="7" class="table_heading">TRAVEL EXPENSES REIMBURSEMENT CLAM</td>
              </tr>
              <tr class="depart_form">
                <td colspan="2">NAME<div class="claer"></div><input type="text" placeholder="Enter Name"/></td>
                <td colspan="2">EMP.NO<div class="claer"></div><input type="text" placeholder="EMP.NO"/></td>
                <td colspan="2">DESIGNATION<div class="claer"></div><input type="text" placeholder="DESIGNATION"/></td>
                <td>DATE<div class="claer"></div><input type="date"/></td>
              </tr>
              <tr class="depart_form">
                <td colspan="2">DEPT<div class="claer"></div><input type="text" placeholder="Enter DEPT"/></td>
                <td colspan="2">LOCATION<div class="claer"></div><input type="text" placeholder="Enter LOCATION"/></td>
                <td colspan="2">CLAIM FROM <div class="claer"></div><input type="text" placeholder="CLAIM FROM"/></td>
                <td>TO<div class="claer"></div><input type="text" placeholder="To"/></td>
              </tr>
              <tr>
                <td colspan="7">PART I       DETAILS OF JOURNEY</td>
              </tr>
              <tr class="time_travel">
                <td> DATE OF DEPARTURE</td>
                <td>LOCATION</td>
                <td>FLT/TRAIN NO.</td>
                <td>TIME</td>
                <td>DATE OF ARRIVAL</td>
                <td>PLACE OF VISIT</td>
                <td>TIME OF ARRIVAL</td>
              </tr>
              <tr class="time_travel">
                <td><input type="date" /></td>
                <td><input type="text" placeholder="LOCATION" /></td>
                <td><input type="text" placeholder="FLT/TRAIN NO" /></td>
                <td><input type="text" placeholder="TIME" /></td>
                <td><input type="date" /></td>
                <td><input type="text" placeholder="PLACE OF VISIT" /></td>
                <td><input type="text" placeholder="TIME OF ARRIVAL"/></td>
              </tr>
              <tr>
                <td colspan="7">
                
                   <div class="addanddelete">
                           <div class="add_table"></div>
                           <div class="delete_table"></div>
                  </div>
                
                </td>
              
              </tr>
              <tr>
                <td colspan="6">PART-II       DETAIL OF EXPENSES</td>
                <td>
                  <table class="part_two" >
                    <tr>
                      <td>Rs.</td>
                      <td>P.</td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td colspan="6">A.  JOURNEY TICKET NO.(S).</td>
                <td><table >
                  <tr>
                    <td><input type="text" class="money" placeholder="Rs." /></td>
                    <td><input type="text" class="money" placeholder="P."/></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td colspan="6">B.  HOTEL EXPENSES BILL NO(S):</td>
                <td><table >
                  <tr>
                    <td><input type="text"  class="money" placeholder="Rs."/></td>
                    <td><input type="text"  class="money" placeholder="P."/></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td colspan="6">C.  TAXI FARE : TO &amp; FROM AIRPORT/RLY.STN:</td>
                <td><table >
                  <tr>
                    <td><input type="text" class="money" placeholder="Rs." /></td>
                    <td><input type="text" class="money" placeholder="P."/></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td colspan="6">AT PLACE OF VISIT</td>
                <td><table >
                  <tr>
                    <td><input type="text" class="money" placeholder="Rs."/></td>
                    <td><input type="text" class="money" placeholder="P."/></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td colspan="7">D.OUT OF POCKET EXPENSES FOR</td>
              </tr>
              <tr>
                <td colspan="3" rowspan="4">AMOUNT CLAIM/REFUNDED IN WORDS
                RUPEES</td>
                <td colspan="3">TOTAL</td>
                <td>
                     <table>
                      <tr>
                        <td><input type="text" class="money" placeholder="Rs."/></td>
                        <td><input type="text" class="money" placeholder="P."/></td>
                      </tr>
                    </table>
                </td>
              </tr>
              <tr>
                <td colspan="3">LESS ADVANCE</td>
                <td>
                    <table>
                      <tr>
                        <td><input type="text" class="money" placeholder="Rs."/></td>
                        <td><input type="text" class="money" placeholder="P."/></td>
                      </tr>
                    </table>
                </td>
              </tr>
              <tr>
                <td colspan="3">NET CLAIMED / REFUNDED</td>
                <td><table>
                  <tr>
                    <td><input type="text" class="money" placeholder="Rs."/></td>
                    <td><input type="text" class="money" placeholder="P."/></td>
                  </tr>
                </table></td>
              </tr>
                <tr>
                <td colspan="3">ROUNDED TO</td>
                <td><table>
                  <tr>
                    <td><input type="text" class="money" placeholder="Rs."/></td>
                    <td><input type="text" class="money" placeholder="P."/></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td colspan="2">
                  <div class="claim_main">Claim Approved<input type="text" placeholder="Claim Approved" /></div>
                </td>
                <td colspan="3">&nbsp;</td>
                <td colspan="2"><div class="declation">DECLARATION <div class="claer"></div>
            Certified that the expenses as
                above were actually incurred </div>
            </td>
              </tr>
                <tr>
                <td colspan="2">
                  <div class="claim_main">
                        <ul>
                         <li>Competent Authority</li>
                         <li><input type="text" placeholder="Competent Authority" /></li>
                         </ul>
                   </div>
                  <div class="claim_main">
                     <ul>
                        <li>Date</li>
                        <li><input type="date" /></li>
                     </ul>
                  </div>
                </td>
                <td colspan="2">
                  <div class="claim_main">
                     <ul>
                       <li>Controlling Officer</li>
                       <li><input type="text" placeholder="Controlling Officer" /></li>
                       </ul>
                   </div>
                  <div class="claim_main">
                     <ul>
                       <li> Date</li>
                       <li><input type="date" /></li>
                       </ul>
                  </div>
                </td>
                <td class="number_of"> 
                      <div class="claim_main">
                        <ul>
                          <li>No.of  enclosures</li>
                          <li> <input type="text" placeholder="No.of  enclosures" /></li>
                        </ul>
                      </div>
                </td>
                <td colspan="2">
                      <div class="claim_main">
                          <ul>
                               <li>Signature</li>
                               <li><input type="file" class="enco" /></li>
                         </ul>
                     </div>
                      <div class="claim_main"> Date<input type="date" /></div>
            </td>
              </tr>
              <tr>
                <td colspan="4">Claim verified for Rs. <input type="text" class="claim_verified" placeholder="Claim verified for Rs" /></td>
                <td colspan="3">Received Rs.<input type="text" class="received" placeholder="Received Rs" /></td>
              </tr>
              
            </table>
            </div>
            <div class="claer"></div>
            
            </div>
            <!------------------------/// Tab 22 END ----------------->
            <!-------------------------//// TAB 22 Started Here ------------------->
            <div id="tab39" class="user_static_14 tab_content_1">
            <div class="table_save">
                         <div class="table_right">
                                  <!----------/// ADD USER ----------->
                                  <div class="Logged_User_tab add_user_js add_user_bg">SAVE</div>
                                  <!----------/// ADD USER END --------> 
                                  <!----------/// User List ----------->
                                  <div class="Logged_User_tab  onclick">CANCEL</div>
                                  <!----------/// User List END --------> 
                            
                          </div>
                          <!-------------------/// USER LIST RIGHT END ------------>
                          <div class="claer"></div>
                 </div>
            <div class="from_main_leave">
            <table>
              <tr>
                <td colspan="4" class="table_heading">INTER OFFICE MEMO</td>
              </tr>
              <tr>
                <td>FROM</td>
                <td><input type="text" class="memo_form" placeholder="FROM" /></td>
                <td>TO</td>
                <td><input type="text" class="memo_form" placeholder="To"/></td>
              </tr>
              <tr>
                <td>OUR REF</td>
                <td><input type="text" class="memo_form" placeholder="OUR REF" /></td>
                <td>YOUR REF</td>
                <td><input type="text" class="memo_form" placeholder="YOUR REF"/></td>
              </tr>
              <tr>
                <td>DATE</td>
                <td><input type="date" class="memo_form" /></td>
                <td>DATE</td>
                <td><input type="date" class="memo_form" /></td>
              </tr>
              <tr>
                <td colspan="4" class="textarea_div">
                   <textarea class="memo_textarea" ></textarea>
                
                </td>
              </tr>
            </table>
            </div>
            <div class="claer"></div>
            
            </div>
            <!------------------------/// Tab 22 END ----------------->
              <!-------------------------/// RIGHT PANNEL END -----------------> 
          </div>
          <div class="shared_trash">
                  <div class="shared_tab">
                       <h1>Under Construction</h1>
                  
                  
                  </div>
                  
                  <!-----------------/// Trash Tab Stared Here ------------------->
                  <div class="trash_tab">
                      <div class="trash_option">
                                 <div class="trash_menu_1"></div>
                                 <div class="trash_menu_2"></div>
                                 <div class="trash_menu_3"></div>
                                 <div class="trash_menu_4"></div>
                                 <div class="claer"></div>
                      </div>
                      <div class="claer"></div>
                      <div class="trash_content">
                            <div class="row_content">
                                <ul>
                                  <li>
                                    <div class="folder_icon"></div>
                                    <span>admin_user_<br>
                                    list_perimission_5</span> </li>
                                  <li>
                                    <div class="folder_icon"></div>
                                    <span>admin_user_<br>
                                    list_perimission_5</span> </li>
                                  <li>
                                    <div class="folder_icon"></div>
                                    <span>admin_user_<br>
                                    list_perimission_5</span> </li>
                                  <li>
                                    <div class="folder_icon"></div>
                                    <span>admin_user_<br>
                                    list_perimission_5</span> </li>
                                  <li>
                                    <div class="folder_icon"></div>
                                    <span>admin_user_<br>
                                    list_perimission_5</span> </li>
                                  <li>
                                    <div class="folder_icon"></div>
                                    <span>admin_user_<br>
                                    list_perimission_5</span> </li>
                                  <li>
                                    <div class="folder_icon"></div>
                                    <span>admin_user_<br>
                                    list_perimission_5</span> </li>
                                  <li>
                                    <div class="folder_icon"></div>
                                    <span>admin_user_<br>
                                    list_perimission_5</span> </li>
                                  <li>
                                    <div class="folder_icon"></div>
                                    <span>admin_user_<br>
                                    list_perimission_5</span> </li>
                                  <li>
                                    <div class="folder_icon"></div>
                                    <span>admin_user_<br>
                                    list_perimission_5</span> </li>
                                  <li>
                                    <div class="folder_icon"></div>
                                    <span>admin_user_<br>
                                    list_perimission_5</span> </li>
                                  <li>
                                    <div class="folder_icon"></div>
                                    <span>admin_user_<br>
                                    list_perimission_5</span> </li>
                                </ul>
                              </div>

                      </div>
                  
                  
                  </div>
                  <!-----------------/// Trans End Here ----------------->
          </div>
          
  </div>
  </div>
  <div class="claer"></div>
  
</div>
<!-----------------/// Testing Content End Here ------------------> 
  <!---------------//// ADD GROUP USER POP UP ----------->
  <div id="contactdiv_6">
    <form class="form" action="#" id="contact">
      <img src="images/button_cancel.png" class="img" id="cancel"/>
      <h3>Add New Documents</h3>
      <hr/>
      <br/>
      <label>File Name: <span>*</span></label>
      <br/>
      <input type="file" class="custom-file-input">
      <br/>
      <br/>
       <div class="claer"></div>
       <input type="checkbox" /><label>Notify to users</label>
       <br/>
      <br/>
      <input type="button" id="send" value="Update"/>
      <input type="button" id="cancel" value="Cancel"/>
      <br/>
    </form>
  </div>
  <!-----------------/// ADD GROUP POP UP  END HERE ----------> 




<!-----------------/// TESTING FOOTER STARTED HERE ------------>
<div id="foot"> 
  
  <!-------------------/// Footer Started Here ----------------------->
  <div class="footer footer_right_space">
    <ul class="left_footer">
      <li><a href="#">TERMS AND CONDITIONS</a></li>
      <li><a href="#">DISCLAIMER</a></li>
      <li><a href="#">CONTACT US</a></li>
      <li><a href="#">HELP</a></li>
    </ul>
    <div class="right_footer">
      <ul class="right_footer_1">
        <li><a href="#"><img src="images/facebook.png" /></a></li>
        <li><a href="#"><img src="images/twitter.png" /></a></li>
      </ul>
    </div>
  </div>
  <!-------------------/// Footer End Here ----------------------------> 
  
</div>
<!---------------/// TESTING FOOTER END HERE ----------------->
</body>
</html>