/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.service;

import java.util.List;
import java.util.Set;
import org.springframework.stereotype.Service;
import team.entity.Orders;
import team.entity.Product;
import team.entity.User;

@Service
public interface ProfileService {

    public User showUserProfile(String username);
    
    List<Orders> findCompletedOrders(List<Orders> ordersList);

    public Set<Product> getUserProducts(List<Orders> complOrderList);
    
}
