/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team.entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
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
@Table(name = "sizes")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Sizes.findAll", query = "SELECT s FROM Sizes s")
    , @NamedQuery(name = "Sizes.findBySizesid", query = "SELECT s FROM Sizes s WHERE s.sizesid = :sizesid")
    , @NamedQuery(name = "Sizes.findBySizename", query = "SELECT s FROM Sizes s WHERE s.sizename = :sizename")})
public class Sizes implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "sizesid")
    private Integer sizesid;
    @Column(name = "sizename")
    private String sizename;
    @ManyToMany(mappedBy = "sizesList")
    private List<Product> productList;

    public Sizes() {
    }

    public Sizes(Integer sizesid) {
        this.sizesid = sizesid;
    }

    public Integer getSizesid() {
        return sizesid;
    }

    public void setSizesid(Integer sizesid) {
        this.sizesid = sizesid;
    }

    public String getSizename() {
        return sizename;
    }

    public void setSizename(String sizename) {
        this.sizename = sizename;
    }

    @XmlTransient
    public List<Product> getProductList() {
        return productList;
    }

    public void setProductList(List<Product> productList) {
        this.productList = productList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (sizesid != null ? sizesid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Sizes)) {
            return false;
        }
        Sizes other = (Sizes) object;
        if ((this.sizesid == null && other.sizesid != null) || (this.sizesid != null && !this.sizesid.equals(other.sizesid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "team.entity.Sizes[ sizesid=" + sizesid + " ]";
    }
    
}
