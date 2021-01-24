/**
 * 
 */
package com.springboot.dropbucket.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author PK
 *
 */
@Controller
public class LoginController {

	@GetMapping("/")
	public String login() {
		return "login.jsp";
	}

	@RequestMapping("/dashboard")
	public String successLogin() {
		return "dashboard.jsp";
	}

	@RequestMapping("/failed-login")
	public String failureLogin() {

		return "login.jsp";
	}
	
}
