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
	public List<Basket> list(Integer v_id) throws CommonException {
		return basketDao.selectAll(v_id);
	}

	@Override
	public int count() throws CommonException {
		return basketDao.BasketCount();
	}

	@Override
	public void remove(Integer basket_no) throws CommonException {
		basketDao.delete(basket_no);
	}

}
