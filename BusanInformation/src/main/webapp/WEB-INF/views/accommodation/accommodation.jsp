<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Hi+Melody|Sunflower:300&amp;subset=korean" rel="stylesheet">
<style>
.col-4 h2.koreanFont{
font-family: 'Do Hyeon', sans-serif;
font-size: 40px;
}
section h2.koreanFont{
font-family: 'Do Hyeon', sans-serif;
font-size: 50px;
}
.tourbutton{
font-family: 'Sunflower', sans-serif;
}
.listTitle{
font-family: 'Do Hyeon', sans-serif;
font-size: 29px;
}
.listContent{
font-family: 'Hi Melody', cursive;
font-size: 20px;
}

</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function() {
		$.get("/hotellist",{"pageNo":""}, function(data) {
			data=$.parseJSON(data);
			var listOfHotel = "";
			$("#pageHtml").html(data[0].pageHtml);
			for(var i = 0;i<data.length;i++){
				listOfHotel+="<p>"
				listOfHotel+="<a href=javascript:hotelview('"+data[i].datasid+"',1) class='listTitle'>"+data[i].title+"</a><br>"
				listOfHotel+="<span class='listContent'>"+data[i].content.substring(0,150)
				if(data[i].content.length>150){
					listOfHotel+="...[더보기]</span></p>"
				}
			}
			
			$("#hotelList").html(listOfHotel);
		})
		
	})
	function HotelPaging(pageNo){
			$.get("/hotellist",{"pageNo":pageNo}, function(data) {
				data=$.parseJSON(data);
				var listOfHotel = "";
				$("#pageHtml").html(data[0].pageHtml);
				for(var i = 0;i<data.length;i++){
					listOfHotel+="<p>"
					listOfHotel+="<a href=javascript:hotelview('"+data[i].datasid+"',"+pageNo+") class='listTitle'>"+data[i].title+"</a><br>"
					listOfHotel+="<span class='listContent'>"+data[i].content.substring(0,150)
					if(data[i].content.length>150){
						listOfHotel+="...[더보기]</span></p>"
					}
				}
				
				$("#hotelList").html(listOfHotel);
			})
			
		}
	function hotelview(datasid,pageNo){
		location.href="/hotelView?datasid="+datasid
	}
	function hotelSearch(){
		$.get("/hotelSearch",{"word":$("#word").val()}, function(data) {
			data=$.parseJSON(data);
			var listOfHotel = "";
			$("#pageHtml").html("<a href='javascript:hotellist(1)' class=smallbutton>전체목록보기</a>");
			for(var i = 0;i<data.length;i++){
				listOfHotel+="<p>"
				listOfHotel+="<a href=javascript:hotelview('"+data[i].datasid+"',1) class='listTitle'>"+data[i].title+"</a><br>"
				listOfHotel+="<span class='listContent'>"+data[i].content.substring(0,150)
				if(data[i].content.length>150){
					listOfHotel+="...[더보기]</span></p>"
				}
			}
			
			$("#hotelList").html(listOfHotel);
		})
	}
	function hotellist(num){
		$.get("/hotellist",{"pageNo":num}, function(data) {
			data=$.parseJSON(data);
			var listOfHotel = "";
			$("#pageHtml").html(data[0].pageHtml);
			for(var i = 0;i<data.length;i++){
				listOfHotel+="<p>"
				listOfHotel+="<a href=javascript:hotelview('"+data[i].datasid+"',1)>"+data[i].title+"</a><br>"
				listOfHotel+=data[i].content.substring(0,150)
				if(data[i].content.length>150){
					listOfHotel+="...[더보기]</p>"
				}
			}
			
			$("#hotelList").html(listOfHotel);
		})
	}
</script>
<head>
<title>부산 정보 포털</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/main.css">
</head>
<body>
	<div id="page-wrapper">
		<!-- Header -->
		<%@include file="../includes/busanHeader.jsp"%>
		<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row main-row">
					<div class="col-4 col-12-medium">
						<section>
							<h2 class=koreanFont>호텔 예매 사이트</h2>
							<div>
								<div class="row">
									<div class="col-6 col-12-small">
										<ul class="link-list">
											<li><a href="#" class="tourbutton">익스피디아</a></li>
											<li><a href="#" class="tourbutton">호텔스 컴바인</a></li>
											<li><a href="#" class="tourbutton">부킹닷컴</a></li>
											<li><a href="#" class="tourbutton">트리바고</a></li>
											<li><a href="#" class="tourbutton">호텔스닷컴</a></li>
										</ul>
									</div>
									<div class="col-6 col-12-small">
										<ul class="link-list">
											<li><a href="#" class="tourbutton">여기 어떄</a></li>
											<li><a href="#" class="tourbutton">야놀자</a></li>
											<li><a href="#" class="tourbutton">에어비앤비</a></li>
											<li><a href="#" class="tourbutton">인터파크</a></li>
											<li><a href="#" class="tourbutton">하나Free</a></li>
										</ul>
									</div>
								</div>
							</div>
						</section>

					</div>
					<div class="col-8 col-12-medium imp-medium">

						<section>
							<h2 class=koreanFont>숙박업소 목록</h2>
							<span id = hotelList></span>
							<div align = center>
							<span id = pageHtml >
							</span><br>
							<span>호텔 이름 검색&nbsp;&nbsp;</span>
							<input type = text id=word name=word width=150>
							<a href="javascript:hotelSearch()" class="smallbutton">검색</a>
							</div>
						</section>

					</div>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<%@include file="../includes/busanFooter.jsp"%>
		<!-- Scripts -->
		<script src="/resources/assets/js/googlemap.js"></script>
		<script src="/resources/assets/js/jquery.min.js"></script>
		<script src="/resources/assets/js/browser.min.js"></script>
		<script src="/resources/assets/js/breakpoints.min.js"></script>
		<script src="/resources/assets/js/util.js"></script>
		<script src="/resources/assets/js/main.js"></script>
</body>
</html>