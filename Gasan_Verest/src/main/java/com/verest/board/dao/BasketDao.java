package com.verest.board.dao;

import java.util.List;

import com.verest.board.model.Basket;
import com.verest.board.model.CommonException;

public interface BasketDao {

		// 장바구니 등록
		public void insert(Basket basket) throws CommonException;
		
		// 장바구니 가져오기
		public List<Basket> selectAll(Integer v_id) throws CommonException;
		
		// 장바구니 개수 가져오기
		public int BasketCount() throws CommonException;
		
		// 장바구니 삭제하기
		public void delete(Integer basket_no) throws CommonException;
}
