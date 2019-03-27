package com.busan.service;

import java.util.HashMap;
import java.util.List;

import com.busan.domain.BoardReplyVO;
import com.busan.domain.BusanBoardVO;

public interface BoardService {
	
	public void BoardInsert(BusanBoardVO vo);//���
	public void BoardUpdate(BusanBoardVO vo);//������Ʈ
	public void BoardDelete(Long num);//����
	
	public List<BusanBoardVO> BoardList(HashMap<String, String> map);//����Ʈ
	
	public BusanBoardVO BoardRead(Long num);//�󼼺���
	public int getTotal(HashMap<String, String> map);//����
	public int passCheck(Long num, String password);
	
	public void replyInsert(BoardReplyVO vo);
	public int replyDelete(Long num, String password);//����
	public List<BoardReplyVO> replyList(Long num);//���ø���Ʈ
	public void addreply(Long bnum);
	public void subreply(Long bnum);
	

}
