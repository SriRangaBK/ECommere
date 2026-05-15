package com.proj.ecom_proj.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.proj.ecom_proj.model.Cart;
import com.proj.ecom_proj.model.CartItems;
import com.proj.ecom_proj.service.CartService;

@Controller
public class CartController {
	@Autowired
	private CartService service;
	@GetMapping("/cart")
	public String getCartItems(@AuthenticationPrincipal org.springframework.security.core.userdetails.User userDetails,Model model) {
		List<CartItems> items = service.getCartItems(userDetails.getUsername());
		model.addAttribute("items",items);
		return "cart";
	}
	@PostMapping("/cart/add/{productId}")
	@ResponseBody
	public String addToCart(
	        @PathVariable int productId,
	        @AuthenticationPrincipal org.springframework.security.core.userdetails.User userDetails) {

	   service.addToCart(productId, userDetails.getUsername());

	    return "Added to cart";
	}
	
	@DeleteMapping("/cart/delete/{productId}")
	public ResponseEntity<String> deleteFromCart(
	        @PathVariable int productId,
	        @AuthenticationPrincipal org.springframework.security.core.userdetails.User userDetails
	) {
	    service.deleteFromCart(productId, userDetails.getUsername());
	    return ResponseEntity.ok("Removed from cart");
	}
}
