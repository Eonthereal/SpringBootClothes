/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.service.admin;

import java.util.List;
import org.springframework.stereotype.Service;
import team.entity.Product;

/**
 *
 * @author AngPan
 */

@Service
public interface AdminService {
    
    List<Product> findAll();
    
    int totalProducts();
    
    List<Integer> productStatus();
    
}
