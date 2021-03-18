/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import team.entity.Role;
import team.entity.User;
import team.repository.RoleRepo;
import team.repository.UserRepo;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    UserRepo userRepo;
    @Autowired
    PasswordEncoder passwordEncoder;
    @Autowired
    RoleRepo roleRepo;

    @Override
    public User findByUsernane(String username) {
        return userRepo.findByUsername(username);
    }

    private List<GrantedAuthority> convertRolesToGrantedAuthorities(List<Role> roles) {
        List<GrantedAuthority> authorities = new ArrayList();
        for (Role r : roles) {
            GrantedAuthority authority = new SimpleGrantedAuthority(r.getType());
            authorities.add(authority);
        }
        return authorities;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        //Get User from DB
        User user = findByUsernane(username); // η μεθοδος από πάνω είναι.

        //if user not exists then throw exception
        if (user == null) {
            throw new UsernameNotFoundException("Invalid username");
        }
        //else return The User Object that Spring Security needs
        List<GrantedAuthority> authorities = convertRolesToGrantedAuthorities(user.getRoleList()); //μετατρέπουμε τους custom roles που έχουμε στη βάση μας σε List<GrantedAuthority> το οποίο γίνεται βάζοντας το roleList του user στη convertRolesToGrantedAuthorities() method που έχουμε φτιάξει πάνω   
        org.springframework.security.core.userdetails.User userOfSpringSecurity = new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), authorities); //έχει παιχτεί μλκια με το User Entity των πινάκων μας γιατί το User είναι δεσμευμένο από το Spring...
        return userOfSpringSecurity;
    }

    
    @Override
    public User saveUser(User user){
        String plainPassword = user.getPassword();
        String hashedPassword = passwordEncoder.encode(plainPassword);
        user.setPassword(hashedPassword);
        Role role = roleRepo.findByTypeContaining("USER"); //με τη findByTypeContaining μπορούμε να γράψουμε σκέτο USER ενώ με τη findByType πρέπει να γράψου ROLE_USER
        user.addRole(role);
        user = userRepo.save(user);
        return user;
}
    

    @Override
    public User createUser(User user) {
        String plainPassword = user.getPassword();
        String hashedPassword = passwordEncoder.encode(plainPassword);
        user.setPassword(hashedPassword);
        user = userRepo.save(user);
        return user;
    }
    
    
    
}
