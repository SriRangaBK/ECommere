package com.proj.ecom_proj.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.proj.ecom_proj.model.Category;

@Repository
public interface CategoryRepo extends JpaRepository<Category, Integer> {

}
