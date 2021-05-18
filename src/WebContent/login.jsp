<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<head>
<meta charset="EUC-KR">
<title>혼밥 친구</title>

<link href="css/login.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">

</head>
<%  // 인증된 세션이 없는경우, 해당페이지를 볼 수 없게 함.
    if (session.getAttribute("signedUser") != null) {
        response.sendRedirect("welcome.jsp");
    }
%>

<body>

	<div class="container" id="login_form">
		<h2 id="login_h2" align="center">로그인하기</h2>
		<form action="loginCheck.jsp" method="post">
			<h5>아이디</h5>
			<input name="_id" type="text" id="inputEmail" class="form-control"
				placeholder="Student number" required autofocus>

			<h5>비밀번호</h5>
			<label for="inputPassword" class="sr-only">Password</label> <input
				name="_pw" type="password" id="inputPassword" class="form-control"
				placeholder="Password" required>

			<div class="checkbox">
				<label> <input type="checkbox" value="remember-me">
					Remember me
				</label>
			</div>
			</br>
			<button id="login_btn" class="btn btn-lg btn-info btn-block" type="submit">Signin</button>
		</form>
		<div class="container" id="login-links">
			<h5>혼밥러들의 친구가 되어주세요!</h5>
			<a href="join.jsp">친구하기</a></br>
			<h5>친구님의 정보를 잊으셨군요!</h5>
			<a href="">아이디</a> <a href="">비밀번호 </a>
		</div>
	</div>
	<!-- /container -->

</body>

</html>
