package com.proj.ecom_proj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.proj.ecom_proj.model.Address;
import com.proj.ecom_proj.model.Users;
import com.proj.ecom_proj.service.UserService;

@Controller
@RequestMapping("/api")
public class UserController {
	@Autowired
	private UserService service;
	@PostMapping("/users")
	public String registerUser(@ModelAttribute Users user) {
		 service.registerUser(user);
		 return "redirect:/";
	}
	@PostMapping("/users/address")
	public String saveAddress(
	        @ModelAttribute Address address,
	        @AuthenticationPrincipal org.springframework.security.core.userdetails.User userDetails) {

	    service.saveAddress(address, userDetails.getUsername());

	    return "redirect:/profile";
	}

}
