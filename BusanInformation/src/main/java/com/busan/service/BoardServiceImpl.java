package com.busan.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.busan.domain.BoardReplyVO;
import com.busan.domain.BusanBoardVO;
import com.busan.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper mapper;

	@Override
	public void BoardInsert(BusanBoardVO vo) {
		mapper.insert(vo);
	}

	@Override
	public void BoardUpdate(BusanBoardVO vo) {
		mapper.update(vo);
		
	}

	@Override
	public void BoardDelete(Long num) {
		mapper.delete(num);
	}

	@Override
	public List<BusanBoardVO> BoardList(HashMap<String, String> map) {
		List<BusanBoardVO> arr = mapper.getList(map);
		return arr;
	}

	@Override
	public BusanBoardVO BoardRead(Long num) {
		BusanBoardVO vo = mapper.read(num);
		return vo;
	}

	@Override
	public int getTotal(HashMap<String, String> map) {
		return mapper.getTotal(map);
	}

	@Override
	public int passCheck(Long num, String password) {
		int flag=0;
		String pass = mapper.passCheck(num);
		
		if(pass.equals(password)) {
			flag=1;
		}
		return flag;
	}

	@Override
	public void replyInsert(BoardReplyVO vo) {
		mapper.replyInsert(vo);
		
	}

	@Override
	public int replyDelete(Long num,String password) {
		int flag=0;
		String pass = mapper.replypassCheck(num);
		if(pass.equals(password)) {
			mapper.replyDelete(num);
			flag=1;
		}
		return flag;
	}

	@Override
	public List<BoardReplyVO> replyList(Long num) {
			List<BoardReplyVO> replyArr = mapper.replyList(num);
		return replyArr;
	}

	@Override
	public void addreply(Long bnum) {
		mapper.addreply(bnum);
		
	}

	@Override
	public void subreply(Long bnum) {
		mapper.subreply(bnum);
		
	}
	

}
