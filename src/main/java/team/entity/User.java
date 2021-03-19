/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author eon_A
 */
@Entity
@Table(name = "user")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "User.findAll", query = "SELECT u FROM User u")
    , @NamedQuery(name = "User.findByUserid", query = "SELECT u FROM User u WHERE u.userid = :userid")
    , @NamedQuery(name = "User.findByUsername", query = "SELECT u FROM User u WHERE u.username = :username")
    , @NamedQuery(name = "User.findByPassword", query = "SELECT u FROM User u WHERE u.password = :password")
    , @NamedQuery(name = "User.findByEmail", query = "SELECT u FROM User u WHERE u.email = :email")
    , @NamedQuery(name = "User.findByFirstname", query = "SELECT u FROM User u WHERE u.firstname = :firstname")
    , @NamedQuery(name = "User.findByLastname", query = "SELECT u FROM User u WHERE u.lastname = :lastname")
    , @NamedQuery(name = "User.findByPhonenumber", query = "SELECT u FROM User u WHERE u.phonenumber = :phonenumber")
    , @NamedQuery(name = "User.findByCredits", query = "SELECT u FROM User u WHERE u.credits = :credits")})
public class User implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "userid")
    private Integer userid;
    
    @Basic(optional = false)
    @Column(name = "username", unique = true)
    @NotEmpty(message = "Username is required!")
    private String username;
    
    @Basic(optional = false)
    @Column(name = "password")
    @NotEmpty(message = "Password is required!")
    private String password;
    
    @Basic(optional = false)
    @Column(name = "email")
    @Email
    @NotEmpty(message = "E-mail is required!")
    private String email;
    
    @Basic(optional = false)
    @Column(name = "firstname")
    @NotEmpty(message = "First Name is required!")
    private String firstname;
    
    @Basic(optional = false)
    @Column(name = "lastname")
    @NotEmpty(message = "Last Name is required!")
    private String lastname;
    
    @Basic(optional = false)
    @Column(name = "phonenumber")
    @NotEmpty(message = "Phone Number is required!")
    private String phonenumber;

    @Basic(optional = false)
    @Column(name = "credits", insertable = false) //Το insertable το έβαλα για να πέρνει το defaul value 5000 που έχουμε ορίσει στη βάση
    private int credits;
    
    @Basic (optional = false)
    @Column(name = "enabled", insertable = false)
    private boolean enabled;
    
    @ManyToMany (fetch = FetchType.EAGER)
    @JoinTable(name = "user_role",
            joinColumns = {
                @JoinColumn(name = "userid", referencedColumnName = "userid")},
            inverseJoinColumns = {
                @JoinColumn(name = "roleid", referencedColumnName = "roleid")})
    private List<Role> roleList;
    @OneToMany(mappedBy = "user" ,cascade = CascadeType.ALL) //
    private List<Orders> ordersList;

    public User() {
    }

    public User(Integer userid) {
        this.userid = userid;
    }

//    public User(Integer userid, int credits) {
//        this.userid = userid;
//        
//        this.credits = credits;
//    }

    public User(Integer userid, String username, String password, String email, String firstname, String lastname, String phonenumber, int credits, boolean enabled) {
        this.userid = userid;
        this.username = username;
        this.password = password;
        this.email = email;
        this.firstname = firstname;
        this.lastname = lastname;
        this.phonenumber = phonenumber;
        this.credits = credits;
        this.enabled = enabled;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public int getCredits() {
        return credits;
    }

    public void setCredits(int credits) {
        this.credits = credits;
    }
    
    

    @XmlTransient
    public List<Role> getRoleList() {
        return roleList;
    }

    public void setRoleList(List<Role> roleList) {
        this.roleList = roleList;
    }
    
    public void addRole(Role role){
        if(roleList == null){
            roleList = new ArrayList();
        }
        roleList.add(role);
    }

    @XmlTransient
    public List<Orders> getOrdersList() {
        return ordersList;
    }

    public void setOrdersList(List<Orders> ordersList) {
        this.ordersList = ordersList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (userid != null ? userid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof User)) {
            return false;
        }
        User other = (User) object;
        if ((this.userid == null && other.userid != null) || (this.userid != null && !this.userid.equals(other.userid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "team.entity.User[ userid=" + userid + ", username " + username + ", password " + password + ", First name " + firstname
                + ", Last Name " + lastname + ", Phone  " + phonenumber + ", email " + email + " ]";

    }

    
    
    public boolean isEnabled() {
        return this.enabled;
    }
    
    public void setActive(boolean enabled){
        this.enabled=enabled;
    }
    

}
