package com.verest.board.service;

import java.util.List;

import com.verest.board.model.CommonException;
import com.verest.board.model.Sale;

public interface SaleService {

	// 게시물 번호를 1 증가하고 게시물을 등록한다.
	public void newBoard(Sale sale) throws CommonException;

	// 게시물 하나를 가져온다.
	public Sale detail(Integer no) throws CommonException;

	// 게시물 전체를 가져온다.
	public List<Sale> list() throws CommonException;

	// 게시물의 개수를 가져온다.
	public int count() throws CommonException;

	// 게시물을 수정한다.
	public void modify(Sale sale) throws CommonException;

	// 게시물을 삭제한다.
	public void remove(Integer no) throws CommonException;

	// 게시물 조회수 증가
	public void viewsup(Sale sale) throws CommonException;

}
