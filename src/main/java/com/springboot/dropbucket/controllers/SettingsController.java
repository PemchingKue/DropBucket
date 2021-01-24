/**
 * 
 */
package com.springboot.dropbucket.controllers;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.dropbucket.entities.User;
import com.springboot.dropbucket.repositories.UserRepository;
import com.springboot.dropbucket.security.CustomUserDetails;

/**
 * @author PK
 *
 */
@Controller
public class SettingsController {

	@Autowired
	UserRepository repo;
		
	@RequestMapping("/settings")
	public String settings() {
		return "settings.jsp";
	}
	
	@PostMapping("/cpassword")
	public String changePassword(@RequestParam("oldpassword") String oldpassword, @RequestParam("newpassword") String newpassword) {
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		String oldPass = oldpassword;
		String newPass = encoder.encode(newpassword);
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		CustomUserDetails customUser = (CustomUserDetails)authentication.getPrincipal();
		int userId = customUser.getUserId();
		
		Optional<User> user = repo.findById(userId);
		
		if(encoder.matches(oldPass, user.get().getPassword()) == true) {
			
			user.get().setPassword(newPass);
			repo.save(user.get());
			
			return "redirect:/settings?successpass=true";
			
		}else {
			
			return "redirect:/settings?cpasserror=true";
		}
		
	}
	
}
