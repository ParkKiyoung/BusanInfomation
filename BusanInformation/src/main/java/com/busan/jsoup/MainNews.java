package com.busan.jsoup;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.busan.domain.BusanNewsVO;

public class MainNews {

	public static void main(String[] args) {
		try {
			Document doc = Jsoup.connect("https://search.naver.com/search.naver?where=post&sm=tab_jum&query=%EB%B6%80%EC%82%B0+%EC%97%AC%ED%96%89").get();
			Elements div = doc.select("li.sh_blog_top");
			System.out.println("구글 부산 여행 검색");
			for(int i = 0 ; i<5; i++) {
				String title = div.get(i).select("a.sh_blog_title").text();
				String link = div.get(i).select("a").attr("href");
				System.out.println(title);
				System.out.println("link:"+link);
				BusanNewsVO vo = new BusanNewsVO();
				vo.setTitle(title);
			}	
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		

	}

}
