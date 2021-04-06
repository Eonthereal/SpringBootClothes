/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.repository;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import team.entity.Product;

/**
 *
 * @author eon_A
 */
public class ProductRepoImpl implements ProductRepoCustom {

    @PersistenceContext 
    private EntityManager em;

    @Override
    public List<Product> findByFilters(String query) {
        TypedQuery<Product> q = em.createQuery(query, Product.class);
        return q.getResultList();
    }

}
