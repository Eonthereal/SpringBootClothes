/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.repository;

import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import team.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import team.entity.Brand;
import team.entity.Category;
import team.entity.Color;
import team.entity.Gender;
import team.entity.Sizes;


@Repository
public interface ProductRepo extends JpaRepository<Product,Integer> {
    @Query("select p from Product p where p.brandid IN (?1) AND p.categoryid IN (?2) AND p.genderid IN (?3) AND p.sizeid IN (?4) AND p.colorid IN (?5)")
    List <Product> findByFilters(List<Integer> brand, List<Integer> category, List<Integer> gender, List<Integer> size, List<Integer> color);
    
}
