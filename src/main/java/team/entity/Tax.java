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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author eon_A
 */
@Entity
@Table(name = "tax")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Tax.findAll", query = "SELECT t FROM Tax t")
    , @NamedQuery(name = "Tax.findByTaxid", query = "SELECT t FROM Tax t WHERE t.taxid = :taxid")
    , @NamedQuery(name = "Tax.findByVat", query = "SELECT t FROM Tax t WHERE t.vat = :vat")})
public class Tax implements Serializable {

    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "taxid")
    final Integer taxid;
    
    @Basic(optional = false)
    @NotNull
    @Column(name = "vat")
    private double vat;
//        
//    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tax")
//    private List<ProductOrders> productOrders;
//    
    public Tax() {
         this.taxid = 1;
         
    }

//    public Tax(Integer taxid) {
//        this.taxid = taxid;
//    }
//
//    public Tax(Integer taxid, double vat) {
//        this.taxid = 1;
//        this.vat = vat;
//    }

    public Integer getTaxid() {
        return taxid;
    }

//    public void setTaxid(Integer taxid) {
//        this.taxid = taxid;
//    }

    public double getVat() {
        return vat;
    }

    public void setVat(double vat) {
        this.vat = vat;
    }

//    public List<ProductOrders> getProductOrders() {
//        return productOrders;
//    }
//
//    public void setProductOrders(List<ProductOrders> productOrders) {
//        this.productOrders = productOrders;
//    }
//    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (taxid != null ? taxid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Tax)) {
            return false;
        }
        Tax other = (Tax) object;
        if ((this.taxid == null && other.taxid != null) || (this.taxid != null && !this.taxid.equals(other.taxid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "team.entity.Tax[ taxid=" + taxid + " ]";
    }
    
}
