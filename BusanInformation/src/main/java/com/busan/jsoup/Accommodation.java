package com.busan.jsoup;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class Accommodation {

	public static void main(String[] args) {
		
		String myapi = "Tj5d8mH5St9DksiKMJBTbgUXRiqOcjGCPvPq%2BUdNk8zE209w%2FV8WUCdj%2BXDuvNXYu3EgTzdZpJ5vt6%2FlnLcXfA%3D%3D";
		String endpoint = "http://apis.data.go.kr/6260000/BusanTourInfoService";
		String getStayList="getStayList";
		int numOfRows=10;//페이지당 갯수
		int pageNO=1;
		String pageNo=null;
	
		String url= endpoint+"/"+getStayList+"?serviceKey="+myapi+"&numOfRows="+numOfRows+"&pageNo="+pageNO;
		try {
			Document doc = Jsoup.connect(url).get();
			int totalCount = Integer.parseInt(doc.select("totalCount").text());
			Elements item = doc.select("item");
			for(int i = 0 ;i<item.size();i++) {
				String title = item.get(i).select("dataTitle").text();
				String content = item.get(i).select("dataContent").text();
				String datasid = item.get(i).select("dataSid").text();
				
				System.out.println("호텔명 : "+title);
				System.out.println("정보 : "+content);
				System.out.println("시드명 : "+datasid);
			}
			}catch(IOException e) {
				e.printStackTrace();
			}
		
		
		
		
		
		

	}

}
