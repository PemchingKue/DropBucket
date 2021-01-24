/**
 * 
 */
package com.springboot.dropbucket.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springboot.dropbucket.entities.User;
import com.springboot.dropbucket.repositories.UserRepository;

/**
 * @author PK
 *
 */
@Controller
public class RegisterController {

	@Autowired
	UserRepository repo;
	
	@PostMapping("/register")
	public String userRegister(User user) {
		
		User checkUser = repo.findByEmail(user.getEmail());
		
		if(checkUser == null) {
			
		    BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		    String encodedPassword = encoder.encode(user.getPassword());
		    user.setPassword(encodedPassword);
		    
		    repo.save(user);
		    
			return "login.jsp";
		}else {
			
			return "redirect:/failed-register?registererror=true";
			
		}
			    
	}
	
	@RequestMapping("/failed-register")
	public String failureLogin() {

		return "login.jsp";
	}
}
