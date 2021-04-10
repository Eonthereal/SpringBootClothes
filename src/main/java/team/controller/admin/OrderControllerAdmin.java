package team.controller.admin;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import team.entity.Orders;
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
@RequestMapping("/admin/orders")
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
    
    
    @GetMapping("/update/{ordersid}")
    public String updateOrders(@PathVariable("ordersid") int ordersid, @RequestParam("status") String status){
        Orders orders = ordersService.findById(ordersid);
        orders.setStatus(status);
        ordersService.saveOrder(orders);
        return "redirect:/admin/orders";
    }
    
    
}
