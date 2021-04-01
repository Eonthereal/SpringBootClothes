/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author eon_A
 */
@Entity
@Table(name = "product_orders")
@NamedQueries({
    @NamedQuery(name = "ProductOrders.findAll", query = "SELECT p FROM ProductOrders p")
    , @NamedQuery(name = "ProductOrders.findByProductid", query = "SELECT p FROM ProductOrders p WHERE p.productOrdersId.productid = :productid")
    , @NamedQuery(name = "ProductOrders.findByOrdersid", query = "SELECT p FROM ProductOrders p WHERE p.productOrdersId.ordersid = :ordersid")
    , @NamedQuery(name = "ProductOrders.findByQuantity", query = "SELECT p FROM ProductOrders p WHERE p.quantity = :quantity")
    , @NamedQuery(name = "ProductOrders.findByPrice", query = "SELECT p FROM ProductOrders p WHERE p.price = :price")})

public class ProductOrders implements Serializable {

    private static final long serialVersionUID = 1L;

    @EmbeddedId
    protected ProductOrdersId productOrdersId;

    @Basic(optional = false)
    @Column(name = "quantity")
    private Integer quantity;

    @Basic(optional = false)
    @Column(name = "price")
    private Double price;

    @JoinColumn(name = "productid", referencedColumnName = "productid", insertable = false, updatable = false)
    @ManyToOne(optional = false)
//    @MapsId("productid") //Το MapsId πρέπει να κάνει ότι και το JoinColumn αλλά κάπου στο stuckoverflow διάβασα ότι έχει πρόβλημα με το Hybernate
    private Product product;

    @JoinColumn(name = "ordersid", referencedColumnName = "ordersid", insertable = false, updatable = false)
    @ManyToOne(optional = false)
//    @MapsId("ordersid")
    private Orders orders;

//    @JoinColumn(name = "taxid",referencedColumnName = "taxid", insertable = false, updatable = false)
//    @ManyToOne(optional = false)
//    private Tax tax;
    
    
    public ProductOrders() {
    }

    public ProductOrders(ProductOrdersId productOrdersId) {
        this.productOrdersId = productOrdersId;
    }

    public ProductOrders(Integer productid, Integer ordersid) {
        this.productOrdersId = new ProductOrdersId(productid, ordersid);
    }

    public ProductOrders(Integer productid, Integer ordersid,  Integer quantity, double price) {
        this.productOrdersId = new ProductOrdersId(productid, ordersid);
        this.quantity = quantity;
        this.price = price;
    }

    public ProductOrdersId getProductOrdersId() {
        return productOrdersId;
    }

    public void setProductOrdersId(ProductOrdersId productOrdersId) {
        this.productOrdersId = productOrdersId;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Orders getOrders() {
        return orders;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

//    public Tax getTax() {
//        return tax;
//    }
//
//    public void setTax(Tax tax) {
//        this.tax = tax;
//    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (productOrdersId != null ? productOrdersId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProductOrders)) {
            return false;
        }
        ProductOrders other = (ProductOrders) object;
        if ((this.productOrdersId == null && other.productOrdersId != null) || (this.productOrdersId != null && !this.productOrdersId.equals(other.productOrdersId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "team.entity.ProductOrders[ productOrdersId=" + productOrdersId + " ]";
    }

}
