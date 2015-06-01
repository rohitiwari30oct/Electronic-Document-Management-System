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
	<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>



</head>
<body >
	             <%
	            // HttpSession hs=request.getSession(false);
	            // String userid="";
	             //if(hs!=null){
	            	String userid=(String)request.getAttribute("userid");
	             //}
	             %>
	
	
	
	<!------------/// LEFT PART BOTTOM BEGINS HERE ------->
                                 <div class="left_bottom_part">
                                      <!----------/// STATISTICS STRED HERE ---->
                                      <ul><li id='dashboard' onclick="getPage(this.id)"> <div class="calender_user_1"></div><span> DASHBOARD</span></li>
                                         
                                          <li id='userStatistics' onclick="getPage(this.id)"> <div class="graph_user_1"></div><span>STATISTICS</span></li>
                                           <li onclick="getActivitiDiagramsPage()"> <div class="contact_user_1"></div><span>ACTIVITI</span></li>
                                          <li id='<%="/"+userid %>' onclick="getSharedFileSystem(this.id)"> <div class="create_view"></div><span>SHARED WITH ME</span></li>
                                          <li id='recently' onclick="getPage(this.id)"> <div class="recent_open"></div><span>RECENTLY MODIFIED</span></li>
                                          <li id='trash'onclick="getPage(this.id)"> <div class="my_doc"></div><span>RECYCLE BIN</span></li>
                                      </ul>
                                      
                                 
                                 
                                 </div>
                                 <!--------/// LEFT BOTTOM PART END HERE --------->
<script type="text/javascript">
function getIndex(){
	location.href="welcome";
}
</script>
</body>
</html>