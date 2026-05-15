package com.proj.ecom_proj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;


import com.proj.ecom_proj.model.Orders;
import com.proj.ecom_proj.service.OrderService;

@Controller

public class OrderController {
	@Autowired
    private OrderService orderService;

    @PostMapping("/orders//place")
    public String placeOrder(
            @AuthenticationPrincipal org.springframework.security.core.userdetails.User userDetails) {

        Orders order = orderService.placeOrder(userDetails.getUsername());

        return "redirect:/profile";
    }
    @GetMapping("/profile/invoice/{id}")
    public ResponseEntity<byte[]> downloadInvoice(@PathVariable int id) {

        byte[] pdf = orderService.generateInvoice(id);

        return ResponseEntity.ok()
                .header("Content-Disposition", "attachment; filename=invoice_" + id + ".pdf")
                .contentType(MediaType.APPLICATION_PDF)
                .body(pdf);
}
}