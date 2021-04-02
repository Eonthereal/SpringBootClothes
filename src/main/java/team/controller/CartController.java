/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.controller;

import java.security.Principal;
import java.util.ArrayList;
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
import team.entity.User;
import team.repository.OrdersRepo;
import team.repository.ProductOrdersRepo;
import team.repository.ProductRepo;
import team.repository.TaxRepo;
import team.service.OrdersService;
import team.service.ProductOrdersService;
import team.service.ProductService;
import team.service.UserService;

@Controller
@RequestMapping("user")
public class CartController {

    @Autowired
    UserService userService;

    @Autowired
    ProductRepo productRepo;

    @Autowired
    OrdersRepo ordersRepo;

    @Autowired
    ProductService productService;

    @Autowired
    OrdersService ordersService;

    @Autowired
    ProductOrdersRepo productOrdersRepo;

    @Autowired
    ProductOrdersService productOrdersService;

    @Autowired
    TaxRepo taxRepo;

    @ModelAttribute("productorders")
    public List<ProductOrders> getProductOrders() {
        return productOrdersService.findAll();
    }

    @ModelAttribute("tax")
    public Tax getTax() {
        return taxRepo.findById(1);
    }

    @GetMapping("/cart")
    public String showCart(Principal principal, Model model) {
        System.out.println("********************************SHOWCART***************************************************");
        try {
            List<Product> cartProducts = pendingOrder(principal.getName(), model);
            model.addAttribute("cartProducts", cartProducts);
        } catch (NullPointerException e) {
        }
        return "Navigation/cart";
    }

    private List<Product> pendingOrder(String userName, Model model) {
        System.out.println("********************************PENDING ORDER***************************************************");
        User user = userService.findByUsername(userName);
        Tax tax = new Tax();
        tax = taxRepo.findById(tax.getTaxid()).get();
         List<Product> cartItems = new ArrayList();
        double sum = 0.0d;
        double totalCostRound;
        for (Orders x : user.getOrdersList()) {
            if (x.getStatus().equalsIgnoreCase("PENDING")) {
                model.addAttribute("pendingorder", x); //έφερα στο model την Order που είναι pending για να μπορώ να τραβίξω το quantity (ακόμα το ψάχνω όμως). Επίσης μαζί με την Order Pending, έφερα και όλο τα ProductOrders και με @ModelAttribute.
               
                for (ProductOrders y : x.getProductList()) {
                    cartItems.add(y.getProduct());

                    sum = sum + y.getPrice();
                }
                totalCostRound = Math.round((sum + (tax.getVat() * sum)) * 100.0) / 100.0;

                x.setTotalcost(totalCostRound);
                ordersService.saveOrder(x);

                return cartItems;
            }
        }
        return cartItems;
    }

    @GetMapping("/cart/{productid}")
    public String addToCart(Principal principal, Model model, @PathVariable("productid") int productid, @RequestParam("qty") int qty) {
        System.out.println("********************************ADD TO CART***************************************************");
//     try {
        List<Product> cartProducts = addToOrder(principal.getName(), productid, qty, model);
        model.addAttribute("cartProducts", cartProducts);
//        } catch (NullPointerException e) {
//        }
        return "redirect:/user/cart";
    }

