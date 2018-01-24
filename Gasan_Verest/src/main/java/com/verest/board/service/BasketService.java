package com.verest.board.service;

import java.util.List;
import com.verest.board.model.Basket;
import com.verest.board.model.CommonException;

public interface BasketService {

			// 게시물 번호를 1 증가하고 게시물을 등록한다.
			public void newBoard(Basket basket) throws CommonException;

			// 게시물 전체를 가져온다.
			public List<Basket> list(Integer v_id) throws CommonException;

			// 게시물의 개수를 가져온다.
			public int count() throws CommonException;

			// 게시물을 삭제한다.
			public void remove(Integer basket_no) throws CommonException;
}
