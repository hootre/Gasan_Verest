package com.verest.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.verest.board.dao.BasketDao;
import com.verest.board.model.Basket;
import com.verest.board.model.CommonException;

@Service
public class BasketServiceImpl implements BasketService{

	@Autowired
	private BasketDao basketDao;
	
	@Override
	public void newBoard(Basket basket) throws CommonException {
		basketDao.insert(basket);
	}

	@Override
	public Basket detail(String basket_no) throws CommonException {
		return basketDao.select(basket_no);
	}

	@Override
	public List<Basket> list() throws CommonException {
		return basketDao.selectAll();
	}

	@Override
	public int count() throws CommonException {
		return basketDao.BasketCount();
	}

	@Override
	public void remove(String basket_no) throws CommonException {
		basketDao.delete(basket_no);
	}

}
