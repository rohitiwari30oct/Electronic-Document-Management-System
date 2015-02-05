<%@page import="org.jivesoftware.smack.packet.RosterPacket"%>
<%@page import="org.jivesoftware.smack.XMPPException.XMPPErrorException"%>
<%@page
	import="org.jivesoftware.smack.SmackException.NotConnectedException"%>
<%@page
	import="org.jivesoftware.smack.SmackException.NoResponseException"%>
<%@page import="org.jivesoftware.smackx.pubsub.PresenceState"%>
<%@page
	import="org.jivesoftware.smackx.vcardtemp.provider.VCardProvider"%>
<%@page import="org.jivesoftware.smack.provider.ProviderManager"%>
<%@page import="org.jivesoftware.smackx.vcardtemp.packet.VCard"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.jivesoftware.smack.RosterListener"%>
<%@page import="org.jivesoftware.smack.Roster"%>
<%@page import="org.jivesoftware.smack.packet.Presence"%>
<%@page import="org.jivesoftware.smack.RosterEntry"%>
<%@page import="org.jivesoftware.smack.XMPPConnection"%>
<%@page import="org.jivesoftware.smack.tcp.XMPPTCPConnection"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 
Header linking css and js
 -->
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
<!-- 
header linking css and js end

 -->



<title>Insert title here</title>

<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/interface/ReverseClass.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>

<!--jQuery and jQuery UI with jQuery Chat-->
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>

</head>
<body >
	             
	
	
	
	<!------------/// LEFT PART BOTTOM BEGINS HERE ------->
                                 <div class="left_bottom_part">
                                      <!----------/// STATISTICS STRED HERE ---->
                                      <ul><li id='userDashboard' onclick="getPage(this.id)"> <div class="calender_user_1"></div><span> DASHBOARD</span></li>
                                         
                                          <li id='userStatistics' onclick="getPage(this.id)"> <div class="graph_user_1"></div><span>STATISTICS</span></li>
                                           <li onclick="getActivitiDiagramsPage()"> <div class="contact_user_1"></div><span>ACTIVITI</span></li>
                                          <li id='shared' onclick="getPage(this.id)"> <div class="create_view"></div><span>SHARED WITH ME</span></li>
                                          <li id='recently' onclick="getPage(this.id)"> <div class="recent_open"></div><span>RECENTLY MODIFIED</span></li>
                                          <li id='trash'onclick="getPage(this.id)"> <div class="my_doc"></div><span>RECYCLE</span></li>
                                      </ul>
                                      
                                 
                                 
                                 </div>
                                 <!--------/// LEFT BOTTOM PART END HERE --------->

</body>
</html>