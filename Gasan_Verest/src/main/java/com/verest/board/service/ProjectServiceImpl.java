package com.verest.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.verest.board.dao.ProjectDao;
import com.verest.board.model.CommonException;
import com.verest.board.model.Port;
import com.verest.board.model.Project;

@Service
public class ProjectServiceImpl implements ProjectService {
	
	@Autowired
	private ProjectDao dao;
	
	public ProjectServiceImpl() {}

	@Override
	public void newBoard(Project project) throws CommonException {
		dao.insert(project);
	}

	@Override
	public Project detail(Integer no) throws CommonException {
		return dao.select(no);
	}

	@Override
	public List<Project> list() throws CommonException {
		return dao.selectAll();
	}

	@Override
	public int count() throws CommonException {
		return dao.boardCount();
	}
	
	@Override
	public void modify(Project project) throws CommonException {
		dao.update(project);
	}
	
	@Override
	public void remove(Integer no) throws CommonException {
		dao.delete(no);
	}

	@Override
	public void viewsup(Project project) throws CommonException {
		dao.viewsaction(project);
		
	}

}
