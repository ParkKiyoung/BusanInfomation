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

							<p id=map></p>

							<p>호텔 명 :${vo.title }</p>
							<p>전화번호 :${vo.tel }</p>
							<p>
								홈페이지 : <a href="">${vo.userHomepage }</a>
							</p>
							<p>주 소 :${vo.addr }</p>
							<p>상세정보 :${vo.content }</p>
							<p>가 격 :${vo.price }</p>
							<p>오시는 길 :${vo.trafficin }</p>
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