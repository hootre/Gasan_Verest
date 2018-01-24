package com.verest.board.model;

public class Backsight {

	private Integer back_no;
	private Integer writer;
	private String content;
	private String title;
	private String regdate;
	private UserInfo userInfo;
	
	public Backsight() {}

	public Backsight(Integer back_no, Integer writer, String content, String title, String regdate, UserInfo userInfo) {
		this.back_no = back_no;
		this.writer = writer;
		this.content = content;
		this.title = title;
		this.regdate = regdate;
		this.userInfo = userInfo;
	}

	public Integer getBack_no() {
		return back_no;
	}

	public void setBack_no(Integer back_no) {
		this.back_no = back_no;
	}

	public Integer getWriter() {
		return writer;
	}

	public void setWriter(Integer writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
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
		result = prime * result + ((back_no == null) ? 0 : back_no.hashCode());
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((regdate == null) ? 0 : regdate.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		result = prime * result + ((userInfo == null) ? 0 : userInfo.hashCode());
		result = prime * result + ((writer == null) ? 0 : writer.hashCode());
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
		Backsight other = (Backsight) obj;
		if (back_no == null) {
			if (other.back_no != null)
				return false;
		} else if (!back_no.equals(other.back_no))
			return false;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (regdate == null) {
			if (other.regdate != null)
				return false;
		} else if (!regdate.equals(other.regdate))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		if (userInfo == null) {
			if (other.userInfo != null)
				return false;
		} else if (!userInfo.equals(other.userInfo))
			return false;
		if (writer == null) {
			if (other.writer != null)
				return false;
		} else if (!writer.equals(other.writer))
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Backsight [back_no=");
		builder.append(back_no);
		builder.append(", writer=");
		builder.append(writer);
		builder.append(", content=");
		builder.append(content);
		builder.append(", title=");
		builder.append(title);
		builder.append(", regdate=");
		builder.append(regdate);
		builder.append(", userInfo=");
		builder.append(userInfo);
		builder.append("]");
		return builder.toString();
	}

	
}
