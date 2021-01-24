<!--
* Filename: sidebar.jsp
* Author: Pemching Kue
* 10/28/2020 
* Modified by: Pemching Kue
-->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

        <!-- Sidebar -->
        <div class="bg-light border-right" id="sidebar-wrapper">
          <div class="list-group list-group-flush">
            <a href="/dashboard" class="list-group-item list-group-item-action bg-light" style="border: 0px; position: static;">
              
              <i class="fab fa-bitbucket"></i><span class="ml-2">Bucket</span>
            
            </a>
            <a href="/settings" class="list-group-item list-group-item-action bg-light" style="border: 0px;">

              <i class="fas fa-cogs"></i><span class="ml-1">Settings</span>

            </a>
          </div>
        </div>
        <!-- /Sidebar-->

