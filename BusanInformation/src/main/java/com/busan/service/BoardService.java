package com.busan.service;

import java.util.HashMap;
import java.util.List;

import com.busan.domain.BoardReplyVO;
import com.busan.domain.BusanBoardVO;

public interface BoardService {
	
	public void BoardInsert(BusanBoardVO vo);//등록
	public void BoardUpdate(BusanBoardVO vo);//업데이트
	public void BoardDelete(Long num);//삭제
	
	public List<BusanBoardVO> BoardList(HashMap<String, String> map);//리스트
	
	public BusanBoardVO BoardRead(Long num);//상세보기
	public int getTotal(HashMap<String, String> map);//개수
	public int passCheck(Long num, String password);
	
	public void replyInsert(BoardReplyVO vo);
	public int replyDelete(Long num, String password);//삭제
	public List<BoardReplyVO> replyList(Long num);//리플리스트
	public void addreply(Long bnum);
	public void subreply(Long bnum);
	

}
