/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.service.admin;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import team.entity.Product;
import team.repository.ProductRepo;

/**
 *
 * @author AngPan
 */
@Service
@Transactional
public class AdminServiceImpl implements AdminService {

    @Autowired
    ProductRepo productRepo;

    @Override
    public List<Product> findAll() {
        return productRepo.findAll();
    }

    @Override
    public int totalProducts() {
        int count;
        List <Product> listOfProducts = productRepo.findAll();
        count = listOfProducts.size();
        return count;
    }

    @Override
    public List<Integer> productStatus() {
        int activeProducts = 0;
        int inactiveProducts = 0;
        List<Product> listOfProducts = productRepo.findAll();
        List<Integer> productStatusList = new ArrayList();
        for (Product p : listOfProducts) {
            if (p.getStatus() == 1) {
                activeProducts = activeProducts + 1;
            } else {
                inactiveProducts = inactiveProducts +1;
            }
        }
        productStatusList.add(activeProducts);
        productStatusList.add(inactiveProducts);

        return productStatusList;
    }

}
