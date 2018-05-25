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
<script src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/css/footer.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/css/file.css"/>" />
<title>게시판 작성 Page</title>
<script type="text/javascript">
	$().ready(function() {
		$("#writebutton").click(function() {
			
			var mode = "${mode}";
			if(mode == "modify" ){
				var url = "<c:url value="/modify/${communityModify.communityId}"/>";
			}
			else {
				var url = "<c:url value="/write"/>";
			}
			
			var writeForm = $("#writeForm");
			console.log(url);
			
			writeForm.attr({
				"method" : "POST",
				"action" : url
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

	<!-- nav -->
	<jsp:include page="/WEB-INF/view/template/menu.jsp"/>
	<!-- /nav -->


	<!-- write 영역  -->
	<div class="container">
	<form:form modelAttribute="writeForm" enctype="multipart/form-data">
		<table class="table table-bordered">
			<thead>
				<caption>글쓰기</caption>
			</thead>
			<tbody>
					<tr>
						<th>제목:</th>
						<td><input type="text" placeholder="제목을 입력하세요. " name="title"
							id="title" class="form-control" value="${communityModify.title}"/></td>
					</tr>
					<tr>
						<th>내용:</th>
						<td><textarea cols="10" rows="10" placeholder="내용을 입력하세요. " name="body"
								id="body" class="form-control">${communityModify.body}</textarea></td>
					</tr>
					<tr>
						<th>첨부파일:</th>
						<td class="filebox preview-image"><input class="upload-name"/> <label for="file">업로드</label>
							<input type="file" id="file" name="file"/>
						</td>
					</tr>
					<tr>
						<td colspan="2">
						<input type="button" value="등록" id="writebutton" class="btn btn-default pull-right" />
						<input type="button" value="목록으로" id="listbutton" class="btn btn-default pull-left" /></td>
					</tr>
			</tbody>
		</table>
		<!-- /write 영역  -->
		
		<input type="hidden" id="memberId" name="memberId" value="${sessionScope.__USER__.memberId}"/>
						
		</form:form>
	</div>


	<!-- footer -->
	<jsp:include page="/WEB-INF/view/template/footer.jsp"/>
	<!-- /footer -->



	
</body>
</html>