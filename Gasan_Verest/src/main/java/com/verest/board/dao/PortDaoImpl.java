package com.verest.board.dao;

import java.util.List;

import javax.sound.sampled.Port;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.verest.board.model.CommonException;

@Repository
public class PortDaoImpl implements PortDao {

	private Logger logger = LogManager.getLogger(this.getClass());

	private static final String MAPPER_NAMESPACE = PortDaoImpl.class.getName();
	
	@Autowired
	private SqlSession sqlSession;
	
	public PortDaoImpl() {}

	@Override
	public void insert(Port port) throws CommonException {
		try {
			sqlSession.insert(MAPPER_NAMESPACE + ".insert", port);
		} catch (CommonException e) {
			logger.debug(e.getMessage());
			throw new CommonException("E04: 포트폴리오 게시물 등록 실패");
		}
		
	}

	@Override
	public Port select(String no) throws CommonException {
		port
		return null;
	}

	@Override
	public List<Port> selectAll() throws CommonException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Port port) throws CommonException {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(String no) throws CommonException {
		// TODO Auto-generated method stub

	}

}
