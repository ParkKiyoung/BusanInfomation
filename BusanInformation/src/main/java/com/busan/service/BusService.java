package com.busan.service;

import java.util.List;

import com.busan.domain.BusVO;

public interface BusService {
	
	public void updateBusInfo(BusVO vo);//���������� ����
	public List<BusVO> callBusInfo(BusVO vo);//���������� �ҷ�����
	public BusVO ViewBusInfo(BusVO vo);//�󼼺���
	public void insertBusInfo(BusVO vo);//�����Է�
	

}
