<!--
* Filename: exceedfilesize.jsp
* Author: Pemching Kue
* 11/9/2020 
* Modified by: Pemching Kue
-->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="root" value="${pageContext.request.contextPath}" />
    
  <div class="modal fade" id="fileSizeExceedModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="false">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
      
        <div class="modal-header">
          <h3 class="modal-title" style="color: #495057;">Notice</h3>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        
        <div class="modal-body">Upload failed. One or more files exceed the maximum size limit of 50MB</div>
        
        <div class="modal-footer">
          <button class="btn btn-primary" type="button" data-dismiss="modal" aria-label="Close">
            OK
          </button>
        </div>
        
      </div>
    </div>
  </div>