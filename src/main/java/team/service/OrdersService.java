/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.service;

import org.springframework.stereotype.Service;
import team.entity.Orders;

/**
 *
 * @author eon_A
 */
@Service
public interface OrdersService {
    
    Orders saveOrder(Orders order);
    
    Orders createOrder(Orders order);
    
    Orders findById(int ordersid);
   
    public void deleteById(int ordersid);
    
    
    
}
