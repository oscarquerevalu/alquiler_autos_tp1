<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="uri" value="${req.requestURI}" />
<c:set var="hostn" value="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}" />

<!DOCTYPE html>

<html lang="es-pe">
    <head>
	      <meta charset="UTF-8">
				<title><spring:message code="login.title"/></title>
				<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
				<link href="<c:url value="/resources/css/AdminLTE.css" />" rel="stylesheet">
      	<!--  <link href="<c:url value="/resources/css/geral.css" />" rel="stylesheet">-->

				<meta http-equiv="X-UA-Compatible" content="IE=edge">
				<title>AutosRARA 2 | Log in</title>
				<!-- Tell the browser to be responsive to screen width -->
				<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
				<!-- Bootstrap 3.3.7 -->
				<link rel="stylesheet" href="../../bower_components/bootstrap/dist/css/bootstrap.min.css">
				<!-- Font Awesome -->
				<link rel="stylesheet" href="../../bower_components/font-awesome/css/font-awesome.min.css">
				<!-- Ionicons -->
				<link rel="stylesheet" href="../../bower_components/Ionicons/css/ionicons.min.css">
				<!-- Theme style -->
				<link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
				<!-- iCheck -->
				<link rel="stylesheet" href="../../plugins/iCheck/square/blue.css">
				
				<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
				<!-- WARNING: Respond.js doesnt work if you view the page via file:// -->
				<!--[if lt IE 9]>
				<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
				<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
				<![endif]-->
				
				<!-- Google Font -->
				<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
				
	</head>
	<body class="hold-transition login-page">

		<div class="login-box">
		  <div class="login-logo">
		    <a href="../../index2.html"><b>Autos</b>RARA</a>
		  </div>
		  
		  <a href="?lang=en"><img alt="English" src="<spring:url value="/resources/images/eua.jpg" />"></a>
		  <a href="?lang=es_PE"><img alt="Español" src="<spring:url value="/resources/images/peru.jpeg" />"></a>
		  <a href="?lang=pt_BR"><img alt="Portugues" src="<spring:url value="/resources/images/brasil.jpeg" />"></a>
		  
		  <!-- /.login-logo -->
		  <div class="login-box-body">

				<c:url var="post_url" value="/login" />
				<c:if test="${param.resetSuccess != null}">
			<div class="alert alert-info">You successfully reset your
				password.</div>
		</c:if>
				<form:form action="${post_url}" method="post" class="form-signin">
								<h2 class="form-signin-heading"><spring:message code="login.title"/></h2>
								<c:if test="${param.error != null}">
					                   <span class="alert alert-danger alert-warning-login"  style="float: initial;"><spring:message code="login.error"/></span>
								</c:if>
								<c:if test="${param.logout != null}">
									<span class="alert alert-success alert-warning-login" ><spring:message code="login.logout.message"/></span>
								</c:if>
								<input type="text" id="username" name="username" class="form-control" placeholder="<spring:message code="login.input.usuario"/>" required autofocus/> 
								<input type="password" id="password" name="password" class="form-control" placeholder="<spring:message code="login.input.password"/>" required/>

								<div class="form-actions">
									<button type="submit" class="btn btn-primary btn-block btn-flat"><spring:message code="login.btlogin.label"/></button>
									<!--<c:url var="create_url" value="/user/create" />-->
									<!--<a href="${create_url}" class="btn btn-lg btn-primary btn-block"><spring:message code="login.btnewuser.label"/></a>-->
								</div>
					</form:form>

					<div class="social-auth-links text-center">
					      <p>- OR -</p>
					      <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using
					        Facebook</a>
					      <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign in using
					        Google+</a>
					</div>
					<div class="col-md-12">
				Forgot password? <a
					href="${hostn}/reset-password/forgot-password">Reset
					password</a>
			</div>
					<!-- /.social-auth-links -->
					
<!-- 					<a href="#">I forgot my password</a><br> -->
					<!-- <a href="register.html" class="text-center">Register a new membership</a> -->
					<c:url var="create_url" value="/user/create" />
					<a href="${create_url}" class="text-center">Register a new membership</a>
					
			</div>
			<!-- /.login-box-body -->
		</div>
		<!-- /.login-box -->
		
		<!-- jQuery 3 -->
		<script src="../../bower_components/jquery/dist/jquery.min.js"></script>
		<!-- Bootstrap 3.3.7 -->
		<script src="../../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
		<!-- iCheck -->
		<script src="../../plugins/iCheck/icheck.min.js"></script>
		<script>
		  $(function () {
		    $('input').iCheck({
		      checkboxClass: 'icheckbox_square-blue',
		      radioClass: 'iradio_square-blue',
		      increaseArea: '20%' /* optional */
		    });
		  });
		</script>
	</body>
</html>
