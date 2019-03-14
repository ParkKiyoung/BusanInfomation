
//---------------------------------------------------명품관광--------------------------------------------------
function LuxuryTour(theme){
	var LuxuryMenu="";
	LuxuryMenu+="<h2>명품 관광 코스 추천</h2>"
	LuxuryMenu+="<p><a href='javascript:tourSpot(\"cour_01\",1,\"광안리\",\""+theme+"\")'>광안리</a></p>";
	LuxuryMenu+="<p><a href='javascript:tourSpot(\"kpu0104_6\",1,\"누리마루APEC하우스\",\""+theme+"\")'>누리마루APEC하우스</a></p>";
	LuxuryMenu+="<p><a href='javascript:tourSpot(\"cour_06\",1,\"벡스코\",\""+theme+"\")'>벡스코</a></p>";
	LuxuryMenu+="<p><a href='javascript:tourSpot(\"cour_13\",1,\"영화의전당/BIFF\",\""+theme+"\")'>영화의전당/BIFF</a></p>";
	LuxuryMenu+="<p><a href='javascript:tourSpot(\"cour_09\",1,\"용두산공원\",\""+theme+"\")'>용두산공원/부산타워</a></p>";
	LuxuryMenu+="<p><a href='javascript:tourSpot(\"cour_14\",1,\"UN기념공원\",\""+theme+"\")'>UN기념공원</a></p>";
	LuxuryMenu+="<p><a href='javascript:tourSpot(\"cour_10\",1,\"자갈치시장\",\""+theme+"\")'>자갈치시장</a></p>";
	LuxuryMenu+="<p><a href='javascript:tourSpot(\"cour_12\",1,\"해운대\",\""+theme+"\")'>해운대</a></p>";
	LuxuryMenu+="<p><a href='javascript:tourSpot(\"cour_11\",1,\"태종대\",\""+theme+"\")'>태종대</a></p>";
	LuxuryMenu+="<p><a href='javascript:tourSpot(\"kpu0103\",1,\"크루즈투어\",\""+theme+"\")'>크루즈투어</a></p>";
	LuxuryMenu+="<p><a href='javascript:tourSpot(\"kpu0106\",1,\"아쿠아리움\",\""+theme+"\")'>아쿠아리움</a></p>";
		
	$("#tourInfo").html(LuxuryMenu)
	$("#pageHtml").html("");
}
//-------------------------------------------------체험여행-----------------------------------------------
function expTourIndex(theme){
	var exmpIndex="";
	exmpIndex+="<h2>테마 관광 코스 추천</h2>"
	exmpIndex+="<p><a href='javascript:tourSpot(\"kpu0105_1\",1,\"전통문화체험\",\""+theme+"\")'>전통문화체험</a></p>";
	exmpIndex+="<p><a href='javascript:tourSpot(\"kpu0105_2\",1,\"자연생태체험\",\""+theme+"\")'>자연생태체험</a></p>";
	exmpIndex+="<p><a href='javascript:tourSpot(\"kpu0105_3\",1,\"템플스테이\",\""+theme+"\")'>템플스테이</a></p>";
	exmpIndex+="<p><a href='javascript:tourSpot(\"kpu0105_4\",1,\"부산시인증문화체험장\",\""+theme+"\")'>부산시인증문화체험장</a></p>";
	$("#tourInfo").html(exmpIndex)
	$("#pageHtml").html("");
}

