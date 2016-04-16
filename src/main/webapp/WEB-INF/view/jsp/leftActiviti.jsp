<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
function getTasksPage(){
	jQuery.get("leftActiviti_toDoTasks", function( data ) {
		//alert(data);
		 $( "#activitiForms" ).html( data );
		});
}
</script>
<script type="text/javascript">
function getWorkflowsPage(){
	jQuery.get("header_activitydiagrams", function( data ) {
		 $( "#activitiForms" ).html( data );
		});
}
</script>
<script type="text/javascript">
function getHistoryPage(){
	jQuery.get("activity_history", function( data ) {
		 $( "#activitiForms" ).html( data );
		});
}
</script>
</head>
<body>
 <!---------/// LEFT PART TOP STARTED HERE ---------->
                                            <div class="left_sub_menu">
                                               <ul>
                                                        <li class="file_system tab_header" onClick="tab_left()"> <a href="javascript:void(0);" >ACTIVITY</a>
                                                        </li>
                                                        <div class="content_left content_left_block">
                                                                <ul>
                                                                          <li>
                                                                            <div class="folder"></div>
                                                                            <span onclick="getWorkflowsPage()">Workflows</span>
                                                                          </li>
                                                                          <li>
                                                                            <div class="folder"></div>
                                                                            <span onclick="getTasksPage()">To Do</span>
                                                                          </li>
                                                                          <li>
                                                                            <div class="folder"></div>
                                                                            <span onclick="getHistoryPage()">History</span>
                                                                          </li>
                                                                </ul>
                                                        </div>
                                                        <div class="content_left"> </div>
                                             </ul>
                                  </div>
                                      
                                 <!------------/// LEFT PART TOP END HERE ------------>     













   <!-- <ul>
      <li>
         <a href="javascript:void(0);" title="Tasks" onclick="getTasksPage()" >To Do Tasks</a> 
      
         <a href="javascript:void(0);" title="Workflows" onclick="getWorkflowsPage()">Workflows</a>
      
         <a href="javascript:void(0);" title="Task History" onclick="getHistoryPage()">Task History</a> 
      </li>
   </ul> -->
</body>
</html>