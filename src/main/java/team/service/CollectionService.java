/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.service;

import java.util.List;
import org.springframework.stereotype.Service;
import team.entity.Brand;
import team.entity.Category;
import team.entity.Color;
import team.entity.Gender;
import team.entity.Product;
import team.entity.Sizes;

@Service
public interface CollectionService {

    public List<Product> showProducts();
    
    
    public List<Product> getFilters(List<Brand> brands,
                                    List<Category> categories,
                                    List<Gender> genders,
                                    List<Sizes> sizes,
                                    List<Color> colors);
    
    
    public Product showProduct(int productid);
    
     public List<Product> findFourRelatedProducts(int productid);

}
