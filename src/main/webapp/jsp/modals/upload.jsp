<!--
* Filename: upload.jsp
* Author: Pemching Kue
* 11/5/2020 
* Modified by: Pemching Kue
-->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="root" value="${pageContext.request.contextPath}" />
    
<!-- Modal -->
        <div class="modal fade" id="uploadModal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
              
                <div class="modal-content">

                <div class="modal-header">
                  <h3 class="modal-title" style="color: #495057;">Upload</h3>
                </div>

                <div class="modal-body">
                    
                <form method="POST" action="/upload" enctype="multipart/form-data">
                
					<input type="file" class="form-control-file" name="files" multiple required /><br/><br/>
    				<input type="submit" class="btn btn-primary btn-sm mr-1" value="Submit" />
    				<button class="btn btn-primary btn-sm" type="button" data-dismiss="modal" aria-label="Close">
			            Cancel
			        </button>
				</form>
				
                </div>

            </div>
          </div>
       </div>
    
    