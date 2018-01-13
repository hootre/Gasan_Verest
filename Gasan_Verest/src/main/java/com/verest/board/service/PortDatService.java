package com.verest.board.service;

import java.util.List;

import com.verest.board.model.CommonException;
import com.verest.board.model.PortDat;

public interface PortDatService {

	// 게시물 번호를 1 증가하고 게시물을 등록한다.
	public void newBoard(PortDat portDat) throws CommonException;

	// 게시물 하나를 가져온다.
	public PortDat detail(String no) throws CommonException;

	// 게시물 전체를 가져온다.
	public List<PortDat> list() throws CommonException;

	// 게시물의 개수를 가져온다.
	public int count() throws CommonException;

	// 게시물을 수정한다. (수정되기 전 파일명을 리턴)
	public String modify(PortDat portDat) throws CommonException;

	// 게시물을 삭제한다. (삭제하는 파일명을 리턴)
	public String remove(String no) throws CommonException;

}
