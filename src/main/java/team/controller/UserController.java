/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.controller;

import java.security.Principal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import team.entity.Orders;
import team.entity.Product;
import team.entity.ProductOrders;
import team.entity.User;
import team.repository.OrdersRepo;
import team.repository.ProductOrdersRepo;
import team.repository.ProductRepo;
import team.service.OrdersService;
import team.service.ProductService;
import team.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    ProductRepo productRepo;

    @Autowired
    ProductService productService;

    @Autowired
    OrdersService ordersService;
    
    @Autowired
    ProductOrdersRepo productOrdersRepo;

    @GetMapping("/profile/{principal.username}")
    public String showUserProfile(Principal principal, Model model) {

        User user = userService.findByUsername(principal.getName());

        model.addAttribute("user", user);

        return "Navigation/profile";
    }

    //===========================CART IMPLEMENTATION============================
    @GetMapping("/cart")
    public String showCart(Principal principal, Model model) {
        try {
            List<Product> cartProducts = pendindOrder(principal.getName());
//            for (Product x : cartProducts) {
//                System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + x.toString());
//            }
            model.addAttribute("cartProducts", cartProducts);
        } catch (NullPointerException e) {
            System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>EMPTY LIST");
        }
        return "Navigation/cart";
    }
    
    private List<Product> pendindOrder(String userName) {
        User user = userService.findByUsername(userName);
        for (Orders x : user.getOrdersList()) {
            if (x.getStatus().equalsIgnoreCase("PENDING")) {
             List<Product> cartItems = new ArrayList();   
                for (ProductOrders y : x.getProductList()){
                    cartItems.add(y.getProduct());
                }
                return cartItems;
            }
        }
        return null;
    }

    @GetMapping("/cart/{productid}")
    public String addToCart(Principal principal, Model model, @PathVariable("productid") int productid) {

        List<Product> cartProducts = addToOrder(principal.getName(), productid);

        model.addAttribute("cartProducts", cartProducts);
        return "Navigation/cart";
    }

    private List<Product> addToOrder(String userName, int productId) {
        User user = userService.findByUsername(userName);
        Product product = productService.findById(productId);
        List<Product> cartItems = new ArrayList();

        for (Orders x : user.getOrdersList()) {
            if (x.getStatus().equalsIgnoreCase("PENDING")) {
              

                  ProductOrders temp = new ProductOrders(product.getProductid(), x.getOrdersid(), 1, 1);               
                  System.out.println("PoducutList before adding product>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> "+x.getProductList().size());

                  x.getProductList().add(temp);
                  System.out.println("TEMPITEM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> "+temp);
                  productOrdersRepo.save(temp);
                  
                  
                  cartItems.add(product);
                  for (int i=0 ; i<x.getProductList().size()-1; i++ ){
//                  for (ProductOrders c : x.getProductList()){
//                  cartItems.add(c.getProduct());
                      cartItems.add(x.getProductList().get(i).getProduct());
                      
                      System.out.println("cartItems before adding product>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> "+cartItems.size());
                  }
//                     
                     System.out.println("cartItems after adding product>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> "+cartItems.size());

                  break;


                  

            } else {
//                Orders order = new Orders();
//                order.getProductList().add(product);
//                order.setUser(user);
//                order.setOrderdate(LocalDate.now());
//                order.setStatus("PENDING");
//                ordersService.saveOrder(order);
//                cartList = x.getProductList();
//                break;
            }
//
        }

        return cartItems;
    }

    

}
