package com.verest.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.verest.board.model.Basket;
import com.verest.board.model.CommonException;
import com.verest.board.model.Order_list;
import com.verest.board.model.Order_state;

@Repository
public class Order_stateDaoImpl implements Order_stateDao{
	
	private Logger logger = LogManager.getLogger(this.getClass());
	
	private static final String MAPPER_NAMESPACE = Order_stateDaoImpl.class.getName();
	
	@Autowired
	private SqlSession sqlSession;
	
	public Order_stateDaoImpl() {}
	
	@Override
	public Order_state select(Integer state_no) throws CommonException {
		Order_state state = null;
		try {
			state = sqlSession.selectOne(MAPPER_NAMESPACE + ".select", state_no);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			throw new CommonException("STATE 01 : 입금상태 불러오기 실패");
		}
		return state;
	}

}
