package com.busan.main;

import java.io.IOException;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.busan.domain.BusanHotelVO;

@Controller
@RequestMapping("/*")
public class AccommController {
	
	String myapi = "F3RKR%2FvO05WMjgbXcNLYkUXIvJfX9WlREEmv1M6GhxceQUnsJBYynbCMu9NVA2rFzp1zGxOiG9V1QLjCSWTqlg%3D%3D";
	
	@Resource(name="page")
	private PagingAction page;
	@GetMapping("/accommodation")
	public String accommodations() {
		return "accommodation";
	}
	
	
	@GetMapping(value="/hotellist", produces="text/plain;charset=UTF-8")
	public @ResponseBody String hotelList(String pageNo) {
		
		String endpoint = "http://apis.data.go.kr/6260000/BusanTourInfoService";
		String getStayList="getStayList";
		int numOfRows=5;//페이지당 갯수
		int pageNO;
		if(pageNo.equals("")||pageNo.equals(null)) {
			pageNO=1;
		}else {
			pageNO=Integer.parseInt(pageNo);
		}
		String url= endpoint+"/"+getStayList+"?serviceKey="+myapi+"&numOfRows="+numOfRows+"&pageNo="+pageNO;
		JSONArray jarr = new JSONArray();
		try {
			Document doc = Jsoup.connect(url).get();
			int totalCount = Integer.parseInt(doc.select("totalCount").text());
			Elements item = doc.select("item");
			String pageHtml = page.paging(totalCount, numOfRows, pageNO);
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
	@GetMapping(value="/hotelView")
	public @ResponseBody BusanHotelVO hotelView(String datasid) {
		
		
		String endpoint = "http://apis.data.go.kr/6260000/BusanTourInfoService";
		String url= endpoint+"/getStayDetail?serviceKey="+myapi+"&data_sid="+datasid;
		
		BusanHotelVO vo = new BusanHotelVO();
		try {
			Document doc = Jsoup.connect(url).get();
			vo.setTitle(doc.select("dataTitle").text());
			vo.setAddr(doc.select("addr").text()+doc.select("detail").text());
			vo.setContent(doc.select("dataContent").text().replaceAll("&ltbr&gt", "\n"));
			vo.setImgSrc(doc.select("mainimgthumb").text());
			vo.setPrice(doc.select("price").text());
			vo.setTel(doc.select("tel").text());
			vo.setTrafficin(doc.select("trafin").text().replaceAll("&ltbr&gt", "\n")+" "+doc.select("trafout").text().replaceAll("&ltbr&gt", "\n"));
			vo.setUserHomepage(doc.select("userHomepage").text());
			vo.setWgsx(doc.select("wgsx").text());
			vo.setWgsy(doc.select("wgsy").text());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}
}
