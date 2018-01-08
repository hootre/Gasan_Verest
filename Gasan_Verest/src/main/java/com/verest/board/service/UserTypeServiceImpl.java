package com.verest.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.verest.board.dao.UserTypeDao;
import com.verest.board.model.UserType;

@Service
public class UserTypeServiceImpl implements UserTypeService {
	
	@Autowired
	private UserTypeDao dao;

	@Override
	public UserType findById(Integer id) {
		return dao.select(id);
	}
}
