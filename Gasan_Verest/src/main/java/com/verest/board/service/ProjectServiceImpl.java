package com.verest.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.verest.board.dao.ProjectDao;
import com.verest.board.model.CommonException;
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
	public Project detail(String no) throws CommonException {
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
	
	@Transactional
	@Override
	public String modify(Project project) throws CommonException {
		Project item = dao.select(Integer.toString(project.getNo()));
		String oldFilename = item.getAttachment();
		dao.update(project);
		return oldFilename;
	}
	
	@Transactional
	@Override
	public String remove(String no) throws CommonException {
		Project item = dao.select(no);
		String filename = item.getAttachment();
		dao.delete(no);
		return filename;
	}

}
