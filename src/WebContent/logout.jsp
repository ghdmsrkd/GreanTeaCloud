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
    // 1: ������ ���� �����͸� ��� ����
    //session.invalidate();
	session.removeAttribute("signedUser");
    // 2: �α��� �������� �̵���Ŵ.
    response.encodeRedirectURL(request.getContextPath() + "/");
%>
</body>
</html>