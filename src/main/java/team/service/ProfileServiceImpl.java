/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import team.entity.Orders;
import team.entity.Product;
import team.entity.ProductOrders;
import team.entity.User;

@Service
@Transactional
public class ProfileServiceImpl implements ProfileService {

    @Autowired
    UserService userService;

    @Override
    public User showUserProfile(String username) {

        return userService.findByUsername(username);
    }

    @Override
    public List<Orders> findCompletedOrders(List<Orders> ordersList) {
        List<Orders> completedOrders = new ArrayList();
        for (Orders x : ordersList) {
            if (x.getStatus().equalsIgnoreCase("COMPLETED")) {
                completedOrders.add(x);
            }
        }
        return completedOrders;
    }

    @Override
    public Set<Product> getUserProducts(List<Orders> complOrderList) {
        Set<Product> userProducts = new HashSet();
        List<List<ProductOrders>> tempList = new ArrayList();
        for (Orders x : complOrderList) {
            tempList.add(x.getProductList());
        }
        for (List<ProductOrders> x : tempList) {
            for (ProductOrders y : x) {
                userProducts.add(y.getProduct());
            }
        }
        return userProducts;
    }

}
