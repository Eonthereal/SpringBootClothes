/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.repository;

import java.util.List;
import org.springframework.data.jpa.repository.Query;
import team.entity.Product;

/**
 *
 * @author eon_A
 */
public interface ProductRepoCustom {
    
    List <Product> findByFilters(String query);
}
