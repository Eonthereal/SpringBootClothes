/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.service;

import org.springframework.stereotype.Service;
import team.entity.Product;

@Service
public interface ProductService {
    
    Product createProduct(Product product);
    
    
}
