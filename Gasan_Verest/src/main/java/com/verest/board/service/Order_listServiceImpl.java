package com.verest.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.verest.board.dao.Order_listDao;
import com.verest.board.model.CommonException;
import com.verest.board.model.Order_list;

@Service
public class Order_listServiceImpl implements Order_listService{

	@Autowired
	private Order_listDao ordDao;
	
	@Override
	public void newBoard(Order_list order_list) throws CommonException {
		ordDao.insert(order_list);
	}

	@Override
	public Order_list detail(String or_no) throws CommonException {
		return ordDao.select(or_no);
	}

	@Override
	public List<Order_list> list() throws CommonException {
		return ordDao.selectAll();
	}

	@Override
	public int count() throws CommonException {
		return ordDao.Order_listCount();
	}

	@Override
	public void remove(String or_no) throws CommonException {
		ordDao.delete(or_no);
		
	}

}