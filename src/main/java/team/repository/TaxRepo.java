/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import team.entity.Tax;

/**
 *
 * @author eon_A
 */
public interface TaxRepo extends JpaRepository<Tax, Integer>{
    
    public Tax findById(int id);
    
}
