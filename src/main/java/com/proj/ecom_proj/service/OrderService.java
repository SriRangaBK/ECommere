package com.proj.ecom_proj.service;


import java.io.ByteArrayOutputStream;
import java.util.List;
import java.util.Optional;

import com.lowagie.text.Document;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Font;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.ecom_proj.model.OrderItems;
import com.proj.ecom_proj.model.Orders;
import com.proj.ecom_proj.model.Users;
import com.proj.ecom_proj.repo.AddressRepo;
import com.proj.ecom_proj.repo.CartItemRepo;
import com.proj.ecom_proj.repo.CartRepo;
import com.proj.ecom_proj.repo.OrderItemsRepo;
import com.proj.ecom_proj.repo.OrderRepo;
import com.proj.ecom_proj.repo.UserRepo;
import com.proj.ecom_proj.model.Address;
import com.proj.ecom_proj.model.Cart;
import com.proj.ecom_proj.model.CartItems;
import jakarta.transaction.Transactional;

@Service
public class OrderService {

    private final CartItemRepo cartItemRepo;

	@Autowired
    private UserRepo userRepo;

    @Autowired
    private CartRepo cartRepo;
    @Autowired
    private AddressRepo addressRepo;

    @Autowired
    private OrderRepo orderRepo;

    @Autowired
    private OrderItemsRepo itemsRepo;


	OrderService(CartItemRepo cartItemRepo) {
		this.cartItemRepo = cartItemRepo;
	}
	
	
	public List<OrderItems> getOrderItems(int id){ return itemsRepo.findByOrderId(id); }

	@Transactional
	public Orders placeOrder(String email) {

	    // 1. Get user
	    Users user = userRepo.findByEmail(email)
	            .orElseThrow(() -> new RuntimeException("User not found"));

	    // 2. Get cart
	    Cart cart = cartRepo.findByUser(user)
	            .orElseThrow(() -> new RuntimeException("Cart not found"));

	    // 3. Get cart items (DIRECT, not via CartService)
	    List<CartItems> cartItems = cartItemRepo.findByCart(cart);

	    if (cartItems.isEmpty()) {
	        throw new RuntimeException("Cart is empty");
	    }

	    // 4. Get address
	    Address address = addressRepo.findByUser(user)
	            .orElseThrow(() -> new RuntimeException("Address not found"));

	    // 5. Calculate totals
	    double subtotal = cartItems.stream()
	            .mapToDouble(i -> i.getProduct().getPrice().doubleValue() * i.getQuantity())
	            .sum();

	    double shipping = 50;
	    double tax = subtotal * 0.18;
	    double grandTotal = subtotal + shipping + tax;

	    // 6. Create order
	    Orders order = new Orders();
	    order.setUser(user);
	    order.setAddress(address);
	    order.setTotalAmount(grandTotal);
	    order.setOrderStatus("CONFIRMED");
	    order.setPaymentStatus("PAID");

	    Orders savedOrder = orderRepo.save(order);

	    // 7. Create order items
	    for (CartItems c : cartItems) {

	        OrderItems item = new OrderItems();
	        item.setOrder(savedOrder);
	        item.setProduct(c.getProduct());
	        item.setQuantity(c.getQuantity());
	        item.setPriceAtPurchase(c.getProduct().getPrice().doubleValue());

	        itemsRepo.save(item);
	    }

	    // 8. Clear cart
	    cartItemRepo.deleteAll(cartItems);

	    return savedOrder;
	}


	public byte[] generateInvoice(int id) {
		// TODO Auto-generated method stub
        try (ByteArrayOutputStream baos = new ByteArrayOutputStream()) {

            Orders order = orderRepo.findById(id)
                    .orElseThrow(() -> new RuntimeException("Order not found"));

            List<OrderItems> items = itemsRepo.findByOrderId(id);

            Document document = new Document();
            PdfWriter.getInstance(document, baos);

            document.open();

            // ---------- HEADER ----------
            Font titleFont = new Font(Font.HELVETICA, 18, Font.BOLD);
            document.add(new Paragraph("INVOICE", titleFont));
            document.add(new Paragraph("Order ID: " + order.getId()));
            document.add(new Paragraph(" "));

            // ---------- USER INFO ----------
            document.add(new Paragraph("Customer: " + order.getUser().getName()));
            document.add(new Paragraph("Email: " + order.getUser().getEmail()));
            document.add(new Paragraph(" "));

            // ---------- TABLE ----------
            PdfPTable table = new PdfPTable(4);
            table.setWidthPercentage(100);

            table.addCell("Product");
            table.addCell("Price");
            table.addCell("Qty");
            table.addCell("Total");

            for (OrderItems item : items) {

                table.addCell(item.getProduct().getName());
                table.addCell(String.valueOf(item.getPriceAtPurchase()));
                table.addCell(String.valueOf(item.getQuantity()));

                double total = item.getPriceAtPurchase() * item.getQuantity();
                table.addCell(String.valueOf(total));
            }

            document.add(table);

            document.add(new Paragraph(" "));
            document.add(new Paragraph("Total Amount: ₹" + order.getTotalAmount()));

            document.close();

            return baos.toByteArray();

        } catch (Exception e) {
            throw new RuntimeException("Error generating invoice PDF", e);
        }
	}
}