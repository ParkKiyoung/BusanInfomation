package com.busan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.busan.domain.BusVO;
import com.busan.mapper.BusMapper;

@Service
public class BusServiceImpl implements BusService{
	
	@Autowired
	private BusMapper mapper;

	@Override
	public void updateBusInfo(BusVO vo) {
		
		
	}

	@Override
	public List<BusVO> callBusInfo(BusVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BusVO ViewBusInfo(BusVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertBusInfo(BusVO vo) {//최초 데이터 입력
		mapper.insert(vo);
		
	}

}
