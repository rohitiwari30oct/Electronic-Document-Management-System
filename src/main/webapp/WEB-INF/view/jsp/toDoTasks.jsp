<%@page import="edms.wsdl.GetFetchGroupTaskResponse"%>
<%@page import="edms.wsdl.GetFetchUserTaskResponse"%>
<%@page import="edms.wsdl.Task"%>
<%@page import="edms.webservice.client.WorkflowClient"%>
<%@page import="edms.service.DemoUserService"%>
<%@page import="edms.service.DemoUser2ServiceImpl"%>
<%@page import="edms.service.DemoUserServiceImpl"%>
<%@page import="java.util.List"%>
<%@page import="edms.service.DemoUser1ServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery-1.7.2.min.js" type="application/javascript"></script>
<script src="js/left_event.js" type="application/javascript"></script>
<script src="js/jquery_popup.js"></script>
<script type="text/javascript">
	/* <![CDATA[ */
	$(document).ready(function() {
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
<script>
	$(document).ready(function() {

		$(".tab_content:first-child").show();
		$(".first_tab").addClass('default_open');
		$(".tab_content").hide();

		$("ul.tabs li").click(function() {
			$("ul.tabs li").removeClass("active");
			$(this).addClass("active");
			$(".tab_content").hide();
			var activeTab = $(this).attr("rel");
			$("#" + activeTab).fadeIn();
			$(".first_tab").removeClass('default_open');
		});
	});
</script>
<style>
.default_open {
	display: block !important;
}
</style>
<link rel="stylesheet" href="css/jquery_popup.css" />


<script type="text/javascript">
	function getClaimTaskForm(taskId) {
		var userid = document.getElementById("employeeId").value;
		jQuery.post("toDoTasks_claimTask", {
			tid : taskId,
			uid : userid,
		}, function(data) {
			$("#activitiForms").html(data);
		});
	}
</script>
<script type="text/javascript">
	function getCommonWorkflowForm(taskId) {
		jQuery.get("toDoTasks_getCommonWorkflowForm", {
			tid : taskId,
		}, function(data) {
			//alert(data);
			$("#activitiForms").html(data);
		});
	}
</script>
</head>
<body>
	<%
		DemoUserService demoUser = (DemoUserService) request
				.getAttribute("demoUserService");
		WorkflowClient workflow = (WorkflowClient) request
				.getAttribute("workflow");
		GetFetchUserTaskResponse respUserTask = workflow
				.getFetchUserTaskRequest(demoUser.getEmpid());
		List<Task> userTasks = respUserTask.getUserTaskListReturn()
				.getUserTaskList();
		GetFetchGroupTaskResponse respGroupTask = workflow
				.getFetchGroupTaskRequest(demoUser.getDeptid());
		List<Task> groupTasks = respGroupTask.getGroupTaskListReturn()
				.getGroupTaskList();
	%>
	<input type="hidden" value="<%=demoUser.getEmpid()%>" id="employeeId">
	<div class="right other_pages">
		<!-------------/// TRASH PAGES STARED HERE --------->

		<!--------/// TRASH MENU STARTED HERE --------->
		<div class="trash_menu">
			<h1>To Do Tasks</h1>
		</div>
		<!--------------/// TRASH MENU END HERE ------------>
		<div class="trash_sroll_content">
			<!--------/// TODO TASK CONTENT STARED HERE ------------->
			<div class="trash_content">
				<div class="todo_content">
					<!---------/// TAB MENU STERED HERE --------->
					<ul class="tabs todo_chat">
						<li class="active" rel="tab41">My Available Tasks</li>
						<li rel="tab32">Available Group Tasks</li>
					</ul>
					<!------------/// TAB MENU END HERE ---------->
					<div class="clear"></div>
					<!-----------/// TAB CONTENT STRED HERE ------->
					<div class="tab_container tab_contain_todo">

						<div id="tab41" class="tab_content first_tab">
							<table>
								<tr class="heading">
									<td>Task Name</td>
									<td>Workflow ID</td>
									<td>Task ID</td>
									<td>Description</td>
									<td>Task Action</td>
								</tr>
								<%
									if (userTasks.isEmpty()) {
								%>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<%
									} else {
										for (Task ut : userTasks) {
								%>
								<tr>
									<td><%=ut.getName()%></td>
									<td><%=ut.getProcessInstanceId()%></td>
									<td><%=ut.getId()%></td>
									<td><%=ut.getDescription()%></td>
									<input type="hidden" value="<%=ut.getFormKey()%>"
										id="indFormKey<%=ut.getId()%>"
										name="indFormKey<%=ut.getId()%>">
									<td><a href="#"
										onclick="getCommonWorkflowForm('<%=ut.getId()%>')">Complete
											Task</a></td>
									<%
										}
										}
									%>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>


							</table>

						</div>
						<!-- #tab1 -->
						<div id="tab32" class="tab_content">
							<table>
								<tr class="heading">
									<td>Task Name</td>
									<td>Workflow ID</td>
									<td>Task ID</td>
									<td>Description</td>
									<td>Task Action</td>
								</tr>
								<%
									if (groupTasks.isEmpty()) {
								%>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<%
									} else {
										for (Task gt : groupTasks) {
								%>
								<tr>
									<td><%=gt.getName()%></td>
									<td><%=gt.getProcessInstanceId()%></td>
									<td><%=gt.getId()%></td>
									<td><%=gt.getDescription()%></td>
									<input type="hidden" value="<%=gt.getFormKey()%>"
										id="formKey<%=gt.getId()%>" name="formKey<%=gt.getId()%>">
									<td><a href="#"
										onclick="getClaimTaskForm('<%=gt.getId()%>')">Claim Task</a></td>
									<%
										}
										}
									%>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>


							</table>

						</div>
						<!-- #tab2 -->



					</div>
					<!-- .tab_container -->
					<!------------/// TAB CONTENT END HERE ----------->
				</div>

			</div>
			<!-----------/// TODO TASK CONTENT END HERE ------------->

		</div>

		<!-------------/// TRASH PAGES END HERE ------------>

	</div>















	<%-- <div class="right other_pages_user">

<input type="hidden" value="<%=demoUser.getEmpid()%>" id="employeeId">
Hii <%=demoUser.getEmpname() %> <br/>
<b>My Available Tasks:</b> <br>
<%if(userTasks.isEmpty()){ %>
No available Tasks!
<% } else {
	for(Task ut : userTasks) { %>		
<%=ut.getName() %><br>
Process ID: <%=ut.getProcessInstanceId() %> <br>
Task ID: <%=ut.getId() %> <br>
Description= <%=ut.getDescription() %><br>
<input type="hidden" value="<%=ut.getFormKey()%>" id="indFormKey<%=ut.getId() %>" name="indFormKey<%=ut.getId() %>">
<a href="#" onclick="getCommonWorkflowForm('<%=ut.getId()%>')">Complete Task</a>
<%} }	%> <br><br>
<b>Available Group Tasks:</b><br>
<% if(groupTasks.isEmpty()){ %>
No available Tasks!
<% } else {
	for(Task gt : groupTasks) {
		  %>		
<%=gt.getName() %><br>
Process ID: <%=gt.getProcessInstanceId() %> <br>
Task ID: <%=gt.getId() %> <br>
Description= <%=gt.getDescription() %><br>
<%System.out.println("after rendering form"); %>
<input type="hidden" value="<%=gt.getFormKey()%>" id="formKey<%=gt.getId() %>" name="formKey<%=gt.getId() %>">
<a href="#" onclick="getClaimTaskForm('<%=gt.getId()%>')">Claim Task</a>
<br><br>
<%} }	%>
<br><br><br>
</div> --%>
</body>
</html>