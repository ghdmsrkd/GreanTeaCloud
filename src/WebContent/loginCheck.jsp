<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%  // 인증된 세션이 없는경우, 해당페이지를 볼 수 없게 함.
    if (session == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");  //Set encoding
    // 1: form 으로부터 전달된 데이터를 변수에 저장.
    String id = request.getParameter("_id");
    String pw = request.getParameter("_pw");
    // 2: 사용자 인증
    
    try{
        Class.forName("org.mariadb.jdbc.Driver");
        String url = "jdbc:mariadb://www.pkcs16.com/greenteacloud";
        Connection con = DriverManager.getConnection(url,"root","admin");

        String query = "select * from member where mid = ?";
        //select * from member where mid = ?; 쿼리문
        PreparedStatement pstmt = con.prepareStatement(query);
        
        pstmt.setString(1, id);
        ResultSet rs = pstmt.executeQuery();
        String password;
        // rs.next();

	if(rs.next()) {
		password = rs.getString("mpw");

        	rs.close();
        	pstmt.close();
       		con.close();

		if(password.equals(pw)) {
       			out.println("<script>");
        		out.println("alert('로그인 완료')");
                	session.setAttribute("signedUser", id);
                	
                	String userRoot = "root_"+ id;
                	String dirRoot = "C:\\Users\\ghdms\\OneDrive\\바탕 화면\\testDIr";
                	session.setAttribute("__rootDir", dirRoot + "\\" + userRoot);
                	session.setAttribute("__curentDir", dirRoot + "\\" + userRoot);
                        
        		out.println("location.href='partys.jsp'");
        		out.println("</script>");
    		} else {
        		out.println("<script>");
        		out.println("alert('비밀번호가 다릅니다!')");
        		out.println("location.href='login.jsp'");
        		out.println("</script>");
    		}
	}
        else {
		out.println("<script>");
        	out.println("alert('해당 계정은 없는 계정입니다!')");
        	out.println("location.href='login.jsp'");
        	out.println("</script>");
	}	
    }
    catch(Exception e){
        out.println(e);
    }
%>
</body>
</html>


