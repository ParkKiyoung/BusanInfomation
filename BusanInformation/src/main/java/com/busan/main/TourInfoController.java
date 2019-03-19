package com.busan.main;

import java.io.IOException;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.busan.domain.BusanHotelVO;
import com.busan.domain.BusanTourInfo;
import com.busan.domain.BusanWeatherVO;

@Controller
@RequestMapping("/*")
public class TourInfoController {
	
	String myapi = "F3RKR%2FvO05WMjgbXcNLYkUXIvJfX9WlREEmv1M6GhxceQUnsJBYynbCMu9NVA2rFzp1zGxOiG9V1QLjCSWTqlg%3D%3D";
	
	@Autowired
	private PagingAction page;
	
	@GetMapping("/TourInformation")
	public String TourInformation(Model model) {
		try {
			Document doc = Jsoup.connect("https://weather.naver.com/rgn/cityWetrCity.nhn?cityRgnCd=CT008008#").get();
			Elements dayInfo = doc.select("table.tbl_weather");//오늘 정보
			String todayDate = dayInfo.select("thead span").eq(0).text();//오늘 날짜
			String todayAMTemp = dayInfo.select("tbody span.temp").eq(0).text();//오늘 오전 
			String todayPMTemp = dayInfo.select("tbody span.temp").eq(1).text();//오늘 오후 
			String todayAMsrc = dayInfo.select("img").eq(0).attr("src");//오늘 오전 이미지
			String todayPMsrc = dayInfo.select("img").eq(1).attr("src");//오늘 오후 이미지
			String tmoDate = dayInfo.select("thead span").eq(1).text();//내일 날짜
			String tmoAMTemp = dayInfo.select("tbody span.temp").eq(2).text();//내일 오전 
			String tmoPMTemp = dayInfo.select("tbody span.temp").eq(3).text();//내일 오후 
			String tmoAMsrc = dayInfo.select("img").eq(2).attr("src");//내일 오전 이미지
			String tmoPMsrc = dayInfo.select("img").eq(3).attr("src");//내일 오후 이미지
			model.addAttribute("todayDate",todayDate);
			model.addAttribute("todayAMTemp",todayAMTemp);
			model.addAttribute("todayPMTemp",todayPMTemp);
			model.addAttribute("tmoDate",tmoDate);
			model.addAttribute("tmoAMTemp",tmoAMTemp);
			model.addAttribute("tmoPMTemp",tmoPMTemp);
			model.addAttribute("todayAMsrc",todayAMsrc);
			model.addAttribute("todayPMsrc",todayPMsrc);
			model.addAttribute("tmoAMsrc",tmoAMsrc);
			model.addAttribute("tmoPMsrc",tmoPMsrc);
			
			Elements weekly = doc.select("table.tbl_weather").eq(1);
			Elements tr = weekly.select("tr");
			ArrayList<BusanWeatherVO> arr = new ArrayList<>();
			for(int i = 0 ; i<tr.size(); i++) {
				BusanWeatherVO vo = new BusanWeatherVO();
				String weekday = tr.get(i).select("th").text();
				String weekAMTemp = tr.get(i).select("td span.temp").eq(0).text();//온도
				String weekPMTemp = tr.get(i).select("td span.temp").eq(1).text();
				String weekAMInfo = tr.get(i).select("td li.info").eq(0).text();//정보
				String weekPMInfo = tr.get(i).select("td li.info").eq(1).text();
				String imgAMsrc = tr.get(i).select("img").eq(0).attr("src");//오전 이미지
				String imgPMsrc = tr.get(i).select("img").eq(1).attr("src");//오후 이미지
				vo.setWeekday(weekday);
				vo.setWeekAMInfo(weekAMInfo);
				vo.setWeekAMTemp(weekAMTemp);
				vo.setWeekPMInfo(weekPMInfo);
				vo.setWeekPMTemp(weekPMTemp);
				vo.setImgAMsrc(imgAMsrc);
				vo.setImgPMsrc(imgPMsrc);
				arr.add(vo);
			}
			model.addAttribute("weatherlist",arr);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/tourInformation/tourInformation";
	}

	@GetMapping(value="/exptour", produces="text/plain;charset=UTF-8")
	public @ResponseBody String emptourmenu(String course,String pageNo,String place,String fx,String theme) {
		String endpoint = "http://apis.data.go.kr/6260000/BusanTourInfoService";
		int numOfRows=5;//페이지당 갯수
		int pageNO;
		if(pageNo.equals("")||pageNo.equals(null)) {
			pageNO=1;
		}else {
			pageNO=Integer.parseInt(pageNo);
		}
		String url=endpoint+"/"+theme+"?serviceKey="+myapi+"&category_code1="+course+"&numOfRows="+numOfRows+"&pageNo="+pageNO;;
		JSONArray jarr = new JSONArray();
		try {
			Document doc = Jsoup.connect(url).get();
			int totalCount = Integer.parseInt(doc.select("totalCount").text());
			Elements item = doc.select("item");
			String pageHtml = page.ltpaging(totalCount, numOfRows, pageNO,course,place,fx,theme);//페이징
			for(int i = 0 ;i<item.size();i++) {
				JSONObject jobj = new JSONObject();
				String title = item.get(i).select("dataTitle").text();
				String content = item.get(i).select("dataContent").text();
				String datasid = item.get(i).select("dataSid").text();
				jobj.put("title",title);
				jobj.put("content",content);
				jobj.put("datasid",datasid);
				jobj.put("pageHtml",pageHtml);
				jarr.add(jobj);
			}
			}catch(IOException e) {
				e.printStackTrace();
			}
		return jarr.toString();
	}
	@GetMapping(value="/empView")
	public String empView(Model model,String datasid) {
	
		String endpoint = "http://apis.data.go.kr/6260000/BusanTourInfoService";
		String url= endpoint+"/getExperienceTourDetail?serviceKey="+myapi+"&data_sid="+datasid;
		
		
		try {
			
			Document doc = Jsoup.connect("https://weather.naver.com/rgn/cityWetrCity.nhn?cityRgnCd=CT008008#").get();
			Elements dayInfo = doc.select("table.tbl_weather");//오늘 정보
			String todayDate = dayInfo.select("thead span").eq(0).text();//오늘 날짜
			String todayAMTemp = dayInfo.select("tbody span.temp").eq(0).text();//오늘 오전 
			String todayPMTemp = dayInfo.select("tbody span.temp").eq(1).text();//오늘 오후 
			String todayAMsrc = dayInfo.select("img").eq(0).attr("src");//오늘 오전 이미지
			String todayPMsrc = dayInfo.select("img").eq(1).attr("src");//오늘 오후 이미지
			String tmoDate = dayInfo.select("thead span").eq(1).text();//내일 날짜
			String tmoAMTemp = dayInfo.select("tbody span.temp").eq(2).text();//내일 오전 
			String tmoPMTemp = dayInfo.select("tbody span.temp").eq(3).text();//내일 오후 
			String tmoAMsrc = dayInfo.select("img").eq(2).attr("src");//내일 오전 이미지
			String tmoPMsrc = dayInfo.select("img").eq(3).attr("src");//내일 오후 이미지
			model.addAttribute("todayDate",todayDate);
			model.addAttribute("todayAMTemp",todayAMTemp);
			model.addAttribute("todayPMTemp",todayPMTemp);
			model.addAttribute("tmoDate",tmoDate);
			model.addAttribute("tmoAMTemp",tmoAMTemp);
			model.addAttribute("tmoPMTemp",tmoPMTemp);
			model.addAttribute("todayAMsrc",todayAMsrc);
			model.addAttribute("todayPMsrc",todayPMsrc);
			model.addAttribute("tmoAMsrc",tmoAMsrc);
			model.addAttribute("tmoPMsrc",tmoPMsrc);
			
			Elements weekly = doc.select("table.tbl_weather").eq(1);
			Elements tr = weekly.select("tr");
			ArrayList<BusanWeatherVO> arr = new ArrayList<>();
			for(int i = 0 ; i<tr.size(); i++) {
				BusanWeatherVO vo = new BusanWeatherVO();
				String weekday = tr.get(i).select("th").text();
				String weekAMTemp = tr.get(i).select("td span.temp").eq(0).text();//온도
				String weekPMTemp = tr.get(i).select("td span.temp").eq(1).text();
				String weekAMInfo = tr.get(i).select("td li.info").eq(0).text();//정보
				String weekPMInfo = tr.get(i).select("td li.info").eq(1).text();
				String imgAMsrc = tr.get(i).select("img").eq(0).attr("src");//오전 이미지
				String imgPMsrc = tr.get(i).select("img").eq(1).attr("src");//오후 이미지
				vo.setWeekday(weekday);
				vo.setWeekAMInfo(weekAMInfo);
				vo.setWeekAMTemp(weekAMTemp);
				vo.setWeekPMInfo(weekPMInfo);
				vo.setWeekPMTemp(weekPMTemp);
				vo.setImgAMsrc(imgAMsrc);
				vo.setImgPMsrc(imgPMsrc);
				arr.add(vo);
			}
			model.addAttribute("weatherlist",arr);
			
			
			
			
			
			
			BusanTourInfo vo = new BusanTourInfo();
			doc = Jsoup.connect(url).get();
			vo.setTitle(doc.select("dataTitle").text().replaceAll("&ltbr&gt", "\n"));//제목
			vo.setAddr(doc.select("addr").text()+doc.select("detail").text().replaceAll("&ltbr&gt", "\n"));//주소
			vo.setContent(doc.select("dataContent").text().replaceAll("&ltbr&gt", "\n"));//내용
			vo.setImgSrc(doc.select("mainimgthumb").text().replaceAll("&ltbr&gt", "\n"));//이미지
			vo.setEntfree(doc.select("entfree").text().replaceAll("&ltbr&gt", "\n"));//입장료
			vo.setTel(doc.select("tel").text().replaceAll("&ltbr&gt", "\n"));//전화번호
			vo.setGuide(doc.select("guide").text().replaceAll("&ltbr&gt", "\n"));//안내전화
			vo.setTraffic(doc.select("trafin").text()+" "+doc.select("trafout").text().replaceAll("&ltbr&gt", "<br>"));//교통편
			vo.setWay(doc.select("way").text().replaceAll("&ltbr&gt", "\n"));//오시는길
			vo.setExpe(doc.select("expe").text().replaceAll("&ltbr&gt", "\n"));//프로그램
			vo.setForguid(doc.select("forguid").text().replaceAll("&ltbr&gt", "\n"));//통역
			vo.setDisest(doc.select("disest").text().replaceAll("&ltbr&gt", "\n"));//편의 시설
			vo.setUserHomepage(doc.select("userHomepage").text().replaceAll("&ltbr&gt", "\n"));
			vo.setWgsx(doc.select("wgsx").text());
			vo.setWgsy(doc.select("wgsy").text());
			
			model.addAttribute("vo",vo);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/tourInformation/tourInformationView";
	}
	
	
	
	

}
