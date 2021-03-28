/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.entity;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author eon_A
 */
@Entity
@Table(name = "orders")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Orders.findAll", query = "SELECT o FROM Orders o")
    , @NamedQuery(name = "Orders.findByOrdersid", query = "SELECT o FROM Orders o WHERE o.ordersid = :ordersid")
    , @NamedQuery(name = "Orders.findByCity", query = "SELECT o FROM Orders o WHERE o.city = :city")
    , @NamedQuery(name = "Orders.findByAddress", query = "SELECT o FROM Orders o WHERE o.address = :address")
    , @NamedQuery(name = "Orders.findByZipcode", query = "SELECT o FROM Orders o WHERE o.zipcode = :zipcode")
    , @NamedQuery(name = "Orders.findByStatus", query = "SELECT o FROM Orders o WHERE o.status = :status")
    , @NamedQuery(name = "Orders.findByTotalcost", query = "SELECT o FROM Orders o WHERE o.totalcost = :totalcost")
    , @NamedQuery(name = "Orders.findByOrderdate", query = "SELECT o FROM Orders o WHERE o.orderdate = :orderdate")})
public class Orders implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ordersid")
    private Integer ordersid;
    @Column(name = "city")
    private String city;
    @Column(name = "address")
    private String address;
    @Column(name = "zipcode")
    private String zipcode;
    @Column(name = "status")
    private String status;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "totalcost")
    private Double totalcost;
    @Column(name = "orderdate", columnDefinition = "DATE")
//    @Temporal(TemporalType.DATE)
    private LocalDate orderdate;
    
    //endiameso entity product_order (ManyToOne kai gia dyo), apo ti plevra tou order oneToMany kai apo ti plevra tou product oneToMany 
    //to product kai to order tha exoun apo mia lista product_order. 
    //product_oder tha exei kai pedio Order kai pedio Product
//    @JoinTable(name = "product_order", joinColumns = {
//        @JoinColumn(name = "ordersid", referencedColumnName = "ordersid")}, inverseJoinColumns = {
//        @JoinColumn(name = "productid", referencedColumnName = "productid")})
//    @ManyToMany(cascade = CascadeType.ALL)
//    private List<Product> productList;
    
    @OneToMany(mappedBy = "orders")
    private List<ProductOrders> productList;
    
    
    
    
    
    @JoinColumn(name = "userid", referencedColumnName = "userid")      
    @ManyToOne () //Μπορεί να θέλει optional=false
    private User user;

    public Orders() {
    }

    public Orders(Integer ordersid) {
        this.ordersid = ordersid;
    }

    public Orders(Integer ordersid, String city, String address, String zipcode, String status, Double totalcost, LocalDate orderdate, List<ProductOrders> productList, User user) {
        this.ordersid = ordersid;
        this.city = city;
        this.address = address;
        this.zipcode = zipcode;
        this.status = status;
        this.totalcost = totalcost;
        this.orderdate = orderdate;
        this.productList = productList;
        this.user = user;
    }

    public Integer getOrdersid() {
        return ordersid;
    }

    public void setOrdersid(Integer ordersid) {
        this.ordersid = ordersid;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Double getTotalcost() {
        return totalcost;
    }

    public void setTotalcost(Double totalcost) {
        this.totalcost = totalcost;
    }

    public LocalDate getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(LocalDate orderdate) {
        this.orderdate = orderdate;
    }

    @XmlTransient
    public List<ProductOrders> getProductList() {
        return productList;
    }

    public void setProductList(List<ProductOrders> productList) {
        this.productList = productList;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (ordersid != null ? ordersid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Orders)) {
            return false;
        }
        Orders other = (Orders) object;
        if ((this.ordersid == null && other.ordersid != null) || (this.ordersid != null && !this.ordersid.equals(other.ordersid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "team.entity.Orders[ ordersid=" + ordersid + " ]";
    }
    
}
