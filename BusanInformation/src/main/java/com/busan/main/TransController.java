package com.busan.main;

import java.io.IOException;

import javax.inject.Inject;

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

import com.busan.service.BusService;

@Controller
@RequestMapping("/*")
public class TransController {
	
	@Inject
	private PagingAction page;
	@Autowired
	private BusService busService;
	
	
	String myapi = "F3RKR%2FvO05WMjgbXcNLYkUXIvJfX9WlREEmv1M6GhxceQUnsJBYynbCMu9NVA2rFzp1zGxOiG9V1QLjCSWTqlg%3D%3D";
	@GetMapping("/Transportation")
	public String Transportation() {	
		return "/transportation/transportation";
	}
	
	@GetMapping(value="/bus", produces="text/plain;charset=UTF-8")
	public @ResponseBody String busInfo(String code,String linename,String pageNo,String fx){
		String http="http://61.43.246.153/openapi-data/service/busanBIMS2";
		String url = http+"/"+code+"?serviceKey="+myapi;
		int numOfRows=10;//페이지당 갯수
		int pageNO;
		if(pageNo.equals("")||pageNo.equals(null)) {
			pageNO=1;
		}else {
			pageNO=Integer.parseInt(pageNo);
		}
		JSONArray jarr = new JSONArray();
		try {
			Document doc = Jsoup.connect(url).get();
			Elements item = doc.select("item");
			int totalCount = 0;
			for(int i = 0 ;i<item.size();i++) {
				String bustype = item.get(i).select("bustype").text().substring(0,4);//버스노선명	
				if(bustype.equals(linename)) {
					totalCount++;
					JSONObject jobj = new JSONObject();
					String buslinenum = item.get(i).select("buslinenum").text();//버스번호
					String startpoint = item.get(i).select("startpoint").text();//시작점
					String endpoint = item.get(i).select("endpoint").text();//종점
					String firsttime = item.get(i).select("firsttime").text();//첫차시간
					String endtime = item.get(i).select("endtime").text();//막차시간
					String headwayNorm = item.get(i).select("headwayNorm").text();//일반배차
					String headwayPeak = item.get(i).select("headwayPeak").text();//출퇴근시간배차
					String headwayHoli = item.get(i).select("headwayHoli").text();//휴일배차
					String lineId = item.get(i).select("lineId").text();//라인 아이디
					//buslinenum.contentEquals("")부분일치 확인 boolean 형태
					String pageHtml = page.transpaging(totalCount, numOfRows, pageNO,linename,code,fx);//페이징
					jobj.put("pageHtml",pageHtml);
					jobj.put("lineId",lineId);
					jobj.put("buslinenum",buslinenum);
					jobj.put("startpoint",startpoint);
					jobj.put("endpoint",endpoint);
					jobj.put("firsttime",firsttime);
					jobj.put("endtime",endtime);
					jobj.put("headwayNorm",headwayNorm);
					jobj.put("headwayPeak",headwayPeak);
					jobj.put("headwayHoli",headwayHoli);
					jarr.add(jobj);
				}
			}
			}catch(IOException e) {
				e.printStackTrace();
			}
		 
		return jarr.toString();
	}
	@GetMapping(value="/busStation", produces="text/plain;charset=UTF-8")
	public @ResponseBody String busStation(String lineId){
		String http="http://61.43.246.153/openapi-data/service/busanBIMS2";
		String url = http+"/busInfoRoute?serviceKey="+myapi+"&lineid="+lineId;
		JSONArray jarr = new JSONArray();
		try {
			Document doc = Jsoup.connect(url).get();
			Elements item = doc.select("item");
			for(int i = 0 ; i<item.size();i++) {
				JSONObject jobj = new JSONObject();
				String bstopnm = item.get(i).select("bstopnm").text();
				String arsNo = item.get(i).select("arsNo").text();
				String carNo = item.get(i).select("carNo").text();
				String direction = item.get(i).select("direction").text();
				jobj.put("bstopnm",bstopnm);
				jobj.put("arsNo",arsNo);
				jobj.put("carNo",carNo);
				jobj.put("direction",direction);
				jarr.add(jobj);
			}
		}catch(IOException e) {
			e.printStackTrace();
		}
		return jarr.toString();
	}
	@GetMapping("/subwayLine1")
	public String Line1Call() {
		return "/transportation/subwayLine1";
	}
	@GetMapping("/subwayLine2")
	public String Line2Call() {
		return "/transportation/subwayLine2";
	}
	@GetMapping("/subwayLine3")
	public String Line3Call() {
		return "/transportation/subwayLine3";
	}
	@GetMapping("/subwayLine4")
	public String Line4Call() {
		return "/transportation/subwayLine4";
	}
	@GetMapping("/subinfo")
	public String subinfo(Model model, String scode) {
		
		model.addAttribute("scode",scode);
		return "/transportation/subwayView";
	}

}
