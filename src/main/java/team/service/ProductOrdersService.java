/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.service;

import java.util.List;
import org.springframework.stereotype.Service;
import team.entity.ProductOrders;
import team.entity.ProductOrdersId;

@Service
public interface ProductOrdersService {

    public List<ProductOrders> findAll();
    
    public ProductOrders save(ProductOrders productOrders);
    
    public void deleteById(ProductOrdersId id);
    
    public ProductOrders findById(ProductOrdersId id);

}
