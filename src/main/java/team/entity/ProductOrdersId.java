/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.entity;

import java.io.Serializable;
import java.util.Objects;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author eon_A
 */
@Embeddable
public class ProductOrdersId implements Serializable {

    private static final long serialVersionUID = 1L;

    @Basic(optional = false)
    @Column(name = "productid")
    private Integer productid;
    @Basic(optional = false)
    @Column(name = "ordersid")
    private Integer ordersid;

    public ProductOrdersId() {
    }

    public ProductOrdersId(Integer productid, Integer ordersid) {
        this.productid = productid;
        this.ordersid = ordersid;
    }

    public Integer getProductid() {
        return productid;
    }

    public void setProductid(Integer productid) {
        this.productid = productid;
    }

    public Integer getOrdersid() {
        return ordersid;
    }

    public void setOrdersid(Integer ordersid) {
        this.ordersid = ordersid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) productid;
        hash += (int) ordersid;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProductOrdersId)) {
            return false;
        }
        ProductOrdersId other = (ProductOrdersId) object;
        if (this.productid != other.productid) {
            return false;
        }
        if (this.ordersid != other.ordersid) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "team.entity.ProductOrdersId[ productid=" + productid + ", ordersid=" + ordersid + " ]";
    }

}
