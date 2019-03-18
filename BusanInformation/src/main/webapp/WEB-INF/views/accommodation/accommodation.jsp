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
		location.href="/hotelView?datasid="+datasid
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
							<h2>호텔 예매 사이트</h2>
							<div>
								<div class="row">
									<div class="col-6 col-12-small">
										<ul class="link-list">
											<li><a href="#">익스피디아</a></li>
											<li><a href="#">호텔스 컴바인</a></li>
											<li><a href="#">부킹닷컴</a></li>
											<li><a href="#">트리바고</a></li>
											<li><a href="#">호텔스닷컴</a></li>
										</ul>
									</div>
									<div class="col-6 col-12-small">
										<ul class="link-list">
											<li><a href="#">여기 어떄</a></li>
											<li><a href="#">야놀자</a></li>
											<li><a href="#">에어비앤비</a></li>
											<li><a href="#">인터파크</a></li>
											<li><a href="#">하나Free</a></li>
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