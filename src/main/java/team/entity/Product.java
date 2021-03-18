/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author eon_A
 */
@Entity
@Table(name = "product")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Product.findAll", query = "SELECT p FROM Product p")
    , @NamedQuery(name = "Product.findByProductid", query = "SELECT p FROM Product p WHERE p.productid = :productid")
    , @NamedQuery(name = "Product.findByTitle", query = "SELECT p FROM Product p WHERE p.title = :title")
    , @NamedQuery(name = "Product.findByImage", query = "SELECT p FROM Product p WHERE p.image = :image")
    , @NamedQuery(name = "Product.findByPrice", query = "SELECT p FROM Product p WHERE p.price = :price")
    , @NamedQuery(name = "Product.findByOffer", query = "SELECT p FROM Product p WHERE p.offer = :offer")})
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "productid")
    private Integer productid;
    @Column(name = "title")
    private String title;
    @Column(name = "image")
    private String image;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "price")
    private Double price;
    @Basic(optional = false)
    @Column(name = "offer")
    private String offer;
    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "product_color",
            joinColumns ={ 
                @JoinColumn(name = "productid", referencedColumnName = "productid")},inverseJoinColumns = {
                @JoinColumn(name = "colorid", referencedColumnName = "colorid")})
    private List<Color> colorList;
    
    //Sto mathima eixame pei oti isws na itan kalo na valoume diko tou ID (2:26:00) 19/02/2021 kai o syndiasmos twn 2 fk na einai unique
    //endiameso entity product_order (ManyToOne kai gia dyo), apo ti plevra tou order oneToMany kai apo ti plevra tou product oneToMany 
    //to product kai to order tha exoun apo mia lista product_order. 
    //product_oder tha exei kai pedio Order kai pedio Product
    @ManyToMany(mappedBy = "productList")
    private List<Orders> ordersList;
    
    
    @JoinTable(name = "product_sizes", joinColumns = {
    @JoinColumn(name = "productid", referencedColumnName = "productid")}, inverseJoinColumns = {
    @JoinColumn(name = "sizesid", referencedColumnName = "sizesid")})
    @ManyToMany
    private List<Sizes> sizesList;
  
    @JoinColumn(name = "brandid", referencedColumnName = "brandid")
    @ManyToOne(optional = false)
    private Brand brand;
    @JoinColumn(name = "categoryid", referencedColumnName = "categoryid")
    @ManyToOne(optional = false)
    private Category category;@JoinColumn(name = "genderid", referencedColumnName = "genderid")
    @ManyToOne(optional = false)
    private Gender gender;

    public Product() {
    }

    public Product(Integer productid) {
        this.productid = productid;
    }

    public Product(Integer productid, String offer) {
        this.productid = productid;
        this.offer = offer;
    }

    public Integer getProductid() {
        return productid;
    }

    public void setProductid(Integer productid) {
        this.productid = productid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getOffer() {
        return offer;
    }

    public void setOffer(String offer) {
        this.offer = offer;
    }

    @XmlTransient
    public List<Color> getColorList() {
        return colorList;
    }

    public void setColorList(List<Color> colorList) {
        this.colorList = colorList;
    }

    @XmlTransient
    public List<Orders> getOrdersList() {
        return ordersList;
    }

    public void setOrdersList(List<Orders> ordersList) {
        this.ordersList = ordersList;
    }

    @XmlTransient
    public List<Sizes> getSizesList() {
        return sizesList;
    }

    public void setSizesList(List<Sizes> sizesList) {
        this.sizesList = sizesList;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (productid != null ? productid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Product)) {
            return false;
        }
        Product other = (Product) object;
        if ((this.productid == null && other.productid != null) || (this.productid != null && !this.productid.equals(other.productid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "team.entity.Product[ productid=" + productid + " ]";
    }

}
