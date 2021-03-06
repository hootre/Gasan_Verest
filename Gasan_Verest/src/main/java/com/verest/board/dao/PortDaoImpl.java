package com.verest.board.dao;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.verest.board.model.CommonException;
import com.verest.board.model.Port;

@Repository
public class PortDaoImpl implements PortDao {

	private Logger logger = LogManager.getLogger(this.getClass());

	private static final String MAPPER_NAMESPACE = PortDaoImpl.class.getName();

	@Autowired
	private SqlSession sqlSession;

	public PortDaoImpl() {
	}

	@Override
	public void insert(Port port) throws CommonException {
		try {
			sqlSession.insert(MAPPER_NAMESPACE + ".insert", port);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("PORT 01: 포트폴리오 게시물 등록 실패");
		}

	}

	@Override
	public Port select(Integer no) throws CommonException {

		Port port = null;
		try {
			port = sqlSession.selectOne(MAPPER_NAMESPACE + ".select", no);
			
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("PORT 02: 포트 게시물 검색 실패");
		}
		return port;

	}

	@Override
	public Port selectType(String p_type) throws CommonException {
		Port port = null;
		try {
			port = sqlSession.selectOne(MAPPER_NAMESPACE + ".selectByType", p_type);
			
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("PORT 07: 포트 분류 게시물 검색 실패");
		}
		return port;
	}
	
	@Override
	public List<Port> selectAll() throws CommonException {
		List<Port> list = null;
		try {
			list = sqlSession.selectList(MAPPER_NAMESPACE + ".selectAll");
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("PORT 03: 포트 게시물 전체 검색 실패");
		}
		return list;
	}

	@Override
	public void update(Port port) throws CommonException {
		try {
			sqlSession.update(MAPPER_NAMESPACE + ".update", port);

		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("PORT 04: 포트 게시물 수정 실패");
		}

	}

	@Override
	public void delete(Integer no) throws CommonException {

		try {
			sqlSession.delete(MAPPER_NAMESPACE + ".delete", no);

		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("PORT 05: 포트 게시물 삭제 실패");
		}

	}

	@Override
	public int boardCount() throws CommonException {
		Integer count = 0;

		try {
			count = sqlSession.selectOne(MAPPER_NAMESPACE + ".count");

		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("PORT 06: 포트 글 개수 가져오기 실패");
		}

		return count;
	}

	@Override
	public void viewsaction(Port port) throws CommonException {
		try {
			sqlSession.update(MAPPER_NAMESPACE + ".views",port);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("PORT 07: 조회수 증가 실패");
		}
		
	}

}
