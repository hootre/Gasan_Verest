package com.verest.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.verest.board.dao.BacksightDao;
import com.verest.board.model.Backsight;
import com.verest.board.model.CommonException;

@Service
public class BacksightServiceImpl implements BacksightService{

	@Autowired
	private BacksightDao backDao;

	@Override
	public void newBoard(Backsight backsight) throws CommonException {
		backDao.insert(backsight);
		
	}

	@Override
	public Backsight detail(Integer back_no) throws CommonException {
		return  backDao.select(back_no);
	}

	@Override
	public List<Backsight> list() throws CommonException {
		return backDao.selectAll();
	}

	@Override
	public int count() throws CommonException {
		return backDao.backsightCount();
	}

	@Override
	public void modify(Backsight backsight) throws CommonException {
		 backDao.update(backsight);
	}

	@Override
	public void remove(Integer back_no) throws CommonException {
		backDao.delete(back_no);
	}
}
