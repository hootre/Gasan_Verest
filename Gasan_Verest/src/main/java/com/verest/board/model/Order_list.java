package com.verest.board.model;

import java.util.Date;

public class Order_list {

	private Integer or_no;
	private Integer v_id;
	private Integer sale_no;
	private String sale_name;
	private Date regdate;
	
	public Order_list() {}

	public Order_list(Integer or_no, Integer v_id, Integer sale_no, String sale_name, Date regdate) {
		super();
		this.or_no = or_no;
		this.v_id = v_id;
		this.sale_no = sale_no;
		this.regdate = regdate;
		this.sale_name = sale_name;
	}

	
	public String getSale_name() {
		return sale_name;
	}

	public void setSale_name(String sale_name) {
		this.sale_name = sale_name;
	}

	public Integer getOr_no() {
		return or_no;
	}

	public void setOr_no(Integer or_no) {
		this.or_no = or_no;
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

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((or_no == null) ? 0 : or_no.hashCode());
		result = prime * result + ((regdate == null) ? 0 : regdate.hashCode());
		result = prime * result + ((sale_name == null) ? 0 : sale_name.hashCode());
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
		Order_list other = (Order_list) obj;
		if (or_no == null) {
			if (other.or_no != null)
				return false;
		} else if (!or_no.equals(other.or_no))
			return false;
		if (regdate == null) {
			if (other.regdate != null)
				return false;
		} else if (!regdate.equals(other.regdate))
			return false;
		if (sale_name == null) {
			if (other.sale_name != null)
				return false;
		} else if (!sale_name.equals(other.sale_name))
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
		builder.append("order_list [or_no=");
		builder.append(or_no);
		builder.append(", v_id=");
		builder.append(v_id);
		builder.append(", sale_no=");
		builder.append(sale_no);
		builder.append(", sale_name=");
		builder.append(sale_name);
		builder.append(", regdate=");
		builder.append(regdate);
		builder.append("]");
		return builder.toString();
	}

	
	
	
}
