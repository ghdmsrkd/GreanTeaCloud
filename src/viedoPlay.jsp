<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>  
</head>
<body>
<%
	//String fileName = request.getParameter("fileName");
	//String curentDir = (String)session.getAttribute("__curentDir");
	//String src = 
	String src = "/var/lib/tomcat9/webapps/ROOT/testcam/root_admin/admin_2019/admin_12/admin_15h_25m_25s.mp4";
%>
	<div class="row d-flex justify-content-center">
		<div class="col-md-6">
			<p class="h5 mb-4">.hoverable</p>
			<video oncontextmenu="return false;" id="myVideo" width="640"
				controls autoplay>
				<source src="<%= src %>" type="video/mp4">
			</video>
			
			<!-- C:Users\ghdms\OneDrive\¹ÙÅÁ È­¸é\testcam\root_admin\admin_2019\admin_12\admin_15h_25m_25s.mp4 
			file:///c:/WINDOWS/clock.avi
			-->
		</div>
	</div>
</body>
</html>