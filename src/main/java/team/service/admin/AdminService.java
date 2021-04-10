/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.service.admin;

import java.util.List;
import org.springframework.stereotype.Service;
import team.entity.Orders;
import team.entity.Product;

/**
 *
 * @author AngPan
 */

@Service
public interface AdminService {
    
    
    //---- Products-----
    
    List<Product> findAll();
    
    int totalProducts();
    
    List<Integer> productStatus();
    
    
    //----- Orders-------
    
    List<Orders> findAllOrders();
    
    int totalOrders();
    
    List<Integer> ordersStatus();
}
