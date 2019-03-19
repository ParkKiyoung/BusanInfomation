<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
<style>
#map {
	width: 100%;
	height: 400px;
	background-color: grey;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script async defer
	src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBx-ZvaEFHhjEzLZQn101vF6zGvNptSGxI&callback=initMap"></script>
<!-- 구글맵 API -->
<script>
	function initMap() { // 지도 요청시 callback으로 호출될 메서드 부분으로 지도를 맨처음 초기화하고, 표시해주는
		// 함수
		var latVal = ${vo.wgsx};
		var lngVal = ${vo.wgsy};

		var mapLocation = {
			lat : latVal,
			lng : lngVal
		}; // 위도, 경도를 가지는 객체를 생성
		/*
		 * var map = new google.maps.Map(document.getElementById('map'), { // 위의 div
		 * id="map" 부분에 지도를 추가하는 부분 zoom: 18, // 확대 정도(ZOOM) center: uluru // 지도에
		 * 표시해주는 중심이 우리가 만든 객체의 위치를 지정해주도록 함 });
		 */
		var mapOptions = {
			center : mapLocation, // 지도에서 가운데로 위치할 위도와 경도(변수)
			zoom : 18, // 지도 zoom단계
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map(document.getElementById("map"), // id:
		// map-canvas,
		// body에 있는
		// div태그의
		// id와 같아야 함
		mapOptions);
		if (latVal == null || latVal == "-") {
			mapLocation = null;
		}
		var marker = new google.maps.Marker({
			position : mapLocation,
			map : map
		});

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
							<p>
								<img src="${vo.imgSrc}">
							</p>
							<h3>호텔 명 :${vo.title }</h3>
							<p>전화번호 :${vo.tel }</p>
							<p>홈페이지 : <c:if test="${vo.userHomepage!='' }">
							<a href=${vo.userHomepage }>${vo.userHomepage }</a>
							</c:if>
							</p>
							<p>주 소 :${vo.addr }</p>
							<p>상세정보 :${vo.content }</p>
							<p>가 격 :${vo.price }</p>
							<p>오시는 길 :${vo.trafficin }</p>
							<c:if test="${vo.wgsx!='-'}">
							<p id=map></p>
							</c:if>
							
						</section>

					</div>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<%@include file="../includes/busanFooter.jsp"%>
		<!-- Scripts -->
		<script src="/resources/assets/js/jquery.min.js"></script>
		<script src="/resources/assets/js/browser.min.js"></script>
		<script src="/resources/assets/js/breakpoints.min.js"></script>
		<script src="/resources/assets/js/util.js"></script>
		<script src="/resources/assets/js/main.js"></script>
</body>
</html>