package com.proj.ecom_proj.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.proj.ecom_proj.model.Product;
import com.proj.ecom_proj.model.Users;
import com.proj.ecom_proj.service.ProductService;

@RestController
@RequestMapping("/api")
public class ProductController {
	@Autowired
	private ProductService service;
	
	@GetMapping("/products")
	public List<Product> getAllProducts(){
		return service.getAllProducts();
	}
	@GetMapping("/products/{id}")
	public Product getProduct(@PathVariable int id) {
		return service.getProduct(id);
	}
	@PostMapping("/products")
	public String addProduct(@ModelAttribute Product product) {
	    service.addProduct(product); // Ensure this method exists in your service
	    return "redirect:/"; // Redirects back to home after adding
	}
	@PostMapping("/users")
	public Users registerUser(@ModelAttribute Users user) {
		return service.registerUser(user);
	}
	@DeleteMapping("/products/{id}")
	public void deleteProduct(@PathVariable int id) {
		service.deleteProduct(id);
	}
}
