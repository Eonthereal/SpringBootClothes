/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import team.entity.Role;

@Repository
public interface RoleRepo extends JpaRepository<Role, Integer> {
    
    @Query("SELECT r FROM Role r WHERE r.type = :type")
    public Role findByType(@Param("type") String type);
    
    public Role findByTypeContaining(String type); // SELECT * FROM role WHERE type LIKE '%USER%' υπάρχει μέσα στο Spring Data JPA
    
    public List<Role> findAll();

    
    
}
