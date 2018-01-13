package com.verest.board.dao;

import java.util.List;

import com.verest.board.model.CommonException;
import com.verest.board.model.Project;

public interface ProjectDao {

	// 글 등록
	public void insert(Project project) throws CommonException;

	// 포트폴리오 글 하나 가져오기
	public Project select(String no) throws CommonException;

	// 전체 포트 개수 가져오기
	public List<Project> selectAll() throws CommonException;

	// 전체 글 개수 가져오기
	public int boardCount() throws CommonException;

	// 후기 수정하기
	public void update(Project project) throws CommonException;

	// 후기 삭제하기
	public void delete(String no) throws CommonException;

}
