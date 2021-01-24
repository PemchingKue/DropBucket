<!--
* Filename: register.jsp
* Author: Pemching Kue
* 10/16/2020 
* Modified by: Pemching Kue
-->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="root" value="${pageContext.request.contextPath}" />
    
<!-- Modal -->
        <div class="modal fade" id="signUpModal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
              
                <div class="modal-content" style="background-color: rgba(4, 26, 54, 0.9);
                border-radius: 0%;">

                <div class="modal-header">
                  <h3 class="modal-title" style="color: #fff;">Sign Up</h3>
                </div>

                <div class="modal-body">
                    <form action="/register" method="POST" oninput='confirm_password.setCustomValidity(confirm_password.value != password.value ? "Passwords do not match." : "")'>

                        <div class="form-group row">
                            <div class="col">
                              <input type="text" class="form-control form-control-lg" placeholder="First name" name="firstName" required>
                            </div>
                            <div class="col">
                              <input type="text" class="form-control form-control-lg" placeholder="Last name" name="lastName" required>
                            </div>
                        </div>

                        <div class="form-group">
                          <input type="email" class="form-control form-control-lg" placeholder="Email" name="email" required>
                        </div>

                        <div class="form-group">
                          <input type="password" class="form-control form-control-lg" placeholder="Password" name="password" minlength="6" required>
                        </div>

                        <div class="form-group">
                            <input type="password" class="form-control form-control-lg" placeholder="Confirm Password" name="confirm_password" minlength="6" required>
                        </div>
					
                        <hr style="height:1px; border:none; background-color:#dee2e6;"></hr>

                        <div>
                        	<p><input type="submit" value="Sign Up" class="btn btn-primary btn-lg btn-block"></p>
                        </div>
                        

                      </form>
                </div>

            </div>
          </div>
       </div>
    
    