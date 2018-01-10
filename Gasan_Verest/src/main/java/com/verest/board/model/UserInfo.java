package com.verest.board.model;

import java.util.Set;

public class UserInfo {
	
	private Integer v_id;					// 사용자 인덱스 (Primary Key)
	private String v_email;				// 이메일
	private String v_password;			// 비밀번호
	private String v_name;				// 이름
	private Set<UserType> userTypes;	// ADMIN, USER
	
	public UserInfo() {}

	public UserInfo(Integer v_id, String v_email, String v_password, String v_name, Set<UserType> userTypes) {
		this.v_id = v_id;
		this.v_email = v_email;
		this.v_password = v_password;
		this.v_name = v_name;
		this.userTypes = userTypes;
	}

	public Integer getV_id() {
		return v_id;
	}

	public void setV_id(Integer v_id) {
		this.v_id = v_id;
	}

	public String getV_email() {
		return v_email;
	}

	public void setV_email(String v_email) {
		this.v_email = v_email;
	}

	public String getV_password() {
		return v_password;
	}

	public void setV_password(String v_password) {
		this.v_password = v_password;
	}

	public String getV_name() {
		return v_name;
	}

	public void setV_name(String v_name) {
		this.v_name = v_name;
	}

	public Set<UserType> getUserTypes() {
		return userTypes;
	}

	public void setUserTypes(Set<UserType> userTypes) {
		this.userTypes = userTypes;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((userTypes == null) ? 0 : userTypes.hashCode());
		result = prime * result + ((v_email == null) ? 0 : v_email.hashCode());
		result = prime * result + ((v_id == null) ? 0 : v_id.hashCode());
		result = prime * result + ((v_name == null) ? 0 : v_name.hashCode());
		result = prime * result + ((v_password == null) ? 0 : v_password.hashCode());
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
		UserInfo other = (UserInfo) obj;
		if (userTypes == null) {
			if (other.userTypes != null)
				return false;
		} else if (!userTypes.equals(other.userTypes))
			return false;
		if (v_email == null) {
			if (other.v_email != null)
				return false;
		} else if (!v_email.equals(other.v_email))
			return false;
		if (v_id == null) {
			if (other.v_id != null)
				return false;
		} else if (!v_id.equals(other.v_id))
			return false;
		if (v_name == null) {
			if (other.v_name != null)
				return false;
		} else if (!v_name.equals(other.v_name))
			return false;
		if (v_password == null) {
			if (other.v_password != null)
				return false;
		} else if (!v_password.equals(other.v_password))
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("UserInfo [v_id=");
		builder.append(v_id);
		builder.append(", v_email=");
		builder.append(v_email);
		builder.append(", v_password=");
		builder.append(v_password);
		builder.append(", v_name=");
		builder.append(v_name);
		builder.append(", userTypes=");
		builder.append(userTypes);
		builder.append("]");
		return builder.toString();
	}

	
}
