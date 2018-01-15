package com.verest.board.dao;

import java.util.List;

import com.verest.board.model.CommonException;
import com.verest.board.model.Sale;

public interface SaleDao {

	// 글 등록
	public void insert(Sale sale) throws CommonException;

	// 세일 글 하나 가져오기
	public Sale select(String no) throws CommonException;

	// 전체 포트 개수 가져오기
	public List<Sale> selectAll() throws CommonException;

	// 전체 글 개수 가져오기
	public int boardCount() throws CommonException;

	// 수정하기
	public void update(Sale sale) throws CommonException;

	// 삭제하기
	public void delete(String no) throws CommonException;

}
