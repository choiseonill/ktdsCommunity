<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/bootstrap/css/bootstrap.min.css"/>"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/css/footer.css"/>" />
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
<title>Insert title here</title>
</head>


<body>

	<!-- nav -->
	<jsp:include page="/WEB-INF/view/template/menu.jsp"/>
	<!-- /nav -->
	
	<!-- login -->
    <div class="container" style="margin-top: 100px;" >
		 <div class="col-xs-12 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3">
		 	<div class="login-panel panel panel-default">
		 	<div class="panel-heading"><h3 class="panel-title"><strong>Log In </strong></h3></div>
		 	
		  	<div class="panel-body">
		    	<form:form modelAttribute="loginForm" class="form-signin">
		    	
		  		<div class="form-group">
		    		<label for="exampleInputEmail1">Email</label>
		    		<input type="email" class="form-control" id="email" name="email" placeholder="Enter email">
		  		</div>
		  		
		  		<div class="form-group">
		    		<label for="exampleInputPassword1">Password</label>
		    		<input type="password" class="form-control" id="password" name="password" placeholder="Password">
		  		</div>
		  		
		  		<button type="button" id="loginBtn" class="btn btn-sm btn-default">login</button>
		  		<button type="button" id="joinBtn"class="btn btn-sm btn-default">Join</button>
		  		
				</form:form>
		  	</div>
		</div>
	</div>
 </div>
 <!-- /login -->

	<!-- footer -->
	<jsp:include page="/WEB-INF/view/template/footer.jsp"/>
	<!-- /footer -->

</body>
</html>