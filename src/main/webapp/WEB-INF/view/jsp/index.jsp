<%@page import="edms.wsdl.Folder"%>
<%@page import="java.util.List"%>
<jsp:include page="header.jsp" />




<%
	HttpSession hs = request.getSession(false);
	if (hs.getAttribute("currentFolder") == null) {
		hs.setAttribute("currentFolder", "/");
		hs.setAttribute("currentDoc", "/");
	}
	List<Folder> folderList = (List<Folder>) request.getAttribute("folderList");
%>
<!---// RIGHT --->
<div class="right">
	<!--------/// MID CONTENT STARTED HERE ---------->
	<div id="head">
		<!----------------/// Header End Here ---------->
		<!------------// Testing CONTENT STARTED HERE ------------------>
		<div id="content">
			<div id="fileSystem">
			<jsp:include page="fileSystem.jsp" />
			</div>
			<!-----------------/// Testing Content End Here ------------------>
			<!-------/// ALL POP UP STATED HERE ------>
			<!---// RIGHT END here ---->
			<div class="clear"></div>
		</div>
	</div>
</div>

</div>

</body>
</html>