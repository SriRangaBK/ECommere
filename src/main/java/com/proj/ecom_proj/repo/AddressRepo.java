package com.proj.ecom_proj.repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.proj.ecom_proj.model.Address;
import com.proj.ecom_proj.model.Users;

@Repository
public interface AddressRepo extends JpaRepository<Address, Integer> {
	 Optional<Address> findByUser(Users user);
}
