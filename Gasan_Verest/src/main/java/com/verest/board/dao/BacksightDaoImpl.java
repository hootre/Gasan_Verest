package com.verest.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.verest.board.model.Backsight;
import com.verest.board.model.CommonException;

public class BacksightDaoImpl implements BacksightDao{


	private Logger logger = LogManager.getLogger(this.getClass());
	

	private static final String MAPPER_NAMESPACE = BacksightDaoImpl.class.getName();
	
	@Autowired
	private SqlSession sqlSession;
	
	public BacksightDaoImpl() {}

	@Override
	public void insert(Backsight backsight) throws CommonException {
		try {
			sqlSession.insert(MAPPER_NAMESPACE + ".insert", backsight);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("H01 : 후기 작성 실패");
		}
		
	}

	@Override
	public Backsight select(String back_no) throws CommonException {
		Backsight backsight = null;
		try {
			backsight = sqlSession.selectOne(MAPPER_NAMESPACE + ".select", back_no);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("H02 : 후기 단일 검색 실패");
		}
		return backsight;
	}

	@Override
	public List<Backsight> selectAll() throws CommonException {
		List<Backsight> backsight = null;
		try {
			backsight = sqlSession.selectList(MAPPER_NAMESPACE + ".selectAll");
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("H03 : 후기 전체 검색 실패");
		}
		return backsight;
	}

	@Override
	public int backsightCount() throws CommonException {
		Integer count = 0;
		try {
			count = sqlSession.selectOne(MAPPER_NAMESPACE + ".count");
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("H04 : 후기 개수 검색 실패");
		}
		return count;
	}

	@Override
	public void update(Backsight backsight) throws CommonException {
		try {
			sqlSession.update(MAPPER_NAMESPACE + ".update", backsight);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("H05 : 후기 수정 실패");
		}
		
	}

	@Override
	public void delete(String back_no) throws CommonException {
		try {
			sqlSession.update(MAPPER_NAMESPACE + ".delete", back_no);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("H06 : 후기 삭제 실패");
		}
		
	}
}
