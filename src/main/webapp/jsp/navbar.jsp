 <!--
* Filename: settings.jsp
* Author: Pemching Kue
* 10/28/2020 
* Modified by: Pemching Kue
-->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
   
    <!-- Navbar -->
    <nav class="navbar navbar-expand-md navbar-dark" style="background-color: #0264d6; color: #fff; box-shadow: 0 .3rem .5rem rgba(0,0,0,0.30);">
        <a href="/dashboard" class="navbar-brand"><i class="fab fa-bitbucket"></i> DropBucket</a>

        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
            <div class="navbar-nav">

            </div>
            <div class="navbar-nav nav-item dropdown">
                <a href="#" class="nav-link" data-toggle="dropdown" style="color: #fff">
                
						<sec:authentication property="principal.fullName" />
						
                </a>
                <div class="dropdown-menu dropdown-menu-right shadow">
                    <a href="/settings" class="dropdown-item">Settings</a>
                    <a href="/logout" class="dropdown-item">Logout</a>
                </div>
            </div>
        </div>
    </nav>
	<!-- /Navbar -->