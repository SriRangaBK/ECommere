package com.proj.ecom_proj.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

import com.proj.ecom_proj.model.Users;
import com.proj.ecom_proj.repo.UserRepo;

@Service
public class CustomUserDetailsService
        implements UserDetailsService {

    @Autowired
    private UserRepo repo;

    @Override
    public UserDetails loadUserByUsername(
            String email)
            throws UsernameNotFoundException {

        Users user = repo.findByEmail(email)
            .orElseThrow(() ->
                new UsernameNotFoundException("User not found"));
        System.out.println("FOUND USER: " + user.getEmail());
        System.out.println("LOGIN EMAIL: " + email);
        return User.builder()
                .username(user.getEmail())
                .password(user.getPasswordHash())
                .roles(user.getRole())
                .build();
    }
}