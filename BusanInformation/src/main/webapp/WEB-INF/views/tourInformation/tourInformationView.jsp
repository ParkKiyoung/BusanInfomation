<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<script>
</script>
<head>
<title>부산 정보 포털</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/main.css">
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
			zoom : 15, // 지도 zoom단계
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
</head>
<body>

	<!-- Header -->
	<%@include file="../includes/busanHeader.jsp"%>
	<!-- Main -->
	<div id="main">
		<div class="container">
			<div class="row main-row">
				<div class="col-4 col-12-medium">
				<section>
						<h2>테마별 여행 추천</h2>
						<div>
							<div class="row">
								<div class="col-6 col-12-small">
									<ul class="link-list">
										<li><a href="javascript:LuxuryTour('getLuxuryTourList')">명품관광</a></li>
										<li><a href="javascript:themetourindex('getThemeTourList')">테마여행</a></li>
										<li><a href="javascript:expTourIndex('getExperienceTourList')">체험여행</a></li>
										<li><a href="javascript:tourSpot('',1,'도보여행','getWalkingTourList')">도보여행</a></li>
									</ul>
								</div>
								<div class="col-6 col-12-small">
									<ul class="link-list">
										<li><a href="javascript:tourSpot('',1,'관광명소','getTouristAttrList')">관광명소</a></li>
										<li><a href="javascript:tourSpot('',1,'쇼핑명소','getShoppingAttrList')">쇼핑명소</a></li>
										<li><a href="javascript:tourSpot('',1,'스포츠/레저','getSportsList')">스포츠/레저</a></li>
										<li><a href="javascript:tourSpot('',1,'맛집','getRestaurantList')">맛집</a></li>
									</ul>
								</div>
							</div>
						</div>
					</section>
					<section >
						<h2>부산 주간 날씨</h2>
						<table>
							<tr>
								<td colspan=4>오늘(${todayDate})</td>
							</tr>
							<tr>
								<td valign="middle"><img src="${todayAMsrc}" width="50"
									height="40"></td>
								<td valign="middle">오전<br>${todayAMTemp}</td>
								<td valign=middle><img src="${todayPMsrc}" width="50"
									height="40"></td>
								<td valign="middle">오후<br>${todayPMTemp}</td>
							</tr>
							<tr>
								<td colspan=4>내일(${tmoDate})</td>
							</tr>
							<tr>
								<td valign="middle"><img src="${tmoAMsrc}" width="50"
									height="40"></td>
								<td valign="middle">오전<br>${tmoAMTemp}</td>
								<td valign=middle><img src="${tmoPMsrc}" width="50"
									height="40"></td>
								<td valign="middle">오후<br>${tmoPMTemp}</td>
							</tr>
							<c:forEach items="${weatherlist }" var="i">
								<tr>
								</tr>
								<td colspan=4>${i.weekday}</td>
								<tr>
									<td valign="middle"><img src="${i.imgAMsrc}" width="50"
										height="40"></td>
									<td valign="middle">오전<br>${i.weekAMTemp }</td>
									<td valign="middle"><img src="${i.imgPMsrc}" width="50"
										height="40"></td>
									<td valign="middle">오후<br>${i.weekPMTemp }</td>
								</tr>
							</c:forEach>
						</table>
					</section>
				</div>
				<div class="col-8 col-12-medium imp-medium">

					<section>
					<span id=tourInfo>
					<h2 align = center>${vo.title}</h2>
						<p align = center>
							 <img src="${vo.imgSrc }"></p>
							<p>장소 명 : ${vo.title }</p>
							<p>전화번호 :${vo.tel }</p>
							<p>안내전화 : ${vo.guide }</p>
							<p>주 소 : ${vo.addr }</p>
							<p>편의 시설 : ${vo.disest }</p>
							<p>홈페이지 : <a href='<c:if test="${vo.userHomepage.substring(0,7)!='https://'}">
							http://${vo.userHomepage }
							</c:if>'>${vo.userHomepage }</a></p>
							<p>가 격 : ${vo.entfree }</p>
							<p>교통편 : ${vo.traffic }</p>
							<p>오시는 길 : ${vo.way }</p>
							<p>상세정보 : ${vo.content }</p>
							<c:if test="${vo.wgsx!='-'}">
							<p id=map></p>
							</c:if>
							</span>
						<div align = center>
						<span id=pageHtml></span>
						</div>
					</section>

				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<%@include file="../includes/busanFooter.jsp"%>
	<!-- Scripts -->
	<script src="/resources/assets/js/tourRecommend.js"></script>
	<script src="/resources/assets/js/jquery.min.js"></script>
	<script src="/resources/assets/js/browser.min.js"></script>
	<script src="/resources/assets/js/breakpoints.min.js"></script>
	<script src="/resources/assets/js/util.js"></script>
	<script src="/resources/assets/js/main.js"></script>
</body>
</html>