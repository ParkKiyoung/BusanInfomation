package com.busan.jsoup;

public class Tranportation {

	public static void main(String[] args) {
		
		String Endpoint = "http://apis.data.go.kr/6260000/BusanTourInfoService";
		String api = "Tj5d8mH5St9DksiKMJBTbgUXRiqOcjGCPvPq%2BUdNk8zE209w%2FV8WUCdj%2BXDuvNXYu3EgTzdZpJ5vt6%2FlnLcXfA%3D%3D";
		String url="http://apis.data.go.kr/6260000/BusanTourInfoService/getRecommendTourList?ServiceKey="+api;
		System.out.println(url);

	}

}
