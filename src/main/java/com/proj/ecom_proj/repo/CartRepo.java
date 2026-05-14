package com.proj.ecom_proj.repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.proj.ecom_proj.model.Cart;
import com.proj.ecom_proj.model.Users;
@Repository
public interface CartRepo extends JpaRepository<Cart, Integer>{
	Optional<Cart> findByUser(Users user);
}
