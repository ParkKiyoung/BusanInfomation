package com.busan.service;

import java.util.List;

import com.busan.domain.BusanBoardVO;

public interface BoardService {
	
	public void BoardInsert(BusanBoardVO vo);
	public void BoardUpdate(BusanBoardVO vo);
	public void BoardDelete(BusanBoardVO vo);
	public List<BusanBoardVO> BoardList();

}
