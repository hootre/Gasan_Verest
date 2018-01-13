package com.verest.board.model;

public class UserType {
	
	private Integer v_id;		// 타입의 인덱스 번호 (Primary key)
	private String v_type;	// 타입명
	
	public UserType() {}

	public UserType(Integer v_id, String v_type) {
		this.v_id = v_id;
		this.v_type = v_type;
	}

	public Integer getId() {
		return v_id;
	}

	public void setId(Integer v_id) {
		this.v_id = v_id;
	}

	public String getType() {
		return v_type;
	}

	public void setType(String v_type) {
		this.v_type = v_type;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((v_id == null) ? 0 : v_id.hashCode());
		result = prime * result + ((v_type == null) ? 0 : v_type.hashCode());
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
		UserType other = (UserType) obj;
		if (v_id == null) {
			if (other.v_id != null)
				return false;
		} else if (!v_id.equals(other.v_id))
			return false;
		if (v_type == null) {
			if (other.v_type != null)
				return false;
		} else if (!v_type.equals(other.v_type))
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("UserType [v_id=");
		builder.append(v_id);
		builder.append(", v_type=");
		builder.append(v_type);
		builder.append("]");
		return builder.toString();
	}

	
}
