<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="util.DeleteFolder" %>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	
	try {
		request.setCharacterEncoding("EUC-KR");
		String path =  URLDecoder.decode(request.getParameter("_radio"), "UTF-8"); ;
		DeleteFolder.deleteFolder(path);
		//out.println(path);
		response.sendRedirect("partys.jsp");
	}catch(Exception e) {
		e.printStackTrace();
		out.println(e);
	}%>
</body>
</html>