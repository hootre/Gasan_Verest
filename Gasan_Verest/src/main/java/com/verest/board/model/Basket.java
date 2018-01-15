package com.verest.board.model;

import java.util.Date;

public class Basket {

	private Integer basket_no;
	private Integer v_id;
	private Integer sale_no;
	private Date regdate;
	
	public Basket() {}

	public Basket(Integer basket_no, Integer v_id, Integer sale_no, Date regdate) {
		this.basket_no = basket_no;
		this.v_id = v_id;
		this.sale_no = sale_no;
		this.regdate = regdate;
	}

	
	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public Integer getBasket_no() {
		return basket_no;
	}

	public void setBasket_no(Integer basket_no) {
		this.basket_no = basket_no;
	}

	public Integer getV_id() {
		return v_id;
	}

	public void setV_id(Integer v_id) {
		this.v_id = v_id;
	}

	public Integer getSale_no() {
		return sale_no;
	}

	public void setSale_no(Integer sale_no) {
		this.sale_no = sale_no;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((basket_no == null) ? 0 : basket_no.hashCode());
		result = prime * result + ((regdate == null) ? 0 : regdate.hashCode());
		result = prime * result + ((sale_no == null) ? 0 : sale_no.hashCode());
		result = prime * result + ((v_id == null) ? 0 : v_id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Basket other = (Basket) obj;
		if (basket_no == null) {
			if (other.basket_no != null)
				return false;
		} else if (!basket_no.equals(other.basket_no))
			return false;
		if (regdate == null) {
			if (other.regdate != null)
				return false;
		} else if (!regdate.equals(other.regdate))
			return false;
		if (sale_no == null) {
			if (other.sale_no != null)
				return false;
		} else if (!sale_no.equals(other.sale_no))
			return false;
		if (v_id == null) {
			if (other.v_id != null)
				return false;
		} else if (!v_id.equals(other.v_id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Basket [basket_no=");
		builder.append(basket_no);
		builder.append(", v_id=");
		builder.append(v_id);
		builder.append(", sale_no=");
		builder.append(sale_no);
		builder.append(", regdate=");
		builder.append(regdate);
		builder.append("]");
		return builder.toString();
	}

	
}
