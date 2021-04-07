/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import team.entity.Product;

@Service
public interface CartService {
    
    
     public List<Product> showCart (String userName, Model model);
     
     
     public List<Product> addToCart(String userName, int productId, int qty, Model model);
     
     
     public void deleteFromCart(int ordersid, int pid);
     
     public void updateQuantity(int productid,int qty,int orderId);
    
}
