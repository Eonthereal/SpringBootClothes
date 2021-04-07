/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import team.entity.Orders;
import team.repository.OrdersRepo;

/**
 *
 * @author eon_A
 */
@Service
@Transactional
public class OrdersServiceImpl implements OrdersService {
    
    @Autowired
    OrdersRepo ordersRepo;
    
    @Override
    public Orders saveOrder(Orders order){
        return ordersRepo.save(order);
    }
    
   @Override //δε τη χρησιμοποιώ ακόμα κάπου
   public Orders createOrder(Orders order){
     
       order=ordersRepo.save(order);
       
       return order;
              
   }
   
    @Override
    public Orders findById(int ordersid) {
        return ordersRepo.findById(ordersid);
    }
    
    @Override
    public void deleteById(int ordersid){
        ordersRepo.deleteById(ordersid);
    }
    
    
}
