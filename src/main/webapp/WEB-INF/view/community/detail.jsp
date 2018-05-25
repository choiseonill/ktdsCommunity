<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value="/bootstrap/css/bootstrap.css" />">
<link href="<c:url value="/bootstrap/css/bootstrap.min.css"/>"
	rel="stylesheet">
<script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/js/alert.js"/>"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/css/reply.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/css/footer.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/css/alert.css"/>" />
<script type="text/javascript">
	$().ready(function() {
		
		loadReplies(0);
		function loadReplies(scrollTop) {
			$.get("<c:url value="/api/reply/${communitydetail.communityId}"/>", {},
					function(response) {
				var test = ${communitydetail.communityId};
					console.log(test);
						for ( var i in response) {
							appendReplies(response[i]);
							
						}
						$(window).scrollTop(scrollTop);
					});
		}
		
		
		$("#writeReplyBtn").click(function() {
			$.post("<c:url value="/api/reply/${communitydetail.communityId}"/>",
					$("#writeReplyForm").serialize(),
					function(response) {
						if (response.status) {
							$("#parentReplyId").val(0);
							$("#body").val("");
							$("#createReply").appendTo("#createReplyDiv");
							
							var scrolltop = $(window).scrollTop();
							
							$("#replies").html("");
							loadReplies(scrolltop);
							
						} else {
							alert("등록에 실패했습니다. 잠시 후에 다시 시도하세요!");
						}
			});
			
		});
		
		function appendReplies(reply){
			if(reply.level-1 >= 2){
				reply.level = 2;
			}
			var row = $("<div class='row' style='padding-left:" + ((reply.level-1) * 20) + "px;'  data-id='"+ reply.replyId +"'></div>");
	
			var rowCol = $("<div class='col-xs-2 col-md-1'></div>");
			var img = $("<img src='http://placehold.it/80' class='img-circle img-responsive' alt='' />");
			var bodyCol = $("<div class='col-xs-10 col-md-11'></div>");
			var bodyDiv = $("<div class='bodyDiv'></div>");
			var bodytitle = $("<div style='display: inline-block;'</div>");
			var title = $("<a href='#' id='comment-title'>" + reply.memberVO.nickname + "</a>");
			var writeDate = $("<div class='mic-info' style='display: inline-block;'>" + reply.writeDate + "</div>");
			
			var body = $("<div class='comment-text'>"+ reply.body +"</div>");
			var replys = $("<div class='comment-reply'></div>");
			var replyA = $("<span><a class='re-reply'>[댓글달기]</a></span>");
			var replyB = $("<span><a class='re-reply-remove'>[삭제]</a></span>");
			var replyLike = $("<span class='like-api-span' style='float: right'><img src='<c:url value='/static/imgs/like.png'/>'/><span class='like-api' data-id='"+ reply.replyId +"'>["+ reply.likeCount +"]</span></span>");
			var replyLAndB = $("<span style='float: right'>&nbsp;&nbsp;</span>");
			var replyDisLike = $("<span class='disLike-api-span' style='float: right'><img src='<c:url value='/static/imgs/dislike.png'/>'/><span class='disLike-api' data-id='"+ reply.replyId +"'>["+ reply.disLikeCount +"]</span></span>");
			var hr = $("<hr />");
			
			var session = ${sessionScope.__USER__.memberId};
			console.log("dd" + session);
			var memberId = reply.memberId;
			

			
			$("#replies").append(row);
			row.append(rowCol);
			rowCol.append(img);
			rowCol.after(bodyCol);
			bodyCol.append(bodyDiv);
			bodyDiv.append(bodytitle);
			bodytitle.append(title);
			bodyDiv.append(writeDate);
			bodyDiv.after(body);
			body.after(replys);
			replys.append(replyA);
			
			if (session == memberId){
				replys.append(replyB);
			}
			
			replys.append(replyLike);
			replys.append(replyLAndB);
			replys.append(replyDisLike);
			bodyCol.append(hr);
		
			
		}
		
		
		$("#replies").on("click", ".re-reply", function() {
			var parentReplyId = $(this).closest(".row").data("id");
			$("#parentReplyId").val(parentReplyId);
			$("#createReply").appendTo($(this).closest(".row"));
		});

		
		$("#replies").on("click", ".like-api-span", function() {
			console.log("click");
	         var that = $(this).children(".like-api");
	         var replyId = $(that).data("id");
	         $.post("<c:url value='/api/like/" + replyId + "'/>", {},
	               function(response) {
	                  if ( response.response ) {
	                     var likeCount = response.likeCount;
	                     $(that).text("["+likeCount+"]");
	                  } else {
	                     alert("댓글 실패!");
	                  }
	                  
	               });
	      });
		
		$("#replies").on("click", ".disLike-api-span", function() {
			console.log("click");
	         var that = $(this).children(".disLike-api");
	         var replyId = $(that).data("id");
	         $.post("<c:url value='/api/disLike/" + replyId + "'/>", {},
	               function(response) {
	                  if ( response.response ) {
	                     var disLikeCount = response.disLikeCount;
	                     $(that).text("["+disLikeCount+"]");
	                  } else {
	                     alert("댓글 실패!");
	                  }
	                  
	               });
	      });

		$("#listbutton").click(function() {
			location.href = "<c:url value="/list"/>"
		});

				
		$('#deletebutton').click(function() { 
			var result = confirm('삭제하시겠습니까?'); 
				if(result) { //yes 
					location.href = "<c:url value="/remove/${communitydetail.communityId}"/>"
			}
		});

		$("#writebutton").click(function() {
			location.href = "<c:url value="/write"/>"
		});
			
		$("#likebutton").click(function() {
			location.href = "<c:url value="/likeCount/${communitydetail.communityId}"/>"
		});
			
		$("#modifybutton").click(function() {
			location.href = "<c:url value="/modify/${communitydetail.communityId}"/>"
		});
			
			
	});
	
