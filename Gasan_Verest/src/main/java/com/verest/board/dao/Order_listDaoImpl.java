package com.verest.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.verest.board.model.Basket;
import com.verest.board.model.CommonException;
import com.verest.board.model.Order_list;

public class Order_listDaoImpl implements Order_listDao{
	private Logger logger = LogManager.getLogger(this.getClass());
	private static final String MAPPER_NAMESPACE = Order_listDaoImpl.class.getName();
	@Autowired
	private SqlSession sqlSession;
	
	public Order_listDaoImpl() {}
	
	@Override
	public void insert(Order_list order_list) throws CommonException {
		try {
			sqlSession.insert(MAPPER_NAMESPACE + ".insert", order_list);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("O01 : 주문 작성 실패");
		}
	}

	@Override
	public Order_list select(String or_no) throws CommonException {
		Order_list order_list = null;
		try {
			order_list = sqlSession.selectOne(MAPPER_NAMESPACE + ".select", or_no);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("O02 : 주문 검색 실패");
		}
		return order_list;
	}

	@Override
	public List<Order_list> selectAll() throws CommonException {
		List<Order_list> order_list = null;
		try {
			order_list = sqlSession.selectList(MAPPER_NAMESPACE + ".selectAll");
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("O03 : 주문 전체검색 실패");
		}
		return order_list;
	}

	@Override
	public int Order_listCount() throws CommonException {
		Integer count = 0;
		try {
			count = sqlSession.selectOne(MAPPER_NAMESPACE + ".count");
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("O04 : 주문 전체개수 불러오기 실패");
		}
		return count;
	}

	@Override
	public void delete(String or_no) throws CommonException {
		try {
			sqlSession.update(MAPPER_NAMESPACE + ".delete", or_no);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("O05 : 주문취소 실패");
		}
		
	}

}