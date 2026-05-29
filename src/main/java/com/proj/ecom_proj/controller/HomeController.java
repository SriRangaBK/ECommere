package com.proj.ecom_proj.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.proj.ecom_proj.model.Address;
import com.proj.ecom_proj.model.CartItems;
import com.proj.ecom_proj.model.OrderItems;
import com.proj.ecom_proj.model.Orders;
import com.proj.ecom_proj.model.Users;
import com.proj.ecom_proj.repo.AddressRepo;
import com.proj.ecom_proj.repo.OrderRepo;
import com.proj.ecom_proj.repo.UserRepo;
import com.proj.ecom_proj.service.CartService;
import com.proj.ecom_proj.service.OrderService;
import com.proj.ecom_proj.service.ProductService;
import com.proj.ecom_proj.service.UserService;

@Controller
public class HomeController {
    @Autowired
    private ProductService service;
	@Autowired
	private CartService cService;
    @Autowired
    private UserRepo uRepo;
    @Autowired
    private AddressRepo addrRepo;
    @Autowired
    private OrderRepo oRepo;
    @Autowired
    private OrderService oService;
    @GetMapping("/")
    public String home(Model model,
            @AuthenticationPrincipal org.springframework.security.core.userdetails.User userDetails) {
    	int cartSize = 0;
        if (userDetails != null) {
            String email = userDetails.getUsername();

            Users user = uRepo.findByEmail(email).orElse(null);
            model.addAttribute("user", user);
        
        List<CartItems> items =
                cService.getCartItems(
                        userDetails.getUsername());
        cartSize = items.size();
        }
        model.addAttribute("cartSize",cartSize);
        model.addAttribute("products", service.getAllProducts());
        model.addAttribute("categories", service.getAllCategories());

        return "home";
    }
    @GetMapping("/register")
    public String register(Model model) {
    	return "register";
    }
    
    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }
    @GetMapping("/add_product")
    public String addProductPage() {
        return "add_product"; // Maps to add_product.jsp
    }
    @GetMapping("/product/{id}")
    public String getProduct(@PathVariable int id, Model model, @AuthenticationPrincipal org.springframework.security.core.userdetails.User userDetails) {
        int cartSize = 0;
    	if (userDetails != null) {
            String email = userDetails.getUsername();

            Users user = uRepo.findByEmail(email).orElse(null);
            model.addAttribute("user", user);
            List<CartItems> items =
                    cService.getCartItems(
                            userDetails.getUsername());
            cartSize = items.size();
        }
    	model.addAttribute("cartSize",cartSize);
        model.addAttribute("product", service.getProduct(id));
        model.addAttribute("product_images",service.getProductImages(id));

        return "product";
    }
    
    @GetMapping("/category/{id}")
    public String getProducts(@PathVariable int id, Model model) {

        model.addAttribute("products", service.getProducts(id));
        model.addAttribute("categories", service.getAllCategories());
  
        return "products";
    }
    
    @GetMapping("/profile")
    public String getProfile(Model model,
            @AuthenticationPrincipal org.springframework.security.core.userdetails.User userDetails) {
    	Users user = uRepo.findByEmail(userDetails.getUsername()).orElse(null);
    	Address address = addrRepo.findByUser(user).orElse(null);
    	List<Orders> orders = oRepo.findByUser(user);
    	Map<Integer, List<OrderItems>> orderMap = new HashMap<>();
    	for(Orders order : orders) {
    	    orderMap.put(order.getId(), oService.getOrderItems(order.getId()));
    	}
    	model.addAttribute("orderMap", orderMap);
    	model.addAttribute("address", address);
    	model.addAttribute("user",user);
    	model.addAttribute("orders",orders);
		return "profile";
    	
    }
    
    @GetMapping("/checkout")
    public String checkout(
            Model model,
            @AuthenticationPrincipal
            org.springframework.security.core.userdetails.User userDetails) {

        Users user =
                uRepo.findByEmail(userDetails.getUsername())
                     .orElse(null);

        Address address =
                addrRepo.findByUser(user)
                        .orElse(null);

        List<CartItems> items =
                cService.getCartItems(
                        userDetails.getUsername());

        double subtotal =
                items.stream()
                     .mapToDouble(i ->
                         i.getProduct()
                          .getPrice()
                          .doubleValue()
                         * i.getQuantity())
                     .sum();

        double shipping = 50;
        double tax = subtotal * 0.18;      // 18% GST
        double grandTotal = subtotal + shipping + tax;

        model.addAttribute("user", user);
        model.addAttribute("address", address);
        model.addAttribute("items", items);
        model.addAttribute("subtotal", subtotal);
        model.addAttribute("shipping", shipping);
        model.addAttribute("tax", tax);
        model.addAttribute("grandTotal", grandTotal);
        return "checkout";
    }

}
