<!--
* Filename: dashboard.jsp
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
    
    	<nav class="navbar navbar-expand-lg navbar-light border-bottom justify-content-between">
			<h3 style="color: #495057;">Bucket</h3>
			
				<div class="navbar-nav nav-item">

					<button type="button" class="btn btn-primary btn-sm mr-1" data-toggle="modal" data-target="#uploadModal">Upload</button>
					
					<button type="button" class="btn btn-primary btn-sm mr-1" id="download">Download</button>
					<button type="button" class="btn btn-primary btn-sm" id="delete">Delete</button>

				</div>


      	</nav>
      	
			<div class="container-fluid">
			
	            <div class="row ml-3 mb-3" id="cardList">
<!--  	                <div class="card mt-4 mr-4 shadow" style="width: 227.4px;">
	
	                  <div class="card-body p-5">
	                    <i class="fas fa-file-download fa-4x" style="text-align: center; width: 100%; color: #495057;"></i>
	                  </div>
	  
	                  <div class="card-footer" style="text-align: center;">
	                    PemchingKue.pdf
	                  </div>
	
	                </div>  -->
	            </div>
	            
	        </div>
	            
			</div>
        <!-- /#page-content-wrapper -->
    
      </div>
      <!-- /#wrapper -->

  <!-- Modals -->
  <%@include file = "./modals/upload.jsp" %>
  <%@include file = "./modals/uploadsuccess.jsp" %>
  <%@include file = "./modals/downloadcheck.jsp" %>
  <%@include file = "./modals/deletecheck.jsp" %>
  <%@include file = "./modals/deletesuccess.jsp" %>
  <%@include file = "./modals/exceedfilesize.jsp" %>
  
	<c:if test="${param.uploadsuccess == true}">
		<script>uploadSuccess();</script>
	</c:if>  
	
	<c:if test="${param.exceedfilesize == true}">
		<script>fileSizeExceed();</script>
	</c:if>  
</body>
</html>