</script>
<title>게시판 본문 Page</title>
</head>
<body>

	<!-- nav -->
	<jsp:include page="/WEB-INF/view/template/menu.jsp"/>
	<!-- /nav -->
	
	<hr />
	<!-- 게시판 부분 -->
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
							<td>${communitydetail.writeDate}
							<span style='float: right'>좋아요 : ${communitydetail.likeCount}</span></td>
						</tr>
						<tr>
							<td>글쓴이</td>
							<td>${communitydetail.memberVO.nickname}
							<span style='float: right'>조회  : ${communitydetail.viewCount}</span>
							</td>
						</tr>
						
						<c:if test="${not empty communitydetail.displayFilename}">
						<tr>
							<td>첨부파일</td>
							<td>${communitydetail.displayFilename}</td>
						</tr>
						</c:if>
						<tr>
							<td colspan="2" height="130px">
								<p>${communitydetail.body}</p>
							</td>
						</tr>
					</tbody>
				</table>
				<table class="table table-condensed">
					<thead>
						<tr>
							<td>
								<span style="float: left">
									<button type="button" id="likebutton" class="btn btn-default">좋아요</button>
								</span> 
								<span style='float: right'>
									<button type="button" id="listbutton" class="btn btn-default">목록</button>
									<button type="button" id="modifybutton" class="btn btn-default">수정</button>
									<button type="button" id="deletebutton" class="btn btn-default">삭제</button>
									<button type="button" id="writebutton" class="btn btn-default">글쓰기</button>
								</span>
							</td>
						</tr>
					</thead>
				</table>
				<!-- /게시판 부분 -->
				
				<hr />
				
				<!-- 댓글 부분 -->
					<table class="table table-condensed">
						<div class="panel panel-default widget">
							<div class="panel-heading">
								<span class="glyphicon glyphicon-comment"></span>
								<h3 class="panel-title">Reply</h3>
							</div>	
							<div class="panel-body">
								<ul class="list-group">
									<li class="list-group-item">
										<!-- 댓글생성부분 -->
										<div id="replies"></div>
										<div id="createReplyDiv"></div>
									</li>
								</ul>
							</div>
	
					<!-- 댓글 textarea -->
					<div id="createReply">
					<div class="col">
						<div class="panel-body">
							<form id="writeReplyForm">
									<input type="hidden" id="parentReplyId" name="parentReplyId" value="0" />
									<div class="form-group">
										<textarea class="form-control" id="body" name="body" rows="3" placeholder="댓글 내용을 작성해주세요." autofocus=""></textarea>
									</div>
							</form>
							<span style='float: right'>
								<button type="button" id="writeReplyBtn" class="btn btn-default">댓글</button>
							</span>
						</div>
						<hr />
					</div>
					</div>
					<!-- /댓글 textarea -->
					</div>
				</table>
				<!-- /댓글 부분 -->
			</div>
		</div>
	</div>
	<!-- /게시판 부분 -->
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/view/template/footer.jsp"/>
	<!-- /footer -->
	
	
</body>
</html>