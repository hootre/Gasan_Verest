package com.verest.board.dao;

import java.util.List;

import com.verest.board.model.CommonException;
import com.verest.board.model.Backsight;

public interface BacksightDao {

	// 후기 등록
	public void insert(Backsight backsight) throws CommonException;
	
	// 후기 글 하나 가져오기
	public Backsight select(String back_no) throws CommonException;
  
	// 후기 글 가져오기
	public List<Backsight> selectAll() throws CommonException;
	
	// 전체 후기 개수 가져오기
	public int backsightCount() throws CommonException;
	
	// 후기 수정하기
	public void update(Backsight backsight) throws CommonException;
	
	// 후기 삭제하기
	public void delete(String back_no) throws CommonException;
}
