<%@page import="pe.com.alquilerautorara.model.UserInfo.Role"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>

<html lang="es-pe">
    <head>
       <meta charset="UTF-8">
        <title><spring:message code="create.title"/></title>
      	<link href="<spring:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
        <link href="<spring:url value="/resources/css/AdminLTE.css" />" rel="stylesheet">
      	<!-- <link href="<spring:url value="/resources/css/geral.css" />" rel="stylesheet">-->
        <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>

        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>AdminLTE 2 | Registration Page</title>
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

    <body class="hold-transition register-page">
      <div class="register-box">
        <div class="register-logo">
          <a href="../../index2.html"><b>Autos</b>RARA</a>
        </div>

        <a href="?lang=en"><img alt="English" src="<spring:url value="/resources/images/eua.jpg" />"></a>
        <a href="?lang=es_PE"><img alt="Español" src="<spring:url value="/resources/images/peru.jpeg" />"></a>
        <a href="?lang=pt_BR"><img alt="Portugues" src="<spring:url value="/resources/images/brasil.jpeg" />"></a>
        
        <div class="register-box-body">
        	
        	<p class="login-box-msg">Register a new membership</p>

        	<c:url var="post_url" value="/user/create/save" />
        	
    		<form:form id="form-create" action="${post_url}" modelAttribute="userInfo" method="post" class="form-signin">
    			<h2 class="form-signin-heading"><spring:message code="create.title"/></h2>
    			<c:if test="${param.message != null}">
    			<span class="alert alert-success alert-warning-login" >${param.message}</span>
    			</c:if>
    			<c:if test="${not empty message}"><div class="message green">${message}</div></c:if>
    			<form:hidden path="id"/>
            
	            <div class="form-group has-feedback">          
	      				<form:errors path="name" element="div" class="alert alert-warning" />
	      				<spring:message code="create.input.name" var="nameLabel"/>
	      				<form:input type="text" path="name" class="form-control" placeholder="${nameLabel}" required="true" autofocus="true"/>
	              <span class="glyphicon glyphicon-user form-control-feedback"></span>
	            </div>

	            <div class="form-group has-feedback">
	      				<form:errors path="documento" element="div" class="alert alert-warning" />
	      				<spring:message code="create.input.documento" var="documentoLabel"/>
	      				<form:input path="documento" class="form-control" placeholder="${documentoLabel}" required="true"/>
	      				<span class="glyphicon glyphicon-credit-card form-control-feedback"></span>
	            </div>

	            <div class="form-group has-feedback">
	              		<div id="user-alert" style="display: none;" class="alert alert-warning">
	  				    </div>
	              		<form:errors path="username" element="div" class="alert alert-teste alert-warning "/>
	              		<spring:message code="create.input.username" var="usernameLabel"/>
	      				<form:input path="username"  class="form-control" placeholder="${usernameLabel}" required="true" onblur="checkUsernameExist(this.value)"/>
	      				<span class="glyphicon glyphicon-eye-open form-control-feedback"></span>
	            </div>
	
	            <div class="form-group has-feedback">
	      				<form:errors path="birthdate" element="div" class="alert alert-warning" />
	      				<spring:message code="create.input.birthdate" var="birthdateLabel"/>
	      				<form:input path="birthdate" readonly="readonly" id="birthdate-input" class="form-control" placeholder="${birthdateLabel}" required="true"/>
	      				<span class="glyphicon glyphicon-gift form-control-feedback"></span>
	            </div>

	            <div class="form-group has-feedback">
	      				<form:errors path="telefono" element="div" class="alert alert-warning" />
	      				<spring:message code="create.input.telefono" var="telefonoLabel"/>
	      				<form:input path="telefono" class="form-control" placeholder="${telefonoLabel}" required="true"/>
	      				<span class="glyphicon glyphicon-phone form-control-feedback"></span>
	            </div>

	            <div class="form-group has-feedback">
	      				<div id="email-alert" style="display: none;" class="alert alert-warning">
	      				</div>
	      				<form:errors path="email" element="div" class="alert alert-warning" />
	      				<spring:message code="create.input.email" var="emailLabel"/>
	      				<form:input type="email" path="email" class="form-control" placeholder="${emailLabel}" required="true" onblur="checkEmailExist(this.value)"/>
	              		<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
	            </div>

	            <div class="form-group has-feedback">
	      				<form:errors path="direccion" element="div" class="alert alert-warning" />
	      				<spring:message code="create.input.direccion" var="direccionLabel"/>
	      				<form:input path="direccion" class="form-control" placeholder="${direccionLabel}" required="true"/>
	      				<span class="glyphicon glyphicon-home form-control-feedback"></span>
	            </div>
            
	            <div class="form-group has-feedback">
	      				<form:errors path="password" element="div" class="alert alert-warning"/>
	      				<spring:message code="create.input.password" var="passwordLabel"/>
	      				<form:password id="password" path="password" onblur="checkPasswords()" class="form-control" placeholder="${passwordLabel}" required="true"/>
	      				<span class="glyphicon glyphicon-lock form-control-feedback"></span>
	            </div>
	            
	            <div class="form-group has-feedback">
	              <div id="password-alert" style="display: none;" class="alert alert-warning">
	      				</div>
	              
	      				<spring:message code="create.input.confirmpassword" var="confirmPasswordLabel"/>
	      				<input type="password" id="confirm-password" onblur="checkPasswords()" name="confirmarSenha" class="form-control" placeholder="${confirmPasswordLabel}" required="required"/>
	              <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
	            </div>
	            
	            <!--<div class="row">
			        <div class="col-xs-8">
			          <div class="checkbox icheck">
			            <label>
			              <input type="checkbox"> I agree to the <a href="#">terms</a>
			            </label>
			          </div>
			        </div>
		      	</div>-->
		      	
		      	

				
				<form:errors path="role" element="div" class="alert alert-warning"/>
				<c:forEach items="<%= Role.values() %>" var="role">
					<spring:message code="userInfo.role.${role.name()}" var="label"/>
					<form:radiobutton path="role" value="${role}" label="${label}" required="true"/>&nbsp
				</c:forEach>
				
		      	<div class="row">
		      	
                	<div class="col-xs-8">
                          <div class="checkbox icheck">
                            <label>
                              <input type="checkbox">I agree to the <a href="#">terms</a>
                            </label>
                          </div>
                	</div>
                        <!-- /.col -->
                        <div class="col-xs-4">
                          	<button type="submit" id="btn-salvar" class="btn btn-primary btn-block btn-flat"><spring:message code="create.input.cadastra"/></button>
                          	<sec:authorize access="isAnonymous()" var="usuarioDeslogado"/>
                        </div>
                        <!-- /.col -->
                </div>				
				
				
				
				<!--<div class="form-actions">
					<button type="submit" id="btn-salvar" class="btn btn-lg btn-primary btn-block"><spring:message code="create.input.cadastra"/></button>
					<sec:authorize access="isAnonymous()" var="usuarioDeslogado"/>
					<c:choose>
					    <c:when test="${usuarioDeslogado}">
							<c:url var="login_url" value="/login" />
							<a href="${login_url}" class="btn btn-lg btn-primary btn-block"><spring:message code="login.title"/></a>
					    </c:when>    
					    <c:otherwise>
							<c:url var="home_url" value="/" />
							<a href="${home_url}" class="btn btn-lg btn-primary btn-block"><spring:message code="create.input.voltar"/></a> 
					    </c:otherwise>
					</c:choose>
				</div>-->
				

				
			</form:form>
			
				<div class="social-auth-links text-center">
			      <p>- OR -</p>
			      <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign up using
			        Facebook</a>
			      <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign up using
			        Google+</a>
			    </div>
			
			    <a href="${login_url}" class="text-center">I already have a membership</a>
		    
		 </div>
			
			
	      	<script type="text/javascript" src="<spring:url value="/resources/js/jquery.js" />"></script>
	      	<script type="text/javascript" src="<spring:url value="/resources/js/jquery-ui.min.js" />"></script>
	      	<script type="text/javascript">
	    	  	$( document ).ready(function() {
		      		var date = new Date();
		      	    $( "#birthdate-input" ).datepicker({ 
		      	      yearRange: date.getFullYear() - 150 + ":" +  date.getFullYear(),
		      	      changeMonth: true,
		      	      changeYear: true, 
		      	      maxDate: "+0 +0",
		      	      dateFormat: "dd/mm/yy",
		      	    }).attr('readonly','readonly');
		      	});
	      	 	
	    	  	$('#form-create').submit(function() {
	      		  return checkPasswords();
	      		});
	      	 	 
	      	 	function checkPasswords() {
	      	 		 var password = $("#password").val();
	      	 		 var confirmPassword = $("#confirm-password").val();
	      	 		 if(password && confirmPassword && password == confirmPassword){
	      	 			 $("#password-alert").hide().html("");
	      	 			 return true;
	      	 		 } else if(password && confirmPassword && password != confirmPassword){
	      	 			 $("#password-alert").show().html("<spring:message code='create.message.senhasIguais'/>");
	      	 			 return false;
	      	 		 } else {
	      	 			 $("#password-alert").hide().html("");
	      	 			 return false;
	      	 			 
	      	 		 }
	      	 	 }
	      	 	
	      	 	function checkUsernameExist(username){
	      	 		if(username){
	      	 			/* $("#loading-image").css('display', 'inline'); */
	      	 			var url = "<spring:url value="/user/checkusername" />";
		      	 		 $.ajax({
		      	 			url:url,
		      	 			data: {username:username},
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

	      	 	function checkEmailExist(email){
	      	 		if(email){
	      	 			/* $("#loading-image").css('display', 'inline'); */
	      	 			var url = "<spring:url value="/user/checkemail" />";
		      	 		 $.ajax({
		      	 			url:url,
		      	 			data: {email:email},
		    				type : "GET",
		      	 			success: function(data){
			      	 		/* 	$("#loading-image").css('display', 'none'); */
			      	 			if(data === 'true'){ 
			      	 				$(":submit").attr("disabled", true);
			      	 				$("#email-alert").show().html("<spring:message code='create.message.emailExistente.parte1'/><strong> " + email + " </strong><spring:message code='create.message.emailExistente.parte2'/>"  );
			      	 			} else {
				      	 		    $(":submit").removeAttr("disabled");
			      	 				$("#email-alert").hide().html("");
			      	 			}
		      	 	        	//alert("Data: " + data );
		      	 			} 
		      	 	    });
	      	 		}
	      	 	}
	      	</script>
      	
      </div>
      
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
