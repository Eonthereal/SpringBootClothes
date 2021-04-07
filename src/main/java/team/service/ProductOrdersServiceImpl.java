/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import team.entity.ProductOrders;
import team.entity.ProductOrdersId;
import team.repository.ProductOrdersRepo;

@Transactional
@Service
public class ProductOrdersServiceImpl implements ProductOrdersService {

    @Autowired
    ProductOrdersRepo productOrdersRepo;

    @Override
    public List<ProductOrders> findAll() {
        return productOrdersRepo.findAll();
    }

    @Override
    public ProductOrders save(ProductOrders productOrders) {
        return productOrdersRepo.save(productOrders);
    }

    @Override
    public void deleteById(ProductOrdersId id) {
        productOrdersRepo.deleteById(id);
    }

    @Override
    public ProductOrders findById(ProductOrdersId id) {
        return productOrdersRepo.findById(id).get();
    }

}
