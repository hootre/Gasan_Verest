package com.verest.board.dao;

import java.util.List;

import com.verest.board.model.CommonException;
import com.verest.board.model.Sale;

public interface SaleDao {

	// 글 등록
	public void insert(Sale sale) throws CommonException;

	// 포트폴리오 글 하나 가져오기
	public Sale select(Integer no) throws CommonException;

	// 전체 포트 개수 가져오기
	public List<Sale> selectAll() throws CommonException;

	// 전체 글 개수 가져오기
	public int boardCount() throws CommonException;

	// 후기 수정하기
	public void update(Sale sale) throws CommonException;

	// 후기 삭제하기
	public void delete(Integer no) throws CommonException;
	
	// 조회수 1씩 증가
	public void viewsaction(Sale sale) throws CommonException;

}
