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
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/css/footer.css"/>" />
<title>게시판 작성 Page</title>
<script type="text/javascript">
	$().ready(function() {
		$("#button").click(function() {
			var writeForm = $("#writeForm");
			writeForm.attr({
				"method" : "POST",
				"action" : "<c:url value="/write"/>"
			});
			writeForm.submit();
		});
		$("#listbutton").click(function(){
			location.href="<c:url value="/list"/>"
		});
	});
	
</script>
</head>
<body>

	<!-- navber영역  -->
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



	<!-- body 영역  -->
	<div class="container">
		<table class="table table-bordered">
			<thead>
			<caption>글쓰기</caption>
			</thead>
			<tbody>
				<form id="writeForm" method="post">
					<tr>
						<th>제목:</th>
						<td><input type="text" placeholder="${communitymodify.title}" name="title"
							id="title" class="form-control" /></td>
					</tr>
					<tr>
						<th>닉네임:</th>
						<td><input type="text" placeholder="${communitymodify.nikeName}"
							name="nikeName" id="nikeName" class="form-control" /></td>
					</tr>
					<tr>
						<th>내용:</th>
						<td><textarea cols="10" rows="10" placeholder="${communitymodify.body}" name="body"
								id="body" class="form-control"></textarea></td>
					</tr>
					<tr>
						<th>작성일 :</th>
						<td><input type="date" id="writeDate" name="writeDate" class="form-control" placeholder="${communitymodify.writeDate}"></td>
					</tr>
					<tr>
						<th>첨부파일:</th>

						<td class="filebox preview-image"><input class="upload-name"
							value="파일선택" disabled="disabled"> <label for="input-file">업로드</label>
							<input type="file" id="input-file" class="upload-hidden">
						</td>
					</tr>
					<tr>
						<td colspan="2">
						<input type="button" value="수정완료" id="button" class="btn btn-default pull-right" />
						<input type="button" value="목록으로" id="listbutton" class="btn btn-default pull-left" /></td>
					</tr>
				</form>
			</tbody>
		</table>
	</div>


	<!-- Footer 영역  -->
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