package com.proj.ecom_proj.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.proj.ecom_proj.model.ProductImages;
import com.proj.ecom_proj.model.Users;
import com.proj.ecom_proj.repo.UserRepo;
import com.proj.ecom_proj.service.CartService;
import com.proj.ecom_proj.service.ProductService;

@Controller
public class CartController {
	@Autowired
	private CartService service;
	@Autowired
	private ProductService pService;
    @Autowired
    private UserRepo uRepo;
	@GetMapping("/api/cart")
	@ResponseBody
	public int getCartCount(@AuthenticationPrincipal org.springframework.security.core.userdetails.User userDetails){
		if(userDetails != null) {
        List<CartItems> items =
                service.getCartItems(
                        userDetails.getUsername());
        return items != null ? items.size() : 0;
	}
		return 0;
	}
	
	@GetMapping("/cart")
	public String getCartItems(@AuthenticationPrincipal org.springframework.security.core.userdetails.User userDetails, Model model) {
	    if (userDetails == null) {
	        return "redirect:/login";
	    }
        String email = userDetails.getUsername();

        Users user = uRepo.findByEmail(email).orElse(null);
        model.addAttribute("user", user);
        
	    // 1. Fetch cart items
	    List<CartItems> items = service.getCartItems(userDetails.getUsername());
	    model.addAttribute("items", items);

	    // 2. Build a map of Product ID -> First Image URL
	    Map<Integer, String> productImageMap = new HashMap<>();
	    
	    for (CartItems item : items) {
	        int productId = item.getProduct().getId(); // Assuming CartItems has a getProduct() method
	        
	        // Fetch images for this specific product ID
	        List<ProductImages> images = pService.getProductImages(productId);
	        
	        if (images != null && !images.isEmpty()) {
	            // Put the first image URL into our map
	            productImageMap.put(productId, images.get(0).getImageUrl());
	        }
	    }
	    
	    // 3. Pass the map to the JSP
	    model.addAttribute("productImagesMap", productImageMap);

	    // Optional: Pass user data if your layout requires it


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
