<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.File" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String userRoot = "root_"+ (String)request.getParameter("_id");
	String dirRoot = "/var/lib/tomcat9/webapps/ROOT/users_cloud";
	
	File mkdir = new File(dirRoot + "/" + userRoot);
	mkdir.mkdir();
	response.sendRedirect("login.jsp");
%>
</body>
</html>