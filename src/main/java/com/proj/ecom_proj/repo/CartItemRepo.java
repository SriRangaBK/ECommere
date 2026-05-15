package com.proj.ecom_proj.repo;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.proj.ecom_proj.model.Cart;
import com.proj.ecom_proj.model.CartItems;
import com.proj.ecom_proj.model.Product;
@Repository
public interface CartItemRepo extends JpaRepository<CartItems, Integer> {
	Optional<CartItems> findByCartAndProduct(Cart cart, Product product);
	
	 List<CartItems> findByCart(Cart cart);
}
