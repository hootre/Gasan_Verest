package com.verest.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.verest.board.dao.SaleDatDao;
import com.verest.board.model.CommonException;
import com.verest.board.model.SaleDat;

@Service
public class SaleDatServiceImpl implements SaleDatService {
	
	@Autowired
	private SaleDatDao dao;
	
	public SaleDatServiceImpl() {}

	@Override
	public void newBoard(SaleDat saleDat) throws CommonException {
		dao.insert(saleDat);
	}

	@Override
	public SaleDat detail(String no) throws CommonException {
		return dao.select(no);
	}

	@Override
	public List<SaleDat> list() throws CommonException {
		return dao.selectAll();
	}

	@Override
	public int count() throws CommonException {
		return dao.boardCount();
	}
	
	@Transactional
	@Override
	public void modify(SaleDat saleDat) throws CommonException {
		dao.update(saleDat);
	}
	
	@Transactional
	@Override
	public void remove(String no) throws CommonException {
		dao.delete(no);
	}

}