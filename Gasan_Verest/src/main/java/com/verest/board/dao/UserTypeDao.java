package com.verest.board.dao;

import com.verest.board.model.CommonException;
import com.verest.board.model.UserType;

public interface UserTypeDao {
	
	public UserType select(Integer v_id) throws CommonException;

}
