package com.verest.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.verest.board.dao.SaleDao;
import com.verest.board.model.CommonException;
import com.verest.board.model.Sale;

@Service
public class SaleServiceImpl implements SaleService {
	
	@Autowired
	private SaleDao dao;
	
	public SaleServiceImpl() {}

	@Override
	public void newBoard(Sale sale) throws CommonException {
		dao.insert(sale);
	}

	@Override
	public Sale detail(Integer no) throws CommonException {
		return dao.select(no);
	}

	@Override
	public List<Sale> list() throws CommonException {
		return dao.selectAll();
	}

	@Override
	public int count() throws CommonException {
		return dao.boardCount();
	}
	
	@Transactional
	@Override
	public void modify(Sale sale) throws CommonException {
		dao.select(sale.getNo());
	}
	
	@Transactional
	@Override
	public void remove(Integer no) throws CommonException {
		dao.delete(no);
	}

	@Override
	public void viewsup(Sale sale) throws CommonException {
		dao.viewsaction(sale);
	}

}
