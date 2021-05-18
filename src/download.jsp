<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	// check.jsp로 부터 넘어온 값(fileName의 값)을 구함
	String fileName = request.getParameter("fileName");

	// 다운로드 할 파일의 경로를 구하고 File 객체 생성
	//ServletContext context = getServletContext();
	String downloadPath = (String)session.getAttribute("__curentDir");
	//out.println(downloadPath);
	String filePath = downloadPath + "/" + fileName;
	//out.println(filePath);
	File file = new File(filePath);
	System.out.println(filePath);

	// MIMETYPE 설정
	String mimeType = getServletContext().getMimeType(filePath);
	if (mimeType == null)
		mimeType = "APPLICATION/OCTET-STREAM";
	response.setContentType("APPLICATION/OCTET-STREAM");

	// 다운로드 설정 및 한글 파일명 깨지는 것 방지
	String encoding = new String(fileName.getBytes("utf-8"), "ISO-8859-1");
	response.setHeader("Content-Disposition", "attachment; filename= " + encoding);

	// 요청 파일을 읽어서 클라이언트에 전송
	FileInputStream in = new FileInputStream(file);
	ServletOutputStream outStream = response.getOutputStream();

	byte b[] = new byte[4096];
	int data = 0;
	while ((data = in.read(b, 0, b.length)) != -1) {
		outStream.write(b, 0, data);
	}

	outStream.flush();
	outStream.close();
	in.close();
%>