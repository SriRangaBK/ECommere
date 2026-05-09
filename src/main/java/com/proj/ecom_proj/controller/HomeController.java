package com.proj.ecom_proj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.proj.ecom_proj.service.ProductService;

@Controller
public class HomeController {
    @Autowired
    private ProductService service;

    @GetMapping("/")
    public String home(Model model) {

        model.addAttribute("products", service.getAllProducts());
        model.addAttribute("categories", service.getAllCategories());

        return "home";
    }
    @GetMapping("/register")
    public String register(Model model) {
    	return "register";
    }
    @GetMapping("/add_product")
    public String addProductPage() {
        return "add_product"; // Maps to add_product.jsp
    }
    @GetMapping("/product/{id}")
    public String getProduct(@PathVariable int id, Model model) {

        model.addAttribute("product", service.getProduct(id));

        return "product";
    }
    
    @GetMapping("/category/{id}")
    public String getProducts(@PathVariable int id, Model model) {

        model.addAttribute("products", service.getProducts(id));
        model.addAttribute("categories", service.getAllCategories());
        return "products";
    }

}
