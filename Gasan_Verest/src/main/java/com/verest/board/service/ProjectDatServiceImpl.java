package com.verest.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.verest.board.dao.ProjectDatDao;
import com.verest.board.model.CommonException;
import com.verest.board.model.ProjectDat;

@Service
public class ProjectDatServiceImpl implements ProjectDatService {
	
	@Autowired
	private ProjectDatDao dao;
	
	public ProjectDatServiceImpl() {}

	@Override
	public void newBoard(ProjectDat projectDat) throws CommonException {
		dao.insert(projectDat);
	}

	@Override
	public ProjectDat detail(String no) throws CommonException {
		return dao.select(no);
	}

	@Override
	public List<ProjectDat> list() throws CommonException {
		return dao.selectAll();
	}

	@Override
	public int count() throws CommonException {
		return dao.boardCount();
	}
	
	@Transactional
	@Override
	public void modify(ProjectDat projectDat) throws CommonException {
		dao.update(projectDat);
	}
	
	@Transactional
	@Override
	public void remove(String no) throws CommonException {
		dao.delete(no);
	}

}
