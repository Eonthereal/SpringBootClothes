/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.controller.admin;

import team.entity.Product;
import team.repository.ProductRepo;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author tasos
 */

@RequestMapping("/admin/product")
@Controller
public class ProductController {
    
    @Autowired
    ProductRepo productRepo;
    
    @GetMapping
    public String showProducts(Model model){
        List<Product> listOfProducts = productRepo.findAll();
        model.addAttribute("listOfProducts", listOfProducts);
        return "Admin/productCRUD";
    }
    
    
    
    
    
}
