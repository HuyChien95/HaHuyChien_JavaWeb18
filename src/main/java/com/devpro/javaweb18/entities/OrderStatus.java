package com.devpro.javaweb18.entities;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table (name = "tbl_order_status")
public class OrderStatus extends BaseEntity{

	@Column(name = "status_name", length = 100, nullable = false)
	private String name;
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "paymentStatus")
	private Set<SaleOrder> saleOrder = new HashSet<SaleOrder>();
	public void addSaleOrder(SaleOrder sOrder) {
		saleOrder.add(sOrder);
		sOrder.setOrderStatus(this);
	}
	public void deleteSaleOrder(SaleOrder sOrder) {
		saleOrder.remove(sOrder);
		sOrder.setOrderStatus(null);
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Set<SaleOrder> getSaleOrder() {
		return saleOrder;
	}
	public void setSaleOrder(Set<SaleOrder> saleOrder) {
		this.saleOrder = saleOrder;
	}
}
