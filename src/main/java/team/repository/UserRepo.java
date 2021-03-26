/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import team.entity.User;

@Repository
public interface UserRepo extends JpaRepository<User, Integer> {
    
    //Μέθοδος που θα φέρει το username από τη βάση (π.χ. για το login) 
    @Query(value = "SELECT u FROM User u WHERE u.username = ?1")
    User findByUsername(String username);
    
    
    
    
     
}
