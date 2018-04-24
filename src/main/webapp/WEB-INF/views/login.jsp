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

<html lang="es-pe" xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title><spring:message code="login.title" /></title>
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/geral.css" />" rel="stylesheet">
</head>
<body>
	<div class="container">
		<a href="?lang=en"><img alt="English"
			src="<spring:url value="/resources/images/eua.jpg" />"></a> <a
			href="?lang=es_PE"><img alt="Español"
			src="<spring:url value="/resources/images/peru.jpeg" />"></a> <a
			href="?lang=pt_BR"><img alt="Portugues"
			src="<spring:url value="/resources/images/brasil.jpeg" />"></a>
		<c:url var="post_url" value="/login" />
<%-- 		<div class="alert alert-info">${req}</div> --%>
<%-- 		<div class="alert alert-info">${url}</div> --%>
<%-- 		<div class="alert alert-info">${uri}</div> --%>
<%-- 		<div class="alert alert-info">${fn:substring(url, 0, fn:length(url) - fn:length(uri))}</div> --%>
		
		<c:if test="${param.resetSuccess != null}">
			<div class="alert alert-info">You successfully reset your
				password.</div>
		</c:if>
		<form:form action="${post_url}" method="post" class="form-signin">
			<h2 class="form-signin-heading">
				<spring:message code="login.title" />
			</h2>
			<c:if test="${param.error != null}">
				<span class="alert alert-danger alert-warning-login"
					style="float: initial;"><spring:message code="login.error" /></span>
			</c:if>
			<c:if test="${param.logout != null}">
				<span class="alert alert-success alert-warning-login"><spring:message
						code="login.logout.message" /></span>
			</c:if>
			<input type="text" id="username" name="username" class="form-control"
				placeholder="<spring:message code="login.input.usuario"/>" required
				autofocus />
			<input type="password" id="password" name="password"
				class="form-control"
				placeholder="<spring:message code="login.input.password"/>" required />
			<div class="form-actions">
				<button type="submit" class="btn btn-lg btn-primary btn-block">
					<spring:message code="login.btlogin.label" />
				</button>
				<c:url var="create_url" value="/user/create" />
				<a href="${create_url}" class="btn btn-lg btn-primary btn-block"><spring:message
						code="login.btnewuser.label" /></a>
			</div>
			<div class="col-md-12">
				Forgot password? <a
					href="${hostn}/reset-password/forgot-password">Reset
					password</a>
			</div>
		</form:form>
	</div>
</body>
</html>