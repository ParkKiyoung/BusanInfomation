package com.busan.mapper;

import java.util.HashMap;
import java.util.List;

import com.busan.domain.BoardReplyVO;
import com.busan.domain.BusanBoardVO;

public interface BoardMapper {

	public void insert(BusanBoardVO vo);
	public List<BusanBoardVO> getList(HashMap<String, String> map);
	public int getTotal(HashMap<String, String> map);
	public BusanBoardVO read(Long num);
	public int delete(Long num);
	public int update(BusanBoardVO vo);
	public String passCheck(Long num);
	public void replyInsert(BoardReplyVO vo);//댓글입력
	public List<BoardReplyVO> replyList(Long num);//리플리스트
	public String replypassCheck(Long num);
	
	public void replyDelete(Long num);
	public void addreply(Long bnum);
	public void subreply(Long bnum);

	//검색포함
//	public List<BusanBoardVO vo> getListWithPaging(Criteria cri);
//	public int getTotalCount(Criteria cri);
//
//	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
//		// 값이 두개 이상 들어갈때는 Param으로 잡아줘야함
//		
//	

	

}
