/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.controller.admin;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import team.service.admin.AdminService;

@RequestMapping("/admin")
@Controller
public class AdminController {
    
    @Autowired
    AdminService adminService;
    
    @GetMapping
    public String adminHome(Model model){
        int totalProducts = adminService.totalProducts();
        List <Integer> productStatusList = adminService.productStatus();
        model.addAttribute("totalProducts", totalProducts);
        model.addAttribute("productStatusList", productStatusList);
        
        int totalOrders = adminService.totalOrders();
        List <Integer> ordersStatusList = adminService.ordersStatus();
        model.addAttribute("totalOrders", totalOrders);
        model.addAttribute("ordersStatusList", ordersStatusList);
        return "Admin/admin-home";
    }
 
}
