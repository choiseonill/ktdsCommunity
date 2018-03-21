<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="<c:url value="/bootstrap/css/bootstrap.css" />">
<link href="<c:url value="/bootstrap/css/bootstrap.min.css"/>"
	rel="stylesheet">

<!-- join css -->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/css/button.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/css/input.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/css/link.css"/>" />		

<script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"
	type="text/javascript"></script>

<script type="text/javascript">
	$().ready(function() {

		$("#userId").keyup(function() {

			var value = $(this).val();
			if (value != "") {
				$(this).removeClass("invalid");
				$(this).addClass("valid");
			} else {
				$(this).removeClass("valid");
				$(this).addClass("invalid");
			}
		});

		$("#nickname").keyup(function() {

			var value = $(this).val();
			if (value != "") {
				$(this).removeClass("invalid");
				$(this).addClass("valid");
			} else {
				$(this).removeClass("valid");
				$(this).addClass("invalid");
			}
		});

		$("#userPassword").keyup(function() {

			var value = $(this).val();
			if (value != "") {
				$(this).removeClass("invalid");
				$(this).addClass("valid");
			} else {
				$(this).removeClass("valid");
				$(this).addClass("invalid");
			}

			var password = $("#userPassword-confirm").val();

			if (value != password) {
				$(this).removeClass("valid");
				$(this).addClass("invalid");
				$("#userPassword-confirm").removeClass("valid");
				$("#userPassword-confirm").addClass("invalid");
			} else {
				$(this).removeClass("invalid");
				$(this).addClass("valid");
				$("#userPassword").removeClass("invalid");
				$("#userPassword").addClass("valid");
			}

		});

		$("#userPassword-confirm").keyup(function() {

			var value = $(this).val();
			var password = $("#userPassword").val();

			if (value != password) {
				$(this).removeClass("valid");
				$(this).addClass("invalid");
				$("#userPassword").removeClass("valid");
				$("#userPassword").addClass("invalid");
			} else {
				$(this).removeClass("invalid");
				$(this).addClass("valid");
				$("#userPassword").removeClass("invalid");
				$("#userPassword").addClass("valid");
			}
		});

		$("#joinBtn").click(function() {

			if ($("#userId").val() == "") {
				alert("이메일을 입력하세요!");
				$("#userId").focus();
				$("#userId").addClass("invalid");
				return false;
			}

			if ($("#nickname").val() == "") {
				alert("닉네임을 입력하세요!");
				$("#nickname").focus();
				$("#nickname").addClass("invalid");
				return false;
			}

			if ($("#userPassword").val() == "") {
				alert("비밀번호를 입력하세요!");
				$("#userPassword").focus();
				$("#userPassword").addClass("invalid");
				return false;
			}

			$("#joinForm").attr({
				"method" : "post",
				"action" : "<c:url value="/join"/>"
			}).submit();
		});
	});
</script>
<title>회원가입 Page</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">JSP 게시판</a>
		</div>
	</nav>
	<hr />
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form:form modelAttribute="joinForm">
					<h3 style="text-align: center;">회원가입 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디"
							name="userId" id="userId" maxlength="20" />
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="닉네임"
							name="nickname" id="nickname" maxlength="20" />
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="userPassword" id="userPassword" maxlength="20" />
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="userPassword-confirm" id="userPassword-confirm" maxlength="20" />
					</div>
					

					<div class="form-group">
						<input type="submit" class="btn btn-primary form-control" id="joinBtn"
							value="회원가입" />
					</div>
					<input type="button" class="btn btn-primary form-control"
						value="취소" />
				</form:form>
			</div>
		</div>
	</div>
	<script src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>
</body>
</html>