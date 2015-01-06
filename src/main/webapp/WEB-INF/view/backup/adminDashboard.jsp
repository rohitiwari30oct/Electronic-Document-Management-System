<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Welcome To EDMS Solutions</title>
<!-----------------// FROM MAIN INDEX PAGES -------------->
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.7.2.min.js" type="application/javascript" ></script>
<script src="js/left_event.js" type="application/javascript"></script>
<!----------------------//// ONLY FOR CHECK BOX -------------->
<script src="js/jquery.screwdefaultbuttonsV2.js"></script>
<script type="text/javascript">
/*
		$(function(){
		
			$('input:radio').screwDefaultButtons({
				image: 'url("images/radioSmall.jpg")',
				width: 23,
				height:15,
			});
			
			$('input:checkbox').screwDefaultButtons({
				image: 'url("images/checkboxSmall.jpg")',
				width: 34,
				height:19,
			});

		});
		*/
	</script>
<!----------------------//// ONLY FOR CHECK BOX END HERE ------------>
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

</script>

<!----------------------// FOR TAB END HERE ---------------->

<!---------------/// POP FOR ADD GROUP ONLY --------------->
<link rel="stylesheet" href="css/jquery_popup.css" />
<script src="js/jquery_popup.js"></script>
<!---------------------/// POP UP FOR ADD USER -------------->
<!-----------------// FROM MAIN INDEX PAGES END HERE ------>
<style type="text/css" media="screen"></style>
</head>
<body>
<!-----------------------// Main DIV STARTED HERE ---------------->
<div class="main_div"> 
  <!-----------/// Header Stared Here ------------>
  <div id="head">
    <div class="header_main"> 
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
             <div class="progress_bar">
                 <img src="images/Progress_Bar.png" />
              </div>
              <div class="full_profile">View profile</div>
              <div class="sign_out">Sign out</div>
                <div class="claer"></div>
              
               </div>
          </div>
          <!--------------// TOP ARROW END ------------> 
        </div>
        <div class="claer"></div>
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
                  <li><label>CURRENT</label> <input type="checkbox" /> <label>ALL SUBFOLDER</label> <input type="checkbox" /></li>
                  <div class="claer"></div>
                  <li>SIZE</li>
                  <li>
                    <select>
                      <option>Empty(0KB) </option>
                      <option> Tiny(0-10KB)</option>
                      <option>Small(10-100KB)</option>
                      <option>Medium(100KB - 1MB)</option>
                      <option>Large(1 - 16MB)</option>
                      <option>Huge(16 - 128 MB)</option>
                      <option>Gigantic(>128 MB)</option>
                    </select>
                  </li>
                  <li>TITLE</li>
                  <li>
                    <input  type="text" />
                  </li>
                  <li>KEYWORDS</li>
                  <li>
                    <input  type="text" />
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
                   <li><label>CURRENT</label> <input type="checkbox" /> <label>ALL SUBFOLDER</label> <input type="checkbox" /></li>
                  <div class="claer"></div>
                  <li>SIZE</li>
                  <li>
                    <select>
                      <option>Empty(0KB) </option>
                      <option> Tiny(0-10KB)</option>
                      <option>Small(10-100KB)</option>
                      <option>Medium(100KB - 1MB)</option>
                      <option>Large(1 - 16MB)</option>
                      <option>Huge(16 - 128 MB)</option>
                      <option>Gigantic(>128 MB)</option>
                    </select>
                  </li>
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
                  <li>DATE MODIFIED</li>
                  <li class="calender">
                    <label>FORM</label><input  type="date" /><label class="left_part">TO</label><input  type="date" />
                  </li>
                  <div class="claer"></div>
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
      <!-------------// HEADER END HERE -------------------------> 
      <!-------------/// Header Menu Section Stared Here --------------->
      <div class="header_menu more_option_event">
        <div class="menu_left"> <span>5 GB Available</span> <span class="font_weight"> Upgrade! </span>
          <div class="prgress_bar"></div>
        </div>
        <div class="menu_right">
          <ul>
            <li><a href="#" title="Home" >
              <div class="home"></div>
              Home
              <div class="claer"></div>
              </a> 
              
              </li>
            <li> <a href="#" title="Directory">
              <div class="digtory"></div>
              DIRECTORY</a> </li>
            <li> <a href="#" title="Find">
              <div class="find"></div>
              Find</a> </li>
            <li> <a href="#" title="Download">
              <div class="download"></div>
              Download</a> </li>
            <li> <a href="#" title="Print">
              <div class="printer"></div>
              PRINT</a> </li>
            <li> <a href="#" title="Lock">
              <div class="lock"></div>
              LOCK</a> </li>
            <li> <a href="#" title="Unlock">
              <div class="unlock"></div>
              UNLOCK</a> </li>
            <li class="add_folder"> <a href="#" title="Create">
              <div class="create"></div>
              CREATE</a> </li>
            <li> <a href="#" title="Upload">
              <div class="upload"></div>
              UPLOAD</a> </li>
            <li class="onclick_4 add_folder"> <a href="#" title="Create">
              <div class="create_doc"></div>
              CREATE</a> </li>
            <li> <a href="#" title="Edit">
              <div class="edit"></div>
              Edit</a> </li>
            <li> <a href="#" title="Update">
              <div class="update"></div>
              UPDATE</a> </li>
            <li> <a href="#" title="Delete">
              <div class="delet"></div>
              DELETE</a> </li>
            <li class="onclick"> <a href="#" title=" Add Group">
              <div class="add_in"></div>
              ADD GROUP</a> </li>
            <li class="onclick_3"> <a href="#" title="Remove Group">
              <div class="remove_group"></div>
              REMOVE GROUP</a> </li>
            <li> <a href="#" title="History">
              <div class="history"></div>
              HISTORY</a> </li>
          </ul>
        </div>
      
     
      </div>
      <div class="new_menu_postion">
        <div class="user_das_heading">DASHBOARD</div>
        <ul class="tabs user_tab">
          <li class="active remove_menu tab_menu" rel="tab4">
            <div class="admin_menu">
              <div class="home_user home_user_color"></div>
              HOME </div>
          </li>
          <li rel="tab5" class="remove_menu tab_menu">
            <div class="admin_menu">
              <div class="graph_user graph_user_color"></div>
              STATISTICS </div>
          </li>
          <li rel="tab21" class="remove_menu tab_menu calender_box">
            <div class="admin_menu">
              <div class="calender_user calender_user_color"></div>
              CALENDAR </div>
          </li>
          <li rel="tab9" class="remove_menu tab_menu">
            <div class="admin_menu">
              <div class="from_user from_user_color"></div>
              ACCOUNTS</div>
          </li>
          <li rel="tab8" class="remove_menu tab_menu">
            <div class="admin_menu">
              <div class="work_flow"></div>
              WORK FLOW </div>
          </li>
          <li rel="tab7" class="remove_menu tab_menu">
            <div class="admin_menu">
              <div class="user_log user_log_color"></div>
              LOG </div>
          </li>
          <li rel="tab10" class="remove_menu tab_menu">
            <div class="admin_menu">
              <div class="user_setting user_setting_color"></div>
              SETTINGS </div>
          </li>

          <a href="index_testing.htm">
           <li rel="tab12" class="remove_menu tab_menu">
            <div class="admin_menu">
              <div class="desktop_main"></div>
              DESKTOP
               </div>
          </li>
          </a>
        </ul>
       <!--- <a href="index_testing.htm">
        <div class="desktop"> DESKTOP</div>
        </a>  -->
        
        </div>
      <div class="claer"></div>
    </div>
    <!----------------/// Header End Here ----------> 
    <!------------// Testing CONTENT STARTED HERE ------------------>
    <div id="content" class="user_dasboard remove_default_changes">
      <div class="heading_strip">
        <div class="tab_container user_tab_container">
          <div id="tab4" class="tab_content_1">
            <div class="tab_mid"> 
              <!----------------/// DATA GRAPH STARTED HERE------------>
              <div class="data_graph">
                <div class="prof_heading"> DATA </div>
              </div>
              
              <!----------------// DATA GRAPH STARTED END --------------> 
              <!--------------// Recentaly Modify Document ---------------->
              <div class="recentaly cpu_utilization_graph">
                <div class="prof_heading"> CPU UTILIZATION </div>
              </div>
              <!--------------/// Recentaly Modify Document End -------------->
              <div class="claer"></div>
              <!----------------/// DATA GRAPH STARTED HERE------------>
              <div class="data_graph">
                <div class="prof_heading"> DISK SPACE </div>
              </div>
              
              <!----------------// DATA GRAPH STARTED END --------------> 
              <!--------------// Recentaly Modify Document ---------------->
              <div class="recentaly cpu_utilization_graph">
                <div class="prof_heading"> MEMORY UTILIZATION </div>
              </div>
              <!--------------/// Recentaly Modify Document End --------------> 
              <!----------------/// EVENT LEft Portion ---------------->
              
              <div class="claer"></div>
              <div class="event_left main_left_side system_alert"> 
                
                <!-----------------/// Left Side Bar Stared Here ------------->
                <div class="event_user margin_bottom system_alert_box">
                  <div class="prof_heading"> SYSTEM ALERTS </div>
                  <div class="event_box">
                    <ul class="event_scroll">
                      <li>
                        <div class="box_icon">
                           <div class="alert"></div>
                           <div class="claer"></div>
                        </div>
                        A "panic" condition usually affecting multipleapps/servers/sites.                                                 At this level it would usually notify all tech staff on call. <br/>
                        <a href="#">1:10am,21-09-2014</a>
                        <div class="claer"></div>
                      </li>
                      <li>
                         <div class="box_icon">
                           <div class="alert_1"></div>
                           <div class="claer"></div>
                        </div>
                        Should be corrected immediately, therefore notify staff who can fix the problem. An example would be the loss of a primary ISP connection.<br/>
                        <a href="#">1:10am,21-09-2014</a>
                        <div class="claer"></div>
                      </li>
                      <li>
                        <div class="box_icon">
                           <div class="alert_2"></div>
                           <div class="claer"></div>
                        </div>
                        Should be corrected immediately, but indicates failure in a secondary system, an example is a loss of a backup ISP connection.<br/>
                        <a href="#">1:10am,21-09-2014</a>
                        <div class="claer"></div>
                      </li>
                      <li>
                          <div class="box_icon">
                           <div class="alert_3"></div>
                           <div class="claer"></div>
                        </div>
                        Non-urgent failures, these should be relayed to developers or admins; each item must be resolved within a given time.
                        <div class="action"></div>
                        <br/>
                        <a href="#">1:10am,21-09-2014</a>
                        <div class="claer"></div>
                      </li>
                    </ul>
                    <a href="#" class="bottom_link">
                    <div class="botom_view_more botom_view_more_11"> View All </div>
                    </a> </div>
                </div>
                <!--------------/// Left Side Bar End Here -----------------> 
                
              </div>
              <!---------------// EVENTS END HERE -------------------------> 
              
              <!-------------/// LOGGED USER STARTED HERE  ------------------->
              <div class="live_chat logged_user">
                <div class="prof_heading"> LOGGED IN USERS </div>
                <!--------------//LIVE CHEAT LIST------------>
                <div class="live_cheat_box display">
                  <ul class="live_cheat_scroll">
                    <li> <img src="images/photo_login.jpg" class="user_live_image" /><span>Hariom Srivastava</span>
                      <div class="user_live"> <img src="images/desktop.png" class="device_icon" /> <img src="images/online_file.png" class="online_icon_user" /> </div>
                      <br/>
                      On the eve of Aero India 2013, the prestigious Aerospace
                      and ... </li>
                    <li> <img src="images/photo_login.jpg" class="user_live_image" /><span>Hariom Srivastava</span>
                      <div class="user_live"> <img src="images/desktop.png" class="device_icon" /> <img src="images/online_file.png" class="online_icon_user" /> </div>
                      <br/>
                      On the eve of Aero India 2013, the prestigious Aerospace
                      and ... </li>
                    <li> <img src="images/photo_login.jpg" class="user_live_image" /><span>Hariom Srivastava</span>
                      <div class="user_live"> <img src="images/desktop.png" class="device_icon" /> <img src="images/online_file.png" class="online_icon_user" /> </div>
                      <br/>
                      On the eve of Aero India 2013, the prestigious Aerospace
                      and ... </li>
                    <li> <img src="images/photo_login.jpg" class="user_live_image" /><span>Hariom Srivastava</span>
                      <div class="user_live"> <img src="images/desktop.png" class="device_icon" /> <img src="images/online_file.png" class="online_icon_user" /> </div>
                      <br/>
                      On the eve of Aero India 2013, the prestigious Aerospace
                      and ... </li>
                    <li> <img src="images/photo_login.jpg" class="user_live_image" /><span>Hariom Srivastava</span>
                      <div class="user_live"> <img src="images/desktop.png" class="device_icon" /> <img src="images/online_file.png" class="online_icon_user" /> </div>
                      <br/>
                      On the eve of Aero India 2013, the prestigious Aerospace
                      and ... </li>
                    <li> <img src="images/photo_login.jpg" class="user_live_image" /><span>Hariom Srivastava</span>
                      <div class="user_live"> <img src="images/desktop.png" class="device_icon" /> <img src="images/online_file.png" class="online_icon_user" /> </div>
                      <br/>
                      On the eve of Aero India 2013, the prestigious Aerospace
                      and ... </li>
                    <li> <img src="images/photo_login.jpg" class="user_live_image" /><span>Hariom Srivastava</span>
                      <div class="user_live"> <img src="images/desktop.png" class="device_icon" /> <img src="images/online_file.png" class="online_icon_user" /> </div>
                      <br/>
                      On the eve of Aero India 2013, the prestigious Aerospace
                      and ... </li>
                    <li> <img src="images/photo_login.jpg" class="user_live_image" /><span>Hariom Srivastava</span>
                      <div class="user_live"> <img src="images/desktop.png" class="device_icon" /> <img src="images/online_file.png" class="online_icon_user" /> </div>
                      <br/>
                      On the eve of Aero India 2013, the prestigious Aerospace
                      and ... </li>
                    <li> <img src="images/photo_login.jpg" class="user_live_image" /><span>Hariom Srivastava</span>
                      <div class="user_live"> <img src="images/desktop.png" class="device_icon" /> <img src="images/online_file.png" class="online_icon_user" /> </div>
                      <br/>
                      On the eve of Aero India 2013, the prestigious Aerospace
                      and ... </li>
                    <li> <img src="images/photo_login.jpg" class="user_live_image" /><span>Hariom Srivastava</span>
                      <div class="user_live"> <img src="images/desktop.png" class="device_icon" /> <img src="images/online_file.png" class="online_icon_user" /> </div>
                      <br/>
                      On the eve of Aero India 2013, the prestigious Aerospace
                      and ... </li>
                  </ul>
                </div>
                <a href="#" class="bottom_link display">
                <div class="botom_view_more botom_view_more_11"> View All </div>
                </a> 
                <!-------------// LIVE CHEAT LIST END -------> 
                
              </div>
              <!------------/// LOGGED USER END  ----------------------> 
              <!-------------/// LOGGED USER STARTED HERE  ------------------->
              <div class="live_chat user_issues">
                <div class="prof_heading"> USER  ISSUES </div>
                <!--------------//LIVE CHEAT LIST------------>
                <div class="live_cheat_box display">
                  <ul class="live_cheat_scroll">
                    <li> <img src="images/photo_login.jpg" class="user_live_image" /><span>Hariom Srivastava</span> <span class="time">12 min ago</span>
                      <div class="user_live"> <img src="images/desktop.png" class="device_icon" /> <img src="images/online_file.png" class="online_icon_user" /> </div>
                      <br/>
                      On the eve of Aero India 2013, the prestigious Aerospace
                      and On the eve of Aero India 2013, the prestigious  ...
                      <div class="replay"> <img src="images/forword.jpg" /> <a href="#">Reply</a> </div>
                    </li>
                    <li> <img src="images/photo_login.jpg" class="user_live_image" /><span>Hariom Srivastava</span> <span class="time">12 min ago</span>
                      <div class="user_live"> <img src="images/desktop.png" class="device_icon" /> <img src="images/online_file.png" class="online_icon_user" /> </div>
                      <br/>
                      On the eve of Aero India 2013, the prestigious Aerospace
                      and On the eve of Aero India 2013, the prestigious  ...
                      <div class="replay"> <img src="images/forword.jpg" /> <a href="#">Reply</a> </div>
                    </li>
                    <li> <img src="images/photo_login.jpg" class="user_live_image" /><span>Hariom Srivastava</span> <span class="time">12 min ago</span>
                      <div class="user_live"> <img src="images/desktop.png" class="device_icon" /> <img src="images/online_file.png" class="online_icon_user" /> </div>
                      <br/>
                      On the eve of Aero India 2013, the prestigious Aerospace
                      and On the eve of Aero India 2013, the prestigious  ...
                      <div class="replay"> <img src="images/forword.jpg" /> <a href="#">Reply</a> </div>
                    </li>
                    <li> <img src="images/photo_login.jpg" class="user_live_image" /><span>Hariom Srivastava</span> <span class="time">12 min ago</span>
                      <div class="user_live"> <img src="images/desktop.png" class="device_icon" /> <img src="images/online_file.png" class="online_icon_user" /> </div>
                      <br/>
                      On the eve of Aero India 2013, the prestigious Aerospace
                      and On the eve of Aero India 2013, the prestigious  ...
                      <div class="replay"> <img src="images/forword.jpg" /> <a href="#">Reply</a> </div>
                    </li>
                    <li> <img src="images/photo_login.jpg" class="user_live_image" /><span>Hariom Srivastava</span> <span class="time">12 min ago</span>
                      <div class="user_live"> <img src="images/desktop.png" class="device_icon" /> <img src="images/online_file.png" class="online_icon_user" /> </div>
                      <br/>
                      On the eve of Aero India 2013, the prestigious Aerospace
                      and On the eve of Aero India 2013, the prestigious  ...
                      <div class="replay"> <img src="images/forword.jpg" /> <a href="#">Reply</a> </div>
                    </li>
                    <li> <img src="images/photo_login.jpg" class="user_live_image" /><span>Hariom Srivastava </span> <span class="time">12 min ago</span>
                      <div class="user_live"> <img src="images/desktop.png" class="device_icon" /> <img src="images/online_file.png" class="online_icon_user" /> </div>
                      <br/>
                      On the eve of Aero India 2013, the prestigious Aerospace
                      and On the eve of Aero India 2013, the prestigious  ...
                      <div class="replay"> <img src="images/forword.jpg" /> <a href="#">Reply</a> </div>
                    </li>
                    <li> <img src="images/photo_login.jpg" class="user_live_image" /><span>Hariom Srivastava </span> <span class="time">12 min ago</span>
                      <div class="user_live"> <img src="images/desktop.png" class="device_icon" /> <img src="images/online_file.png" class="online_icon_user" /> </div>
                      <br/>
                      On the eve of Aero India 2013, the prestigious Aerospace
                      and On the eve of Aero India 2013, the prestigious  ...
                      <div class="replay"> <img src="images/forword.jpg" /> <a href="#">Reply</a> </div>
                    </li>
                    <li> <img src="images/photo_login.jpg" class="user_live_image" /><span>Hariom Srivastava </span> <span class="time">12 min ago</span>
                      <div class="user_live"> <img src="images/desktop.png" class="device_icon" /> <img src="images/online_file.png" class="online_icon_user" /> </div>
                      <br/>
                      On the eve of Aero India 2013, the prestigious Aerospace
                      and On the eve of Aero India 2013, the prestigious  ...
                      <div class="replay"> <img src="images/forword.jpg" /> <a href="#">Reply</a> </div>
                    </li>
                    <li> <img src="images/photo_login.jpg" class="user_live_image" /><span>Hariom Srivastava </span> <span class="time">12 min ago</span>
                      <div class="user_live"> <img src="images/desktop.png" class="device_icon" /> <img src="images/online_file.png" class="online_icon_user" /> </div>
                      <br/>
                      On the eve of Aero India 2013, the prestigious Aerospace
                      and On the eve of Aero India 2013, the prestigious  ...
                      <div class="replay"> <img src="images/forword.jpg" /> <a href="#">Reply</a> </div>
                    </li>
                    <li> <img src="images/photo_login.jpg" class="user_live_image" /><span>Hariom Srivastava </span> <span class="time">12 min ago</span>
                      <div class="user_live"> <img src="images/desktop.png" class="device_icon" /> <img src="images/online_file.png" class="online_icon_user" /> </div>
                      <br/>
                      On the eve of Aero India 2013, the prestigious Aerospace
                      and On the eve of Aero India 2013, the prestigious  ...
                      <div class="replay"> <img src="images/forword.jpg" /> <a href="#">Reply</a> </div>
                    </li>
                  </ul>
                </div>
                <a href="#" class="bottom_link display">
                <div class="botom_view_more botom_view_more_11"> View All </div>
                </a> 
                <!-------------// LIVE CHEAT LIST END -------> 
                
              </div>
              <!------------/// LOGGED USER END  ---------------------->
              
              <div class="claer"></div>
            </div>
          </div>
          <!-- #tab1 -->
          <div id="tab5" class="tab_content_1"> 
            <!---------/// Statical Document View -------------->
            <div class="main_statical statice_space_11 admin_statics"> 
              <!-------------/// ROW FIRST STARTED HERE ----------->
              <div class="statical_graph">
                <div class="static_heading">Last month viewed Documents</div>
                <div class="row_recent">
                  <div class="recnt_pdf"></div>
                  <a href="#">Setting Ad Budget-A Sorcoic</a>Viewed by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                <div class="row_recent">
                  <div class="recnt_pdf_pdf"></div>
                  <a href="#">Setting Ad Budget-A Sorcoic</a>Viewed by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                <div class="row_recent">
                  <div class="recnt_pdf_pdf"></div>
                  <a href="#">Setting Ad Budget-A Sorcoic</a>Viewed by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                <div class="row_recent">
                  <div class="recnt_pdf_doc"></div>
                  <a href="#">Setting Ad Budget-A Sorcoic</a>Viewed by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                <div class="row_recent">
                  <div class="recnt_pdf_pdf"></div>
                  <a href="#">Setting Ad Budget-A Sorcoic</a>Viewed by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                <div class="row_recent">
                  <div class="recnt_pdf_doc"></div>
                  <a href="#">Setting Ad Budget-A Sorcoic</a>Viewed by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                <div class="row_recent">
                  <div class="recnt_pdf_doc"></div>
                  <a href="#">Setting Ad Budget-A Sorcoic</a>Viewed by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                <div class="row_recent">
                  <div class="recnt_pdf_doc"></div>
                  <a href="#">Setting Ad Budget-A Sorcoic</a>Viewed by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                <div class="claer"></div>
                <a href="#" class="bottom_link">
                <div class="botom_view_more botom_view_more_11"> View All </div>
                </a> </div>
              <!--------------/// ROW FIRST END HERE ------------> 
              
              <!-------------/// ROW FIRST STARTED HERE ----------->
              <div class="statical_graph">
                <div class="static_heading">Last month created documents</div>
                <div class="row_recent">
                  <div class="recnt_pdf"></div>
                  <a href="#">Setting Ad Budget-A Sorcoic</a>created by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                <div class="row_recent">
                  <div class="recnt_pdf_pdf"></div>
                  <a href="#">Setting Ad Budget-A Sorcoic</a>created by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                <div class="row_recent">
                  <div class="recnt_pdf_pdf"></div>
                  <a href="#">Setting Ad Budget-A Sorcoic</a>created by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                <div class="row_recent">
                  <div class="recnt_pdf_doc"></div>
                  <a href="#">Setting Ad Budget-A Sorcoic</a>created by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                <div class="row_recent">
                  <div class="recnt_pdf_pdf"></div>
                  <a href="#">Setting Ad Budget-A Sorcoic</a>created by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                <div class="row_recent">
                  <div class="recnt_pdf_doc"></div>
                  <a href="#">Setting Ad Budget-A Sorcoic</a>created by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                <div class="row_recent">
                  <div class="recnt_pdf_doc"></div>
                  <a href="#">Setting Ad Budget-A Sorcoic</a>created by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                <div class="row_recent">
                  <div class="recnt_pdf_doc"></div>
                  <a href="#">Setting Ad Budget-A Sorcoic</a>created by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                <div class="claer"></div>
                <a href="#" class="bottom_link">
                <div class="botom_view_more botom_view_more_11"> View All </div>
                </a> </div>
              <!--------------/// ROW FIRST END HERE ------------> 
              <!-------------/// ROW FIRST STARTED HERE ----------->
              <div class="statical_graph">
                <div class="static_heading">Last month modified documents</div>
                <div class="row_recent">
                  <div class="recnt_pdf"></div>
                  <a href="#">Setting Ad Budget-A Sorcoic</a>Modifed by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                <div class="row_recent">
                  <div class="recnt_pdf_pdf"></div>
                  <a href="#">Setting Ad Budget-A Sorcoic</a>Modifed by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                <div class="row_recent">
                  <div class="recnt_pdf_pdf"></div>
                  <a href="#">Setting Ad Budget-A Sorcoic</a>Modifed by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                <div class="row_recent">
                  <div class="recnt_pdf_doc"></div>
                  <a href="#">Setting Ad Budget-A Sorcoic</a>Modifed by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                <div class="row_recent">
                  <div class="recnt_pdf_pdf"></div>
                  <a href="#">Setting Ad Budget-A Sorcoic</a>Modifed by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                <div class="row_recent">
                  <div class="recnt_pdf_doc"></div>
                  <a href="#">Setting Ad Budget-A Sorcoic</a>Modifed by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                <div class="row_recent">
                  <div class="recnt_pdf_doc"></div>
                  <a href="#">Setting Ad Budget-A Sorcoic</a>Modifed by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                <div class="row_recent">
                  <div class="recnt_pdf_doc"></div>
                  <a href="#">Setting Ad Budget-A Sorcoic</a>Modifed by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                <div class="claer"></div>
                <a href="#" class="bottom_link">
                <div class="botom_view_more botom_view_more_11"> View All </div>
                </a> </div>
              <!--------------/// ROW FIRST END HERE ------------> 
              <!-------------/// ROW FIRST STARTED HERE ----------->
              <div class="statical_graph">
                <div class="static_heading">Top 20 recently uploaded documents</div>
                <div class="row_recent">
                  <div class="recnt_pdf"></div>
                  <a href="#">Setting Ad Budget-A Sorcoic</a>uploaded by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                <div class="row_recent">
                  <div class="recnt_pdf_pdf"></div>
                  <a href="#">Setting Ad Budget-A Sorcoic</a>uploaded by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                <div class="row_recent">
                  <div class="recnt_pdf_pdf"></div>
                  <a href="#">Setting Ad Budget-A Sorcoic</a>uploaded by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                <div class="row_recent">
                  <div class="recnt_pdf_doc"></div>
                  <a href="#">Setting Ad Budget-A Sorcoic</a>uploaded by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                <div class="row_recent">
                  <div class="recnt_pdf_pdf"></div>
                  <a href="#">Setting Ad Budget-A Sorcoic</a>uploaded by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                <div class="row_recent">
                  <div class="recnt_pdf_doc"></div>
                  <a href="#">Setting Ad Budget-A Sorcoic</a>uploaded by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                <div class="claer"></div>
                <a href="#" class="bottom_link">
                <div class="botom_view_more botom_view_more_11"> View All </div>
                </a> </div>
              <!--------------/// ROW FIRST END HERE ------------> 
              <!-------------/// ROW FIRST STARTED HERE ----------->
              <div class="statical_graph">
                <div class="static_heading">Top 20 recently downloaded documents</div>
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
                  <a href="#">Setting Ad Budget-A Sorcoic</a>downloaded by<a href="#" class="second">Nudd On</a> 05 Jan 2010 12:48:45 </div>
                <div class="claer"></div>
                <a href="#" class="bottom_link">
                <div class="botom_view_more botom_view_more_11"> View All </div>
                </a> </div>
              <!--------------/// ROW FIRST END HERE ------------> 
              <!-------------/// ROW FIRST STARTED HERE ----------->
              <div class="statical_graph">
                <div class="static_heading">Locked documents</div>
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
                <div class="claer"></div>
                <a href="#" class="bottom_link">
                <div class="botom_view_more botom_view_more_11"> View All </div>
                </a> </div>
              <!--------------/// ROW FIRST END HERE ------------> 
                 <div class="claer"></div>
            </div>
            
            <!-----------/// Statical Graph End here ------------> 
            
          </div>
          <!-- #tab2 -->
          <div id="tab21"  class="tab_content_1 calender_div">
                     <div class="add_margin">
                           <img src="images/calender.jpg" />
                     </div>
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
            
            <!---------------------/// TAB 8 END HERE --------------------> 
            
          </div>
          <!-- #tab4 -->
          
          <div id="tab9" class="tab_content_1">
        
            <div class="full_width_111"> 
            
               <div class="next_privious">
                   
                   <ul class="nextpre">
                      <li><span>1 - 50 of 3,229</span></li>
                      <li><a href="#"><div class="pri"></div></a></li>
                      <li><a href="#"><div class="next"></div></a></li>
                   </ul>
               
               
               </div>
            
            
               <!---------// HIdden Open Here -------------->
                    <div class="hindden_tab" id="powermail_fieldwrap_331">
                            <ul>
                               <li class="delete_option"></li>
                               <li class="simple_line"> |  </li>
                               <li class="edit_option"></li>
                            
                            </ul>
                    </div>
                 
                 <!------------/// Hinden End -------------------->
              <!-------------------/// USER LIST RIGHT STARTED HERE ----------->
              <div class="user_loged_right"> 
              
                
              
              
                
                <!----------/// ADD USER ----------->
                <div class="Logged_User_tab add_user_js add_user_bg">Add User</div>
                <!----------/// ADD USER END --------> 
                <!----------/// User List ----------->
                <div class="Logged_User_tab  onclick">Add Group</div>
                <!----------/// User List END --------> 
                <!----------/// User List ----------->
                <div class="Logged_User_tab User_List_js">User List</div>
                <!----------/// User List END --------> 
                <!----------/// User List ----------->
                <div class="Logged_User_tab group_List_js">Group List</div>
                <!----------/// User List END --------> 
                <!----------/// LOGED USER ----------->
                <div class="Logged_User_tab logged_user_js ">Logged User</div>
                <!----------/// LOGED USER END --------> 
                
              </div>
              <!-------------------/// USER LIST RIGHT END ------------>
              <div class="claer"></div>
            </div>
            <!---------------------///TAB 8 CONTENT STARTED HERE ---------------->
            
            <div class="tab_container user_tab_container"> 
              
              <!------------///Loged User Tab8 Conatent ------------> 
              <!---------------/// ADD USER CONTENT ------------->
              
              <div class="add_user_content">
                <h1>ADD USER</h1>
                <div class="main_add_user_div"> 
                  <!-------------------/// ADD USER from  ----------->
                  <div class="add_user_from">
                    <form class="add_user_1">
                      <input type="text" placeholder="First Name" class="new_user_icon new_user_right" />
                      <input type="text" placeholder="Last Name" class="new_user_icon" />
                      <div class="claer"></div>
                      <input type="text" placeholder="Enter Your Email Id" class="full_width_new_user email_user_icon" />
                      <div class="claer"></div>
                      <input type="text" placeholder="Type a password (at least 6 characters)" class="full_width_new_user pass_user_icon" />
                      <div class="claer"></div>
                      <input type="text" placeholder="Re-enter password" class="full_width_new_user pass_user_icon" />
                      <div class="claer"></div>
                      <div class="datebirth">Birthday</div>
                      <select class="date">
                        <option>Date</option>
                        <option>1</option>
                        <option>2</option>
                      </select>
                      <select class="date">
                        <option>Month</option>
                        <option>1</option>
                        <option>2</option>
                      </select>
                      <select class="date" >
                        <option>Year</option>
                        <option>1</option>
                        <option>2</option>
                      </select>
                      <div class="claer"></div>
                      <div class="datebirth">Gender</div>
                      <div class="check_box_1">
                        <div class="example">
                          <input type="radio" name="ex1" id="ex1_a" class="left_1">
                          <label for="ex1_a" class="left">Male</label>
                          <input type="radio" name="ex1" id="ex1_b" class="left_1">
                          <label for="ex1_b" class="float left">Female</label>
                        </div>
                      </div>
                      <div class="claer"></div>
                      <div class="cancel_buttom">Cancel</div>
                      <div class="cancel_buttom">Save & New</div>
                      <div class="cancel_buttom">Save & Close</div>
                      <div class="add_user_buttom">Save</div>
                    </form>
                  </div>
                  <div class="bottom_add_user"></div>
                </div>
              </div>
              <!----------------/// ADD USER CONTENT END ------------> 
              
              <!--------------------// Logged User Tab Stared Here -------------->
              <div class="loged_user_content">
                <table class="table_heading_user_list_1">
                  <tr class="logged_user_list">
                    <td class="space_logged">&nbsp;</td>
                    <td class="user_list_user"><div class="user_loged">
                        <div class="looged_user"></div>
                        USER
                        <div class="claer"></div>
                      </div></td>
                    <td class="session_id_width"><div class="session">
                        <div class="logged_session"></div>
                        SESSION ID </div></td>
                    <td><div class="location">
                        <div class="logged_location"> </div>
                        LOCATION (IP) </div></td>
                    <td><div class="creation">
                        <div class="logged_creation"></div>
                        CREATION </div></td>
                    <td><div class="last_user">
                        <div class="last_login"></div>
                        LAST LOGIN </div></td>
                  </tr>
                </table>
                <div class="scroll_table_user">
                  <table>
                    <tr class="logged_padding ">
                      <td><img src="images/blue_user.png" /></td>
                      <td class="name"><div class="large_name">Hariom Srivastava</div></td>
                      <td>572345905sfjsj0148-04 </td>
                      <td>India(UP)(122.176.71.85)</td>
                      <td>10:50am,10-10-2011</td>
                      <td>12:01am,10-10-2014</td>
                    </tr>
                    <tr class="logged_padding ">
                      <td><img src="images/blue_user.png" /></td>
                      <td class="name"><div class="large_name">Rohit Kumar Tiwari father</div></td>
                      <td>572345905sfjsj0148-04 </td>
                      <td>India(UP)(122.176.71.85)</td>
                      <td>10:50am,10-10-2011</td>
                      <td>12:01am,10-10-2014</td>
                    </tr>
                    <tr class="logged_padding ">
                      <td><img src="images/blue_user.png" /></td>
                      <td class="name"><div class="large_name">Hariom Srivastava</div></td>
                      <td>572345905sfjsj0148-04 </td>
                      <td>India(UP)(122.176.71.85)</td>
                      <td>10:50am,10-10-2011</td>
                      <td>12:01am,10-10-2014</td>
                    </tr>
                    <tr class="logged_padding ">
                      <td><img src="images/blue_user.png" /></td>
                      <td class="name"><div class="large_name">Rohit Kumar Tiwari father</div></td>
                      <td>572345905sfjsj0148-04 </td>
                      <td>India(UP)(122.176.71.85)</td>
                      <td>10:50am,10-10-2011</td>
                      <td>12:01am,10-10-2014</td>
                    </tr>
                    <tr class="logged_padding ">
                      <td><img src="images/blue_user.png" /></td>
                      <td class="name"><div class="large_name">Hariom Srivastava</div></td>
                      <td>572345905sfjsj0148-04 </td>
                      <td>India(UP)(122.176.71.85)</td>
                      <td>10:50am,10-10-2011</td>
                      <td>12:01am,10-10-2014</td>
                    </tr>
                    <tr class="logged_padding ">
                      <td><img src="images/blue_user.png" /></td>
                      <td class="name"><div class="large_name">Rohit Kumar Tiwari father</div></td>
                      <td>572345905sfjsj0148-04 </td>
                      <td>India(UP)(122.176.71.85)</td>
                      <td>10:50am,10-10-2011</td>
                      <td>12:01am,10-10-2014</td>
                    </tr>
                    <tr class="logged_padding ">
                      <td><img src="images/blue_user.png" /></td>
                      <td class="name"><div class="large_name">Hariom Srivastava</div></td>
                      <td>572345905sfjsj0148-04 </td>
                      <td>India(UP)(122.176.71.85)</td>
                      <td>10:50am,10-10-2011</td>
                      <td>12:01am,10-10-2014</td>
                    </tr>
                    <tr class="logged_padding ">
                      <td><img src="images/blue_user.png" /></td>
                      <td class="name"><div class="large_name">Rohit Kumar Tiwari father</div></td>
                      <td>572345905sfjsj0148-04 </td>
                      <td>India(UP)(122.176.71.85)</td>
                      <td>10:50am,10-10-2011</td>
                      <td>12:01am,10-10-2014</td>
                    </tr>
                    <tr class="logged_padding ">
                      <td><img src="images/blue_user.png" /></td>
                      <td class="name"><div class="large_name">Hariom Srivastava</div></td>
                      <td>572345905sfjsj0148-04 </td>
                      <td>India(UP)(122.176.71.85)</td>
                      <td>10:50am,10-10-2011</td>
                      <td>12:01am,10-10-2014</td>
                    </tr>
                    <tr class="logged_padding ">
                      <td><img src="images/blue_user.png" /></td>
                      <td class="name"><div class="large_name">Rohit Kumar Tiwari father</div></td>
                      <td>572345905sfjsj0148-04 </td>
                      <td>India(UP)(122.176.71.85)</td>
                      <td>10:50am,10-10-2011</td>
                      <td>12:01am,10-10-2014</td>
                    </tr>
                    <tr class="logged_padding ">
                      <td ><img src="images/blue_user.png" /></td>
                      <td class="name"><div class="large_name">Hariom Srivastava</div></td>
                      <td>572345905sfjsj0148-04 </td>
                      <td>India(UP)(122.176.71.85)</td>
                      <td>10:50am,10-10-2011</td>
                      <td>12:01am,10-10-2014</td>
                    </tr>
                    <tr class="logged_padding ">
                      <td ><img src="images/blue_user.png" /></td>
                      <td class="name"><div class="large_name">Rohit Kumar Tiwari father</div></td>
                      <td>572345905sfjsj0148-04 </td>
                      <td>India(UP)(122.176.71.85)</td>
                      <td>10:50am,10-10-2011</td>
                      <td>12:01am,10-10-2014</td>
                    </tr>
                    <tr class="logged_padding ">
                      <td ><img src="images/blue_user.png" /></td>
                      <td class="name"><div class="large_name">Hariom Srivastava</div></td>
                      <td>572345905sfjsj0148-04 </td>
                      <td>India(UP)(122.176.71.85)</td>
                      <td>10:50am,10-10-2011</td>
                      <td>12:01am,10-10-2014</td>
                    </tr>
                    <tr class="logged_padding ">
                      <td><img src="images/blue_user.png" /></td>
                      <td class="name"><div class="large_name">Rohit Kumar Tiwari father</div></td>
                      <td>572345905sfjsj0148-04 </td>
                      <td>India(UP)(122.176.71.85)</td>
                      <td>10:50am,10-10-2011</td>
                      <td>12:01am,10-10-2014</td>
                    </tr>
                    <tr class="logged_padding ">
                      <td><img src="images/blue_user.png" /></td>
                      <td class="name"><div class="large_name">Hariom Srivastava</div></td>
                      <td>572345905sfjsj0148-04 </td>
                      <td>India(UP)(122.176.71.85)</td>
                      <td>10:50am,10-10-2011</td>
                      <td>12:01am,10-10-2014</td>
                    </tr>
                    <tr class="logged_padding ">
                      <td><img src="images/blue_user.png" /></td>
                      <td class="name"><div class="large_name">Rohit Kumar Tiwari father</div></td>
                      <td>572345905sfjsj0148-04 </td>
                      <td>India(UP)(122.176.71.85)</td>
                      <td>10:50am,10-10-2011</td>
                      <td>12:01am,10-10-2014</td>
                    </tr>
                    <tr class="logged_padding ">
                      <td><img src="images/blue_user.png" /></td>
                      <td class="name"><div class="large_name">Hariom Srivastava</div></td>
                      <td>572345905sfjsj0148-04 </td>
                      <td>India(UP)(122.176.71.85)</td>
                      <td>10:50am,10-10-2011</td>
                      <td>12:01am,10-10-2014</td>
                    </tr>
                    <tr class="logged_padding ">
                      <td><img src="images/blue_user.png" /></td>
                      <td class="name"><div class="large_name">Rohit Kumar Tiwari father</div></td>
                      <td>572345905sfjsj0148-04 </td>
                      <td>India(UP)(122.176.71.85)</td>
                      <td>10:50am,10-10-2011</td>
                      <td>12:01am,10-10-2014</td>
                    </tr>
                    <tr class="logged_padding ">
                      <td><img src="images/blue_user.png" /></td>
                      <td class="name"><div class="large_name">Hariom Srivastava</div></td>
                      <td>572345905sfjsj0148-04 </td>
                      <td>India(UP)(122.176.71.85)</td>
                      <td>10:50am,10-10-2011</td>
                      <td>12:01am,10-10-2014</td>
                    </tr>
                    <tr class="logged_padding ">
                      <td><img src="images/blue_user.png" /></td>
                      <td class="name"><div class="large_name">Rohit Kumar Tiwari father</div></td>
                      <td>572345905sfjsj0148-04 </td>
                      <td>India(UP)(122.176.71.85)</td>
                      <td>10:50am,10-10-2011</td>
                      <td>12:01am,10-10-2014</td>
                    </tr>
                    <tr class="logged_padding ">
                      <td><img src="images/blue_user.png" /></td>
                      <td class="name"><div class="large_name">Hariom Srivastava</div></td>
                      <td>572345905sfjsj0148-04 </td>
                      <td>India(UP)(122.176.71.85)</td>
                      <td>10:50am,10-10-2011</td>
                      <td>12:01am,10-10-2014</td>
                    </tr>
                    <tr class="logged_padding ">
                      <td><img src="images/blue_user.png" /></td>
                      <td class="name"><div class="large_name">Rohit Kumar Tiwari father</div></td>
                      <td>572345905sfjsj0148-04 </td>
                      <td>India(UP)(122.176.71.85)</td>
                      <td>10:50am,10-10-2011</td>
                      <td>12:01am,10-10-2014</td>
                    </tr>
                    <tr class="logged_padding ">
                      <td><img src="images/blue_user.png" /></td>
                      <td class="name"><div class="large_name">Hariom Srivastava</div></td>
                      <td>572345905sfjsj0148-04 </td>
                      <td>India(UP)(122.176.71.85)</td>
                      <td>10:50am,10-10-2011</td>
                      <td>12:01am,10-10-2014</td>
                    </tr>
                    <tr class="logged_padding ">
                      <td><img src="images/blue_user.png" /></td>
                      <td class="name"><div class="large_name">Rohit Kumar Tiwari father</div></td>
                      <td>572345905sfjsj0148-04 </td>
                      <td>India(UP)(122.176.71.85)</td>
                      <td>10:50am,10-10-2011</td>
                      <td>12:01am,10-10-2014</td>
                    </tr>
                    <tr class="logged_padding ">
                      <td><img src="images/blue_user.png" /></td>
                      <td class="name"><div class="large_name">Hariom Srivastava</div></td>
                      <td>572345905sfjsj0148-04 </td>
                      <td>India(UP)(122.176.71.85)</td>
                      <td>10:50am,10-10-2011</td>
                      <td>12:01am,10-10-2014</td>
                    </tr>
                    <tr class="logged_padding ">
                      <td><img src="images/blue_user.png" /></td>
                      <td class="name"><div class="large_name">Rohit Kumar Tiwari father</div></td>
                      <td>572345905sfjsj0148-04 </td>
                      <td>India(UP)(122.176.71.85)</td>
                      <td>10:50am,10-10-2011</td>
                      <td>12:01am,10-10-2014</td>
                    </tr>
                    <tr class="logged_padding ">
                      <td><img src="images/blue_user.png" /></td>
                      <td class="name"><div class="large_name">Hariom Srivastava</div></td>
                      <td>572345905sfjsj0148-04 </td>
                      <td>India(UP)(122.176.71.85)</td>
                      <td>10:50am,10-10-2011</td>
                      <td>12:01am,10-10-2014</td>
                    </tr>
                    <tr class="logged_padding ">
                      <td><img src="images/blue_user.png" /></td>
                      <td class="name"><div class="large_name">Rohit Kumar Tiwari father</div></td>
                      <td>572345905sfjsj0148-04 </td>
                      <td>India(UP)(122.176.71.85)</td>
                      <td>10:50am,10-10-2011</td>
                      <td>12:01am,10-10-2014</td>
                    </tr>
                    <tr class="logged_padding ">
                      <td><img src="images/blue_user.png" /></td>
                      <td class="name"><div class="large_name">Hariom Srivastava</div></td>
                      <td>572345905sfjsj0148-04 </td>
                      <td>India(UP)(122.176.71.85)</td>
                      <td>10:50am,10-10-2011</td>
                      <td>12:01am,10-10-2014</td>
                    </tr>
                    <tr class="logged_padding ">
                      <td><img src="images/blue_user.png" /></td>
                      <td class="name"><div class="large_name">Rohit Kumar Tiwari father</div></td>
                      <td>572345905sfjsj0148-04 </td>
                      <td>India(UP)(122.176.71.85)</td>
                      <td>10:50am,10-10-2011</td>
                      <td>12:01am,10-10-2014</td>
                    </tr>
                    <tr class="logged_padding ">
                      <td><img src="images/blue_user.png" /></td>
                      <td class="name"><div class="large_name">Hariom Srivastava</div></td>
                      <td>572345905sfjsj0148-04 </td>
                      <td>India(UP)(122.176.71.85)</td>
                      <td>10:50am,10-10-2011</td>
                      <td>12:01am,10-10-2014</td>
                    </tr>
                    <tr class="logged_padding ">
                      <td><img src="images/blue_user.png" /></td>
                      <td class="name"><div class="large_name">Rohit Kumar Tiwari father</div></td>
                      <td>572345905sfjsj0148-04 </td>
                      <td>India(UP)(122.176.71.85)</td>
                      <td>10:50am,10-10-2011</td>
                      <td>12:01am,10-10-2014</td>
                    </tr>
                  </table>
                </div>
              </div>
              <!--------------------/// Logeed User End ----------------> 
              <!------------/// User List Stared Here --------------->
              <div class="User_List_content">
                <table class="table_heading_user_list">
                  <tr class="user_list_first_row" >
                    <td class="user_list_table"><input type="checkbox" id="checkboxTop" name="chk[]" 
                                  class="heading_main hidden_option check_class main_check" /></td>
                    <td><div class="user_list_box_other">
                        <div class="user_list_first_name"></div>
                        <div class="claer"></div>
                        LOGIN ID </div></td>
                    <td><div class="user_list_box_name full_name">
                        <div class="user_list_last"></div>
                        <div class="claer"></div>
                        FULL NAME </div></td>
                    <td><div class="user_list_box_des">
                        <div class="user_list_screen"></div>
                        <div class="claer"></div>
                        DESIGNATION </div></td>
                    <td><div class="user_list_box_group">
                        <div class="user_list_user_group"></div>
                        <div class="claer"></div>
                        USER GROUP </div></td>
                    <td><div class="user_list_box_user_login">
                        <div class="user_list_first_name"></div>
                        <div class="claer"></div>
                        LAST LOGIN </div></td>
                        <td class="active_deactive_space"><div class="user_list_box_status_user">
                        <div class="user_list_screen"></div>
                        <div class="claer"></div>
                        STATUS </div></td>
                        
                       <td class="next_pre">
                              <div class="user_list_box_action_user">
                        <div class="user_list_first_name"></div>
                        <div class="claer"></div>
                        ACTION </div>
                        </td>
                  </tr>
                </table>
                <div class="scroll_table_user_2">
                  <table class="content_user_list">
                    <tr>
                      <td><input type="checkbox" class="user_list_main hidden_option check_class" /></td>
                      <td>hari@silvereye.co</td>
                      <td class="name"><div class="large_name">Hariom Srivastava</div></td>
                      <td>Webdesigner</td>
                      <td>IT</td>
                      <td>12:01am,10-10-2014</td>
                        <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="active_icon" onclick="myFunction()"></div>
                        </div></td>
                      <td><div class="left_option">
                          <div class="del_edt_del new_edit"></div>
                          <div class="del_edt_edit"></div>
                          <select>
                            <option>Action</option>
                            <option>Event</option>
                          </select>
                        </div></td>
                    </tr>
                    <tr class="background_change">
                      <td><input type="checkbox" class="user_list_main hidden_option check_class" /></td>
                      <td>hari@silvereye.co</td>
                      <td class="name"><div class="large_name">Rohit Kumar Tiwari father</div></td>
                      <td>Software Enginner</td>
                      <td>ACCOUNTING</td>
                      <td>12:01am,10-10-2014</td>
                      <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="active_icon" onclick="myFunction()"></div>
                        </div></td>
                      <td class="action_width"><div class="left_option">
                          <div class="del_edt_del"></div>
                          <div class="del_edt_edit"></div>
                          <select>
                            <option>Action</option>
                            <option>Event</option>
                          </select>
                        </div></td>
                    </tr>
                     <tr>
                      <td><input type="checkbox" class="user_list_main hidden_option check_class" /></td>
                      <td>hari@silvereye.co</td>
                      <td class="name"><div class="large_name">Hariom Srivastava</div></td>
                      <td>Webdesigner</td>
                      <td>IT</td>
                      <td>12:01am,10-10-2014</td>
                      <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="deactive_icon" onclick="myFunction_decative()"></div>
                        </div></td>
                      <td><div class="left_option">
                          <div class="del_edt_del new_edit"></div>
                          <div class="del_edt_edit"></div>
                          <select>
                            <option>Action</option>
                            <option>Event</option>
                          </select>
                        </div></td>
                    </tr>
                    <tr class="background_change">
                      <td><input type="checkbox" class="user_list_main hidden_option check_class" /></td>
                      <td>hari@silvereye.co</td>
                      <td class="name"><div class="large_name">Rohit Kumar Tiwari father</div></td>
                      <td>Software Enginner</td>
                      <td>ACCOUNTING</td>
                      <td>12:01am,10-10-2014</td>
                      <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="deactive_icon" onclick="myFunction_decative()"></div>
                        </div></td>
                      <td class="action_width"><div class="left_option">
                          <div class="del_edt_del"></div>
                          <div class="del_edt_edit"></div>
                          <select>
                            <option>Action</option>
                            <option>Event</option>
                          </select>
                        </div></td>
                    </tr>
                     <tr>
                      <td><input type="checkbox" class="user_list_main hidden_option check_class" /></td>
                      <td>hari@silvereye.co</td>
                      <td class="name"><div class="large_name">Hariom Srivastava</div></td>
                      <td>Webdesigner</td>
                      <td>IT</td>
                      <td>12:01am,10-10-2014</td>
                      <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="deactive_icon" onclick="myFunction_decative()"></div>
                        </div></td>
                      <td><div class="left_option">
                          <div class="del_edt_del new_edit"></div>
                          <div class="del_edt_edit"></div>
                          <select>
                            <option>Action</option>
                            <option>Event</option>
                          </select>
                        </div></td>
                    </tr>
                    <tr class="background_change">
                      <td><input type="checkbox" class="user_list_main hidden_option check_class" /></td>
                      <td>hari@silvereye.co</td>
                      <td class="name"><div class="large_name">Rohit Kumar Tiwari father</div></td>
                      <td>Software Enginner</td>
                      <td>ACCOUNTING</td>
                      <td>12:01am,10-10-2014</td>
                        <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="active_icon" onclick="myFunction()"></div>
                        </div></td>
                      <td class="action_width"><div class="left_option">
                          <div class="del_edt_del"></div>
                          <div class="del_edt_edit"></div>
                          <select>
                            <option>Action</option>
                            <option>Event</option>
                          </select>
                        </div></td>
                    </tr>
                     <tr>
                      <td><input type="checkbox" class="user_list_main hidden_option check_class" /></td>
                      <td>hari@silvereye.co</td>
                      <td class="name"><div class="large_name">Hariom Srivastava</div></td>
                      <td>Webdesigner</td>
                      <td>IT</td>
                      <td>12:01am,10-10-2014</td>
                        <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="active_icon" onclick="myFunction()"></div>
                        </div></td>
                      <td><div class="left_option">
                          <div class="del_edt_del new_edit"></div>
                          <div class="del_edt_edit"></div>
                          <select>
                            <option>Action</option>
                            <option>Event</option>
                          </select>
                        </div></td>
                    </tr>
                    <tr class="background_change">
                      <td><input type="checkbox" class="user_list_main hidden_option check_class" /></td>
                      <td>hari@silvereye.co</td>
                      <td class="name"><div class="large_name">Rohit Kumar Tiwari father</div></td>
                      <td>Software Enginner</td>
                      <td>ACCOUNTING</td>
                      <td>12:01am,10-10-2014</td>
                        <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="active_icon" onclick="myFunction()"></div>
                        </div></td>
                      <td class="action_width"><div class="left_option">
                          <div class="del_edt_del"></div>
                          <div class="del_edt_edit"></div>
                          <select>
                            <option>Action</option>
                            <option>Event</option>
                          </select>
                        </div></td>
                    </tr>
                     <tr>
                      <td><input type="checkbox" class="user_list_main hidden_option check_class" /></td>
                      <td>hari@silvereye.co</td>
                      <td class="name"><div class="large_name">Hariom Srivastava</div></td>
                      <td>Webdesigner</td>
                      <td>IT</td>
                      <td>12:01am,10-10-2014</td>
                        <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="active_icon" onclick="myFunction()"></div>
                        </div></td>
                      <td><div class="left_option">
                          <div class="del_edt_del new_edit"></div>
                          <div class="del_edt_edit"></div>
                          <select>
                            <option>Action</option>
                            <option>Event</option>
                          </select>
                        </div></td>
                    </tr>
                    <tr class="background_change">
                      <td><input type="checkbox" class="user_list_main hidden_option check_class" /></td>
                      <td>hari@silvereye.co</td>
                      <td class="name"><div class="large_name">Rohit Kumar Tiwari father</div></td>
                      <td>Software Enginner</td>
                      <td>ACCOUNTING</td>
                      <td>12:01am,10-10-2014</td>
                        <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="active_icon" onclick="myFunction()"></div>
                        </div></td>
                      <td class="action_width"><div class="left_option">
                          <div class="del_edt_del"></div>
                          <div class="del_edt_edit"></div>
                          <select>
                            <option>Action</option>
                            <option>Event</option>
                          </select>
                        </div></td>
                    </tr>
                     <tr>
                      <td><input type="checkbox" class="user_list_main hidden_option check_class" /></td>
                      <td>hari@silvereye.co</td>
                      <td class="name"><div class="large_name">Hariom Srivastava</div></td>
                      <td>Webdesigner</td>
                      <td>IT</td>
                      <td>12:01am,10-10-2014</td>
                        <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="active_icon" onclick="myFunction()"></div>
                        </div></td>
                      <td><div class="left_option">
                          <div class="del_edt_del new_edit"></div>
                          <div class="del_edt_edit"></div>
                          <select>
                            <option>Action</option>
                            <option>Event</option>
                          </select>
                        </div></td>
                    </tr>
                    <tr class="background_change">
                      <td><input type="checkbox" class="user_list_main hidden_option check_class" /></td>
                      <td>hari@silvereye.co</td>
                      <td class="name"><div class="large_name">Rohit Kumar Tiwari father</div></td>
                      <td>Software Enginner</td>
                      <td>ACCOUNTING</td>
                      <td>12:01am,10-10-2014</td>
                        <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="active_icon" onclick="myFunction()"></div>
                        </div></td>
                      <td class="action_width"><div class="left_option">
                          <div class="del_edt_del"></div>
                          <div class="del_edt_edit"></div>
                          <select>
                            <option>Action</option>
                            <option>Event</option>
                          </select>
                        </div></td>
                    </tr>
                     <tr>
                      <td><input type="checkbox" class="user_list_main hidden_option check_class" /></td>
                      <td>hari@silvereye.co</td>
                      <td class="name"><div class="large_name">Hariom Srivastava</div></td>
                      <td>Webdesigner</td>
                      <td>IT</td>
                      <td>12:01am,10-10-2014</td>
                        <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="active_icon" onclick="myFunction()"></div>
                        </div></td>
                      <td><div class="left_option">
                          <div class="del_edt_del new_edit"></div>
                          <div class="del_edt_edit"></div>
                          <select>
                            <option>Action</option>
                            <option>Event</option>
                          </select>
                        </div></td>
                    </tr>
                    <tr class="background_change">
                      <td><input type="checkbox" class="user_list_main hidden_option check_class" /></td>
                      <td>hari@silvereye.co</td>
                      <td class="name"><div class="large_name">Rohit Kumar Tiwari father</div></td>
                      <td>Software Enginner</td>
                      <td>ACCOUNTING</td>
                      <td>12:01am,10-10-2014</td>
                        <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="active_icon" onclick="myFunction()"></div>
                        </div></td>
                      <td class="action_width"><div class="left_option">
                          <div class="del_edt_del"></div>
                          <div class="del_edt_edit"></div>
                          <select>
                            <option>Action</option>
                            <option>Event</option>
                          </select>
                        </div></td>
                    </tr>
                     <tr>
                      <td><input type="checkbox" class="user_list_main hidden_option check_class" /></td>
                      <td>hari@silvereye.co</td>
                      <td class="name"><div class="large_name">Hariom Srivastava</div></td>
                      <td>Webdesigner</td>
                      <td>IT</td>
                      <td>12:01am,10-10-2014</td>
                        <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="active_icon" onclick="myFunction()"></div>
                        </div></td>
                      <td><div class="left_option">
                          <div class="del_edt_del new_edit"></div>
                          <div class="del_edt_edit"></div>
                          <select>
                            <option>Action</option>
                            <option>Event</option>
                          </select>
                        </div></td>
                    </tr>
                    <tr class="background_change">
                      <td><input type="checkbox" class="user_list_main hidden_option check_class" /></td>
                      <td>hari@silvereye.co</td>
                      <td class="name"><div class="large_name">Rohit Kumar Tiwari father</div></td>
                      <td>Software Enginner</td>
                      <td>ACCOUNTING</td>
                      <td>12:01am,10-10-2014</td>
                        <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="active_icon" onclick="myFunction()"></div>
                        </div></td>
                      <td class="action_width"><div class="left_option">
                          <div class="del_edt_del"></div>
                          <div class="del_edt_edit"></div>
                          <select>
                            <option>Action</option>
                            <option>Event</option>
                          </select>
                        </div></td>
                    </tr>
                     <tr>
                      <td><input type="checkbox" class="user_list_main hidden_option check_class" /></td>
                      <td>hari@silvereye.co</td>
                      <td class="name"><div class="large_name">Hariom Srivastava</div></td>
                      <td>Webdesigner</td>
                      <td>IT</td>
                      <td>12:01am,10-10-2014</td>
                        <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="active_icon" onclick="myFunction()"></div>
                        </div></td>
                      <td><div class="left_option">
                          <div class="del_edt_del new_edit"></div>
                          <div class="del_edt_edit"></div>
                          <select>
                            <option>Action</option>
                            <option>Event</option>
                          </select>
                        </div></td>
                    </tr>
                    <tr class="background_change">
                      <td><input type="checkbox" class="user_list_main hidden_option check_class" /></td>
                      <td>hari@silvereye.co</td>
                      <td class="name"><div class="large_name">Rohit Kumar Tiwari father</div></td>
                      <td>Software Enginner</td>
                      <td>ACCOUNTING</td>
                      <td>12:01am,10-10-2014</td>
                        <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="active_icon" onclick="myFunction()"></div>
                        </div></td>
                      <td class="action_width"><div class="left_option">
                          <div class="del_edt_del"></div>
                          <div class="del_edt_edit"></div>
                          <select>
                            <option>Action</option>
                            <option>Event</option>
                          </select>
                        </div></td>
                    </tr>
                  </table>
                </div>
              </div>
              <!-----------------/// User List Stared Here -----------> 
                     
              <!------------/// Group List Stared Here --------------->
              <div class="group_List_content">
                <table class="table_heading_user_list">
                  <tr class="user_list_first_row" >
                    <td class="min_width"><div class="select_all">
                        <input id="checkboxTop" class="hidden_option check_class group_main_menu" type="checkbox" name="chk[]">
                      </div></td>
                    <td class="id_space_heading"><div class="user_list_box_group_1">
                        <div class="group_list_last"></div>
                        <div class="claer"></div>
                        GROUP NAME </div></td>
                    <td class="group_name"><div class="user_list_box_num">
                        <div class="user_list_first_name "></div>
                        <div class="claer"></div>
                        NUMBER OF USERS </div></td>
                    <td class="group_name"><div class="user_list_box">
                        <div class="user_list_first_name"></div>
                        <div class="claer"></div>
                        DESCRIPTION </div></td>
                    <td class="active_deactive_space"><div class="user_list_box_status_group">
                        <div class="user_list_screen"></div>
                        <div class="claer"></div>
                        STATUS </div></td>
                    <td class="min_width"><a href="#" class="add_user_link onclick"   >
                      <div class="add_group_icon_main">
                        <div class="add_group_icon"></div>
                        ACTION </div>
                      </a></td>
                  </tr>
                </table>
                <div class="scroll_table_user_2">
                  <table class="content_user_list">
                    <tr>
                      <td class="min_width"><input type="checkbox" class="hidden_option check_class"></td>
                      <td class="id_space"><div class="large_name">IT</div></td>
                      <td class="name"><div class="large_name">5</div></td>
                      <td>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, </td>
                      <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="active_icon" onclick="myFunction()"></div>
                        </div></td>
                      <td ><div class="group_action">
                          <div class="del_edt_de2 onclick_5"></div>
                          <div class="del_edt_edit"></div>
                        </div></td>
                    </tr>
                    <tr class="background_change">
                      <td class="min_width"><input type="checkbox" class="hidden_option check_class"></td>
                      <td class="id_space"><div class="large_name">FINANCE</div></td>
                      <td class="name"><div class="large_name">5</div></td>
                      <td>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, </td>
                      <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="active_icon" onclick="myFunction()"></div>
                        </div></td>
                      <td ><div class="group_action">
                          <div class="del_edt_de2 onclick_5"></div>
                          <div class="del_edt_edit"></div>
                        </div></td>
                    </tr>
                    <tr >
                      <td class="min_width"><input type="checkbox" class="hidden_option check_class"></td>
                      <td class="id_space"><div class="large_name">ACCOUNTING</div></td>
                      <td class="name"> 10</td>
                      <td>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, </td>
                      <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="deactive_icon" onclick="myFunction_decative()"></div>
                        </div></td>
                      <td class="min_width"><div class="group_action">
                          <div class="del_edt_de2 onclick_5"></div>
                          <div class="del_edt_edit"></div>
                        </div></td>
                    </tr>
                    <tr class="background_change">
                      <td class="min_width"><input type="checkbox" class="hidden_option check_class"></td>
                      <td class="id_space"><div class="large_name">MARKETING</div></td>
                      <td class="name">8 </td>
                      <td>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, </td>
                      <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="deactive_icon" onclick="myFunction_decative()"></div>
                        </div></td>
                      <td class="min_width"><div class="group_action">
                          <div class="del_edt_de2 onclick_5"></div>
                          <div class="del_edt_edit"></div>
                        </div></td>
                    </tr>
                      <tr>
                      <td class="min_width"><input type="checkbox" class="hidden_option check_class"></td>
                      <td class="id_space"><div class="large_name">IT</div></td>
                      <td class="name"><div class="large_name">5</div></td>
                      <td>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, </td>
                      <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="active_icon" onclick="myFunction()"></div>
                        </div></td>
                      <td ><div class="group_action">
                          <div class="del_edt_de2 onclick_5"></div>
                          <div class="del_edt_edit"></div>
                        </div></td>
                    </tr>
                    <tr class="background_change">
                      <td class="min_width"><input type="checkbox" class="hidden_option check_class"></td>
                      <td class="id_space"><div class="large_name">FINANCE</div></td>
                      <td class="name"><div class="large_name">5</div></td>
                      <td>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, </td>
                      <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="active_icon" onclick="myFunction()"></div>
                        </div></td>
                      <td ><div class="group_action">
                          <div class="del_edt_de2 onclick_5"></div>
                          <div class="del_edt_edit"></div>
                        </div></td>
                    </tr>
                    <tr >
                      <td class="min_width"><input type="checkbox" class="hidden_option check_class"></td>
                      <td class="id_space"><div class="large_name">ACCOUNTING</div></td>
                      <td class="name"> 10</td>
                      <td>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, </td>
                      <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="deactive_icon" onclick="myFunction_decative()"></div>
                        </div></td>
                      <td class="min_width"><div class="group_action">
                          <div class="del_edt_de2 onclick_5"></div>
                          <div class="del_edt_edit"></div>
                        </div></td>
                    </tr>
                    <tr class="background_change">
                      <td class="min_width"><input type="checkbox" class="hidden_option check_class"></td>
                      <td class="id_space"><div class="large_name">MARKETING</div></td>
                      <td class="name">8 </td>
                      <td>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, </td>
                      <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="deactive_icon" onclick="myFunction_decative()"></div>
                        </div></td>
                      <td class="min_width"><div class="group_action">
                          <div class="del_edt_de2 onclick_5"></div>
                          <div class="del_edt_edit"></div>
                        </div></td>
                    </tr>
                      <tr>
                      <td class="min_width"><input type="checkbox" class="hidden_option check_class"></td>
                      <td class="id_space"><div class="large_name">IT</div></td>
                      <td class="name"><div class="large_name">5</div></td>
                      <td>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, </td>
                      <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="active_icon" onclick="myFunction()"></div>
                        </div></td>
                      <td ><div class="group_action">
                          <div class="del_edt_de2 onclick_5"></div>
                          <div class="del_edt_edit"></div>
                        </div></td>
                    </tr>
                    <tr class="background_change">
                      <td class="min_width"><input type="checkbox" class="hidden_option check_class"></td>
                      <td class="id_space"><div class="large_name">FINANCE</div></td>
                      <td class="name"><div class="large_name">5</div></td>
                      <td>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, </td>
                      <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="active_icon" onclick="myFunction()"></div>
                        </div></td>
                      <td ><div class="group_action">
                          <div class="del_edt_de2 onclick_5"></div>
                          <div class="del_edt_edit"></div>
                        </div></td>
                    </tr>
                    <tr >
                      <td class="min_width"><input type="checkbox" class="hidden_option check_class"></td>
                      <td class="id_space"><div class="large_name">ACCOUNTING</div></td>
                      <td class="name"> 10</td>
                      <td>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, </td>
                      <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="deactive_icon" onclick="myFunction_decative()"></div>
                        </div></td>
                      <td class="min_width"><div class="group_action">
                          <div class="del_edt_de2 onclick_5"></div>
                          <div class="del_edt_edit"></div>
                        </div></td>
                    </tr>
                    <tr class="background_change">
                      <td class="min_width"><input type="checkbox" class="hidden_option check_class"></td>
                      <td class="id_space"><div class="large_name">MARKETING</div></td>
                      <td class="name">8 </td>
                      <td>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, </td>
                      <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="deactive_icon" onclick="myFunction_decative()"></div>
                        </div></td>
                      <td class="min_width"><div class="group_action">
                          <div class="del_edt_de2 onclick_5"></div>
                          <div class="del_edt_edit"></div>
                        </div></td>
                    </tr>
                      <tr>
                      <td class="min_width"><input type="checkbox" class="hidden_option check_class"></td>
                      <td class="id_space"><div class="large_name">IT</div></td>
                      <td class="name"><div class="large_name">5</div></td>
                      <td>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, </td>
                      <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="active_icon" onclick="myFunction()"></div>
                        </div></td>
                      <td ><div class="group_action">
                          <div class="del_edt_de2 onclick_5"></div>
                          <div class="del_edt_edit"></div>
                        </div></td>
                    </tr>
                    <tr class="background_change">
                      <td class="min_width"><input type="checkbox" class="hidden_option check_class"></td>
                      <td class="id_space"><div class="large_name">FINANCE</div></td>
                      <td class="name"><div class="large_name">5</div></td>
                      <td>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, </td>
                      <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="active_icon" onclick="myFunction()"></div>
                        </div></td>
                      <td ><div class="group_action">
                          <div class="del_edt_de2 onclick_5"></div>
                          <div class="del_edt_edit"></div>
                        </div></td>
                    </tr>
                    <tr >
                      <td class="min_width"><input type="checkbox" class="hidden_option check_class"></td>
                      <td class="id_space"><div class="large_name">ACCOUNTING</div></td>
                      <td class="name"> 10</td>
                      <td>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, </td>
                      <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="deactive_icon" onclick="myFunction_decative()"></div>
                        </div></td>
                      <td class="min_width"><div class="group_action">
                          <div class="del_edt_de2 onclick_5"></div>
                          <div class="del_edt_edit"></div>
                        </div></td>
                    </tr>
                    <tr class="background_change">
                      <td class="min_width"><input type="checkbox" class="hidden_option check_class"></td>
                      <td class="id_space"><div class="large_name">MARKETING</div></td>
                      <td class="name">8 </td>
                      <td>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, </td>
                      <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="deactive_icon" onclick="myFunction_decative()"></div>
                        </div></td>
                      <td class="min_width"><div class="group_action">
                          <div class="del_edt_de2 onclick_5"></div>
                          <div class="del_edt_edit"></div>
                        </div></td>
                    </tr>
                      <tr>
                      <td class="min_width"><input type="checkbox" class="hidden_option check_class"></td>
                      <td class="id_space"><div class="large_name">IT</div></td>
                      <td class="name"><div class="large_name">5</div></td>
                      <td>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, </td>
                      <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="active_icon" onclick="myFunction()"></div>
                        </div></td>
                      <td ><div class="group_action">
                          <div class="del_edt_de2 onclick_5"></div>
                          <div class="del_edt_edit"></div>
                        </div></td>
                    </tr>
                    <tr class="background_change">
                      <td class="min_width"><input type="checkbox" class="hidden_option check_class"></td>
                      <td class="id_space"><div class="large_name">FINANCE</div></td>
                      <td class="name"><div class="large_name">5</div></td>
                      <td>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, </td>
                      <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="active_icon" onclick="myFunction()"></div>
                        </div></td>
                      <td ><div class="group_action">
                          <div class="del_edt_de2 onclick_5"></div>
                          <div class="del_edt_edit"></div>
                        </div></td>
                    </tr>
                    <tr >
                      <td class="min_width"><input type="checkbox" class="hidden_option check_class"></td>
                      <td class="id_space"><div class="large_name">ACCOUNTING</div></td>
                      <td class="name"> 10</td>
                      <td>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, </td>
                      <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="deactive_icon" onclick="myFunction_decative()"></div>
                        </div></td>
                      <td class="min_width"><div class="group_action">
                          <div class="del_edt_de2 onclick_5"></div>
                          <div class="del_edt_edit"></div>
                        </div></td>
                    </tr>
                    <tr class="background_change">
                      <td class="min_width"><input type="checkbox" class="hidden_option check_class"></td>
                      <td class="id_space"><div class="large_name">MARKETING</div></td>
                      <td class="name">8 </td>
                      <td>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, </td>
                      <td class="active_deactive_space"><div class="active_and_deactive">
                          <div class="deactive_icon" onclick="myFunction_decative()"></div>
                        </div></td>
                      <td class="min_width"><div class="group_action">
                          <div class="del_edt_de2 onclick_5"></div>
                          <div class="del_edt_edit"></div>
                        </div></td>
                    </tr>
                  </table>
                </div>
              </div>
              <!-----------------/// User List Stared Here -----------> 
              
              <!------------/// User Profile Started Here ------------>
              <div class="user_profile_content">
                <div class="add_user_from user_profile_page">
                  <div class="user_img"> <img src="images/blank_images.jpg" />
                    <div class="change_user">Change photo</div>
                  </div>
                  <div class="right_info">
                    <div class="user_icon">
                      <div class="del_edt_del new_edit"></div>
                      <div class="delete_user_1"><img src="images/delete.png" /></div>
                    </div>
                    <!------------/// Name Row First ------>
                    <div class="info_row" style="margin-top: -26px;">
                      <div class="spacific_space"> Name </div>
                      <div class="info"> Hariom Srivastava</div>
                    </div>
                    <!--------------/// Name Row End -------------> 
                    <!------------/// Name Row First ------>
                    <div class="info_row">
                      <div class="spacific_space">E-mail </div>
                      <div class="info"> hariom@silvereye.co</div>
                    </div>
                    <!--------------/// Name Row End ------------->
                    <div class="claer"></div>
                    <div class="midlle_heading">Login Details</div>
                    <!-------------/// ROW STARTED HERE -------------->
                    <div class="info_row for_width">
                      <div class="spacific_space">User Login Id </div>
                      <div class="info"> hariom@silvereye.co</div>
                    </div>
                    <!-------------/// ROW END HERE --------------> 
                    <!-------------/// ROW STARTED HERE -------------->
                    <div class="info_row for_width">
                      <div class="spacific_space">Password </div>
                      <div class="info"> hariom7417hfh</div>
                    </div>
                    <!-----------------/// ROW END HERE ---------->
                    <div class="claer"></div>
                    <!-------------/// ROW END HERE --------------> 
                    <!--<div class="midlle_heading">Personal Information</div>--> 
                    <!-------------/// ROW STARTED HERE --------------> 
                    <!--<div class="info_row for_width">
                                                         <div class="spacific_space">Name </div>
                                                         <div class="info"> Hariom Srivastava</div>
                                                     </div>--> 
                    <!-----------------/// ROW END HERE ----------> 
                    <!-------------/// ROW STARTED HERE --------------> 
                    <!-- <div class="info_row for_width">
                                                         <div class="spacific_space">Designation </div>
                                                         <div class="info"> Web Designer</div>
                                                     </div>--> 
                    <!-----------------/// ROW END HERE ----------> 
                    <!-------------/// ROW STARTED HERE --------------> 
                    <!-- <div class="info_row for_width">
                                                         <div class="spacific_space">Email </div>
                                                         <div class="info"> hari@silvereye.co</div>
                                                     </div>--> 
                    <!-----------------/// ROW END HERE ----------> 
                    <!-------------/// ROW STARTED HERE -------------->
                    <div class="info_row for_width">
                      <div class="spacific_space">Gender </div>
                      <div class="info">Male</div>
                    </div>
                    <!-----------------/// ROW END HERE ----------> 
                  </div>
                  <div class="claer"></div>
                </div>
                
                <!-----------------/// add user from end ------------->
                <div class="bottom_add_user"></div>
              </div>
              <!--------------/// USer Profile End  Here ----------->
              
              <div class="claer"></div>
              
              <!------------/// EDITE PROFILE PAGE  Started Here ------------>
              
              <div class="new_edit_pages"> 
                <!-------------------/// ADD USER from  ----------->
                <div class="add_user_from">
                  <div class="delete_new_user"> <img src="images/delete.png" /> </div>
                  <div class="claer"></div>
                  <form class="add_user_1">
                    <input type="text" placeholder="Hariom" class="new_user_icon new_user_right" />
                    <input type="text" placeholder="Srivastava" class="new_user_icon" />
                    <div class="claer"></div>
                    <input type="text" placeholder="hari@silvereye.co" class="full_width_new_user email_user_icon" />
                    <div class="claer"></div>
                    <input type="text" placeholder="*************" class="full_width_new_user pass_user_icon" />
                    <div class="claer"></div>
                    <input type="text" placeholder="*************" class="full_width_new_user pass_user_icon" />
                    <div class="claer"></div>
                    <div class="datebirth">Birthday</div>
                    <select class="date">
                      <option>01</option>
                      <option>01</option>
                      <option>02</option>
                    </select>
                    <select class="date">
                      <option>02</option>
                      <option>01</option>
                      <option>02</option>
                    </select>
                    <select class="date" >
                      <option>1991</option>
                      <option>1</option>
                      <option>2</option>
                    </select>
                    <div class="claer"></div>
                    <div class="datebirth">Gender</div>
                    <div class="check_box_1">
                      <div class="example">
                        <input type="radio" name="ex1" id="ex1_a" checked="checked">
                        <label for="ex1_a">Male</label>
                        <input type="radio" name="ex1" id="ex1_b">
                        <label for="ex1_b" class="float">Female</label>
                      </div>
                    </div>
                    <div class="claer"></div>
                    <div class="cancel_buttom delete_new_user">Cancel</div>
                    <div class="add_user_buttom">Update</div>
                  </form>
                </div>
                <div class="bottom_add_user"></div>
              </div>
              
              <!--------------///  EDITE PROFILE PAGE  End  Here -----------> 
              
              <!------------------//// DELETE USER INFO PAGES HERE ------------->
              <div class="delete_user_info"> </div>
              <!-----------------/// DELETE USER INFO END HERE -----------------> 
              
              <!--------------/// Logerd User Tab COntent end ----------> 
              
            </div>
            <!-- .tab_container --> 
            
          </div>
          <!-- #tab4 --> 
          
        </div>
        <!-- .tab_container --> 
        
      </div>
    </div>
    <div class="claer"></div>
  </div>
  <!-----------------/// Testing Content End Here ------------------> 
  <!---------------//// ADD GROUP USER POP UP ----------->
  <div id="contactdiv">
    <form class="form" action="#" id="contact">
      <h3>Add New Group</h3>
      <p>Group Name: <span>*</span></p>
      <input type="text" id="name" placeholder="Name"/>
      <textarea placeholder="Description"></textarea>
       <div class="claer"></div>
      <input type="button" id="send" value="Add"/>
      <input type="button" id="cancel" value="Cancel"/>

      <br/>
    </form>
  </div>
  <!-----------------/// ADD GROUP POP UP  END HERE ----------> 
  <!---------------//// ADD GROUP USER POP UP ----------->
  <div id="contactdiv_3">
    <form class="form" action="#" id="contact">
      <h3>REMOVE GROUP</h3>
      <p>Select Group: <span>*</span></p>
      <select>
        <option>SELECT THE GROUP</option>
        <option>MANAGEMENT GROUP</option>
        <option>DEVELOPER GROUP</option>
        <option>DESIGNER GROUP</option>
      </select>
      <div class="claer"></div>
      <input type="button" id="send" value="Delete"/>
      <input type="button" id="cancel" value="Cancel"/>
      <br/>
    </form>
  </div>
  <!-----------------/// ADD GROUP POP UP  END HERE ----------> 
  
  <!---------------//// ADD GROUP USER POP UP ----------->
  <div id="contactdiv_4">
    <form class="form" action="#" id="contact">
      <h3>Add New Document</h3>
      <input type="file" name="pic" >
      <div class="claer"></div>
      <input type="button" id="send" value="Close"/>
      <input type="button" id="cancel" value="Upload"/>
      <br/>
    </form>
  </div>
  <!-----------------/// ADD GROUP POP UP  END HERE ----------> 
  <!---------------//// ADD GROUP USER POP UP ----------->
  <div id="contactdiv_5">
    <form class="form" action="#" id="contact">
      <h3>EDIT GROUP</h3>
      <p>Group Name: <span>*</span></p>
      <br/>
      <input type="text" id="name" placeholder="Information Technology "/>
      <p>Description: <span>*</span></p>
      <br/>
      <textarea placeholder="">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC,</textarea>
      <div class="claer"></div>
      <input type="button" id="send" value="Update"/>
      <input type="button" id="cancel" value="Cancel"/>
      <br/>
    </form>
  </div>
  <!-----------------/// ADD GROUP POP UP  END HERE ----------> 
  
    <!---------------//// ADD GROUP USER POP UP ----------->
  <div id="contactdiv_66">
    <form class="form" action="#" id="contact">
      <h3>EDIT GROUP</h3>
      <p>Group Name: <span>*</span></p>
      <br/>
      <input type="text" id="name" placeholder="Information Technology "/>
      <br/>
      <br/>
      <p>Description: <span>*</span></p>
      <br/>
      <textarea placeholder="">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC,</textarea>
      <br/>
      <br/>
      <input type="button" id="send" value="Update"/>
      <input type="button" id="cancel" value="Cancel"/>
      <br/>
    </form>
  </div>
  <!-----------------/// ADD GROUP POP UP  END HERE ----------> 
  
  <!-----------------/// TESTING FOOTER STARTED HERE ------------> 
</div>
<!-----------------------------/// MAIN DIV END HERE ---------------->
<div id="foot"> 
  
  <!-------------------/// Footer Started Here ----------------------->
  <div class="footer">
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
<!--------------/// HIdden Option Here ---------->
<script type='text/javascript'>
window.onload=function(){
	/*
document.getElementsByClassName('hidden_option').onchange = function() {
    document.getElementById('powermail_fieldwrap_331').style.display = this.checked ? 'block' : 'none';
};*/

$('#checkboxTop').change(function () {
	if($('#checkboxTop').is(':checked'))
	{
		$('.check_class').each(function() {
			this.checked = true;
		});
	}
});

$('.check_class').each(function() {
	this.onchange = checkBoxClicked;
});
function checkBoxClicked(){
	
	$('.check_class').each(function(){
		if(this.checked)
		{
			$('#powermail_fieldwrap_331').show();
			return false;
		}
		$('#powermail_fieldwrap_331').hide();
		
	});
}

} 
</script>
<!--------------------//// Hindeen Option End ----------->
<!---------------/// TESTING FOOTER END HERE ----------------->
</body>
</html>