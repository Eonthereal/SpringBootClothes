/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import team.entity.Tax;
import team.repository.TaxRepo;

@Service
@Transactional
public class TaxServiceImpl implements TaxService {
    
    @Autowired
    TaxRepo taxRepo;

    @Override
    public Tax findById(int taxid) {
        return taxRepo.findById(taxid);
    }
    
}
