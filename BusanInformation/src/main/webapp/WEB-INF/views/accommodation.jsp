<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function() {
		$.get("/hotellist",{"pageNo":""}, function(data) {
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
		
	})
	function HotelPaging(pageNo){
			$.get("/hotellist",{"pageNo":pageNo}, function(data) {
				data=$.parseJSON(data);
				var listOfHotel = "";
				$("#pageHtml").html(data[0].pageHtml);
				for(var i = 0;i<data.length;i++){
					listOfHotel+="<p>"
					listOfHotel+="<a href=javascript:hotelview('"+data[i].datasid+"',"+pageNo+")>"+data[i].title+"</a><br>"
					listOfHotel+=data[i].content.substring(0,150)
					if(data[i].content.length>150){
						listOfHotel+="...[더보기]</p>"
					}
				}
				
				$("#hotelList").html(listOfHotel);
			})
			
		}
	function hotelview(datasid,pageNo){
		$.get("/hotelView",{"datasid":datasid}, function(data) {
			var hotelcontent = "";
			$("#pageHtml").html("<a href='javascript:HotelPaging("+pageNo+")'>목록으로 돌아가기</a>");
				hotelcontent+="<p>"
				hotelcontent+=" <img src="+data.imgSrc+"></p>"
				hotelcontent+="<p>호텔 명 : "+data.addr+"</p>"
				hotelcontent+="<p>전화번호 : "+data.tel+"</p>"
				hotelcontent+="<p>홈페이지 : <a href='"+data.userHomepage+"'>"+data.userHomepage+"</a></p>"
				hotelcontent+="<p>주 소 : "+data.addr+"</p>"
				hotelcontent+="<p>상세정보 : "+data.content+"</p>"
				hotelcontent+="<p>가 격 : "+data.price+"</p>"
				hotelcontent+="<p>오시는 길 : "+data.trafficin+"</p>"
			$("#hotelList").html(hotelcontent);
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
		<%@include file="./includes/busanHeader.jsp"%>
		<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row main-row">
					<div class="col-4 col-12-medium">

						<section>
							<h2>호텔 추천</h2>
							<ul class="small-image-list">
								<li>
									<h4>Jane Anderson</h4>
									<p>Varius nibh. Suspendisse vitae magna eget et amet mollis
										justo facilisis amet quis.</p></li>
								<li>
									<h4>James Doe</h4>
									<p>Vitae magna eget odio amet mollis justo facilisis amet
										quis. Sed sagittis consequat.</p></li>
							</ul>
						</section>

						<section>
							<h2>호텔 예매 사이트</h2>
							<div>
								<div class="row">
									<div class="col-6 col-12-small">
										<ul class="link-list">
											<li><a href="#">Sed neque nisi consequat</a></li>
											<li><a href="#">Dapibus sed mattis blandit</a></li>
											<li><a href="#">Quis accumsan lorem</a></li>
											<li><a href="#">Suspendisse varius ipsum</a></li>
											<li><a href="#">Eget et amet consequat</a></li>
										</ul>
									</div>
									<div class="col-6 col-12-small">
										<ul class="link-list">
											<li><a href="#">Quis accumsan lorem</a></li>
											<li><a href="#">Sed neque nisi consequat</a></li>
											<li><a href="#">Eget et amet consequat</a></li>
											<li><a href="#">Dapibus sed mattis blandit</a></li>
											<li><a href="#">Vitae magna sed dolore</a></li>
										</ul>
									</div>
								</div>
							</div>
						</section>

					</div>
					<div class="col-8 col-12-medium imp-medium">

						<section>
							<h2>숙박업소 목록</h2>
							<span id = hotelList></span>
							<div align = center>
							<span id = pageHtml >
							</span>
							</div>
						</section>

					</div>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<%@include file="./includes/busanFooter.jsp"%>
		<!-- Scripts -->
		<script src="/resources/assets/js/jquery.min.js"></script>
		<script src="/resources/assets/js/browser.min.js"></script>
		<script src="/resources/assets/js/breakpoints.min.js"></script>
		<script src="/resources/assets/js/util.js"></script>
		<script src="/resources/assets/js/main.js"></script>
</body>
</html>