package com.proj.ecom_proj.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.proj.ecom_proj.model.Address;
import com.proj.ecom_proj.model.Users;
import com.proj.ecom_proj.repo.AddressRepo;
import com.proj.ecom_proj.repo.UserRepo;

@Service
public class UserService {
	@Autowired
	private UserRepo uRepo;	
	@Autowired
	private AddressRepo addrRepo;	
    @Autowired
    private BCryptPasswordEncoder encoder;
    
    public void registerUser(Users user) {

        String hashedPassword =
                encoder.encode(user.getPasswordHash());

        user.setPasswordHash(hashedPassword);

        uRepo.save(user);
    }

    public void saveAddress(Address address, String email) {

        Users user = uRepo.findByEmail(email).orElse(null);
        Address existing = addrRepo.findByUser(user).orElse(null);
        if (existing == null) {
            address.setUser(user);

            addrRepo.save(address);
        }
        else {
        	existing.setStreet(address.getStreet());
            existing.setCity(address.getCity());
            existing.setState(address.getState());
            existing.setCountry(address.getCountry());
            existing.setPincode(address.getPincode());
            existing.setPhone(address.getPhone());
            existing.setDefault(address.isDefault());

            addrRepo.save(existing);
        }

    }
}
