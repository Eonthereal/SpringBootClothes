/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import team.entity.Orders;
import team.entity.Product;
import team.entity.ProductOrders;
import team.entity.User;
import team.service.ProductOrdersService;
import team.service.ProfileService;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    ProfileService profileService;

    @Autowired
    ProductOrdersService productOrdersService;

    @ModelAttribute("productOrders")
    public List<ProductOrders> getProductOrders() {
        return productOrdersService.findAll();
    }

    @GetMapping("/profile/{principal.username}")
    public String showUserProfile(Principal principal, Model model) {

        User user = profileService.showUserProfile(principal.getName());
        List<Orders> ordersList = user.getOrdersList();
        List<Orders> complOrderList = profileService.findCompletedOrders(ordersList);
        List<List<ProductOrders>> tempList = new ArrayList();
        Set<Product> userProducts = new HashSet();

        for (Orders x : complOrderList) {
            tempList.add(x.getProductList());
        }

        for (List<ProductOrders> x : tempList) {
            for (ProductOrders y : x) {
                userProducts.add(y.getProduct());
            }
        }

        model.addAttribute("userProducts", userProducts);
        model.addAttribute("ordersCount", ordersList.size());
        model.addAttribute("orders", complOrderList);
        model.addAttribute("user", user);

        return "Navigation/profile";
    }

}
