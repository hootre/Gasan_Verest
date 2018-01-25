package com.verest.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.verest.board.model.CommonException;
import com.verest.board.model.Project;

@Repository
public class ProjectDaoImpl implements ProjectDao {

	private Logger logger = LogManager.getLogger(this.getClass());

	private static final String MAPPER_NAMESPACE = ProjectDaoImpl.class.getName();

	@Autowired
	private SqlSession sqlSession;

	public ProjectDaoImpl() {
	}

	@Override
	public void insert(Project project) throws CommonException {
		try {
			sqlSession.insert(MAPPER_NAMESPACE + ".insert", project);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("PRO 01: 프로젝트 게시물 등록 실패");
		}

	}

	@Override
	public Project select(Integer no) throws CommonException {

		Project port = null;
		try {
			port = sqlSession.selectOne(MAPPER_NAMESPACE + ".select", no);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("PRO 02: 프로젝트 게시물 검색 실패");
		}
		return port;

	}

	@Override
	public List<Project> selectAll() throws CommonException {
		List<Project> list = null;
		try {
			list = sqlSession.selectList(MAPPER_NAMESPACE + ".selectAll");
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("PRO 03: 프로젝트 게시물 전체 검색 실패");
		}
		return list;
	}

	@Override
	public void update(Project project) throws CommonException {
		try {
			sqlSession.update(MAPPER_NAMESPACE + ".update", project);

		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("PRO 04: 프로젝트 게시물 수정 실패");
		}

	}

	@Override
	public void delete(Integer no) throws CommonException {

		try {
			sqlSession.delete(MAPPER_NAMESPACE + ".delete", no);

		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("PRO 05: 프로젝트 게시물 삭제 실패");
		}

	}

	@Override
	public int boardCount() throws CommonException {
		Integer count = 0;

		try {
			count = sqlSession.selectOne(MAPPER_NAMESPACE + ".count");

		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("PRO 06: 프로젝트 글 개수 가져오기 실패");
		}

		return count;
	}

	@Override
	public void viewsaction(Project project) throws CommonException {
		try {
			sqlSession.update(MAPPER_NAMESPACE + ".views",project);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("PRO 07: 조회수 증가 실패");
		}
	}

}
