<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
function gutour(area,guname){
	$.ajax({
		type:"get",
		url: "gutour",
		data:{"area":area},
		success:function(data){
			data=$.parseJSON(data);
			var tourSpot=""
				tourSpot+="<h2>"+guname+"의 여행기</h2>"
			for(var i = 0 ; i<data.length;i++){
				tourSpot+="<p>"
					tourSpot+="<a href="+data[i].link+">"+data[i].title+"</a><br>"
					tourSpot+=data[i].content+"</p>"
			}
			$("#tourInfo").html(tourSpot)
		},
		error:function(e){
			alert("error : "+e)
		}
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

	<!-- Header -->
	<%@include file="./includes/busanHeader.jsp"%>
	<!-- Main -->
	<div id="main">
		<div class="container">
			<div class="row main-row">
				<div class="col-4 col-12-medium">
					<section>
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
					<section>
						<h2>지역별 여행지</h2>
						<div>
							<div class="row">
								<div class="col-6 col-12-small">
									<ul class="link-list">
										<li><a href="javascript:gutour('joong','중구')">중구</a></li>
										<li><a href="javascript:gutour('seo','서구')">서구</a></li>
										<li><a href="javascript:gutour('dong','동구')">동구</a></li>
										<li><a href="javascript:gutour('youngdo','영도구')">영도구</a></li>
										<li><a href="javascript:gutour('busanjin','부산진구')">부산진구</a></li>
										<li><a href="javascript:gutour('geumjeong','금정구')">금정구</a></li>
										<li><a href="javascript:gutour('gangseo','강서구')">강서구</a></li>
										<li><a href="javascript:gutour('sasang','사상구')">사상구</a></li>
									</ul>
								</div>
								<div class="col-6 col-12-small">
									<ul class="link-list">
										<li><a href="javascript:gutour('dongnea','동래구')">동래구</a></li>
										<li><a href="javascript:gutour('nam','남구')">남구</a></li>
										<li><a href="javascript:gutour('book','북구')">북구</a></li>
										<li><a href="javascript:gutour('haeundae','해운대구')">해운대구</a></li>
										<li><a href="javascript:gutour('saha','사하구')">사하구</a></li>
										<li><a href="javascript:gutour('yeonje','연제구')">연제구</a></li>
										<li><a href="javascript:gutour('suyoung','수영구')">수영구</a></li>
										<li><a href="javascript:gutour('gijang','기장군')">기장군</a></li>
									</ul>
								</div>
							</div>
						</div>
					</section>

				</div>
				<div class="col-8 col-12-medium imp-medium">

					<section>
						<span id=tourInfo>
							<h2>부산을 대표하는 관광지</h2>
							<p>
								해운대 해수욕장 및 <a href="https://www.busanaquarium.com/">아쿠아리움</a>
							</p>
							<table>
								<tr>
									<td><img
										src="/resources/img/tourinfomainimg/haeundae1.jpg" width=300
										height=200></td>
									<td><img
										src="/resources/img/tourinfomainimg/aquarium.jpg" width=400
										height=200></td>
								</tr>
							</table>
							<p>달맞이 공원</p>
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
							<p>용두산 공원 및 태종대</p>
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
							<p>
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