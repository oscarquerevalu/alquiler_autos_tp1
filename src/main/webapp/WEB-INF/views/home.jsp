<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="es-pe">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="home.title" /></title>
<%-- <link href="<c:url value="/resources/css/bootstrap.min.css" />" --%>
<!-- 	rel="stylesheet"> -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="<c:url value="/resources/css/geral.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/jimgMenu.css"/>" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<spring:url value="/resources/js/jquery.js" />"></script>
<script type="text/javascript" src="<spring:url value="/resources/js/jquery-ui.min.js" />"></script>
<script type="text/javascript" src="<spring:url value="/resources/js/jquery-easing-1.3.pack.js" />"></script>
<script type="text/javascript" src="<spring:url value="/resources/js/jquery-easing-compatibility.1.2.pack.js" />"></script>
</head>
<body>

	<div class="container">

		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">Alquiler Autos Rara</a> <a
						class="navbar-brand" href="?lang=en"><img alt="English"
						src="<spring:url value="/resources/images/eua.jpg" />"></a> <a
						class="navbar-brand" href="?lang=es_PE"><img alt="Español"
						src="<spring:url value="/resources/images/peru.jpeg" />"></a> <a
						class="navbar-brand" href="?lang=pt_BR"><img alt="Portugues"
						src="<spring:url value="/resources/images/brasil.jpeg" />"></a>
				</div>
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="#">Reserva</a></li>
					<li><a href="#">Ofertas</a></li>
					<li><a href="#">Cliente</a></li>
				</ul>
				<form class="navbar-form navbar-left" action="/action_page.php">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search"
							name="search">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
			</div>
		</nav>


		<div class="user-info">
			<h1>
				<spring:message code="home.welcome"
					arguments="${usuarioLogado.name}" />
			</h1>
			<br />
			<c:if test="${param.message != null}">
				<span class="alert alert-success alert-success-home">${param.message}</span>
			</c:if>

			<h1>Menu auto</h1>
			<div class="jimgMenu user-info">
				<ul>
					<li class="auto1"><a href="#nogo">Landscapes</a></li>
					<li class="auto2"><a href="#nogo">People</a></li>
					<li class="auto3"><a href="#nogo">Nature</a></li>
					<li class="auto4"><a href="#nogo">Abstract</a></li>
					<li class="auto5"><a href="#nogo">Urban</a></li>
				</ul>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {

			// find the elements to be eased and hook the hover event
			$('div.jimgMenu ul li a').hover(function() {

				// if the element is currently being animated (to a easeOut)...
				if ($(this).is(':animated')) {
					$(this).stop().animate({
						width : "310px"
					}, {
						duration : 450,
						easing : "easeOutQuad"
					});
				} else {
					// ease in quickly
					$(this).stop().animate({
						width : "310px"
					}, {
						duration : 400,
						easing : "easeOutQuad"
					});
				}
			}, function() {
				// on hovering out, ease the element out
				if ($(this).is(':animated')) {
					$(this).stop().animate({
						width : "78px"
					}, {
						duration : 400,
						easing : "easeInOutQuad"
					})
				} else {
					// ease out slowly
					$(this).stop('animated:').animate({
						width : "78px"
					}, {
						duration : 450,
						easing : "easeInOutQuad"
					});
				}
			});
		});
	</script>

</body>
</html>
