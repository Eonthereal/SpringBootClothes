/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import team.entity.Product;
import team.repository.ProductRepo;


@Service
@Transactional
public class ProductServiceImpl implements ProductService{
    
    @Autowired
    ProductRepo productRepo;
    
    
    

    @Override
    public Product createProduct(Product product) {       
       return productRepo.save(product);
    
    }

    @Override
    public Product findById(int productId) {
          
        Product product=productRepo.findById(productId).get();
//        System.out.println("Service implement>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+product.toString());
        return product;
    }
    
}
