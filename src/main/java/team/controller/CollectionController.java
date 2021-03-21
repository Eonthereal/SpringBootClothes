/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import team.entity.Brand;
import team.entity.Category;
import team.entity.Color;
import team.entity.Gender;
import team.entity.Product;
import team.entity.Sizes;
import team.repository.ProductRepo;
import team.service.BrandService;
import team.service.CategoryService;
import team.service.ColorService;
import team.service.GenderService;
import team.service.ProductService;
import team.service.SizesService;

@Controller
@RequestMapping("/collection")
public class CollectionController {
    
    
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

    @Autowired
    SizesService sizesService;

    @Autowired
    ColorService colorService;

    
    
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

    @ModelAttribute("sizes")
    public List<Sizes> getSizes() {
        return sizesService.findAll();
    }

    @ModelAttribute("colors")
    public List<Color> getColors() {
        return colorService.findAll();
    }
    
    
    @GetMapping
    public String showCollection(Model model){
        
        List<Product> listOfProducts = productRepo.findAll();
        model.addAttribute("listOfProducts", listOfProducts);
        return ("Navigation/collection");
    }
    
//    
//    @GetMapping
//    public String showFilters(@ModelAttribute("product") Product product){
//
//        return ("Navigation/collection");
//    }
}
