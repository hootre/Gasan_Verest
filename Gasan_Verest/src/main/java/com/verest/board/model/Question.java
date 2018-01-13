package com.verest.board.model;

import java.util.Date;

public class Question {
	
	private Integer qu_no;
	private Integer writer;
	private String content;
	private String title;
	private Date regdate;
	
	public Question() {}

	public Question(Integer qu_no, Integer writer, String content, String title, Date regdate) {
		this.qu_no = qu_no;
		this.writer = writer;
		this.content = content;
		this.title = title;
		this.regdate = regdate;
	}

	public Integer getQu_no() {
		return qu_no;
	}

	public void setQu_no(Integer qu_no) {
		this.qu_no = qu_no;
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
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((qu_no == null) ? 0 : qu_no.hashCode());
		result = prime * result + ((regdate == null) ? 0 : regdate.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
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
		Question other = (Question) obj;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (qu_no == null) {
			if (other.qu_no != null)
				return false;
		} else if (!qu_no.equals(other.qu_no))
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
		builder.append("question1 [qu_no=");
		builder.append(qu_no);
		builder.append(", writer=");
		builder.append(writer);
		builder.append(", content=");
		builder.append(content);
		builder.append(", title=");
		builder.append(title);
		builder.append(", regdate=");
		builder.append(regdate);
		builder.append("]");
		return builder.toString();
	}
	
	
}
