package com.proj.ecom_proj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.ecom_proj.model.Product;
import com.proj.ecom_proj.repo.ProductRepo;

@Service
public class ProductService {
	
	@Autowired
	private ProductRepo repo;
	
	public List<Product> getAllProducts(){
		return repo.findAll();
	}

	public Product getProduct(int id) {
		// TODO Auto-generated method stub
		return repo.findById(id).orElse(new Product());
	}

	public void addProduct(Product product) {
		// TODO Auto-generated method stub
		repo.save(product);
		
	}

	public void deleteProduct(int id) {
		Product p = repo.findById(id).orElse(new Product());
		repo.delete(p);
		
	}
}
