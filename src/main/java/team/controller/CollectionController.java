/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;
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

    @GetMapping()
    public String showProducts(Model model) {
        List<Product> products = productRepo.findAll();
        model.addAttribute("products", products);
        return ("Navigation/collection");
    }

    @GetMapping("/filters")
    public String getFilters(@RequestParam(value = "brand", required = false) List<Brand> brands,
            @RequestParam(value = "category", required = false) List<Category> categories,
            @RequestParam(value = "gender", required = false) List<Gender> genders,
            @RequestParam(value = "size", required = false) List<Sizes> sizes,
            @RequestParam(value = "color", required = false) List<Color> colors,
            Model model) {

        System.out.println("Controller here!!!!!");

        List<Integer> brandlist = new ArrayList();

        List<Integer> categorylist = new ArrayList();

        List<Integer> genderlist = new ArrayList();

        List<Integer> sizelist = new ArrayList();

        List<Integer> colorlist = new ArrayList();

        for (Brand x : brands) {
            brandlist.add(x.getBrandid());

        }
        for (Category x : categories) {
            categorylist.add(x.getCategoryid());
        }

        for (Gender x : genders) {
            genderlist.add(x.getGenderid());
        }

        for (Sizes x : sizes) {
            sizelist.add(x.getSizesid());
        }

        for (Color x : colors) {
            colorlist.add(x.getColorid());
        }
        List<Product> productfilters = productRepo.findByFilters(brandlist, categorylist, genderlist, sizelist, colorlist);
        model.addAttribute("products", productfilters);

        return ("Navigation/Collection");

//        
//        if (brandlist.isEmpty()){
//            brandlist = null;
//        }
        //String 
        //inalQ = "Select p from product p where p.brandid = ????? AND p.categoryid=????? AND p.genderid=?? AND p.sizesid=??? AND p.colorid=???";
    }

//    
    //======================================SHOW SINGLE PRODUCT INFO==========================================
    @GetMapping("/{productid}")
    public String showProduct(/*Product product,*/@PathVariable("productid") int productid, Model model) {

        Product productToShow = productRepo.findById(productid).get();

        //Four more related products
        List<Product> relatedProducts = new ArrayList();
        List<Integer> listOfIds = new ArrayList();
        List<Product> allProducts = productRepo.findAll();

        for (Product x : allProducts) {
            listOfIds.add(x.getProductid());
        }
        listOfIds.remove(Integer.valueOf(productid)); //remove the product that shows as main in sigle product info page

        Collections.shuffle(listOfIds);

        for (int i = 1; i <= 4; i++) {
            relatedProducts.add(productRepo.findById(listOfIds.get(i)).get());
        }
        model.addAttribute("relatedProducts", relatedProducts);
        model.addAttribute("product", productToShow);

        return ("Navigation/product");
    }

}
