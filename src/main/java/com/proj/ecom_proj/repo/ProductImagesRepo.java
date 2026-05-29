package com.proj.ecom_proj.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.proj.ecom_proj.model.Product;
import com.proj.ecom_proj.model.ProductImages;
@Repository
public interface ProductImagesRepo extends JpaRepository<ProductImages, Integer> {
	List<ProductImages> findByProduct_Id(int id);
}
