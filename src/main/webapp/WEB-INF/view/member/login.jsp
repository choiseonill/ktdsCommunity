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

<script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"
	type="text/javascript"></script>
<script type="text/javascript">
	$().ready(function() {

		$("#joinBtn").click(function() {
			location.href = "<c:url value="/join"/>"
		});
		
		$("#loginBtn").click(function() {

			$("#loginForm").attr({
				"action" : "<c:url value="/login"/>",
				"method" : "post"
			}).submit();
		});
	});
</script>
<title>로그인 Page</title>
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
					<form:form modelAttribute="loginForm">
					<h3 style="text-align: center;">로그인 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디"
							name="userId" maxlength="20" />
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="userPassword" maxlength="20" />
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-primary form-control"
							id="loginBtn"value="로그인" />
					</div>
					<input type="button" class="btn btn-primary form-control"
						id="joinBtn" value="회원가입" />
				</form:form>
			</div>
		</div>
	</div>
	<script src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>
</body>
</html>