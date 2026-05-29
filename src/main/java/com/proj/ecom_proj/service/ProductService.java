package com.proj.ecom_proj.service;

import java.util.List;

import org.jspecify.annotations.Nullable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.proj.ecom_proj.model.Category;
import com.proj.ecom_proj.model.Product;
import com.proj.ecom_proj.model.ProductImages;
import com.proj.ecom_proj.model.Users;
import com.proj.ecom_proj.repo.CategoryRepo;
import com.proj.ecom_proj.repo.ProductImagesRepo;
import com.proj.ecom_proj.repo.ProductRepo;
import com.proj.ecom_proj.repo.UserRepo;

@Service
public class ProductService {
	
	@Autowired
	private ProductRepo repo;
	@Autowired
	private CategoryRepo cRepo;
	@Autowired
	private ProductImagesRepo pRepo;

    
	public List<Product> getAllProducts(){

	    Pageable limit = PageRequest.of(0, 60);

	    return repo.findAll(limit).getContent();
	}

	public Product getProduct(int id) {
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

	public List<Category> getCategory() {
		
		return null;
	}

	public List<Category> getAllCategories() {
		return cRepo.findAll();
	}

	public List<Product> getProducts(int id) {
		Category cat = cRepo.findById(id).orElse(new Category());
		return cat.getProducts();
			
	}

	public List<ProductImages> getProductImages(int id) {
		return pRepo.findByProduct_Id(id);
	}
}
