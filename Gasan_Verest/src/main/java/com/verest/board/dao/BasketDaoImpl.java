package com.verest.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.verest.board.model.Backsight;
import com.verest.board.model.Basket;
import com.verest.board.model.CommonException;

@Repository
public class BasketDaoImpl implements BasketDao{

	private Logger logger = LogManager.getLogger(this.getClass());
	

	private static final String MAPPER_NAMESPACE = BasketDaoImpl.class.getName();
	
	@Autowired
	private SqlSession sqlSession;
	
	public BasketDaoImpl() {}
	
	@Override
	public void insert(Basket Basket) throws CommonException {
		try {
			sqlSession.insert(MAPPER_NAMESPACE + ".insert", Basket);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("BAS 01 : 작성 실패");
		}
	}

	@Override
	public List<Basket> selectAll(Integer v_id) throws CommonException {
		List<Basket> basket = null;
		try {
			basket = sqlSession.selectList(MAPPER_NAMESPACE + ".selectAll",  v_id);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("BAS 03 : 전체 검색 실패");
		}
		return basket;
	}

	@Override
	public int BasketCount() throws CommonException {
		Integer count = 0;
		try {
			count = sqlSession.selectOne(MAPPER_NAMESPACE + ".count");
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("BAS 04 : 전체 개수 검색 실패");
		}
		return count;
	}

	@Override
	public void delete(Integer basket_no) throws CommonException {
		try {
			sqlSession.update(MAPPER_NAMESPACE + ".delete", basket_no);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("BAS 04 : 삭제 실패");
		}
	}

	
}
