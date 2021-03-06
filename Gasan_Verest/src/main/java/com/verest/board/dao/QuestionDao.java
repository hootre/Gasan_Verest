package com.verest.board.dao;

import java.util.List;
import com.verest.board.model.CommonException;
import com.verest.board.model.Question;

public interface QuestionDao {

		// 문의 등록
		public void insert(Question question) throws CommonException;
		
		// 문의 글 상세보기
		public Question select(Integer qu_no) throws CommonException;
		
		// 문의 글목록 가져오기
		public List<Question> selectAll() throws CommonException;
		
		// 전체 문의 개수 가져오기
		public int QuestionCount() throws CommonException;

		// 문의 삭제하기
		public void delete(Integer qu_no) throws CommonException;
}
