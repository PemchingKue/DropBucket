<!--
* Filename: login.jsp
* Author: Pemching Kue
* 10/27/2020 
* Modified by: Pemching Kue
-->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Login</title>

<!-- Custom fonts for this template-->
	<link href="${root}/vendors/fontawesome-5.15.1/css/all.min.css" rel="stylesheet"
		type="text/css">
	
	<!-- BootStrap -->
	<link href="${root}/bootstrap/bootstrap.min.css" rel="stylesheet" />
	<script src="${root}/bootstrap/jquery-3.5.1.js"></script>
	<script src="${root}/bootstrap/bootstrap.min.js"></script>
	
	<!-- Custom styles for this template-->
	<link href="${root}/css/login.css" rel="stylesheet">

</head>
<body>

    <div class="main">

        <div class="container">
                <div class="middle">

                    <div class="logo">
                        <i class="fab fa-bitbucket"></i><span> DropBucket</span>
                    </div>

                    <div class="card shadow-lg mb-4">
                        <div class="card-body">
                            <form action="/perform_login" method="POST">
                                <div class="form-group">
                                  <input type="email" class="form-control form-control-lg" placeholder="Email" name="email" required>
                                </div>

                                <div class="form-group">
                                  <input type="password" class="form-control form-control-lg" placeholder="Password" name="password" minlength="6" required>
                                </div>

                                <div>
                                    <p><input type="submit" value="Login" class="btn btn-primary btn-lg btn-block"></p>
                                </div>
                                
                                <c:if test="${param.error != null}">
						            <p style="color:red">
						                Your login attempt was not successful, please try again.
						                <br /> Reason: <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />.
						            </p>
        						</c:if>
        						
                                <c:if test="${param.registererror != null}">
						            <p style="color:red">
						                Registration attempt was not successful, please try again.<br /> Reason: Email already exist.
						            </p>
        						</c:if>
        						
                                <hr style="height:1px; border:none; background-color:#fff;"></hr>
                                <div>
                                    <p><button type="button" class="btn btn-success btn-lg btn-block "data-toggle="modal" data-target="#signUpModal">Create New Account</button></p>
                                </div>

                              </form>
                          </div>
                    </div>

                </div>                    
            </div>


    </div>

  <!-- Modals -->
  <%@include file = "./modals/register.jsp" %>
  
</body>
</html>