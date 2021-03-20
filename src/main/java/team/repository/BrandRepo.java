/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import team.entity.Brand;

@Repository
public interface BrandRepo extends JpaRepository<Brand, Integer> {
    
    public List<Brand> findAll();
    
    public Brand findById(int id);
    
    
}
