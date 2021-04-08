package team.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import team.entity.Orders;
import team.service.OrdersService;

@Controller
@RequestMapping("user/cart/checkout")
public class CheckoutController {
    
    @Autowired
    OrdersService ordersService;
    
     @GetMapping("{ordersid}")
    public String showAbout(Model model, @PathVariable("ordersid") int ordersid){
        
        Orders order = ordersService.findById(ordersid);
        
        model.addAttribute("order", order);
        
        
        return ("Navigation/checkout");
    }
    
}