package com.verest.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.verest.board.dao.PortDao;
import com.verest.board.model.CommonException;
import com.verest.board.model.Port;

@Service
public class PortServiceImpl implements PortService {
	
	@Autowired
	private PortDao dao;
	
	public PortServiceImpl() {}

	@Override
	public void newBoard(Port port) throws CommonException {
		dao.insert(port);
	}

	@Override
	public Port detail(String no) throws CommonException {
		return dao.select(no);
	}

	@Override
	public List<Port> list() throws CommonException {
		return dao.selectAll();
	}

	@Override
	public int count() throws CommonException {
		return dao.boardCount();
	}
	
	@Transactional
	@Override
	public String modify(Port port) throws CommonException {
		Port item = dao.select(Integer.toString(port.getNo()));
		String oldFilename = item.getAttachment();
		return oldFilename;
	}
	
	@Transactional
	@Override
	public String remove(String no) throws CommonException {
		Port item = dao.select(no);
		String filename = item.getAttachment();
		dao.delete(no);
		return filename;
	}

}