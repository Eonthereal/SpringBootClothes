/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.controller;

import java.security.Principal;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import team.entity.Orders;
import team.entity.Product;
import team.entity.User;
import team.service.ProfileService;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    ProfileService profileService;


    @GetMapping("/profile/{principal.username}")
    public String showUserProfile(Principal principal, Model model) {

        User user = profileService.showUserProfile(principal.getName());
        List<Orders> ordersList = user.getOrdersList();
        List<Orders> complOrderList = profileService.findCompletedOrders(ordersList);
        Set<Product> userProducts = profileService.getUserProducts(complOrderList);


        model.addAttribute("userProducts", userProducts);
        model.addAttribute("ordersCount", ordersList.size());
        model.addAttribute("orders", complOrderList);
        model.addAttribute("user", user);

        return "Navigation/profile";
    }

}
