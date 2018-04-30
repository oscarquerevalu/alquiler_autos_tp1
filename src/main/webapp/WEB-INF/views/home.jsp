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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><spring:message code="home.title" /></title>
<%-- <link href="<c:url value="/resources/css/bootstrap.min.css" />" --%>
<!-- 	rel="stylesheet"> -->
<%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >--%>
<link href="<c:url value="/resources/css/other2.css" />"
	rel="stylesheet">
<!--<link href="<c:url value="/resources/css/geral.css" />" rel="stylesheet">-->
<!--<link href="<c:url value="/resources/css/jimgMenu.css"/>"
	rel="stylesheet" type="text/css" />-->
<script type="text/javascript"
	src="<spring:url value="/resources/js/jquery.js" />"></script>
<script type="text/javascript"
	src="<spring:url value="/resources/js/jquery-ui.min.js" />"></script>
<script type="text/javascript"
	src="<spring:url value="/resources/js/jquery-easing-1.3.pack.js" />"></script>
<script type="text/javascript"
	src="<spring:url value="/resources/js/jquery-easing-compatibility.1.2.pack.js" />"></script>


<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</head>
<body>

	<div class="container">

		<div class="navbar-header">

			<a class="navbar-brand" href="?lang=en"><img alt="English"
				src="<spring:url value="/resources/images/eua.jpg" />"></a> <a
				class="navbar-brand" href="?lang=es_PE"><img alt="Español"
				src="<spring:url value="/resources/images/peru.jpeg" />"></a> <a
				class="navbar-brand" href="?lang=pt_BR"><img alt="Portugues"
				src="<spring:url value="/resources/images/brasil.jpeg" />"></a>
		</div>

		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<a class="navbar-brand" href="#">Alquiler Autos RARA</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarTogglerDemo02"
				aria-controls="navbarTogglerDemo02" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
				<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
					<li class="nav-item active"><a class="nav-link" href="#">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link disabled" href="#">Reserva</a>
					</li>
					<li class="active"><c:url var="listReserva_url" value="/reserva/list" />
						<a class="nav-link disabled" href="${listReserva_url}">Mis reservas</a></li>
					<li class="nav-item"><a class="nav-link disabled" href="#">Ofertas</a>
					</li>
					<li class="nav-item"><c:url var="edit_url" value="/user/edit" />
						<a class="nav-link disabled" href="${edit_url}">Cliente</a></li>
				</ul>
				<form class="form-inline my-2 my-lg-0">

					<div class="div-actions">
						<c:url var="logout_url" value="/logout?logout" />
						<a href="${logout_url}" class="btn btn-default btn-lg btn-logout">
							<span class="glyphicon glyphicon-log-out"></span> Logout
						</a>
					</div>

				</form>
			</div>
		</nav>


		<div class="container">
			<h1>
				<spring:message code="home.welcome"
					arguments="${usuarioLogado.name}" />
			</h1>
			<br />
			<c:if test="${param.message != null}">
				<span class="alert alert-success alert-success-home">${param.message}</span>
			</c:if>
		</div>
	</div>
	<div class="content">
		<div class="container">
			<div class="row">
				<div
					class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 mb40 text-center">

					<spring:message code='home.title2' />

				</div>
			</div>

			<div class="row">
				<div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
					<div class="team-block">
						<div class="team-img">
							<img onclick="autoFindbyId(1);"
								src="<spring:url value="/resources/css/images//elantra.jpg" />"
								alt="Avatar" class="image">
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
					<div class="team-block">
						<div class="team-img">
							<img onclick="autoFindbyId(2);"
								src="<spring:url value="/resources/css/images//toyota-hilux.jpg" />"
								alt="Avatar" class="image">
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
					<div class="team-block">
						<div class="team-img">
							<img onclick="autoFindbyId(3);"
								src="<spring:url value="/resources/css/images//kia-optima-2.jpg" />"
								alt="Avatar" class="image">
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
					<div class="team-block">
						<div class="team-img">
							<img onclick="autoFindbyId(4);"
								src="<spring:url value="/resources/css/images//kia-rio-2.jpg" />"
								alt="Avatar" class="image">
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
					<div class="team-block">
						<div class="team-img">
							<img onclick="autoFindbyId(5);"
								src="<spring:url value="/resources/css/images//mercedes-1.jpg" />"
								alt="Avatar" class="image">
						</div>
					</div>
				</div>

				<div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
					<div class="team-block">
						<div class="team-img">
							<img onclick="autoFindbyId(5);"
								src="<spring:url value="/resources/css/images//rav4-1.jpg" />"
								alt="Avatar" class="image">
						</div>
					</div>
				</div>

				<%-- <div class="col-sm-3">
					
					<div class="form-actions" style="display: none;">
						<c:url var="post_url" value="/reserva/inicia" />
						<form:form id="form-create" action="${post_url}"
							modelAttribute="auto" method="post" class="form-signin">
						</form:form>
						
						<sec:authorize access="isAnonymous()" var="usuarioDeslogado" />
						<c:choose>
							<c:when test="${usuarioDeslogado}">
								<c:url var="login_url" value="/login" />
								<a href="${login_url}" class="btn btn-lg btn-primary btn-block"><spring:message
										code="home.auto.login" /></a>
							</c:when>
							<c:otherwise>
								<button type="submit" id="btn-reservar"
									class="btn btn-lg btn-primary btn-block">
									<spring:message code="home.auto.reservar" />
								</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>--%>

			</div>


		</div>
	</div>


	<!-- Modal -->
	<%--<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalCenterTitle">Modal title</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-lg btn-secondary" data-dismiss="modal">Cerrar</button>
	        <btn-replace></btn-replace>
	      </div>
	    </div>
	  </div>
	</div>--%>

	<!-- Large Modal -->
	<div class="modal fade bd-example-modal-lg" id="exampleModalCenter"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalCenterTitle">Modal
						title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<div class="container">
						<div class="row">
							<div class="col-sm">
								<!-- Imagenes de auto -->

								<div id="carouselExampleIndicators" class="carousel slide"
									data-ride="carousel">
									<ol class="carousel-indicators">
										<li data-target="#carouselExampleIndicators" data-slide-to="0"
											class="active"></li>
										<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
										<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
									</ol>
									<div class="carousel-inner">
										<div class="carousel-item active">
											<img class="d-block w-100" src="" alt="First slide"
												id="imgOne">
										</div>
										<div class="carousel-item">
											<img class="d-block w-100" src="" alt="Second slide"
												id="imgTwo">
										</div>
										<div class="carousel-item">
											<img class="d-block w-100" src="" alt="Third slide"
												id="imgThree">
										</div>
									</div>
									<a class="carousel-control-prev"
										href="#carouselExampleIndicators" role="button"
										data-slide="prev"> <span
										class="carousel-control-prev-icon" aria-hidden="true"></span>
										<span class="sr-only">Previous</span>
									</a> <a class="carousel-control-next"
										href="#carouselExampleIndicators" role="button"
										data-slide="next"> <span
										class="carousel-control-next-icon" aria-hidden="true"></span>
										<span class="sr-only">Next</span>
									</a>
								</div>

							</div>
							<div class="col-sm2">
								<!-- Info de auto seleccionado -->
							</div>
						</div>
					</div>

				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-lg btn-secondary"
						data-dismiss="modal">Cerrar</button>
					<btn-replace></btn-replace>
				</div>
			</div>
		</div>
	</div>


	<!-- Script -->
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

		function autoFindbyId(id) {
			$('#exampleModalCenter').modal('show');
			if (id) {
				/* $("#loading-image").css('display', 'inline'); */
				var url = "<spring:url value="/auto/findbyId" />";
				$
						.ajax({
							url : url,
							headers : {
								"Accept" : "application/json"
							},
							data : {
								id : id
							},
							type : "GET",
							dataType : "JSON",
							success : function(data) {
								/* 	$("#loading-image").css('display', 'none'); */
								if (data === 'true') {
									// 	      	 				$(":submit").attr("disabled", true);

									alert("NOT FOUND");

								} else {
									// 		      	 		    $(":submit").removeAttr("disabled");
									// 	      	 				$("#user-alert").hide().html("");
									// 	      	 				alert(data);
									// 									$("#autoId") = data.id;

									var textDisponible;

									if (data.disponible) {
										textDisponible = "<c:url var='edit_url' value='/reserva/iniciaReserva/"+ data.id + "' />"
												+ "<a href='${edit_url}' class='btn btn-lg btn-primary'><spring:message code='home.reserva.reservar'/></a>";
									} else {
										textDisponible = "<h1> <spring:message code='home.reserva.nodisponible'/></h1>";
									}

									/*$("#auto-info")
											.show()
											.html(
													"<h3> <spring:message code='home.auto.categoria'/><small> "
															+ data.categoria
															+ " </small></h3>"
															+ "<h3> <spring:message code='home.auto.nombre'/><small> "
															+ data.nombre
															+ " </small></h3>"
															+ "<h3> <spring:message code='home.auto.pasajeros'/><small> "
															+ data.pasajeros
															+ " </small></h3>"
															+ "<h3> <spring:message code='home.auto.precio'/><small> $"
															+ data.precio
															+ " </small></h3>"
															+ "<h3> <spring:message code='home.auto.tipo'/><small> "
															+ data.tipo
															+ " </small></h3>"
															+ "<h3> <spring:message code='home.auto.transmision'/><small> "
															+ data.transmision
															+ " </small></h3>"
															+ "<h3> <spring:message code='home.auto.aireAcondicionado'/><small> "
															+ data.aireAcondicionado
															+ " </small></h3>"
															+ "<h3> <spring:message code='home.auto.tipoAsiento'/><small> "
															+ data.tipoAsiento
															+ " </small></h3>"
															+ "<h3> <spring:message code='home.auto.radio'/><small> "
															+ data.radio
															+ " </small></h3>"
															+ "<h3> <spring:message code='home.auto.puertoUsb'/><small> "
															+ data.puertoUsb
															+ " </small></h3>"
															+ "<h3> <spring:message code='home.auto.camaraRetro'/><small> "
															+ data.camaraRetro
															+ " </small></h3>"
															+ "<h3> <spring:message code='home.auto.interCol'/><small> "
															+ data.interCol
															+ " </small></h3>"
															+ "<h3> <spring:message code='home.auto.cntrlVoz'/><small> "
															+ data.cntrlVoz
															+ " </small></h3>"
															+ "<h3> <spring:message code='home.auto.bluetooth'/><small> "
															+ data.bluetooth
															+ " </small></h3>"
															+ "<h3> <spring:message code='home.auto.encendidoAuto'/><small> "
															+ data.encendidoAuto
															+ " </small></h3>"
															+ "<h3> <spring:message code='home.auto.sistNav'/><small> "
															+ data.sistNav
															+ " </small></h3>"
															+ "<h3> <spring:message code='home.auto.seguroVehiculo'/><small> $"
															+ data.seguroVehiculo
															+ " </small></h3>"
															+ "<a target='_blank' href='<c:url value='/seguro/download/internal' />'><spring:message code='home.auto.politicas'/></a><br>"
															+ textDisponible);*/
								}
								//alert("Data: " + data );
								$(".modal-title").text(data.nombre);
								$(".col-sm2")
										.html(
												"<h3> <spring:message code='home.auto.categoria'/><small> "
														+ data.categoria
														+ " </small></h3>"
														+ "<h3> <spring:message code='home.auto.nombre'/><small> "
														+ data.nombre
														+ " </small></h3>"
														+ "<h3> <spring:message code='home.auto.pasajeros'/><small> "
														+ data.pasajeros
														+ " </small></h3>"
														+ "<h3> <spring:message code='home.auto.precio'/><small> $"
														+ data.precio
														+ " </small></h3>"
														+ "<h3> <spring:message code='home.auto.tipo'/><small> "
														+ data.tipo
														+ " </small></h3>"
														+ "<h3> <spring:message code='home.auto.transmision'/><small> "
														+ data.transmision
														+ " </small></h3>"
														+ "<h3> <spring:message code='home.auto.aireAcondicionado'/><small> "
														+ data.aireAcondicionado
														+ " </small></h3>"
														+ "<h3> <spring:message code='home.auto.tipoAsiento'/><small> "
														+ data.tipoAsiento
														+ " </small></h3>"
														+ "<h3> <spring:message code='home.auto.radio'/><small> "
														+ data.radio
														+ " </small></h3>"
														+ "<h3> <spring:message code='home.auto.puertoUsb'/><small> "
														+ data.puertoUsb
														+ " </small></h3>"
														+ "<h3> <spring:message code='home.auto.camaraRetro'/><small> "
														+ data.camaraRetro
														+ " </small></h3>"
														+ "<h3> <spring:message code='home.auto.interCol'/><small> "
														+ data.interCol
														+ " </small></h3>"
														+ "<h3> <spring:message code='home.auto.cntrlVoz'/><small> "
														+ data.cntrlVoz
														+ " </small></h3>"
														+ "<h3> <spring:message code='home.auto.bluetooth'/><small> "
														+ data.bluetooth
														+ " </small></h3>"
														+ "<h3> <spring:message code='home.auto.encendidoAuto'/><small> "
														+ data.encendidoAuto
														+ " </small></h3>"
														+ "<h3> <spring:message code='home.auto.sistNav'/><small> "
														+ data.sistNav
														+ " </small></h3>"
														+ "<h3> <spring:message code='home.auto.seguroVehiculo'/><small> $"
														+ data.seguroVehiculo
														+ " </small></h3>"
														+ "<a target='_blank' href='<c:url value='/seguro/download/internal' />'><spring:message code='home.auto.politicas'/></a><br>");
								$("btn-replace").html(textDisponible);
								$("#imgOne").attr(
										"src",
										"https://casa.com/auto/auto_" + data.id
												+ "_01.jpg");
								$("#imgTwo").attr(
										"src",
										"https://casa.com/auto/auto_" + data.id
												+ "_02.jpg");
								$("#imgThree").attr(
										"src",
										"https://casa.com/auto/auto_" + data.id
												+ "_03.jpg");

							},
							error : function(jqXHR, textStatus, errorThrown) {
								alert('error ' + errorThrown);
							}
						});
			}
		}

		function iniciaReserva(id) {
			if (id) {
				/* $("#loading-image").css('display', 'inline'); */
				var url = "<spring:url value="/reserva/iniciaReserva" />";
				$
						.ajax({
							url : url,
							data : {
								id : id
							},
							type : "GET",
							success : function(data) {
								/* 	$("#loading-image").css('display', 'none'); */
								if (data === 'true') {
									$(":submit").attr("disabled", true);
									$("#user-alert")
											.show()
											.html(
													"<spring:message code='create.message.usuarioExistente.parte1'/><strong> "
															+ username
															+ " </strong><spring:message code='create.message.usuarioExistente.parte2'/>");
								} else {
									$(":submit").removeAttr("disabled");
									$("#user-alert").hide().html("");
								}
								//alert("Data: " + data );
							}
						});
			}
		}
	</script>

</body>
</html>
