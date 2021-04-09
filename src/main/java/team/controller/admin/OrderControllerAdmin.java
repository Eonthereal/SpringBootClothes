package team.controller.admin;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import team.entity.Orders;
import team.entity.User;
import team.service.OrdersService;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 *
 * @author AngPan
 */
@RequestMapping("/admin/order")
@Controller
public class OrderControllerAdmin {
    
    
    @Autowired
    OrdersService ordersService;
    
    @GetMapping
    public String showOrders(Model model) {
        List<Orders> listOfOrders = ordersService.findAll();
        model.addAttribute("listOfOrders", listOfOrders);
        return "Admin/ordersCRUD";
    }
    
    
}
