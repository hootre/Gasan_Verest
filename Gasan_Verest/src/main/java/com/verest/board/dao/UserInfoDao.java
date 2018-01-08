package com.verest.board.dao;

import java.util.List;

import com.verest.board.model.CommonException;
import com.verest.board.model.UserInfo;

public interface UserInfoDao {

	public List<UserInfo> selectAll() throws CommonException;

	public UserInfo select(Integer id) throws CommonException;

	public void insert(UserInfo user) throws CommonException;

	public void insertUserTypes(UserInfo user) throws CommonException;

	public void delete(Integer id) throws CommonException;

	public void deleteUserTypes(Integer id) throws CommonException;

	public void update(UserInfo user) throws CommonException;

	public UserInfo selectByEmail(String email) throws CommonException;

	public UserInfo select(String string) throws CommonException;
	
}
