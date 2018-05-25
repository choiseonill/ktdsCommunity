<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/css/footer.css"/>" />
<link rel="stylesheet"
	href="<c:url value="/bootstrap/css/bootstrap.css" />">
<link href="<c:url value="/bootstrap/css/bootstrap.min.css"/>"
	rel="stylesheet">
<script src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"type="text/javascript"></script>
<title>게시판 Page</title>
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

		$('#logoutBtn').click(function() { 
			var result = confirm('로그아웃 하시겠습니까?'); 
			if(result) { //yes 
				location.href = "<c:url value="/logout"/>"
			}
		});
		
	});
</script>
</head>
<body>


	<!-- nav -->
	<jsp:include page="/WEB-INF/view/template/menu.jsp"/>
	<!-- /nav -->
	
	
	<!-- list -->
	<div class="container">
		<a class="btn btn-default pull-right" id="insertbtn" href="<c:url value="/write"/>">글쓰기</a>
		<a class="btn btn-default pull-right" href="<c:url value="/mypage"/>">마이페이지</a>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
					<th>조회수/좋아요</th>
				</tr>
			</thead>
			<c:forEach items="${pageExplorer.list}" var="communityList">
				<tbody>
					<tr>
						<td>${communityList.communityId}</td>
						<td><a
							href="<c:url value="/viewCount/${communityList.communityId}"/> ">${communityList.title}</a></td>
						<td>${communityList.memberVO.nickname}</td>
						<td>${communityList.writeDate}</td>
						<td>${communityList.viewCount}/${communityList.likeCount}</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>

		<hr />
	<form id ="searchForm" onsubmit="movePage('0')">
		<div class="text-center">
			<ul class="pagination">
				<li><a href="#">&laquo;</a></li>
				<li>${pageExplorer.make()}</li>
				<li><a href="#">&raquo;</a></li>
			</ul>
		</div>
		</form>
		<c:if test="${empty sessionScope.__USER__}">
			<div class="text-center">
				<a class="btn btn-default" data-toggle="modal"
					data-target="#myModal">로그인</a>
			</div>
		</c:if>

		<c:if test="${not empty sessionScope.__USER__}">
			<div class="text-center">
				<a class="btn btn-default" id="logoutBtn">로그아웃</a>
			</div>
		</c:if>

		<hr />
	</div>
	<!-- /list -->

	<!-- Modal -->
	<div class="container">
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Login</h4>
					</div>
					<div class="modal-body">
						<div class="jumbotron" style="padding-top: 20px;">
							<form:form modelAttribute="loginForm">
								<h3 style="text-align: center;">로그인 화면</h3>
								<div class="form-group">
									<input type="text" class="form-control" placeholder="아이디"
										name="email" maxlength="20" />
								</div>
								<div class="form-group">
									<input type="password" class="form-control" placeholder="비밀번호"
										name="password" maxlength="20" />
								</div>
								<div class="form-group">
									<input type="submit" class="btn btn-primary form-control"
										value="로그인" id="loginBtn" />
								</div>
								<input type="button" id="joinBtn"
									class="btn btn-primary form-control" value="회원가입" />
							</form:form>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
				<!-- /Modal content-->
			</div>
		</div>
	</div>
	<!-- /Modal -->
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/view/template/footer.jsp"/>
	<!-- /footer -->
</body>
</html>