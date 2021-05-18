<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    Connection con = null; // 데이터 베이스와 연결을 위한 객체
    Statement stat = null; // SQL 문을 데이터베이스에 보내기위한 객체
    ResultSet rs = null; // SQL 질의에 의해 생성된 테이블을 저장하는 객체

    String sendid = request.getParameter("sendid");

    try{
        Class.forName("org.mariadb.jdbc.Driver");
        String url = "jdbc:mariadb://www.pkcs16.com/greenteacloud";
        con = DriverManager.getConnection(url,"root","admin");
        stat = con.createStatement();
        int count = 0;

        String query = "SELECT mid FROM member";
        //SELECT 쿼리문
    
        rs = stat.executeQuery(query);
    
        while (rs.next()) {
            String id = rs.getString("mid");

            if(id.equals(sendid) && sendid.equals(id)) {
                count = 1;
            }
        }
        if(count == 1) {
                out.println("<h1>이미 생성된 ID입니다.</h1>");
            }
        else {
            out.println("<h1>입력하신 " + sendid + "는 사용할 수 있는 ID입니다.</h1>");
            out.println("<SCRIPT LANGUAGE='JavaScript'>");
            out.println("opener.document.userInfo.idDuplication.value = \"idCheck\";");
            out.print("</SCRIPT>");
        }
        stat.close();
        con.close();
    }
    catch(Exception e){
        out.println(e);
        out.println("오류");
    }
%> 