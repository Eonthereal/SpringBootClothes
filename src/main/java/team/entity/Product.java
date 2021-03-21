/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

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
    , @NamedQuery(name = "Product.findByOffer", query = "SELECT p FROM Product p WHERE p.offer = :offer")
    , @NamedQuery(name = "Product.findByStock", query = "SELECT p FROM Product p WHERE p.stock = :stock")})
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "productid")
    private Integer productid;
    @Size(max = 45)
    @Column(name = "title")
    private String title;
    @Size(max = 100)
    @Column(name = "image")
    private String image;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "price")
    private Double price;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 3)
    @Column(name = "offer")
    private String offer;
    @Basic(optional = false)
    @NotNull
    @Column(name = "stock")
    private int stock;
    @JoinColumn(name = "brandid", referencedColumnName = "brandid")
    @ManyToOne(optional = false)
    private Brand brand;
    @JoinColumn(name = "categoryid", referencedColumnName = "categoryid")
    @ManyToOne(optional = false)
    private Category category;
    @JoinColumn(name = "colorid", referencedColumnName = "colorid")
    @ManyToOne(optional = false)
    private Color color;
    @JoinColumn(name = "genderid", referencedColumnName = "genderid")
    @ManyToOne(optional = false)
    private Gender gender;
    @JoinColumn(name = "sizeid", referencedColumnName = "sizesid")
    @ManyToOne(optional = false)
    private Sizes size;

    public Product() {
    }

    public Product(Integer productid) {
        this.productid = productid;
    }

//    public Product(Integer productid, String offer, int stock) {
//        this.productid = productid;
//        this.offer = offer;
//        this.stock = stock;
//    }

    public Product(Integer productid, String title, String image, Double price, String offer, int stock, Brand brand, Category category, Color color, Gender gender, Sizes sizeid) {
        this.productid = productid;
        this.title = title;
        this.image = image;
        this.price = price;
        this.offer = offer;
        this.stock = stock;
        this.brand = brand;
        this.category = category;
        this.color = color;
        this.gender = gender;
        this.size = sizeid;
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

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
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

    public Color getColor() {
        return color;
    }

    public void setColor(Color color) {
        this.color = color;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public Sizes getSize() {
        return size;
    }

    public void setSize(Sizes size) {
        this.size = size;
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
        return "team.repository.Product[ productid=" + productid + " ]";
    }
    
}
