/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import team.entity.Color;

/**
 *
 * @author eon_A
 */
public interface ColorRepo extends JpaRepository <Color, Integer>{
    
    public List<Color> findAll();
    
    public Color findById(int id);
    
    
}
