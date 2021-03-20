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
import team.entity.Gender;
import team.repository.GenderRepo;

@Transactional
@Service
public class GenderService {
    
    @Autowired
    GenderRepo genderRepo;
    
    
    public List<Gender> findAll(){
      return  genderRepo.findAll();
    }
    
    
    
    
}
