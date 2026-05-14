package com.proj.ecom_proj.repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.proj.ecom_proj.model.Orders;
import com.proj.ecom_proj.model.Users;

@Repository
public interface OrderRepo extends JpaRepository<Orders, Integer> {
	Optional<Orders> findByUser(Users user);
}
