package com.verest.board.service;


import com.verest.board.model.CommonException;
import com.verest.board.model.Order_state;

public interface Order_stateService {

			// 게시물 하나를 가져온다.
			public Order_state detail(Integer state_no) throws CommonException;

}
