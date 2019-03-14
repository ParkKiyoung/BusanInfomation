package com.busan.main;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.busan.domain.BusanNewsVO;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;
import com.fasterxml.jackson.databind.util.JSONPObject;

@Controller
@RequestMapping("/*")
public class MainController {
	
	@GetMapping("/home")
	public String home() {	
		return "home";
	}

	@GetMapping("/Statistics")
	public String Statistics() {	
		return "Statistics";
	}
	
	
	@GetMapping(value="/GetMainNews", produces="text/plain;charset=UTF-8")
	public @ResponseBody String MainNews() {
		JSONArray jarr = new JSONArray();
		
		try {
			Document doc = Jsoup.connect("https://www.google.com/search?q=%EB%B6%80%EC%82%B0%EC%97%AC%ED%96%89&source=lnms&tbm=nws&sa=X&ved=0ahUKEwiT88zGgvzgAhVkEqYKHX-SDEwQ_AUIESgE&biw=1023&bih=888").get();
			Elements div = doc.select("div.g");
			for(int i = 0 ; i<5; i++) {
				String title = div.get(i).select("a").text();
				String link = div.get(i).select("a").attr("href");
				JSONObject jobj = new JSONObject();
				jobj.put("title",title);
				jobj.put("link",link);
				jarr.add(jobj);
			}	
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return jarr.toString();
	}
	@GetMapping(value="/GetWeather", produces="text/plain;charset=UTF-8")
	public @ResponseBody String Weather() {
		JSONObject jobj = new JSONObject();
		
		try {
			Document doc = Jsoup.connect("https://weather.naver.com/rgn/cityWetrCity.nhn?cityRgnCd=CT008008#").get();
			Elements now = doc.select("div.fl");
			String nowTime = now.select("div.fl span").eq(0).text();//현재시각
			String nowTemp = now.select("em").eq(0).text().split("℃")[0];//현재 기온
			String nowWeather = now.select("em").eq(0).text().split("℃")[1];//현재날씨 상황
			String nowRain = now.select("p strong").eq(1).text();//현재 강수확률
			String dust = now.select("span em").eq(0).text();//현재 미세먼지
			String ozon = now.select("span em").eq(1).text();//현재 오존상황
			
			Elements todayInfo = doc.select("table.tbl_weather");//오늘 정보
			String todayDate = todayInfo.select("thead span").eq(0).text();//오늘 날짜
			String todayAMTemp = todayInfo.select("tbody span.temp").eq(0).text();//오늘 오전 
			String todayPMTemp = todayInfo.select("tbody span.temp").eq(1).text();//오늘 오후 
			jobj.put("nowTime", nowTime);
			jobj.put("nowTemp", nowTemp);
			jobj.put("nowWeather", nowWeather);
			jobj.put("nowRain", nowRain);
			jobj.put("dust", dust);
			jobj.put("ozon", ozon);
			
			jobj.put("todayDate", todayDate);
			jobj.put("todayAMTemp", todayAMTemp);
			jobj.put("todayPMTemp", todayPMTemp);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return jobj.toString();
	}
	@GetMapping(value="/GetNaverBlog", produces="text/plain;charset=UTF-8")
	public @ResponseBody String naverBlog() {//네이버 블로그 검색
		JSONArray jarr = new JSONArray();
		try {
			Document doc = Jsoup.connect("https://search.naver.com/search.naver?where=post&sm=tab_jum&query=%EB%B6%80%EC%82%B0+%EC%97%AC%ED%96%89").get();
			Elements div = doc.select("li.sh_blog_top");
			for(int i = 0 ; i<5; i++) {
				String title = div.get(i).select("a.sh_blog_title").text();
				String link = div.get(i).select("a").attr("href");
				JSONObject jobj = new JSONObject();
				jobj.put("title",title);
				jobj.put("link",link);
				jarr.add(jobj);
			}	
		} catch (IOException e) {
			e.printStackTrace();
		}
		return jarr.toString();
	}
	@GetMapping(value="/GetDaumBlog", produces="text/plain;charset=UTF-8")
	public @ResponseBody String daumBlog() {//다음 블로그 검색
		JSONArray jarr = new JSONArray();
		try {
			Document doc = Jsoup.connect("https://search.daum.net/search?w=blog&nil_search=btn&DA=NTB&enc=utf8&q=%EB%B6%80%EC%82%B0+%EC%97%AC%ED%96%89").get();
			Elements div = doc.select("a.f_link_b");
			for(int i = 0 ; i<5; i++) {
				String title = div.get(i).select("a.f_link_b").text();
				String link = div.get(i).select("a").attr("href");
				JSONObject jobj = new JSONObject();
				jobj.put("title",title);
				jobj.put("link",link);
				jarr.add(jobj);
			}	
		} catch (IOException e) {
			e.printStackTrace();
		}
		return jarr.toString();
	}
	
	
	

	
	

}
