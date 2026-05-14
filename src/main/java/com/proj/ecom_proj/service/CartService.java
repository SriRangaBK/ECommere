package com.proj.ecom_proj.service;



import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.ecom_proj.model.Cart;
import com.proj.ecom_proj.model.CartItems;
import com.proj.ecom_proj.model.Product;
import com.proj.ecom_proj.model.Users;
import com.proj.ecom_proj.repo.AddressRepo;
import com.proj.ecom_proj.repo.CartItemRepo;
import com.proj.ecom_proj.repo.CartRepo;
import com.proj.ecom_proj.repo.ProductRepo;
import com.proj.ecom_proj.repo.UserRepo;

@Service
public class CartService {
	@Autowired
	private UserRepo uRepo;
	@Autowired
	private ProductRepo prodRepo;	
	@Autowired
	private CartRepo cartRepo;	
	@Autowired
	private CartItemRepo itemRepo;	
	public List<CartItems> getCartItems(String email) {

	    Users user = uRepo.findByEmail(email)
	            .orElseThrow(() -> new RuntimeException("User not found"));

	    Cart cart = cartRepo.findByUser(user).orElse(null);

	        return cart.getItems();
	    }
	public void addToCart(int productId, String email) {

	    Users user = uRepo.findByEmail(email).get();

	    Cart cart = cartRepo.findByUser(user).get();

	    Product product = prodRepo.findById(productId).get();

	    Optional<CartItems> existingItem =
	            itemRepo.findByCartAndProduct(cart, product);

	    if(existingItem.isPresent()) {

	        CartItems item = existingItem.get();

	        item.setQuantity(item.getQuantity() + 1);

	        itemRepo.save(item);

	    } else {

	        CartItems item = new CartItems();

	        item.setCart(cart);
	        item.setProduct(product);
	        item.setQuantity(1);

	        itemRepo.save(item);
	    }
		
	}
	public void deleteFromCart(int productId, String email) {
		 Users user = uRepo.findByEmail(email)
		            .get();

		    Cart cart = cartRepo.findByUser(user)
		            .get();
		    Product product = prodRepo.findById(productId)
		            .get();
		    CartItems item = itemRepo.findByCartAndProduct(cart,product).get();
		    itemRepo.delete(item);
	}
	}

