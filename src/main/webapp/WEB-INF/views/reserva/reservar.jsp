<%@page import="pe.com.alquilerautorara.model.UserInfo.Role"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>

<html lang="es-pe">
<head>
<meta charset="UTF-8">
<title><spring:message code="reserva.title" /></title>
<link href="<spring:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<link href="<spring:url value="/resources/css/geral.css" />"
	rel="stylesheet">
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />
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
					<li><a href="#">Home</a></li>
					<li class="active"><a href="#">Reserva</a></li>
					<li><a href="#">Mis reservas</a></li>
					<li><a href="#">Ofertas</a></li>
					<li><a href="#">Cliente</a></li>
				</ul>
				<div class="div-actions">
					<c:url var="logout_url" value="/logout?logout" />
					<a href="${logout_url}" class="btn btn-default btn-lg btn-logout">
						<span class="glyphicon glyphicon-log-out"></span> Logout
					</a>
				</div>
			</div>
		</nav>

		<c:url var="post_url" value="/reserva/create/save" />
		<form:form id="form-create" action="${post_url}"
			modelAttribute="reserva" method="post" class="form-signin">
			<h2 class="form-signin-heading">
				<spring:message code="reserva.title" />
			</h2>
			<c:if test="${param.message != null}">
				<span class="alert alert-success alert-warning-login">${param.message}</span>
			</c:if>
			<c:if test="${not empty message}">
				<div class="message green">${message}</div>
			</c:if>
			
			<c:if test="${not empty alert}">
				<div class="alert alert-success alert-warning-login">${alert}</div>
			</c:if>
			<form:hidden path="id" />
			<form:errors path="userInfo.name" element="div"
				class="alert alert-warning" />
			<spring:message code="create.input.name" var="nameLabel" />
			<form:input path="userInfo.name" class="form-control"
				placeholder="${nameLabel}" required="true" readonly="readonly" />

			<form:errors path="userInfo.email" element="div"
				class="alert alert-warning" />
			<spring:message code="create.input.email" var="emailLabel" />
			<form:input path="userInfo.email" class="form-control"
				placeholder="${emailLabel}" required="true" readonly="readonly" />

			<form:errors path="userInfo.documento" element="div"
				class="alert alert-warning" />
			<spring:message code="create.input.documento" var="documentoLabel" />
			<form:input path="userInfo.documento" class="form-control"
				placeholder="${documentoLabel}" required="true" readonly="readonly" />

			<form:errors path="userInfo.birthdate" element="div"
				class="alert alert-warning" />
			<spring:message code="create.input.birthdate" var="birthdateLabel" />
			<form:input path="userInfo.birthdate" readonly="readonly"
				class="form-control" placeholder="${birthdateLabel}" required="true" />

			<form:errors path="auto.categoria" element="div"
				class="alert alert-warning" />
			<spring:message code="home.auto.categoria" var="categoriaLabel" />
			<form:input path="auto.categoria" class="form-control"
				placeholder="${categoriaLabel}" required="true" readonly="readonly" />

			<form:errors path="auto.nombre" element="div"
				class="alert alert-warning" />
			<spring:message code="home.auto.nombre" var="nombreLabel" />
			<form:input path="auto.nombre" class="form-control"
				placeholder="${nombreLabel}" required="true" readonly="readonly" />

			<form:errors path="auto.precio" element="div"
				class="alert alert-warning" />
			<spring:message code="home.auto.precio" var="precioLabel" />
			<form:input path="auto.precio" class="form-control"
				placeholder="${precioLabel}" required="true" readonly="readonly" />
				
				<div id="fecha-alert" style="display: none;" class="alert alert-warning">
				</div>

			<form:errors path="fechaReservaIni" element="div"
				class="alert alert-warning" />
			<spring:message code="reserva.input.fechaIni" var="fechaIniLabel" />
			<form:input path="fechaReservaIni" readonly="readonly" id="fechaIni-input"
				class="form-control" placeholder="${fechaIniLabel}" required="true"
				onblur="checkReserveExist()" />

			<form:errors path="fechaReservaFin" element="div"
				class="alert alert-warning" />
			<spring:message code="reserva.input.fechaFin" var="fechaFinLabel" />
			<form:input path="fechaReservaFin" readonly="readonly" id="fechaFin-input"
				class="form-control" placeholder="${fechaFinLabel}" required="true"
				onblur="checkReserveExist()" />

			<form:hidden path="estado" />
			<form:hidden path="precio" />
			<form:hidden path="auto.id" />
			<div class="form-actions">
				<form:button type="submit" id="btn-salvar"
					class="btn btn-lg btn-primary btn-block">
					<spring:message code="create.input.reservar" />
				</form:button>
			</div>


		</form:form>
		<script type="text/javascript"
			src="<spring:url value="/resources/js/jquery.js" />"></script>
		<script type="text/javascript"
			src="<spring:url value="/resources/js/jquery-ui.min.js" />"></script>
		<script type="text/javascript">
			$(document).ready(
					function() {
						var date = new Date();
						$("#fechaIni-input").datepicker(
								{
									yearRange : date.getFullYear() - 150 + ":"
											+ date.getFullYear(),
									changeMonth : true,
									changeYear : true,
									minDate : "+0 +0",
									dateFormat : "dd/mm/yy",
									onSelect:function(selectedDate){
				                    	/*alert(selectedDate);*/
				                    	//var day = day.getDay();
				                    	//alert(day);
// 				                    $('#fechaFin-input').val(selectedDate);
				                    var fechaSeparada = selectedDate.split("/");
				                    $( "#fechaFin-input" ).datepicker( "option", "disabled", false );
				                    $('#fechaFin-input').datepicker("option", "minDate", new Date(fechaSeparada[2], parseInt(fechaSeparada[1]) - 1, parseInt(fechaSeparada[0]) ));
				                    },
								}).attr('readonly', 'readonly');

						$("#fechaFin-input").datepicker(
								{
									yearRange : date.getFullYear() - 150 + ":"
											+ date.getFullYear(),
									changeMonth : true,
									changeYear : true,
									minDate : "+0 +0",
									dateFormat : "dd/mm/yy",
								}).attr('readonly', 'readonly');
						$("#fechaFin-input").datepicker('disable');
					});

// 			$('#form-create').submit(function() {
// 	      		  return checkReserveExist();
// 	      		});

			function checkReserveExist() {
				var fechaIni = $("#fechaIni-input").val();
				var fechaFin = $("#fechaFin-input").val();
				
				if (fechaIni && fechaFin) {
					/* $("#loading-image").css('display', 'inline'); */
					var url = "<spring:url value="/reserva/checkreserve" />";
					$
							.ajax({
								url : url,
								data : {
									fechaIni : fechaIni,
									fechaFin : fechaFin
								},
								type : "GET",
								headers : {
									"Accept" : "application/json"
								},
								contentType: "application/json; charset=utf-8",
								dataType: "json",
								success : function(data) {
									/* 	$("#loading-image").css('display', 'none'); */
									if (data) {
										$(":submit").attr("disabled", true);
										$("#fecha-alert")
												.show()
												.html(
														"<spring:message code='create.message.fechaReserva'/>");
										return false;
									} else {
										$(":submit").removeAttr("disabled");
										$("#fecha-alert").hide().html("");
										return true;
									}
									//alert("Data: " + data );
								}
							});
				}
			}
		</script>
	</div>
</body>
</html>
