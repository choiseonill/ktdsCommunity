<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/bootstrap/css/bootstrap.min.css"/>"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/css/input.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/css/footer.css"/>" />	
<script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"
	type="text/javascript"></script>
<script type="text/javascript">

$().ready(function() {
	
	$("#email").keyup(function() {
		var value = $(this).val();
		if ( value != "" ) {
			
			$.post("<c:url value="/api/exists/email"/>", {
				email: value
			}, function(response) {
				console.log(response.response);
				
				if ( response.response ) {
					$("#email").removeClass("valid");
					$("#email").addClass("invalid");
				}
				else {
					$("#email").removeClass("invalid");
					$("#email").addClass("valid");
				}
			});
		}
		else {
			$(this).removeClass("valid");
			$(this).addClass("invalid");
		}
	});
	
	$("#nickname").keyup(function() {
		var value = $(this).val();
		if ( value != "" ) {
			$.post("<c:url value="/api/exists/nickname"/>", {
				nickname: value
			}, function(response) {
				console.log(response.response);
				if ( response.response ) {
					$("#nickname").removeClass("valid");
					$("#nickname").addClass("invalid");
				}
				else {
					$("#nickname").removeClass("invalid");
					$("#nickname").addClass("valid");
				}
			});
		}
		else {
			$(this).removeClass("valid");
			$(this).addClass("invalid");
		}
	});
	
	$("#password").keyup(function() {
		var value = $(this).val();
		if ( value != "" ) {
			$(this).removeClass("invalid");
			$(this).addClass("valid");
		}
		else {
			$(this).removeClass("valid");
			$(this).addClass("invalid");
		}
		
		var password = $("#password-confirm").val();
		
		if ( value != password ) {
			$(this).removeClass("valid");
			$(this).addClass("invalid");
			$("#password-confirm").removeClass("valid");
			$("#password-confirm").addClass("invalid");
		}
		else {
			$(this).removeClass("invalid");
			$(this).addClass("valid");
			$("#password-confirm").removeClass("invalid");
			$("#password-confirm").addClass("valid");
		}
	});
	
	$("#password-confirm").keyup(function() {
		var value = $(this).val();
		var password = $("#password").val();
		
		if ( value != password ) {
			$(this).removeClass("valid");
			$(this).addClass("invalid");
			$("#password").removeClass("valid");
			$("#password").addClass("invalid");
		}
		else {
			$(this).removeClass("invalid");
			$(this).addClass("valid");
			$("#password").removeClass("invalid");
			$("#password").addClass("valid");
		}
	});
	
	$("#cancelBtn").click(function(){
		location.href="<c:url value="/login"/>";
	});
	
	$("#joinBtn").click(function() {
		
		if ( $("#email").val() == "" ) {
			alert("이메일을 입력하세요!");
			$("#email").focus();
			$("#email").addClass("invalid");
			return false;
		}
		
		if ( $("#email").hasClass("invalid") ) {
			alert("작성한 이메일은 사용할 수 없습니다.");
			$("#email").focus();
			return false;
		}
		else {
			$.post("<c:url value="/api/exists/email"/>", {
				email: $("#email").val()
			}, function(response) {
				
				if ( response.response ) {
					alert("작성한 이메일은 사용할 수 없습니다.");
					$("#email").focus();
					return false;
				}
				
				if ( $("#nickname").val() == "" ) {
					alert("닉네임을 입력하세요!");
					$("#nickname").focus();
					$("#nickname").addClass("invalid");
					return false;
				}
				
				if ( $("#nickname").hasClass("invalid") ) {
					console.log("nickname invalid check"); 
					alert("작성한 닉네임은 사용할 수 없습니다.");
					$("#nickname").focus();
					return false;
				}
				else {
					$.post("<c:url value="/api/exists/nickname"/>", {
						nickname: $("#nickname").val()
					}, function(response) {
						if ( response.response ) {
							console.log("second nickname invalid check");
							$("#nickname").removeClass("valid");
							$("#nickname").addClass("invalid");
							return false;
						}
						else {
							$("#nickname").removeClass("invalid");
							$("#nickname").addClass("valid");
							
							if ( $("#password").val() == "" ) {
								alert("비밀번호를 입력하세요!");
								$("#password").focus();
								$("#password").addClass("invalid");
								return false;
							}
									
							$("#joinForm").attr({
								"method": "post",
								"action": "<c:url value="/join"/>"
							}).submit();
						}
					});
				}
			});
		}
	});
});
</script>
<title>회원가입 Page</title>
</head>
<body>
	<!-- nav -->
	<jsp:include page="/WEB-INF/view/template/menu.jsp"/>
	<!-- /nav -->
	
	<!-- join -->
     <div class="container">
		 <div class="col-xs-12 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3">
		    <div class="login-panel panel panel-default">
		  	<div class="panel-heading"><h3 class="panel-title"><strong>JoIn </strong></h3></div>
		  	
		 		 <div class="panel-body">
		 		 <form:form modelAttribute="joinForm" class="form-signin">
		 		 
		  		<div class="form-group">
		    		<label for="exampleInputEmail1">Email</label>
		    		<input type="email" class="form-control" id="email" name="email" placeholder="Enter email">
		  		</div>
		  		
		  		<div class="form-group">
		    		<label for="exampleInputEmail1">Email</label>
		    		<input type="text" class="form-control" id=nickname name="nickname" placeholder="Enter nickname">
		  		</div>
		  		
		  		<div class="form-group">
		   			 <label for="exampleInputPassword1">Password</label>
		        	 <input type="password" class="form-control" id="password" name="password" placeholder="Password">
		  		</div>
		  		
				<div class="form-group">
		    		<label for="exampleInputPassword1">Password</label>
		    		<input type="password" class="form-control" id="password-confirm" name="password-confirm" placeholder="password-confirm">
		  		</div> 
		  		
		  		<button type="button" id="joinBtn" class="btn btn-sm btn-default"> Join</button>
		  		<button type="button" id="cancelBtn"class="btn btn-sm btn-default">Cancel</button>
		  		
				</form:form>
		  		</div>
			</div>
		</div>
    </div>
    <!-- /join -->
    
    
	<!-- footer -->
	<jsp:include page="/WEB-INF/view/template/footer.jsp"/>
	<!-- /footer -->

    
    
</body>
</html>