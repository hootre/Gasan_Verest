package com.verest.board.dao;

import com.verest.board.model.CommonException;
import com.verest.board.model.Order_state;

public interface Order_stateDao {
	
		// 주문확인  하나 가져오기
		public Order_state select(Integer state_no) throws CommonException;

}
