<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<style>
th{
width:2000px;
height:50px;
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
	<div id="page-wrapper">
		<!-- Header -->
		<%@include file="../includes/busanHeader.jsp"%>
		<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row main-row">
					<div class="col-4 col-12-medium">
						<section>
							<h2 align=center>대중교통 정보</h2>
							<div>
								<h2>버스</h2>
								<div class="col-6 col-12-small">
									<ul class="link-list">
										<li><a href="javascript:bus('busInfo','일반버스',1)">노선버스</a></li>
										<li><a href="javascript:bus('busInfo','좌석버스',1)">좌석버스</a></li>
										<li><a href="javascript:bus('busInfo','급행버스',1)">급행버스</a></li>
										<li><a href="javascript:bus('busInfo','심야버스',1)">심야버스</a></li>
									</ul>
								</div>
								<h2>지하철</h2>
								<div class="col-6 col-12-small">
									<ul class="link-list">
										<li><a href="/subwayLine1">1호선</a></li>
										<li><a href="/subwayLine2">2호선</a></li>
										<li><a href="/subwayLine3">3호선</a></li>
										<li><a href="/subwayLine4">4호선</a></li>
										<li><a href="#">경전철</a></li>
									</ul>
								</div>
							</div>
						</section>

					</div>
					<div class="col-8 col-12-medium imp-medium">

						<section>
							<h2>교통 정보</h2>
							<span id = "lineInfo"></span>
							
						</section>

					</div>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<%@include file="../includes/busanFooter.jsp"%>
		<!-- Scripts -->
		<script src="/resources/assets/js/bus.js"></script>
		<script src="/resources/assets/js/jquery.min.js"></script>
		<script src="/resources/assets/js/browser.min.js"></script>
		<script src="/resources/assets/js/breakpoints.min.js"></script>
		<script src="/resources/assets/js/util.js"></script>
		<script src="/resources/assets/js/main.js"></script>
</body>
</html>