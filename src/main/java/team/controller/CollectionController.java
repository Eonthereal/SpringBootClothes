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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import team.entity.Brand;
import team.entity.Category;
import team.entity.Color;
import team.entity.Gender;
import team.entity.Product;
import team.entity.Sizes;
import team.service.BrandService;
import team.service.CategoryService;
import team.service.CollectionService;
import team.service.ColorService;
import team.service.GenderService;
import team.service.SizesService;

@Controller
@RequestMapping("/collection")
public class CollectionController {

    @Autowired
    BrandService brandService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    GenderService genderService;

    @Autowired
    SizesService sizesService;

    @Autowired
    ColorService colorService;

    @Autowired
    CollectionService collectionService;

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

    @GetMapping()
    public String showProducts(Model model) {

        List<Product> products = collectionService.showProducts();
        model.addAttribute("products", products);

        return ("Navigation/collection");
    }

    @GetMapping("/filters")
    public String getFilters(
            Model model,
            @RequestParam(value = "brand", required = false) List<Brand> brands,
            @RequestParam(value = "category", required = false) List<Category> categories,
            @RequestParam(value = "gender", required = false) List<Gender> genders,
            @RequestParam(value = "size", required = false) List<Sizes> sizes,
            @RequestParam(value = "color", required = false) List<Color> colors
    ) {

        List<Product> products = collectionService.getFilters(brands, categories, genders, sizes, colors);
        model.addAttribute("products", products);

        return ("Navigation/collection");
    }

    //======================================SHOW SINGLE PRODUCT INFO==========================================
    @GetMapping("/{productid}")
    public String showProduct(@PathVariable("productid") int productid, Model model) {

        Product productToShow = collectionService.showProduct(productid);

        List<Product> relatedProducts = collectionService.findFourRelatedProducts(productid);

        model.addAttribute("relatedProducts", relatedProducts);
        model.addAttribute("product", productToShow);

        return ("Navigation/product");
    }

}
