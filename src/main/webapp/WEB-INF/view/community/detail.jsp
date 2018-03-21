<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/css/footer.css"/>" />
<script type="text/javascript">
	$().ready(function() {

						$("#listbutton").click(function() {
							location.href = "<c:url value="/list"/>"
						});

							
						$('#deletebutton').click(function() { 
							var result = confirm('삭제하시겠습니까?'); 
							if(result) { //yes 
								location.href = "<c:url value="/remove/${communitydetail.titleNo}"/>"
							}
						});

						
						$("#writebutton").click(function() {
							location.href = "<c:url value="/write"/>"
						});
						
						$("#likebutton").click(function() {
							location.href = "<c:url value="/likeCount/${communitydetail.titleNo}"/>"
						});
						$("#modifybutton").click(function() {
							location.href = "<c:url value="/modify/${communitydetail.titleNo}"/>"
						});
						
						
					});
	


		
</script>
<title>게시판 본문 Page</title>
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
		<hr />
		<div class="row">
			<div class="col-md-10">
				<table class="table table-condensed">
					<thead>
						<tr align="center">
							<th width="10%">제목</th>
							<th width="60%">${communitydetail.title}</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>작성일</td>
							<td>${communitydetail.writeDate} <span style='float: right'>좋아요
									: ${communitydetail.likeCount}</span></td>
						</tr>
						<tr>
							<td>글쓴이</td>
							<td>${communitydetail.nikeName} <span style='float: right'>조회
									: ${communitydetail.viewCount}</span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<p>${communitydetail.body}</p>

							</td>
						</tr>
					</tbody>
				</table>
				<table id="commentTable" class="table table-condensed"></table>
				<table class="table table-condensed">
					<tr>
						<td><span class="form-inline" role="form">
								<p>
								<div class="form-group">
									<input type="text" id="commentParentName"
										name="commentParentName" class="form-control col-lg-2"
										data-rule-required="true" placeholder="이름" maxlength="10">
								</div>
								<div class="form-group">
									<input type="password" id="commentParentPassword"
										name="commentParentPassword" class="form-control col-lg-2"
										data-rule-required="true" placeholder="패스워드" maxlength="10">
								</div>
								<div class="form-group">
									<button type="button" id="commentParentSubmit"
										name="commentParentSubmit" class="btn btn-default">확인</button>
								</div>
								</p> <textarea id="commentParentText" class="form-control col-lg-12"
									style="width: 100%" rows="4"></textarea>
						</span></td>
					</tr>
				</table>
				<table class="table table-condensed">
					<thead>
						<tr>
							<td>
							<span style="float: left">
									<button type="button" id="likebutton" class="btn btn-default">좋아요</button>
							</span> <span style='float: right'>
									<button type="button" id="listbutton" class="btn btn-default">목록</button>
									<button type="button" id="modifybutton" class="btn btn-default">수정</button>
									<button type="button" id="deletebutton" class="btn btn-default">삭제</button>
									<button type="button" id="writebutton" class="btn btn-default">글쓰기</button>
							</span></td>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>


	<footer class="footer">
		<div class="container">
			<p>수정 중 입니다.</p>
			<ul class="footer-links">
				<li><a href="#">수정중</a></li>
				<li class="muted">&middot;</li>
				<li><a href="#">수정중</a></li>
				<li class="muted">&middot;</li>
				<li><a href="#">수정중</a></li>
			</ul>
		</div>
	</footer>

	<script src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>
</body>
</html>