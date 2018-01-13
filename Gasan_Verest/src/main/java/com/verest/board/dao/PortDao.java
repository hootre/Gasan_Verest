package com.verest.board.dao;

import java.util.List;

import javax.sound.sampled.Port;

import com.verest.board.model.CommonException;

public interface PortDao {

	// 글 등록
	public void insert(Port port) throws CommonException;

	// 포트폴리오 글 하나 가져오기
	public Port select(String no) throws CommonException;

	// 전체 포트 개수 가져오기
	public List<Port> selectAll() throws CommonException;

	// 후기 수정하기
	public void update(Port port) throws CommonException;

	// 후기 삭제하기
	public void delete(String no) throws CommonException;

}
