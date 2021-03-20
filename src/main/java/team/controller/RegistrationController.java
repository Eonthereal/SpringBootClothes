/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.controller;

import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import team.entity.User;
import team.service.UserService;

@Controller
public class RegistrationController {

    @Autowired
    UserService userService;

    @GetMapping("/register")
    public String showRegisterForm(@ModelAttribute("reguser") User reguser) {
        
        return "Login-Authentication/register-form";

    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("reguser") User reguser, BindingResult result,
             RedirectAttributes attributes) {

            if (result.hasErrors()) {
                return "Login-Authentication/register-form";  //Login-Authentication/
            }
        //save user to DB       
      userService.saveUser(reguser);
//        System.out.println(">>>>> User from reg form:" + reguser);
        attributes.addFlashAttribute("registered", "Successfully registered");
        return "redirect:/loginpage";
    }

}
