/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import team.entity.User;
import team.repository.UserRepo;


@Controller
@RequestMapping("/user")
public class UserController {
    
    @Autowired
    UserRepo userRepo;
    
    
//    @GetMapping("/profile/{principal.username}")
//    public String userProfile(@ModelAttribute("user") User user){ //@RequestParam("username") String username, @ModelAttribute("user") User user
//      
//        
//        System.out.println("user before 1 "+user.getUsername());
//        System.out.println("user before 2 "+username);
//         if(user.getUsername().equals(username)){
//             System.out.println("after if ");
//        
//             user = userRepo.findByUsername(username);
//             
//        System.out.println("after if 1 "+user.getUsername());
//        System.out.println("after if 2 "+username);
//        
//        
//             System.out.println(user.toString());
//           
//        }else{
//            System.out.println("FUCK YOU");
//            System.out.println(user.getUsername());
//        }
//        
//        return "User/profile";
//    }
    
    
//     public String userProfile(@RequestParam("username") String username, @ModelAttribute("user") User user){ //@RequestParam("username") String username, @ModelAttribute("user") User user
//      
//        
//        System.out.println("user before 1 "+user.getUsername());
//        System.out.println("user before 2 "+username);
//         if(user.getUsername().equals(username)){
//             System.out.println("after if ");
//        
//             user = userRepo.findByUsername(username);
//             
//        System.out.println("after if 1 "+user.getUsername());
//        System.out.println("after if 2 "+username);
//        
//        
//             System.out.println(user.toString());
//           
//        }else{
//            System.out.println("FUCK YOU");
//            System.out.println(user.getUsername());
//        }
//        
//        return "User/profile";
    
//     }
       
}
