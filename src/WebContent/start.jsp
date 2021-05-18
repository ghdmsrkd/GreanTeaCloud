<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<a href="partys.jsp">디렉토리 들어가기</a>
<% 
	//session.setAttribute("__rootDir", "C:\\Users\\ghdms\\eclipse-workspace");
	//session.setAttribute("__curentDir", "C:\\Users\\ghdms\\eclipse-workspace");
	
	
	session.setAttribute("__rootDir", "C:\\Users\\ghdms\\OneDrive\\바탕 화면");
	session.setAttribute("__curentDir", "C:\\Users\\ghdms\\OneDrive\\바탕 화면");
%>>
</body>
</html>