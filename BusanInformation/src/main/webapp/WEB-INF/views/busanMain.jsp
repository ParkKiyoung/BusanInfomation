<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./includes/busanHeader.jsp"%>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function(){
	$.get("/GetMainNews",function(data){
		data = $.parseJSON(data);
		var newsBoard = "";
		newsBoard+="<table>"
		for(var i = 0 ; i<data.length;i++){
			newsBoard+="<tr><td>"
			newsBoard+="<a href="+data.link+">"
			newsBoard+=data.title
			newsBoard+="</a></td></tr>"
		}
		newsBoard+="</table>"
		alert(newsBoard);
	$("#tourNews").html(newsBoard);
	})
	
})


</script>

<div align="center">
	<img src="/resources/img/busanMain.png" width="750" height="200">
	<table>
		<tr>
			<td>
				<h3 align=center>부산 여행 뉴스</h3>
				<span id="tourNews">
				</span>
			</td>
			<td valign="top">
				<h3 align= center>오늘 날씨</h3>
				<table border solid>
					<tr>
						<td align = center>오전</td>
						<td align = center>오후</td>
					</tr>
					<tr>
						<td>오전온도</td>
						<td>오후온도</td>
					</tr>
					<tr>
						<td>오전미세먼지</td>
						<td>오후미세먼지</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<h3>주간 날씨</h3>

	<table border solid>
		<tr>
			<td width=100px align = center>오늘날씨</td>
			<td width=100px align = center>내일날씨</td>
			<td width=100px align = center>모레날씨</td>
			<td width=100px align = center>담날날씨</td>
			<td width=100px align = center>그담날날씨</td>
			<td width=100px align = center>그담담날씨</td>
		</tr>
		<tr>
			<td>미세먼지 농도: 오늘미세</td>
			<td>미세먼지 농도: 내일미세</td>
			<td>미세먼지 농도: 모레미세</td>
			<td>미세먼지 농도: 담날미세</td>
			<td>미세먼지 농도: 그담날미세</td>
			<td>미세먼지 농도: 그담날미세</td>
		</tr>
	</table>
</div>
