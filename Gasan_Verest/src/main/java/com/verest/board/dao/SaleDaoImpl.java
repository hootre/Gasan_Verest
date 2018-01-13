package com.verest.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.verest.board.model.CommonException;
import com.verest.board.model.Sale;

@Repository
public class SaleDaoImpl implements SaleDao {

	private Logger logger = LogManager.getLogger(this.getClass());

	private static final String MAPPER_NAMESPACE = SaleDaoImpl.class.getName();

	@Autowired
	private SqlSession sqlSession;

	public SaleDaoImpl() {
	}

	@Override
	public void insert(Sale sale) throws CommonException {
		try {
			sqlSession.insert(MAPPER_NAMESPACE + ".insert", sale);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("E04: 포트폴리오 게시물 등록 실패");
		}

	}

	@Override
	public Sale select(String no) throws CommonException {

		Sale port = null;
		try {
			port = sqlSession.selectOne(MAPPER_NAMESPACE + ".select", no);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("E04: 포트 게시물 검색 실패");
		}
		return port;

	}

	@Override
	public List<Sale> selectAll() throws CommonException {
		List<Sale> list = null;
		try {
			list = sqlSession.selectList(MAPPER_NAMESPACE + ".selectAll");
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("E04: 포트 게시물 전체 검색 실패");
		}
		return list;
	}

	@Override
	public void update(Sale sale) throws CommonException {
		try {
			sqlSession.update(MAPPER_NAMESPACE + ".update", sale);

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
