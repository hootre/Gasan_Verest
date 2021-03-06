package com.verest.board.dao;

import java.util.List;

import com.verest.board.model.CommonException;
import com.verest.board.model.Order_list;

public interface Order_listDao {
	
		// 주문확인 등록
		public void insert(Order_list order_list) throws CommonException;
		

		// 주문확인  하나 가져오기
		public Order_list select(Integer or_no) throws CommonException;
		
		// 주문확인 목록
		public List<Order_list> selectAll(Integer v_id) throws CommonException;
		
		// 주문개수
		public int Order_listCount() throws CommonException;
		
		// 주문 취소하기
		public void delete(Integer or_no) throws CommonException;
}
