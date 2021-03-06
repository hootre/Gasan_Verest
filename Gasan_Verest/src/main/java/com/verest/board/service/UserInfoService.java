package com.verest.board.service;

import java.util.List;

import com.verest.board.model.CommonException;
import com.verest.board.model.UserInfo;

public interface UserInfoService {

	public UserInfo detail(Integer id) throws CommonException;

	public void newUser(UserInfo userInfo) throws CommonException;

	public void delete(Integer id, String password) throws CommonException;
	public void delete(Integer id) throws CommonException;
	public void modify(UserInfo userInfo) throws CommonException;
	
	// 게시물 번호를 이용하여 게시물 작성자의 비밀번호와 입력한 비밀번호 비교
	public boolean isPortMatched(Integer no, String rawPassword) throws CommonException;
	public boolean isProMatched(Integer no, String rawPassword) throws CommonException;
	public boolean isSaleMatched(Integer no, String rawPassword) throws CommonException;

	// 현재 사용자의 id값을 이용하여 비밀번호를 불러온 다음, 입력한 비밀번호와 비교
	public boolean isPasswordMatched(Integer id, String oldPassword) throws CommonException;

	// CustomUserDetailsService에서 이메일 값으로 사용자를 검색할 때 사용
	public UserInfo detail(String v_email) throws CommonException;

	// email 값을 이용하여 사용자 삭제
	public void delete(String email, String password) throws CommonException;

	// 사용자의 email 값을 이용하여 비밀번호를 불러온 다음, 입력한 비밀번호와 비교
	boolean isPasswordMatched(String email, String rawPassword) throws CommonException;

	public List<UserInfo> list() throws CommonException;

}
