/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.controller;

import java.security.Principal;
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
import team.entity.Product;
import team.entity.ProductOrders;
import team.entity.Tax;
import team.service.CartService;
import team.service.OrdersService;
import team.service.ProductOrdersService;
import team.service.TaxService;

@Controller
@RequestMapping("user")
public class CartController {

    @Autowired
    CartService cartService;

    @Autowired
    OrdersService ordersService;

    @Autowired
    ProductOrdersService productOrdersService;

    @Autowired
    TaxService taxService;

    @ModelAttribute("productorders")
    public List<ProductOrders> getProductOrders() {
        return productOrdersService.findAll();
    }

    @ModelAttribute("tax")
    public Tax getTax() {
        return taxService.findById(1);
    }

    @GetMapping("/cart")
    public String showCart(Principal principal, Model model) {
        try {
            List<Product> cartProducts = cartService.showCart(principal.getName(), model);
            model.addAttribute("cartProducts", cartProducts);
        } catch (NullPointerException e) {
        }
        return "Navigation/cart";
    }

    @GetMapping("/cart/{productid}")
    public String addToCart(Principal principal, Model model, @PathVariable("productid") int productid, @RequestParam("qty") int qty) {

        List<Product> cartProducts = cartService.addToCart(principal.getName(), productid, qty, model);
        model.addAttribute("cartProducts", cartProducts);

        return "redirect:/user/cart";
    }

    @GetMapping("cart/delete/{pendingorder.ordersid}")
    public String deleteFromCart(@PathVariable("pendingorder.ordersid") int ordersid,
            @RequestParam("pid") int pid) {

        cartService.deleteFromCart(ordersid, pid);

        //if this "if" goes inside method deleteFromCart(line 100) doesn't work..needs debbuging.
        if (ordersService.findById(ordersid).getProductList().isEmpty()) {
            ordersService.deleteById(ordersid);
        }

        return "redirect:/user/cart";
    }

    @GetMapping("cart/update/{productid}")
    public String updateQuantity(@PathVariable("productid") int productid,
            @RequestParam("qty") int qty,
            @RequestParam("oid") int orderId) {

        cartService.updateQuantity(productid, qty, orderId);

        return "redirect:/user/cart";
    }

    @GetMapping("cart/address/{ordersid}")
    public String showAddressForm(Orders order, @PathVariable("ordersid") int ordersid, Model model) {
              
        Orders orderToUpdate = ordersService.findById(ordersid);

        model.addAttribute("order", orderToUpdate);

        return "Navigation/addressform";
    }

    @PostMapping("cart/address/updateaddress")
    public String updateAddress(@ModelAttribute("order") Orders order, Principal principal, Model model) {
        
        ordersService.saveOrder(order);

        return "Navigation/orderreview";
    }

}
