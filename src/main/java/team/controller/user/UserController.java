/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.controller.user;

import java.security.Principal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import team.entity.User;
import team.repository.UserRepo;


@Controller
@RequestMapping("/user")
public class UserController {
    
   @Autowired
   UserRepo userRepo;
    
    
    @GetMapping("/profile/{principal.username}")
    public String showUserProfile(Principal principal, Model model){
        
        User user = userRepo.findByUsername(principal.getName());
        
        model.addAttribute("user", user);
        
        return "User/profile";
    }
    
    
    
    
    
}
