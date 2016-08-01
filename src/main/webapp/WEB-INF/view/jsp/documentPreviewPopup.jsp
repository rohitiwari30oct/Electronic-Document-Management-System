<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
ArrayList<String> imageList=(ArrayList<String>)request.getAttribute("previewImages");
if(imageList.size()==0){%>
<span style="display: block;
margin: 0 auto;
width: 157px;
position: relative;
top: 47%;" >No Preview Available!</span>
<%}
for(String str:imageList){
	%>
	<img alt="No Preview" src="<%=str %>" />
	<%
}
%>

<img alt="" src="">
</body>
</html>