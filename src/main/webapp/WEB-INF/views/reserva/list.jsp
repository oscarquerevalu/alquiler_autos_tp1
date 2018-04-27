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
					<li><a href="#">Reserva</a></li>
					<li class="active"><a href="#">Mis reservas</a></li>
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

		<table class="table table-striped">
			<thead align="center">
				<tr>
					<th align="center" style="text-align: center"><spring:message
							code="home.reservas.table.id" /></th>
					<th align="center" style="text-align: center"><spring:message
							code="home.reservas.table.fechaini" /></th>
					<th align="center" style="text-align: center"><spring:message
							code="home.reservas.table.fechafin" /></th>
					<th align="center" style="text-align: center"><spring:message
							code="home.reservas.table.auto" /></th>
					<th align="center" style="text-align: center"><spring:message
							code="home.reservas.table.auto.precio" /></th>
					<th align="center" style="text-align: center"><spring:message
							code="home.reservas.table.auto.seguro" /></th>
					<th align="center" style="text-align: center"><spring:message
							code="home.reservas.table.precio" /></th>
					<th align="center" style="text-align: center"><spring:message
							code="home.reservas.table.actions" /></th>
				</tr>
			</thead>
			<c:forEach items="${reservas}" var="reserva">
				<tr>
					<td>${reserva.id}</td>
					<fmt:parseDate value="${reserva.fechaReservaIni}"
						pattern="yyyy-MM-dd" var="parsedDateFecIni" type="date" />
					<td><fmt:formatDate type="date" value="${parsedDateFecIni}" /></td>
					<fmt:parseDate value="${reserva.fechaReservaFin}"
						pattern="yyyy-MM-dd" var="parsedDateFecFin" type="date" />
					<td><fmt:formatDate type="date" value="${parsedDateFecFin}" /></td>
					<td>${reserva.auto.nombre}</td>
					<td>${reserva.auto.precio}</td>
					<td>${reserva.auto.seguroVehiculo}</td>
					<td>${reserva.precio}</td>
					<td><c:url var="edit_url" value="/reserva/edit/${reserva.id}" />
						<spring:message code="home.users.table.actions" var="editTitle" />
						<a href="${edit_url}" class="btn btn-default btn-lg"
						title="${editTitle}"> <span class="glyphicon glyphicon-edit"></span>
					</a> <%-- 					 <sec:authorize access="hasRole('ROLE_ADMIN')" var="teste"> --%>
						<spring:message code="home.users.table.actions" var="removerTitle" />
						<button
							onclick="showModalRemoveUser('${reserva.id}','${reserva.auto.nombre}')"
							class="btn btn-default btn-lg" title="${removerTitle}">
							<span class="glyphicon glyphicon-remove"></span>
						</button> <%-- 						</sec:authorize> --%></td>
				</tr>
			</c:forEach>
		</table>

		<div class="modal fade" id="modal-remove">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">
							<spring:message code="home.reservas.modal.remove" />
						</h4>
					</div>
					<div class="modal-body">
						<p>
							<spring:message code="home.reservas.modal.remove.description" />
							<strong id="modalUserName"></strong>?
						</p>
<%-- 						<strong id="usuarioLogadoAlert" style="display: none"><spring:message --%>
<%-- 								code="home.reservas.modal.remove.observation" /></strong> --%>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">
							<spring:message code="home.reservas.modal.remove.cancel" />
						</button>
						<c:url var="remove_url" value="/reserva/remove/" />
						<a id="link-remove" href="#" class="btn btn-primary" title="Edit">
							<spring:message code="home.reservas.modal.remove.label" />
						</a>
						<!-- <button type="button" class="btn btn-primary">Remover</button> -->
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

	</div>
	<script type="text/javascript"
		src="<spring:url value="/resources/js/jquery.js" />"></script>
	<script type="text/javascript"
		src="<spring:url value="/resources/js/bootstrap.min.js" />"></script>
	<script type="text/javascript">
		function showModalRemoveUser(id, nome) {
			var usuarioLogadorId = '${usuarioLogado.id}';
			if (usuarioLogadorId == id) {
				$("#usuarioLogadoAlert").show();
			} else {
				$("#usuarioLogadoAlert").hide();
			}
			$("#modalUserName").html(nome)
			$("#link-remove").attr("href", "${remove_url}" + id);
			$('#modal-remove').modal('show')
		}
	</script>

</body>
</html>
