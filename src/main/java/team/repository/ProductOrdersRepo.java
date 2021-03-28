/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import team.entity.ProductOrders;
import team.entity.ProductOrdersId;

@Repository
public interface ProductOrdersRepo extends JpaRepository<ProductOrders,ProductOrdersId>{
    
}
