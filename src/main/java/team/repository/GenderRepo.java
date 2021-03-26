/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import team.entity.Gender;

/**
 *
 * @author eon_A
 */
public interface GenderRepo extends JpaRepository<Gender, Integer> {
    
// public List<Gender>findAll();
 
 public Gender findById(int id);
        
}
