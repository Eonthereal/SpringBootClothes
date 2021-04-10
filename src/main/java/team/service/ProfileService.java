/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.service;

import java.util.List;
import org.springframework.stereotype.Service;
import team.entity.Orders;
import team.entity.User;

@Service
public interface ProfileService {

    public User showUserProfile(String username);
    
    List<Orders> findCompletedOrders(List<Orders> ordersList);
    
}
