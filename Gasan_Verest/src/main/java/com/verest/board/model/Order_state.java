package com.verest.board.model;

public class Order_state {

	private Integer state_no;
	private String ready;
	private String finish;
	
	public Order_state() {}

	public Order_state(Integer state_no, String ready, String finish) {
		this.state_no = state_no;
		this.ready = ready;
		this.finish = finish;
	}

	public Integer getState_no() {
		return state_no;
	}

	public void setState_no(Integer state_no) {
		this.state_no = state_no;
	}

	public String getReady() {
		return ready;
	}

	public void setReady(String ready) {
		this.ready = ready;
	}

	public String getFinish() {
		return finish;
	}

	public void setFinish(String finish) {
		this.finish = finish;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((finish == null) ? 0 : finish.hashCode());
		result = prime * result + ((ready == null) ? 0 : ready.hashCode());
		result = prime * result + ((state_no == null) ? 0 : state_no.hashCode());
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
		Order_state other = (Order_state) obj;
		if (finish == null) {
			if (other.finish != null)
				return false;
		} else if (!finish.equals(other.finish))
			return false;
		if (ready == null) {
			if (other.ready != null)
				return false;
		} else if (!ready.equals(other.ready))
			return false;
		if (state_no == null) {
			if (other.state_no != null)
				return false;
		} else if (!state_no.equals(other.state_no))
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("order_state [state_no=");
		builder.append(state_no);
		builder.append(", ready=");
		builder.append(ready);
		builder.append(", finish=");
		builder.append(finish);
		builder.append("]");
		return builder.toString();
	}
	
	
}
