package com.verest.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.verest.board.model.CommonException;
import com.verest.board.model.Question;

public class QuestionDaoImpl implements QuestionDao{

	private Logger logger = LogManager.getLogger(this.getClass());

	private static final String MAPPER_NAMESPACE = QuestionDaoImpl.class.getName();
	
	@Autowired
	private SqlSession sqlSession;
	
	public QuestionDaoImpl() {}
	
	@Override
	public void insert(Question question) throws CommonException {
		try {
			sqlSession.insert(MAPPER_NAMESPACE + ".insert", question);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("Q01 : 문의 작성 실패");
		}
	}

	@Override
	public Question select(String qu_no) throws CommonException {
		Question question = null;
		try {
			question = sqlSession.selectOne(MAPPER_NAMESPACE + ".select", qu_no);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("Q02 : 문의 상세보기 실패");
		}
		return question;
	}

	@Override
	public List<Question> selectAll() throws CommonException {
		List<Question> question = null;
		try {
			question = sqlSession.selectList(MAPPER_NAMESPACE + ".selectAll");
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("Q03 : 문의 목록불러오기 실패");
		}
		return question;
	}

	@Override
	public int QuestionCount() throws CommonException {
		Integer count = 0;
		try {
			count = sqlSession.selectOne(MAPPER_NAMESPACE + ".count");
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("Q04 : 문의 개수 검색 실패");
		}
		return count;
	}

	@Override
	public void update(Question question) throws CommonException {
		try {
			sqlSession.update(MAPPER_NAMESPACE + ".update", question);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("Q05 : 문의 수정 실패");
		}
		
	}

	@Override
	public void delete(String qu_no) throws CommonException {
		try {
			sqlSession.update(MAPPER_NAMESPACE + ".delete", qu_no);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("Q06 : 문의 삭제 실패");
		}
		
	}

}
