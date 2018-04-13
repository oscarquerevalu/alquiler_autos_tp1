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
<link href="<c:url value="/resources/css/jimgMenu.css"/>"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="<spring:url value="/resources/js/jquery.js" />"></script>
<script type="text/javascript"
	src="<spring:url value="/resources/js/jquery-ui.min.js" />"></script>
<script type="text/javascript"
	src="<spring:url value="/resources/js/jquery-easing-1.3.pack.js" />"></script>
<script type="text/javascript"
	src="<spring:url value="/resources/js/jquery-easing-compatibility.1.2.pack.js" />"></script>
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
				<div class="div-actions">
					<c:url var="logout_url" value="/logout?logout" />
					<a href="${logout_url}" class="btn btn-default btn-lg btn-logout">
						<span class="glyphicon glyphicon-log-out"></span> Logout
					</a>
				</div>
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
			<div class="row">
				<div class="col-sm-8">
					<div class="jimgMenu">
						<ul>
							<li class="auto1" onclick="autoFindbyId(1);"><a href="#nogo">Landscapes</a></li>
							<li class="auto2" onclick="autoFindbyId(2);"><a href="#nogo">People</a></li>
							<li class="auto3" onclick="autoFindbyId(3);"><a href="#nogo">Nature</a></li>
							<li class="auto4" onclick="autoFindbyId(4);"><a href="#nogo">Abstract</a></li>
							<li class="auto5" onclick="autoFindbyId(5);"><a href="#nogo">Urban</a></li>
						</ul>

					</div>
				</div>

				<div class="col-sm-3"">
					<div id="auto-info" style="display: none;" class="auto-info"></div>
					<div class="form-actions" style="display: none;">
						<c:url var="post_url" value="/reserva/inicia" />
						<form:form id="form-create" action="${post_url}"
							modelAttribute="auto" method="post" class="form-signin">
						</form:form>
						<%-- 						<form:hidden path="id" id="autoId"   /> --%>
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
				</div>
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

		function autoFindbyId(id) {
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
										textDisponible =  "<c:url var='edit_url' value='/reserva/iniciaReserva/"+ data.id + "' />"
										+ "<a href='${edit_url}' class='btn btn-lg btn-primary'><spring:message code='home.reserva.reservar'/></a>";
									}
									else {
										textDisponible ="<h1> <spring:message code='home.reserva.nodisponible'/></h1>";
									}
									
									$("#auto-info")
											.show()
											.html(
													"<h1> <spring:message code='home.auto.categoria'/><small> "
															+ data.categoria
															+ " </small></h1>"
															+ "<h1> <spring:message code='home.auto.nombre'/><small> "
															+ data.nombre
															+ " </small></h1>"
															+ "<h1> <spring:message code='home.auto.pasajeros'/><small> "
															+ data.pasajeros
															+ " </small></h1>"
															+ "<h1> <spring:message code='home.auto.precio'/><small> "
															+ data.precio
															+ " </small></h1>"
															+ "<h1> <spring:message code='home.auto.tipo'/><small> "
															+ data.tipo
															+ " </small></h1>"
															+ "<h1> <spring:message code='home.auto.transmision'/><small> "
															+ data.transmision
															+ " </small></h1>"
															+ textDisponible);
								}
								//alert("Data: " + data );
							},
							error : function(jqXHR, textStatus, errorThrown) {
								alert('error ' + errorThrown);
							}
						});
			}
		}
		
		function iniciaReserva(id){
  	 		if(id){
  	 			/* $("#loading-image").css('display', 'inline'); */
  	 			var url = "<spring:url value="/reserva/iniciaReserva" />";
      	 		 $.ajax({
      	 			url:url,
      	 			data: {id:id},
    				type : "GET",
      	 			success: function(data){
	      	 		/* 	$("#loading-image").css('display', 'none'); */
	      	 			if(data === 'true'){ 
	      	 				$(":submit").attr("disabled", true);
	      	 				$("#user-alert").show().html("<spring:message code='create.message.usuarioExistente.parte1'/><strong> " + username + " </strong><spring:message code='create.message.usuarioExistente.parte2'/>"  );
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
