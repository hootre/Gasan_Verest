package com.verest.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.verest.board.dao.QuestionDao;
import com.verest.board.model.CommonException;
import com.verest.board.model.Question;

@Service
public class QuestionServiceImpl implements QuestionService{

	@Autowired
	private QuestionDao queDao;

	@Override
	public void newBoard(Question question) throws CommonException {
		queDao.insert(question);
	}

	@Override
	public Question detail(Integer qu_no) throws CommonException {
		return queDao.select(qu_no);
	}

	@Override
	public List<Question> list() throws CommonException {
		return queDao.selectAll();
	}

	@Override
	public int count() throws CommonException {
		return queDao.QuestionCount();
	}

	@Override
	public void remove(Integer qu_no) throws CommonException {
		queDao.delete(qu_no);
	}
}
