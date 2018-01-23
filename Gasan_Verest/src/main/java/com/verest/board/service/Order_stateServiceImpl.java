package com.verest.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.verest.board.dao.Order_stateDao;
import com.verest.board.model.CommonException;
import com.verest.board.model.Order_state;

@Service
public class Order_stateServiceImpl implements Order_stateService{

	@Autowired
	private Order_stateDao StateDao;
	
	@Override
	public Order_state detail(Integer state_no) throws CommonException {
		return StateDao.select(state_no);
	}

}