    private List<Product> addToOrder(String userName, int productId, int qty, Model model) {
        System.out.println("********************************ADD TO ORDER***************************************************");
        Tax tax = new Tax();
        tax = taxRepo.findById(tax.getTaxid()).get();
        User user = userService.findByUsername(userName);
        Product product = productService.findById(productId);
        List<Product> cartItems = new ArrayList();
        boolean pendingCheck = false;
        int orderId = 0;
        for (Orders x : user.getOrdersList()) {
            if (x.getStatus().equalsIgnoreCase("PENDING")) {
                orderId = x.getOrdersid();
//                model.addAttribute("pendingorder", x); //Έχω εξηγήσει πιο πάνω στην pendingOrder() γιατί το κάνω αυτό.
                pendingCheck = true;
                break;
            }
        }
        if (pendingCheck == true) {
            Orders order = ordersService.findById(orderId);
            cartItems = createList(product, order, qty, cartItems, model);

//            ProductOrders productAdded1 = new ProductOrders(product.getProductid(), orderId, qty, qty * product.getPrice());
//            order.getProductList().add(productAdded1);
//            productOrdersRepo.save(productAdded1);
//            cartItems.add(product);
//            for (int i = 0; i < order.getProductList().size() - 1; i++) {
//                cartItems.add(order.getProductList().get(i).getProduct());
//            }
        } else {
            Orders order = new Orders(user, "PENDING", tax.getVat());
            ordersService.createOrder(order);
            cartItems = createList(product, order, qty, cartItems, model);

//            ProductOrders productAdded2 = new ProductOrders(product.getProductid(), order.getOrdersid(), qty, (qty * product.getPrice()));
//            order.getProductList().add(productAdded2);
//            productOrdersRepo.save(productAdded2);
//            cartItems.add(product);
//            model.addAttribute("pendingorder", order); //Έχω εξηγήσει πιο πάνω στην pendingOrder() γιατί το κάνω αυτό.
//            for (int i = 0; i < order.getProductList().size() - 1; i++) {
//                cartItems.add(order.getProductList().get(i).getProduct());
//            }
        }
        return cartItems;
    }

    //H createList έγινε διότι ο κώδικας της addToOrder επαναλαμβανόταν στην if-else
    private List<Product> createList(Product product, Orders order, int qty, List<Product> cartItems, Model model) {
        double price = qty * product.getPrice();
        ProductOrders productAdded = new ProductOrders(product.getProductid(), order.getOrdersid(), qty, (Math.round(price * 100.0) / 100.0));
        order.getProductList().add(productAdded);
        productOrdersRepo.save(productAdded);
        cartItems.add(product);
        model.addAttribute("pendingorder", order);//Έχω εξηγήσει πιο πάνω στην pendingOrder() γιατί το κάνω αυτό.
        for (int i = 0; i < order.getProductList().size() - 1; i++) {
            cartItems.add(order.getProductList().get(i).getProduct());
        }
        return cartItems;
    }

    @GetMapping("cart/delete/{pendingorder.ordersid}")
    public String delete(@PathVariable("pendingorder.ordersid") int ordersid,
            @RequestParam("pid") int pid) {

        ProductOrders po = new ProductOrders(pid, ordersid);

        productOrdersRepo.deleteById(po.getProductOrdersId());

        if (ordersService.findById(ordersid).getProductList().isEmpty()) {
            ordersRepo.deleteById(ordersid);
        }

        return "redirect:/user/cart";
    }

    @GetMapping("cart/update/{productid}")
    public String updateQuantity(@PathVariable("productid") int productid,
            @RequestParam("qty") int qty,
            @RequestParam("oid") int orderId) {
        double roundPrice;
        productService.findById(productid);
        ProductOrders po = new ProductOrders(productid, orderId);
        po = productOrdersRepo.findById(po.getProductOrdersId()).get();
        po.setQuantity(qty);
        roundPrice = Math.round((qty * productService.findById(productid).getPrice()) * 100.0) / 100.0;
        po.setPrice(roundPrice);
        productOrdersRepo.save(po);

        return "redirect:/user/cart";
    }

    @GetMapping("cart/address/{ordersid}")
    public String showForm(Orders order, @PathVariable("ordersid") int ordersid, Model model) {
        Orders orderToUpdate = ordersRepo.findById(ordersid);

        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> " + orderToUpdate);

        model.addAttribute("order", orderToUpdate);

        return "Navigation/addressform";
    }

    @PostMapping("cart/address/updateaddress")
    public String updateAddress(@ModelAttribute("order") Orders order, Principal principal, Model model) {
        ordersService.saveOrder(order);
        
        return "Navigation/orderreview";
    }

}
