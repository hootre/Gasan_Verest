package com.verest.board.dao;

import java.util.List;

import com.verest.board.model.CommonException;
import com.verest.board.model.UserInfo;

public interface UserInfoDao {

	// 사용자 전체 검색
	public List<UserInfo> selectAll() throws CommonException;

	// 사용자 일부 검색
	public UserInfo select(Integer v_id) throws CommonException;

	// 사용자 등록
	public void insert(UserInfo user) throws CommonException;

	// 상용자 권한 등록
	public void insertUserTypes(UserInfo user) throws CommonException;

	// 사용자 삭제
	public void delete(Integer v_id) throws CommonException;

	// 사용자 권한 삭제
	public void deleteUserTypes(Integer id) throws CommonException;

	// 사용자 데이터 수정
	public void update(UserInfo user) throws CommonException;

	// 사용자 이메로일 검색
	public UserInfo selectByEmail(String email) throws CommonException;

}
