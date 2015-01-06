<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Welcome To EDMS Solutions</title>
<script src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js" type="application/javascript" ></script>
<!--------------/// CHAT OPTION STARED HERE ------------->
<script src="<c:url value='/js/event.js' />" type="text/javascript" language="javascript" ></script>
<!----------------/// CHAT OPTIN END HERE ----------->
<!-----------------// FROM MAIN INDEX PAGES -------------->
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<script src="<c:url value='/js/left_event.js' />" type="application/javascript"></script>
<link rel="stylesheet" href="<c:url value='/css/jquery_popup.css' />" />
<script src="<c:url value='/js/jquery_popup.js' />"></script>
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
<script type="text/javascript" src="js/jquery.js"></script>
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
<!---------------------/// RIGHT CLICK MENU ONLY -------------->
<script type="text/javascript" src="js/milonic_src.js"></script>
<script type="text/javascript" src="js/mmenudom.js"></script>
<script type="text/javascript" src="js/menu_data.js"></script>
<script type="text/javascript" src="js/contextmenu.js"></script>
<!---------------------/// RIGHT CLICK MENU ONLY --------------->
<!-----------------// FROM MAIN INDEX PAGES END HERE ------>

</head>
<body>
<div class="header_main bottom_space_22"> 
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
            <li class="add_folder "> <a href="#" title="Create">
              <div class="create"></div>
              CREATE</a> </li>
            <li class="folder_icon_1"> <a href="#" title="Upload">
              <div class="upload"></div>
              UPLOAD</a> </li>
            <li > <a href="#" title="Create">
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
            <li class="delete_folder"> <a href="#" title="Delete">
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
    <!-------------/// HEADER MENU SECTON END HERE -----------------> 
  </div>
  <div class="claer"></div>
</div>
<!-----------/// Header Stared Here ------------>