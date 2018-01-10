package com.verest.board.model;

import java.util.Date;

public class PortDat {
	
	private Integer dat_no;
	private Integer board_no;
	private Integer dat_writer;
	private String content;
	private Date regdate;
	
	public PortDat() { }

	public PortDat(Integer dat_no, Integer board_no, Integer dat_writer, String content, Date regdate) {
		super();
		this.dat_no = dat_no;
		this.board_no = board_no;
		this.dat_writer = dat_writer;
		this.content = content;
		this.regdate = regdate;
	}

	public Integer getDat_no() {
		return dat_no;
	}

	public void setDat_no(Integer dat_no) {
		this.dat_no = dat_no;
	}

	public Integer getBoard_no() {
		return board_no;
	}

	public void setBoard_no(Integer board_no) {
		this.board_no = board_no;
	}

	public Integer getDat_writer() {
		return dat_writer;
	}

	public void setDat_writer(Integer dat_writer) {
		this.dat_writer = dat_writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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
		result = prime * result + ((board_no == null) ? 0 : board_no.hashCode());
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((dat_no == null) ? 0 : dat_no.hashCode());
		result = prime * result + ((dat_writer == null) ? 0 : dat_writer.hashCode());
		result = prime * result + ((regdate == null) ? 0 : regdate.hashCode());
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
		PortDat other = (PortDat) obj;
		if (board_no == null) {
			if (other.board_no != null)
				return false;
		} else if (!board_no.equals(other.board_no))
			return false;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (dat_no == null) {
			if (other.dat_no != null)
				return false;
		} else if (!dat_no.equals(other.dat_no))
			return false;
		if (dat_writer == null) {
			if (other.dat_writer != null)
				return false;
		} else if (!dat_writer.equals(other.dat_writer))
			return false;
		if (regdate == null) {
			if (other.regdate != null)
				return false;
		} else if (!regdate.equals(other.regdate))
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("SaleDat [dat_no=");
		builder.append(dat_no);
		builder.append(", board_no=");
		builder.append(board_no);
		builder.append(", dat_writer=");
		builder.append(dat_writer);
		builder.append(", content=");
		builder.append(content);
		builder.append(", regdate=");
		builder.append(regdate);
		builder.append("]");
		return builder.toString();
	}
	
	

}
