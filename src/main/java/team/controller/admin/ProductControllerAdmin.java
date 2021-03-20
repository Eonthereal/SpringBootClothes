/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.controller.admin;

import team.entity.Product;
import team.repository.ProductRepo;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import team.entity.Brand;
import team.entity.Category;
import team.entity.Gender;
import team.service.BrandService;
import team.service.CategoryService;
import team.service.GenderService;
import team.service.ProductService;

/**
 *
 * @author tasos
 */

@RequestMapping("/admin/product")
@Controller
public class ProductControllerAdmin {
    
    @Autowired
    ProductRepo productRepo;
    
    @Autowired
    BrandService brandService;
    
    @Autowired
    CategoryService categoryService;
    
    @Autowired
    GenderService genderService;
    
    @Autowired
    ProductService productService;
    
     @ModelAttribute("brands")
    public List<Brand> getBrands() {
        return brandService.findAll();
    }
    @ModelAttribute("categories")
    public List<Category> getCategories() {
        return categoryService.findAll();
    }
    
    @ModelAttribute("genders")
    public List<Gender> getGenders() {
        return genderService.findAll();
    }
    
    
    
    @GetMapping
    public String showProducts(Model model){
        List<Product> listOfProducts = productRepo.findAll();
        model.addAttribute("listOfProducts", listOfProducts);
        return "Admin/productCRUD";
    }
    // =================CREATE METHODS============================
    
 @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String showForm(@ModelAttribute("product") Product product) {
        return "Admin/productFormCREATE";
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String create(@Valid @ModelAttribute("product") Product product, BindingResult result,
            RedirectAttributes attributes) {

        if (result.hasErrors()) {

            return "Admin/productFormCREATE";
        }
        productService.createProduct(product);
        
        String minima = "Product " + product.getTitle()+ " successfully created!!";
        attributes.addFlashAttribute("message", minima);
        return "redirect:/admin/product";
    }   
    
    
    
    
}
