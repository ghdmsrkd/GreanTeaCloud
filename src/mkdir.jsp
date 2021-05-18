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
	request.setCharacterEncoding("UTF-8");
	String mkdir = session.getAttribute("__curentDir") + "/" + (String)request.getParameter("_dir");
	//String dirRoot = "C:\\Users\\ghdms\\OneDrive\\바탕 화면\\testDIr";
	
	File dir = new File(mkdir);
	dir.mkdir();
	response.sendRedirect("partys.jsp");
%>
</body>
</html>