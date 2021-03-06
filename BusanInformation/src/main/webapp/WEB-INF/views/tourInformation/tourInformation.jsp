<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Hi+Melody|Sunflower:300&amp;subset=korean" rel="stylesheet">
<style>
td{
width:150px;
height:50px;
}
#tourInfo h2.koreanFont{
font-family: 'Do Hyeon', sans-serif;
font-size: 50px;

}
.col-4 h2.koreanFont{
font-family: 'Do Hyeon', sans-serif;
font-size: 40px;
}
p.koreanFont{
font-family: 'Do Hyeon', sans-serif;
font-size: 30px;

}
.tourbutton{
font-family: 'Sunflower', sans-serif;
}
a.koreanFontTitle{
font-family: 'Do Hyeon', sans-serif;
font-size: 29px;
}
span.koreanFontContent{
font-family: 'Hi Melody', cursive;
font-size: 20px;
}

p.koreanFontList{
font-family: 'Do Hyeon', sans-serif;
font-size: 30px;

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
						<h2 class="koreanFont">테마별 여행 추천</h2>
						<div>
							<div class="row">

								<table>
										<tr><td>
										<a href="javascript:LuxuryTour('getLuxuryTourList')" class="tourbutton">명품관광</a></td>
										<td>
										<a href="javascript:tourSpot('',1,'관광명소','getTouristAttrList')"class="tourbutton">관광명소</a></td>
										</tr>
										<tr>
										<td>
										<a href="javascript:themetourindex('getThemeTourList')"class="tourbutton">테마여행</a>
										</td>
										<td>
										<a href="javascript:tourSpot('',1,'쇼핑명소','getShoppingAttrList')"class="tourbutton">쇼핑명소</a>
										</td>
										</tr>
										<tr>
										<td>
										<a href="javascript:expTourIndex('getExperienceTourList')"class="tourbutton">체험여행</a>
										</td>
										<td>
										<a href="javascript:tourSpot('',1,'스포츠/레저','getSportsList')"class="tourbutton">스포츠/레저</a>
										</td>
										</tr>
										<tr>
										<td>
										<a href="javascript:tourSpot('',1,'도보여행','getWalkingTourList')"class="tourbutton">도보여행</a>
										</td>
										<td>
										<a href="javascript:tourSpot('',1,'맛집','getRestaurantList')"class="tourbutton">맛집</a>
										</td>
										</tr>
									</table>
							</div>
						</div>
					</section>
					<section >
						<h2 class="koreanFont">부산 주간 날씨</h2>
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
							<h2 class="koreanFont">부산을 대표하는 관광지</h2>
							<p
							 class="koreanFont">
								해운대 해수욕장 및 <a href="https://www.busanaquarium.com/">아쿠아리움</a>
							</p>
							<table>
								<tr>
									<td><img
										src="/resources/img/tourinfomainimg/haeundae1.jpg" width=300
										height=200 ></td>
									<td><img
										src="/resources/img/tourinfomainimg/aquarium.jpg" width=400
										height=200></td>
								</tr>
							</table>
							<br>
							<p class="koreanFont">달맞이 공원</p>
							<table>
								<tr>
									<td><img
										src="/resources/img/tourinfomainimg/dalmaji1.jpg" width=300
										height=200></td>
									<td><img
										src="/resources/img/tourinfomainimg/dalmaji2.jpg" width=200
										height=200></td>
								</tr>
							</table>
							<br>
							<p class="koreanFont">용두산 공원 및 태종대</p>
							<table>
								<tr>
									<td><img
										src="/resources/img/tourinfomainimg/yongdusan1.jpg" width=300
										height=200></td>
									<td><img
										src="/resources/img/tourinfomainimg/taejongdae1.jpg" width=300
										height=200></td>
								</tr>
							</table>
							<br>
							<p class="koreanFont">
								<a href="https://www.knmm.or.kr/Main/Main.aspx">국립해양 박물관</a>
							</p>
							<table>
								<tr>
									<td><img
										src="/resources/img/tourinfomainimg/haeyangpark1.jpg"
										width=300 height=200></td>
									<td><img
										src="/resources/img/tourinfomainimg/haeyangpark2.JPG"
										width=250 height=200></td>
									<td><img
										src="/resources/img/tourinfomainimg/haeyangpark3.jpg"
										width=300 height=200></td>
								</tr>
							</table>
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