/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import team.entity.Orders;
import team.entity.Product;
import team.entity.ProductOrders;
import team.entity.Tax;
import team.entity.User;
import team.repository.OrdersRepo;

@Transactional
@Service
public class CartServiceImpl implements CartService {

    @Autowired
    OrdersService ordersService;

    @Autowired
    UserService userService;

    @Autowired
    TaxService taxService;

    @Autowired
    ProductService productService;

    @Autowired
    ProductOrdersService productOrdersService;

    @Autowired
    OrdersRepo ordersRepo;

    @Override
    public List<Product> showCart(String userName, Model model) {
        User user = userService.findByUsername(userName);
        Tax tax = new Tax();
        tax = taxService.findById(tax.getTaxid());
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

    @Override
    public List<Product> addToCart(String userName, int productId, int qty, Model model) {
        Tax tax = new Tax();
        tax = taxService.findById(tax.getTaxid());
        User user = userService.findByUsername(userName);
        Product product = productService.findById(productId);
        List<Product> cartItems = new ArrayList();
        boolean pendingCheck = false;
        int orderId = 0;
        for (Orders x : user.getOrdersList()) {
            if (x.getStatus().equalsIgnoreCase("PENDING")) {
                orderId = x.getOrdersid();
                pendingCheck = true;
                break;
            }
        }
        if (pendingCheck == true) {
            Orders order = ordersService.findById(orderId);
            cartItems = createList(product, order, qty, cartItems, model);

        } else {
            Orders order = new Orders(user, "PENDING", tax.getVat());
            ordersService.createOrder(order);
            cartItems = createList(product, order, qty, cartItems, model);

        }
        return cartItems;
    }

    @Override
    public void deleteFromCart(int ordersid, int pid) {

        ProductOrders po = new ProductOrders(pid, ordersid);

        productOrdersService.deleteById(po.getProductOrdersId());

//        if (ordersService.findById(ordersid).getProductList().isEmpty()) {
//            ordersService.deleteById(ordersid);
//        }
    }

    @Override
    public void updateQuantity(int productid, int qty, int orderId) {
        double roundPrice;
        productService.findById(productid);
        ProductOrders po = new ProductOrders(productid, orderId);
        po = productOrdersService.findById(po.getProductOrdersId());
        po.setQuantity(qty);
        roundPrice = Math.round((qty * productService.findById(productid).getPrice()) * 100.0) / 100.0;
        po.setPrice(roundPrice);
        productOrdersService.save(po);

    }
    
    
    
    

    //=============================================SUPORT METHODS=================================================================
    //H createList έγινε διότι ο κώδικας της addToOrder επαναλαμβανόταν στην if-else
    private List<Product> createList(Product product, Orders order, int qty, List<Product> cartItems, Model model) {
        double price = qty * product.getPrice();
        ProductOrders productAdded = new ProductOrders(product.getProductid(), order.getOrdersid(), qty, (Math.round(price * 100.0) / 100.0));
        order.getProductList().add(productAdded);
        productOrdersService.save(productAdded);
        cartItems.add(product);
        model.addAttribute("pendingorder", order);//Έχω εξηγήσει πιο πάνω στην pendingOrder() γιατί το κάνω αυτό.
        for (int i = 0; i < order.getProductList().size() - 1; i++) {
            cartItems.add(order.getProductList().get(i).getProduct());
        }
        return cartItems;
    }

}
