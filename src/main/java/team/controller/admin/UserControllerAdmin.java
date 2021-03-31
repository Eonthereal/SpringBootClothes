/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.controller.admin;

import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import team.entity.Role;
import team.entity.User;
import team.repository.RoleRepo;
import team.repository.UserRepo;
import team.service.RoleService;
import team.service.UserService;

@Controller
@RequestMapping("admin/user")
public class UserControllerAdmin {

    @Autowired
    UserService userService;

    @Autowired
    RoleService roleService;

    @Autowired
    RoleRepo roleRepo;

    @Autowired
    UserRepo userRepo;
    
    @ModelAttribute("roles")
    public List<Role> getRoles() {
        return roleService.findAll();
    }
    
    @GetMapping
    public String showUsers(Model model) {
        List<User> listOfUsers = userRepo.findAll();
       
        model.addAttribute("listOfUsers", listOfUsers);
        return "Admin/userCRUD";
    }

    // =================CREATE METHODS============================
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String showForm(@ModelAttribute("user") User user) {
        return "Admin/userFormCREATE";
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String create(@Valid @ModelAttribute("user") User user, BindingResult result,
            RedirectAttributes attributes) {

        if (result.hasErrors()) {

            return "Admin/userFormCREATE";
        }
        userService.createUser(user);
        String minima = "User " + user.getFirstname() + " successfully created!!";
        attributes.addFlashAttribute("message", minima);
        return "redirect:/admin/user";
    }


//===========================================UPDATE===============================================
  
    @GetMapping("/update/{userid}")
    public String update(
            User user,
            @PathVariable(value = "userid") int userid, Model model) {

        User userToUpdate = userRepo.findById(userid).get();

        model.addAttribute("user", userToUpdate);
        return "Admin/userFormUPDATE";
    }

    @PostMapping("/update")
    public String update(@Valid @ModelAttribute("user") User user, BindingResult result, RedirectAttributes attributes) {
        if (result.hasErrors()) {
            return "Admin/userFormUPDATE";
        }

        userRepo.save(user);

        String minima = "User updated successfully!!";
        attributes.addFlashAttribute("message", minima);
        return "redirect:/admin/user";
    }
    // =============================DELETE=====================================    

    @GetMapping("/delete")
    public String delete(@RequestParam("id") int id, RedirectAttributes attributes) {
        String minima;

        userRepo.deleteById(id);

        minima = "User deleted successfully!";
        attributes.addFlashAttribute("message", minima);
        return "redirect:/admin/user";
    }

    //===============================EXCEPTIONS=======================================
    @ExceptionHandler(DataIntegrityViolationException.class)
    public String handleDataIntegrityViolationException(RedirectAttributes attributes) {
        String minima = "Could not commit transaction!!";
        attributes.addFlashAttribute("message", minima);
        return "redirect:/admin/user";
    }

}
