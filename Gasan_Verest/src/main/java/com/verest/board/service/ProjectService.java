package com.verest.board.service;

import java.util.List;

import com.verest.board.model.CommonException;
import com.verest.board.model.Port;
import com.verest.board.model.Project;

public interface ProjectService {

	// 게시물 번호를 1 증가하고 게시물을 등록한다.
	public void newBoard(Project project) throws CommonException;

	// 게시물 하나를 가져온다.
	public Project detail(Integer no) throws CommonException;

	// 게시물 전체를 가져온다.
	public List<Project> list() throws CommonException;

	// 게시물의 개수를 가져온다.
	public int count() throws CommonException;

	// 게시물을 수정한다. (수정되기 전 파일명을 리턴)
	public void modify(Project project) throws CommonException;

	// 게시물을 삭제한다. (삭제하는 파일명을 리턴)
	public void remove(Integer no) throws CommonException;
	
	// 게시물 조회수 증가
	public void viewsup(Project project) throws CommonException;

}
