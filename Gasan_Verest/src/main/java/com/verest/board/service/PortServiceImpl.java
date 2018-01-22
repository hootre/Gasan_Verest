package com.verest.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.verest.board.dao.PortDao;
import com.verest.board.dao.UserInfoDao;
import com.verest.board.model.CommonException;
import com.verest.board.model.Port;
import com.verest.board.model.UserInfo;

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
		dao.update(port);
		return oldFilename;
	}
	
	@Override
	public void remove(String no) throws CommonException {
			dao.delete(no);
	}

	@Override
	public void viewsup(Port port) throws CommonException {
		dao.viewsaction(port);
	}

}
