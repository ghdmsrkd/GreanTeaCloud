<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>혼밥친구</title>
<meta charset="utf-8">
<link href="css/join.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">

<script type="text/javascript">
	// 회원가입 화면의 입력값들을 검사한다.
	function checkValue() {
		var form = document.userInfo;

		if (form.idDuplication.value != "idCheck") {
			alert("아이디 중복체크를 해주세요.");
			return false;
		}

		// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
		if (form._pwd.value != form._pwdcheck.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
	}

	// 취소 버튼 클릭시 첫화면으로 이동
	function goFirstForm() {
		location.href = "login.jsp";
	}

	// 아이디 중복체크 화면open
	function openIdChk() {
		if (document.userInfo._id.value == "") {
			alert("ID를 입력하세요");
			return;
		}

		url = "idCheckFrom.jsp?sendid=" + document.userInfo._id.value;
		window
				.open(
						url,
						"confirm",
						"toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=300, height=200");
	}

	// 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
	// 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
	// 다시 중복체크를 하도록 한다.
	function inputIdChk() {
		document.userInfo.idDuplication.value = "idUncheck";
	}
</script>
</head>
<body>
	<div class="container" id="join_form">
		<h2 id="join_h2" align="center">가입하기</h2>
		
		<form action="joinus.jsp" method="post" name="userInfo"
			onsubmit="return checkValue()">
			
			<h5>*아이디</h5>
			<input class="form-control" type="text" name="_id" maxlength="20"onkeydown="inputIdChk()" placeholder="*아이디" autofocus"> 
			
			<input type="button" class="btn btn-secondary" value="중복확인" id="join_checkbtn" onclick="openIdChk(this.form)">
			
			<input type="hidden" name="idDuplication" value="idUncheck"><br>
			
			<h5>*암호<h5>
			<input class="form-control" type="password" name="_pwd" maxlength="20"><br>
			
			<h5>암호 재입력</h5> 
			<input class="form-control" type="password" name="_pwdcheck" maxlength="20"><br>
			
			<h5>*이름</h5>
			<input class="form-control" type="text" name="_name" maxlength="20"><br>
			
			<h5>*이메일</h5>
			<input class="form-control" type="email" name="_email" maxlength="30">
			
			<br>
			<input type="submit" value="가입하기" id="login_btn" class="btn btn-lg btn-info btn-block">
			<input type="reset" value="초기화" id="login_btn" class="btn btn-lg btn-info btn-block">
			<input type="button" value="취소" id="login_btn" class="btn btn-lg btn-info btn-block" onclick="goFirstForm()">
		</form>
	</div>
		
</body>
</html>