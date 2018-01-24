package com.verest.board.model;

public class Order_list {

	private Integer or_no;
	private Integer v_id;
	private Integer sale_no;
	private Sale sale;
	private String regdate;
	private String state;
	private UserInfo userInfo;
	
	public Order_list() {}

	public Order_list(Integer or_no, Integer v_id, Integer sale_no, Sale sale, String regdate, String state,
			UserInfo userInfo) {
		this.or_no = or_no;
		this.v_id = v_id;
		this.sale_no = sale_no;
		this.sale = sale;
		this.regdate = regdate;
		this.state = state;
		this.userInfo = userInfo;
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

	public Sale getSale() {
		return sale;
	}

	public void setSale(Sale sale) {
		this.sale = sale;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((or_no == null) ? 0 : or_no.hashCode());
		result = prime * result + ((regdate == null) ? 0 : regdate.hashCode());
		result = prime * result + ((sale == null) ? 0 : sale.hashCode());
		result = prime * result + ((sale_no == null) ? 0 : sale_no.hashCode());
		result = prime * result + ((state == null) ? 0 : state.hashCode());
		result = prime * result + ((userInfo == null) ? 0 : userInfo.hashCode());
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
		if (sale == null) {
			if (other.sale != null)
				return false;
		} else if (!sale.equals(other.sale))
			return false;
		if (sale_no == null) {
			if (other.sale_no != null)
				return false;
		} else if (!sale_no.equals(other.sale_no))
			return false;
		if (state == null) {
			if (other.state != null)
				return false;
		} else if (!state.equals(other.state))
			return false;
		if (userInfo == null) {
			if (other.userInfo != null)
				return false;
		} else if (!userInfo.equals(other.userInfo))
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
		builder.append("Order_list [or_no=");
		builder.append(or_no);
		builder.append(", v_id=");
		builder.append(v_id);
		builder.append(", sale_no=");
		builder.append(sale_no);
		builder.append(", sale=");
		builder.append(sale);
		builder.append(", regdate=");
		builder.append(regdate);
		builder.append(", state=");
		builder.append(state);
		builder.append(", userInfo=");
		builder.append(userInfo);
		builder.append("]");
		return builder.toString();
	}

	
	
}
