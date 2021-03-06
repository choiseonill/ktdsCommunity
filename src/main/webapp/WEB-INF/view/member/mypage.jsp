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
<script src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"
	type="text/javascript"></script>
<title>My Page</title>
</head>
<body>


	<!-- nav -->
	<jsp:include page="/WEB-INF/view/template/menu.jsp"/>
	<!-- /nav -->
	
	<!-- body상단 영역 -->
	<!-- body상단 1번 영역 -->
	<div class="container">
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form>
					<h3 style="text-align: center">MY PAGE</h3>

					<div>아이디 :</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userId" maxlength="20" />
					</div>
					<div>닉네임 :</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="닉네임" name="userNickname" maxlength="20" />
					</div>
				</form>
			</div>
		</div>
		<!-- /body상단 1번 영역 -->
		
		<!-- body상단 2번 영역 -->
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form>
					<h3 style="text-align: center">개인 등급</h3>

					<div>게시물 수  :</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userId" maxlength="20" />
					</div>
					<div>총 점수 :</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="점수" name="likePoint" maxlength="20" />
					</div>
				</form>
			</div>
		</div>
		<!-- /body상단 2번 영역 -->
		
		<!-- body상단 3번 영역 -->
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form>
					<h3 style="text-align: center">MY PAGE</h3>

					<div>아이디 :</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userId" maxlength="20" />
					</div>
					<div>닉네임 :</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="닉네임" name="userNickname" maxlength="20" />
					</div>
				</form>
			</div>
		</div>
		<!-- /body상단 3번 영역 -->
	</div>
	<!-- /body상단 영역 -->
	
	<!-- body하단 영역 -->
	<div class="container">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>165</td>
					<td>수정중</td>
					<td>길라임</td>
					<td>2016.12.02</td>
					<td>2</td>
				</tr>
				<tr>
					<td>165</td>
					<td>수정중</td>
					<td>최선일</td>
					<td>2016.12.02</td>
					<td>2</td>
				</tr>
				<tr>
					<td>165</td>
					<td>수정중</td>
					<td>최선일</td>
					<td>2016.12.02</td>
					<td>2</td>
				</tr>
				<tr>
					<td>165</td>
					<td>수정중</td>
					<td>최선일</td>
					<td>2016.12.02</td>
					<td>2</td>
				</tr>
				<tr>
					<td>165</td>
					<td>수정중</td>
					<td>최선일</td>
					<td>2016.12.02</td>
					<td>2</td>
				</tr>
			</tbody>
		</table>
		
		
		<hr />
		<!-- body하 버튼 영역 -->
		<div class="text-center">
			<a class="btn btn-default">회원탈퇴</a>
			<a class="btn btn-default" href="<c:url value="list"/>">>뒤로가기</a>
		</div>
		<!-- /body하 버튼 영역 -->
		
		<hr />
		
	</div>
	<!-- /body하단 영역 -->




	<!-- footer -->
	<jsp:include page="/WEB-INF/view/template/footer.jsp"/>
	<!-- /footer -->
	
</body>
</html>