/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedList;
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
        List<Product> productsInStock = new ArrayList();
        List<Product> activeProducts = new ArrayList();
        
        for (Product p : products) {
            if (p.getStock() != 0  ) {
                productsInStock.add(p);
            }
            
        }
        for (Product p: productsInStock){
            if (p.getStatus()!=0){
                activeProducts.add(p);
            }
        }

        model.addAttribute("products", activeProducts);
        return ("Navigation/collection");
    }

    @GetMapping("/filters")
    public String getFilters(@RequestParam(value = "brand", required = false) List<Brand> brands,
            @RequestParam(value = "category", required = false) List<Category> categories,
            @RequestParam(value = "gender", required = false) List<Gender> genders,
            @RequestParam(value = "size", required = false) List<Sizes> sizes,
            @RequestParam(value = "color", required = false) List<Color> colors,
            Model model) {
        String query = "SELECT p FROM Product p WHERE ";

        try {
            String brandQuery = "brandid IN (";
            for (int i = 0; i <= brands.size() - 1; i++) {
                brandQuery = brandQuery.concat("'" + brands.get(i).getBrandid() + "'");
                if (i == brands.size() - 1) {
                    brandQuery = brandQuery.concat(") AND ");
                } else {
                    brandQuery = brandQuery.concat(" , ");
                }
            }
            query = query + brandQuery;
        } catch (NullPointerException e) {
        }
        try {
            String categoryQuery = "categoryid IN (";
            for (int i = 0; i <= categories.size() - 1; i++) {
                categoryQuery = categoryQuery.concat("'" + categories.get(i).getCategoryid() + "'");
                if (i == categories.size() - 1) {
                    categoryQuery = categoryQuery.concat(") AND ");
                } else {
                    categoryQuery = categoryQuery.concat(" , ");
                }
            }
            query = query + categoryQuery;
        } catch (NullPointerException e) {
        }
        try {
            String genderQuery = "genderid IN (";
            for (int i = 0; i <= genders.size() - 1; i++) {
                genderQuery = genderQuery.concat("'" + genders.get(i).getGenderid() + "'");
                if (i == genders.size() - 1) {
                    genderQuery = genderQuery.concat(") AND ");
                } else {
                    genderQuery = genderQuery.concat(" , ");
                }
            }
            query = query + genderQuery;
        } catch (NullPointerException e) {
        }
        try {
            String sizesQuery = "sizeid IN (";
            for (int i = 0; i <= sizes.size() - 1; i++) {
                sizesQuery = sizesQuery.concat("'" + sizes.get(i).getSizesid() + "'");
                if (i == sizes.size() - 1) {
                    sizesQuery = sizesQuery.concat(") AND ");
                } else {
                    sizesQuery = sizesQuery.concat(" , ");
                }
            }
            query = query + sizesQuery;
        } catch (NullPointerException e) {
        }
        try {
            String colorQuery = "colorid IN (";
            for (int i = 0; i <= colors.size() - 1; i++) {
                colorQuery = colorQuery.concat("'" + colors.get(i).getColorid() + "'");
                if (i == colors.size() - 1) {
                    colorQuery = colorQuery.concat(") AND ");
                } else {
                    colorQuery = colorQuery.concat(" , ");
                }
            }
            query = query + colorQuery;
        } catch (NullPointerException e) {
        }
        //remove last "AND " and triming the last space
        query = query.substring(0, query.lastIndexOf("AND ")).trim();

        System.out.println(query);

        List<Product> products = productRepo.findByFilters(query);
        List<Product> productsInStock = new ArrayList();
        List<Product> activeProducts = new ArrayList();
        for (Product p : products) {
            if (p.getStock() != 0 ) {
                productsInStock.add(p);
            }
        }
        for (Product p: productsInStock){
            if (p.getStatus()!=0){
                activeProducts.add(p);
            }
        }

        model.addAttribute("products", activeProducts);

        return ("Navigation/collection");
    }

    //======================================SHOW SINGLE PRODUCT INFO==========================================
    @GetMapping("/{productid}")
    public String showProduct(/*Product product,*/@PathVariable("productid") int productid, Model model) {

        Product productToShow = productRepo.findById(productid).get();

        //Four more related products
        List<Product> relatedProducts = new ArrayList();
        List<Integer> listOfIds = new ArrayList();
        List<Product> allProducts = productRepo.findAll();
        List<Product> productsInStock = new ArrayList();
        List<Product> activeProducts = new ArrayList();
        for (Product p : allProducts) {
            if (p.getStock() != 0 ) {
                productsInStock.add(p);
            }
        }
        for (Product p: productsInStock){
            if (p.getStatus()!=0){
                activeProducts.add(p);
            }
        }

        for (Product x : activeProducts) {
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
