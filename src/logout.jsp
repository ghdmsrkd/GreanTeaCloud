<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
    // 1: 기존의 세션 데이터를 모두 삭제
    session.invalidate();
	//session.removeAttribute("signedUser");
    // 2: 로그인 페이지로 이동시킴.
    response.encodeRedirectURL(request.getContextPath() + "/");
    response.sendRedirect("login.jsp");
%>
</body>
</html>