$(document).ready(function(){
	$.get("/bus",{"linename":"일반버스","code":"busInfo","pageNo":"1","fx":"bus"}, function(data){
		data=$.parseJSON(data);
		var lineIndex="";
		lineIndex+="<h2 class='koreanFont'>일반버스 정보</h2>"
		lineIndex+="<table>";
		lineIndex+="<tr>";
		lineIndex+="<th>버스번호</th><th width=120px>시작점</th><th width=120px>종점</th><th>첫차시간</th>";
		lineIndex+="<th>막차시간</th><th width=120px>배차간격(일반)</th><th>출퇴근배차</th><th>휴일배차</th></tr>"
		var z=10;//출력간격
		var y = z*1;//데이터의 길이
		if(y>data.length){//y가 데이터길이보다 클때는
			y=data.length
		}
		if(data.length<z){//길이가 출력값보다 작을떄
			y=data.length
		}
		var x=y-z;//for문 시작값
		if(x<0){
			x=0
		}
		for(var i=x ; i<y;i++){
			lineIndex+="<tr>";
			lineIndex+="<td><a href=javascript:StationInfo('일반버스','"+data[i].buslinenum+"','busInfo',1,'"+data[i].lineId+"')>"+data[i].buslinenum+" 번</a></td>";
			lineIndex+="<td>"+data[i].startpoint+"</td>";
			lineIndex+="<td>"+data[i].endpoint+"</td>";
			lineIndex+="<td>"+data[i].firsttime+"</td>";
			lineIndex+="<td>"+data[i].endtime+"</td>";
			lineIndex+="<td>"+data[i].headwayNorm+"분</td>";
			lineIndex+="<td>"+data[i].headwayPeak+"분</td>";
			lineIndex+="<td>"+data[i].headwayHoli+"분</td></tr>";
		}
		lineIndex+="</table><br>"	
		lineIndex+="<div align=center>"+data[data.length-1].pageHtml+"<br>";
		lineIndex+="<span>버스 번호 검색&nbsp;&nbsp;</span><input type=text id=word name=word width=100>";
		lineIndex+="<a href='javascript:busSearch()' class='smallbutton'>검색</a></div>";
	$("#lineInfo").html(lineIndex);
		
	})
})
function bus(code,line,pageNo){
		$.get("/bus",{"linename":line,"code":code,"pageNo":pageNo,"fx":"bus"}, function(data){
			
			data=$.parseJSON(data);
			var lineIndex="";
			lineIndex+="<h2 class='koreanFont'>"+line+" 정보</h2>"
			lineIndex+="<table >";
			lineIndex+="<tr>";
			lineIndex+="<th>버스번호</th><th width=120px>시작점</th><th width=120px>종점</th><th>첫차시간</th>";
			lineIndex+="<th>막차시간</th><th width=120px>배차간격(일반)</th><th>출퇴근배차</th><th>휴일배차</th></tr>"
				var z=10;//출력간격
			var y = z*pageNo;//데이터의 길이
			if(y>data.length){//y가 데이터길이보다 클때는
				y=data.length
			}
			if(data.length<z){//길이가 출력값보다 작을떄
				y=data.length
			}
			var x=z*(pageNo-1);//for문 시작값
			
			for(var i=x ; i<y;i++){
				lineIndex+="<tr>";
				lineIndex+="<td><a href=javascript:StationInfo('"+line+"','"+data[i].buslinenum+"','"+code+"','"+pageNo+"','"+data[i].lineId+"')>"+data[i].buslinenum+" 번</a></td>";
				lineIndex+="<td>"+data[i].startpoint+"</td>";
				lineIndex+="<td>"+data[i].endpoint+"</td>";
				lineIndex+="<td>"+data[i].firsttime+"</td>";
				lineIndex+="<td>"+data[i].endtime+"</td>";
				lineIndex+="<td>"+data[i].headwayNorm+"분</td>";
				lineIndex+="<td>"+data[i].headwayPeak+"분</td>";
				lineIndex+="<td>"+data[i].headwayHoli+"분</td></tr>";
			}
			lineIndex+="</table><br>"
			lineIndex+="<div align=center>"+data[data.length-1].pageHtml+"<br>";
			lineIndex+="<span>버스 번호 검색&nbsp;&nbsp;</span><input type=text id=word name=word width=100>";
			lineIndex+="<a href='javascript:busSearch()' class='smallbutton'>검색</a></div>";
			
		$("#lineInfo").html(lineIndex);
		})
}
function StationInfo(line,linename,code,pageNo,lineId){
	$.get("/busStation",{"lineId":lineId},function(data){
		data=$.parseJSON(data);
		var stationIndex="";
		stationIndex+="<h2>"+linename+"번 버스의 정류소 정보</h2>";
		stationIndex+="<p><a href=javascript:bus('"+code+"','"+line+"','"+pageNo+"')>돌아가기</a></p>";
		stationIndex+="<table><tr><th>정류소명</th><th>방향/버스</th></tr>";
		for(var i = 0 ; i<data.length;i++){
			stationIndex+="<tr>";
			stationIndex+="<td height=50px"
				if(data[i].direction==1||data[i].direction==2){
					stationIndex+=" style='font-weight:bold;'"
				}
			stationIndex+=	">"+data[i].bstopnm+"</td>";
			if(data[i].direction==1){
				stationIndex+="<th>상행/버스접근중</th>";
			}else if(data[i].direction==2){
				stationIndex+="<th>하행/버스접근중</th>";
			}else{
				stationIndex+="<th></th>";
			};
			stationIndex+="</tr>"
		}
		stationIndex+="</table>"
		$("#lineInfo").html(stationIndex);
	})
}
function busSearch(){//버스 번호 검색
	$.get("/busSearch",{"num":$("#word").val()},function(data){
		data=$.parseJSON(data);
		var lineIndex="";
		lineIndex+="<h2 class='koreanFont'>"+$("#word").val()+"검색 정보</h2>"
		lineIndex+="<table >";
		lineIndex+="<tr>";
		lineIndex+="<th>버스번호</th><th width=120px>시작점</th><th width=120px>종점</th><th>첫차시간</th>";
		lineIndex+="<th>막차시간</th><th width=120px>배차간격(일반)</th><th>출퇴근배차</th><th>휴일배차</th></tr>"
			for(var i=0 ; i<data.length;i++){
				lineIndex+="<tr>";
				lineIndex+="<td><a href=javascript:StationInfo('일반버스','"+data[i].buslinenum+"','busInfo','1','"+data[i].lineId+"')>"+data[i].buslinenum+" 번</a></td>";
				lineIndex+="<td>"+data[i].startpoint+"</td>";
				lineIndex+="<td>"+data[i].endpoint+"</td>";
				lineIndex+="<td>"+data[i].firsttime+"</td>";
				lineIndex+="<td>"+data[i].endtime+"</td>";
				lineIndex+="<td>"+data[i].headwayNorm+"분</td>";
				lineIndex+="<td>"+data[i].headwayPeak+"분</td>";
				lineIndex+="<td>"+data[i].headwayHoli+"분</td></tr>";
			}
			lineIndex+="</table><br>"
			lineIndex+="<div align=center><span>버스 번호 검색&nbsp;&nbsp;</span><input type=text id=word name=word width=100>";
			lineIndex+="<a href='javascript:busSearch()' class='smallbutton'>검색</a></div>";
		$("#lineInfo").html(lineIndex);
	})
	
	
	
}