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
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import team.entity.Brand;
import team.entity.Category;
import team.entity.Color;
import team.entity.Gender;
import team.entity.Sizes;
import team.entity.User;
import team.service.BrandService;
import team.service.CategoryService;
import team.service.ColorService;
import team.service.GenderService;
import team.service.ProductService;
import team.service.SizesService;

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
    public String showProducts(Model model) {
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

        String minima = "Product " + product.getTitle() + " successfully created!!";
        attributes.addFlashAttribute("message", minima);
        return "redirect:/admin/product";
    }


    //===========================================UPDATE===============================================
    @GetMapping("/update/{productid}")
    public String update(
            Product product,
            @PathVariable(value = "productid") int productid, Model model) {

        Product productToUpdate = productRepo.findById(productid).get();

        model.addAttribute("product", productToUpdate);
        return "Admin/productFormUPDATE";
    }

    @PostMapping("/update")
    public String update(@Valid @ModelAttribute("product") Product product, BindingResult result, RedirectAttributes attributes) {
        if (result.hasErrors()) {
            return "Admin/productFormUPDATE";
        }

        productRepo.save(product);

        String minima = "Product updated successfully!!";
        attributes.addFlashAttribute("message", minima);
        return "redirect:/admin/product";
    }
        // =============================DELETE=====================================    

    @GetMapping("/delete")
    public String delete(@RequestParam("id") int id, RedirectAttributes attributes) {
        String minima;

        productRepo.deleteById(id);

        minima = "Product deleted successfully!";
        attributes.addFlashAttribute("message", minima);
        return "redirect:/admin/product";
    }

    //===============================EXCEPTIONS=======================================
    @ExceptionHandler(DataIntegrityViolationException.class)
    public String handleDataIntegrityViolationException(RedirectAttributes attributes) {
        String minima = "Could not commit transaction!!";
        attributes.addFlashAttribute("message", minima);
        return "redirect:/admin/product";
    }
    
    

}
