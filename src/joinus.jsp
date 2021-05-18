
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");  //Set encoding
    String id = request.getParameter("_id");
    String pwd = request.getParameter("_pwd");
    String name = request.getParameter("_name");
    String email = request.getParameter("_email");

    //POST로 Input.html로부터 입력받은 내용을 변수화

    try{
        Class.forName("org.mariadb.jdbc.Driver");
        String url = "jdbc:mariadb://www.pkcs16.com/greenteacloud";
        Connection con = DriverManager.getConnection(url,"root","admin");
        Statement stat = con.createStatement();
        
        String query = "INSERT INTO member(mname, mid, mpw, mmail)  VALUES('"+name+"','"+id+"','"+pwd+"','"+email+"')";

        //INSERT into member(id,name,pwd,email) VALUES ('id','name','pwd') 쿼리문
        stat.executeUpdate(query);
        stat.close();
        con.close();
        response.sendRedirect("mkroot.jsp?_id="+id); 
    }
        catch(Exception e){
        out.println(e);
    }


%>
</body>
</html>