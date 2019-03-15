package com.busan.service;

import java.util.List;

import com.busan.domain.BusVO;

public interface BusService {
	
	public void updateBusInfo(BusVO vo);//버스데이터 갱신
	public List<BusVO> callBusInfo(BusVO vo);//버스데이터 불러오기
	public BusVO ViewBusInfo(BusVO vo);//상세보기
	public void insertBusInfo(BusVO vo);//최초입력
	

}
