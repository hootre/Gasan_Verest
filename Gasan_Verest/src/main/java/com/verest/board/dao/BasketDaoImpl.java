package com.verest.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.verest.board.model.Backsight;
import com.verest.board.model.Basket;
import com.verest.board.model.CommonException;

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
			throw new CommonException("I01 : 장바구니 작성 실패");
		}
	}

	@Override
	public Basket select(String basket_no) throws CommonException {
		Basket basket = null;
		try {
			basket = sqlSession.selectOne(MAPPER_NAMESPACE + ".select", basket_no);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("I02 : 장바구니 단일 검색 실패");
		}
		return basket;
	}

	@Override
	public List<Basket> selectAll() throws CommonException {
		List<Basket> basket = null;
		try {
			basket = sqlSession.selectList(MAPPER_NAMESPACE + ".selectAll");
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("I03 : 장바구니 전체 검색 실패");
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
			throw new CommonException("I04 : 장바구니 전체 개수 검색 실패");
		}
		return count;
	}

	@Override
	public void delete(String basket_no) throws CommonException {
		try {
			sqlSession.update(MAPPER_NAMESPACE + ".delete", basket_no);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("I04 : 장바구니 삭제 실패");
		}
	}

	
}
