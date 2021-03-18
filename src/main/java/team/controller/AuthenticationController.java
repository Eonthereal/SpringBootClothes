/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class AuthenticationController {
    
    
    @GetMapping("/loginpage")
    public String showLoginPage(){
        return "Login-Authentication/login-page";
    }
    
    
    @GetMapping("/access-denied")
    public String showAccessDeniedPage(){
        return "Login-Authentication/access-denied";
    }
}