//--------------------------------------------테마여행---------------------------------------------
function themetourindex(theme){
	var themaIndex="";
	themaIndex+="<h2>테마 관광 코스 추천</h2>"
	themaIndex+="<p><a href='javascript:tourSpot(\"f_the_cine\",1,\"시네마투어\",\""+theme+"\")'>시네마투어</a></p>";
	themaIndex+="<p><a href='javascript:tourSpot(\"f_the_gal\",1,\"갤러리투어\",\""+theme+"\")'>갤러리 투어</a></p>";
	themaIndex+="<p><a href='javascript:tourSpot(\"f_the_well\",1,\"웰빙투어\",\""+theme+"\")'>웰빙투어</a></p>";
	themaIndex+="<p><a href='javascript:tourSpot(\"f_the_nig\",1,\"나이트투어\",\""+theme+"\")'>나이트 투어</a></p>";
	themaIndex+="<p><a href='javascript:tourSpot(\"f_the_cul\",1,\"역사/문화투어\",\""+theme+"\")'>역사/문화투어</a></p>";
	themaIndex+="<p><a href='javascript:tourSpot(\"f_the_sub\",1,\"도시철도투어\",\""+theme+"\")'>도시철도투어</a></p>";
	$("#tourInfo").html(themaIndex)
	$("#pageHtml").html("");
}
//-----------------------------------------도보여행-----------------------------------------------------------
//------------------------------------------------관광명소--------------------------------------------------------
//-----------------------------------------------쇼핑명소------------------------------------------------------------
//-----------------------------------------------스포츠레저----------------------------------------------------------
function tourSpot(course,pageNo,place,theme){
	if(pageNo==""||pageNo==null) {
		pageNo=1;
	}
	$.get("exptour",{"course":course,"pageNo":pageNo,"place":place,"fx":"exptour","theme":theme},function(data){
	data=$.parseJSON(data)
	var expMenu="";
	expMenu+="<h2>"+place+"의 정보</h2>"
	$("#pageHtml").html(data[0].pageHtml);
	for(var i = 0;i<data.length;i++){
		expMenu+="<p>"
		expMenu+="<a href=javascript:empView('"+course+"','"+data[i].datasid+"',"+pageNo+",'"+place+"',\""+theme+"\")>"+data[i].title+"</a><br>"
		expMenu+=data[i].content.substring(0,150)
		if(data[i].content.length>150){
			expMenu+="...";
		}
	}
	$("#tourInfo").html(expMenu);
})
}
//===================================================개별 목록 불러옴=================================================
function exptour(course,pageNo,place,theme){
	$.get("exptour",{"course":course,"pageNo":pageNo,"place":place,"fx":"exptour","theme":theme},function(data){
	data=$.parseJSON(data)
	var expMenu="";
	expMenu+="<h2>"+place+"의 정보</h2>"
	$("#pageHtml").html(data[0].pageHtml);
	for(var i = 0;i<data.length;i++){
		expMenu+="<p>"
		expMenu+="<a href=javascript:empView('"+course+"','"+data[i].datasid+"',"+pageNo+",'"+place+"',\""+theme+"\")>"+data[i].title+"</a><br>"
		expMenu+=data[i].content.substring(0,150)
		if(data[i].content.length>150){
			expMenu+="...";
		}
	}
	$("#tourInfo").html(expMenu);
})
}
//====================================================상세보기=========================================================
function empView(course,datasid,pageNo,place,theme){//상세보기
	$.get("/empView",{"datasid":datasid}, function(data) {
		var empViewText = "";
		$("#pageHtml").html("<a href='javascript:exptour(\""+course+"\","+pageNo+",\""+place+"\",\""+theme+"\")'>목록으로 돌아가기</a>");
		empViewText+="<h2 align = center>"+data.title+"</h2>"
		empViewText+="<p align = center>"
			empViewText+=" <img src="+data.imgSrc+"></p>"
			empViewText+="<p>장소 명 : "+data.title+"</p>"
			empViewText+="<p>전화번호 : "+data.tel+"</p>"
			empViewText+="<p>안내전화 : "+data.guide+"</p>"
			empViewText+="<p>주 소 : "+data.addr+"</p>"
			empViewText+="<p>편의 시설 : "+data.disest+"</p>"
			empViewText+="<p>홈페이지 : <a href='"
				if(data.userHomepage.substring(0,7)!='https://'){
					empViewText+="https://"
				}
		empViewText+=data.userHomepage+"'>"+data.userHomepage+"</a></p>"
		empViewText+="<p>가 격 : "+data.entfree+"</p>"
		empViewText+="<p>교통편 : "+data.traffic+"</p>"
		empViewText+="<p>오시는 길 : "+data.way+"</p>"
		empViewText+="<p>상세정보 : "+data.content+"</p>"
		$("#tourInfo").html(empViewText);
	})
}
