package com.proj.ecom_proj.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.proj.ecom_proj.model.OrderItems;

@Repository
public interface OrderItemsRepo extends JpaRepository<OrderItems, Integer>{
	List<OrderItems> findByOrderId(int orderId);
}
