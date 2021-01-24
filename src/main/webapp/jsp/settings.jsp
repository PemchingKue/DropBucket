<!--
* Filename: settings.jsp
* Author: Pemching Kue
* 10/18/2020 
* Modified by: Pemching Kue
-->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>DashBoard</title>

<!-- Custom fonts for this template-->
	<link href="${root}/vendors/fontawesome-5.15.1/css/all.min.css" rel="stylesheet"
		type="text/css">
	
	<!-- BootStrap -->
	<link href="${root}/bootstrap/bootstrap.min.css" rel="stylesheet" />
	<script src="${root}/bootstrap/jquery-3.5.1.js"></script>
	<script src="${root}/bootstrap/bootstrap.min.js"></script>
	<script src="${root}/js/bucket.js"></script>
	
	<!-- Custom styles for this template-->
	<link href="${root}/css/main.css" rel="stylesheet">
	
</head>
<body>

	<!-- NavBar -->
	<%@include file = "./navbar.jsp" %>

    <div class="d-flex" id="wrapper">

        <!-- Sidebar -->
		<%@include file = "./sidebar.jsp" %>
    
        <!-- Page Content -->
        <div id="page-content-wrapper">
    
    	<nav class="navbar navbar-expand-lg navbar-light border-bottom">
			<h3 style="color: #495057;">Settings</h3>
			
      	</nav>
      
          <div class="container-fluid">

			<div class="card mt-4 shadow" style="width: 30%;">

              <div class="card-header">
                <h5 style="color: #495057;">Change Password</h5>
              </div>

              <div class="card-body">
                
                <form action="/cpassword" method="POST" oninput='confirm_password.setCustomValidity(confirm_password.value != newpassword.value ? "Passwords do not match." : "")'>
                  <div class="form-group">
                    <label>Old Password</label>
                    <input type="password" class="form-control" name="oldpassword" required>
                  </div>
                  <div class="form-group">
                    <label>New Password</label>
                    <input type="password" class="form-control" name="newpassword" minlength="6" required>
                  </div>
                  <div class="form-group">
                    <label>Confirm New Password</label>
                    <input type="password" class="form-control" name="confirm_password" minlength="6" required>
                  </div>
                  <c:if test="${param.cpasserror != null}">
					<p style="color:red">
						Change password was not successful.<br /> Reason: Old password incorrect.
					</p>
        		  </c:if>
                  <button type="submit" class="btn btn-primary">Submit</button>
                </form>

              </div>

           </div>


          </div>
        </div>
        <!-- /#page-content-wrapper -->
    
      </div>
      <!-- /#wrapper -->
      
    <!-- Modals -->
	<%@include file = "./modals/passchangesuccess.jsp" %>

	<c:if test="${param.successpass == true}">
		<script>cPassSuccess();</script>
	</c:if>  

</body>
</html>