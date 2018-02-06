package com.verest.board.dao;

import java.util.List;

import com.verest.board.model.CommonException;
import com.verest.board.model.Port;

public interface PortDao {

	// 글 등록
	public void insert(Port port) throws CommonException;

	// 포트폴리오 글 하나 가져오기
	public Port select(Integer no) throws CommonException;
	
	// 포트폴리오 분류 글 가져오기
	public Port selectType(String p_type) throws CommonException;

	// 전체 포트 개수 가져오기
	public List<Port> selectAll() throws CommonException;

	// 전체 글 개수 가져오기
	public int boardCount() throws CommonException;

	// 후기 수정하기
	public void update(Port port) throws CommonException;

	// 후기 삭제하기
	public void delete(Integer no) throws CommonException;
	
	// 조회수 1씩 증가
	public void viewsaction(Port port) throws CommonException;

}
