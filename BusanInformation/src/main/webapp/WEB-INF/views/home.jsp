<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="false"%>

<!DOCTYPE HTML>
<html>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document)
			.ready(
					function() {//뉴스 검색 결과 가져옴(구글)
						$.get("/GetMainNews", function(data) {
							data = $.parseJSON(data);
							var newsBoard = "";
							newsBoard += "<table>"
							for (var i = 0; i < data.length; i++) {
								newsBoard += "<tr><td height=45px>"
								newsBoard += "<a href="+data[i].link+">"
										+ (i + 1) + ". "
								newsBoard += data[i].title.substring(0, 20)
								if (data[i].title.length > 20) {
									newsBoard += "...[더보기]"
								}
								newsBoard += "</a></td></tr>"
							}
							newsBoard += "</table>"
							$("#tourNews").html(newsBoard);
						})
						$
								.get(
										"/GetWeather",
										function(data) {//날씨정보 가져옴(네이버)
											data = $.parseJSON(data);
											var weather = "";
											weather += "<table>"
											weather += "<tr><td>오늘 날짜 </td><td width=200px height=25px align=center> "
													+ data.todayDate + "</td>"
											weather += "<tr><td>현재시각 </td><td width=200px  height=25px align=center>"
													+ data.nowTime
													+ "시 기준</td>"
											weather += "<tr><td>기온 </td><td width=200px  height=25px align=center>"
													+ data.nowTemp + "℃</td>"
											weather += "<tr><td>날씨 </td><td width=200px  height=25px align=center> "
													+ data.nowWeather + "</td>"
											weather += "<tr><td>미세먼지 </td><td width=200px  height=25px align=center> "
													+ data.dust + "</td>"
											weather += "<tr><td>오존 </td><td width=200px  height=25px align=center> "
													+ data.ozon + "</td>"

											weather += "<tr><td>오전 기온 </td><td width=200px height=25px  align=center> "
													+ data.todayAMTemp
													+ "</td>"
											weather += "<tr><td>오후 기온 </td><td width=200px height=25px  align=center> "
													+ data.todayPMTemp
													+ "</td>"
											weather += "</table>"
											$("#busanweather").html(weather);
										})

						$.get("/GetNaverBlog", function(data) {//블로그 정보 가져옴
							data = $.parseJSON(data);
							var Blog = ""
							Blog += "<table>"
							for (var i = 0; i < data.length; i++) {
								Blog += "<tr><td height=45px>"
								Blog += "<a href="+data[i].link+">" + (i + 1)
										+ ". "
								Blog += data[i].title.substring(0, 20)
								if (data[i].title.length > 20) {
									Blog += "...[더보기]"
								}
								Blog += "</a></td></tr>"
							}
							Blog += "</table>"
							$("#naverBlog").html(Blog);
						})
						$.get("/GetDaumBlog", function(data) {//블로그 정보 가져옴
							data = $.parseJSON(data);
							var Blog = ""
							Blog += "<table>"
							for (var i = 0; i < data.length; i++) {
								Blog += "<tr><td height=45px>"
								Blog += "<a href="+data[i].link+">" + (i + 1)
										+ ". "
								Blog += data[i].title.substring(0, 20)
								if (data[i].title.length > 20) {
									Blog += "...[더보기]"
								}
								Blog += "</a></td></tr>"
							}
							Blog += "</table>"
							$("#daumBlog").html(Blog);
						})
					})
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
		<!-- Banner -->
		<div id="banner-wrapper">
			<div class="container">
				<iframe width="1200" height="500"
					src="https://www.youtube.com/embed/wBo1BSbq4ek?controls=0"
					frameborder="0"
					allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
				<span align=center> Most ImportantThings..When you tour BUSAN
				</span>
			</div>
		</div>

		<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row main-row">
					<div class="col-4 col-12-medium">

						<section>
							<h2>부산 여행 기사</h2>
							<span id="tourNews"> </span>

						</section>

					</div>
					<div class="col-4 col-6-medium col-12-small">

						<section>
							<h2>오늘 부산 날씨</h2>
							<span id="busanweather"></span>
						</section>

					</div>
					<div class="col-4 col-6-medium col-12-small">

						<section>
							<h2>이런곳은 어때요?</h2>
							<div>
								<div class="row">
									<div class="col-6 col-12-small">
										<ul class="link-list">
											<li><a href="#">한국 관광공사</a></li>
											<li><a href="#">부산 관광공사</a></li>
											<li><a href="#">부산 문화회관</a></li>
											<li><a href="#">부산 시 행사</a></li>
											<li><a href="#">부산 시티투어</a></li>
										</ul>
									</div>
									<div class="col-6 col-12-small">
										<ul class="link-list">
											<li><a href="#">롯데 자이언츠 야구단</a></li>
											<li><a href="#">부산 아이파크 축구단</a></li>
											<li><a href="#">KT 매직윙스 농구단</a></li>
											<li><a href="#">해운대 정보</a></li>
											<li><a href="#">서면 정보</a></li>
										</ul>
									</div>
								</div>
							</div>
						</section>

					</div>
					<div class="col-6 col-12-medium">

						<section>
							<h2>부산 여행 블로그 보러가기</h2>
							<h3>네이버 블로그</h3>
							<span id="naverBlog"></span>
							<h3>다음 블로그</h3>
							<span id="daumBlog"></span>
						</section>

					</div>
					<div class="col-6 col-12-medium">

						<article class="blog-post">
							<h2>부산시 홍보 영상</h2>
							<iframe width="560" height="315"
								src="https://www.youtube.com/embed/Q2Izo0J0uVU" frameborder="0"
								allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
								allowfullscreen></iframe>
						</article>

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