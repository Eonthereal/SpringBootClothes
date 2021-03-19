/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.service;

import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import team.entity.User;


@Service
//@Transactional
public interface UserService  { //extends UserDetailsService ==> (έφτιαξα class που το κάνει Implement)
    
    User findByUsernane(String username);
    
    User saveUser(User user);

    User createUser(User user);
    
    User updateUser(User user);
    
    
}


