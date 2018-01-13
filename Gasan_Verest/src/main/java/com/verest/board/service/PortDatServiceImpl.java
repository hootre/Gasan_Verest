package com.verest.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.verest.board.dao.PortDatDao;
import com.verest.board.model.CommonException;
import com.verest.board.model.PortDat;

@Service
public class PortDatServiceImpl implements PortDatService {
	
	@Autowired
	private PortDatDao dao;
	
	public PortDatServiceImpl() {}

	@Override
	public void newBoard(PortDat portDat) throws CommonException {
		dao.insert(portDat);
	}

	@Override
	public PortDat detail(String no) throws CommonException {
		return dao.select(no);
	}

	@Override
	public List<PortDat> list() throws CommonException {
		return dao.selectAll();
	}

	@Override
	public int count() throws CommonException {
		return dao.boardCount();
	}
	
	@Transactional
	@Override
	public String modify(PortDat portDat) throws CommonException {
		dao.update(portDat);
		return null;
	}
	
	@Transactional
	@Override
	public String remove(String no) throws CommonException {
		dao.delete(no);
		return null;
	}

}
