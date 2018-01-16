package com.verest.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.verest.board.model.CommonException;
import com.verest.board.model.ProjectDat;

@Repository
public class ProjectDatDaoImpl implements ProjectDatDao {

	private Logger logger = LogManager.getLogger(this.getClass());

	private static final String MAPPER_NAMESPACE = ProjectDatDaoImpl.class.getName();

	@Autowired
	private SqlSession sqlSession;

	public ProjectDatDaoImpl() {
	}

	@Override
	public void insert(ProjectDat projectDat) throws CommonException {
		try {
			sqlSession.insert(MAPPER_NAMESPACE + ".insert", projectDat);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("E04: 포트폴리오 게시물 등록 실패");
		}

	}

	@Override
	public ProjectDat select(String no) throws CommonException {

		ProjectDat port = null;
		try {
			port = sqlSession.selectOne(MAPPER_NAMESPACE + ".select", no);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("E04: 포트 게시물 검색 실패");
		}
		return port;

	}

	@Override
	public List<ProjectDat> selectAll() throws CommonException {
		List<ProjectDat> list = null;
		try {
			list = sqlSession.selectList(MAPPER_NAMESPACE + ".selectAll");
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("E04: 포트 게시물 전체 검색 실패");
		}
		return list;
	}

	@Override
	public void update(ProjectDat projectDat) throws CommonException {
		try {
			sqlSession.update(MAPPER_NAMESPACE + ".update", projectDat);

		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("E04: 포트 게시물 수정 실패");
		}

	}

	@Override
	public void delete(String no) throws CommonException {

		try {
			sqlSession.delete(MAPPER_NAMESPACE + ".delete", no);

		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("E04: 포트 게시물 삭제 실패");
		}

	}

	@Override
	public int boardCount() throws CommonException {
		Integer count = 0;

		try {
			count = sqlSession.selectOne(MAPPER_NAMESPACE + ".count");

		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("E04: 포트 글 개수 가져오기 실패");
		}

		return count;
	}

}