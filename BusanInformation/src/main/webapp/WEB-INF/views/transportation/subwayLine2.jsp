<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<style>
td {
	width: 200px;
	height: 50px;
	align: center;
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
							<h2>2호선 정보</h2>
							<div align=center>
								<table>
									<tr>
										<td><a href="/subinfo?scode=201">장산역</a></td>
										<td><a href="/subinfo?scode=202">중동</a></td>
										<td><a href="/subinfo?scode=203">해운대</a></td>
										<td><a href="/subinfo?scode=204">동백역</a></td>
										<td><a href="/subinfo?scode=205">시립미술관</a></td>
									</tr>
									<tr>
										<td><a href="/subinfo?scode=206">센텀시티</a></td>
										<td><a href="/subinfo?scode=207">민락</a></td>
										<td><a href="/subinfo?scode=208">수영</a></td>
										<td><a href="/subinfo?scode=209">광안</a></td>
										<td><a href="/subinfo?scode=210">금련산</a></td>
									</tr>
									<tr>
										<td><a href="/subinfo?scode=211">남천</a></td>
										<td><a href="/subinfo?scode=212">경성대/부경대</a></td>
										<td><a href="/subinfo?scode=213">대연</a></td>
										<td><a href="/subinfo?scode=214">못골</a></td>
										<td><a href="/subinfo?scode=215">지게골</a></td>
									</tr>
									<tr>
										<td><a href="/subinfo?scode=216">문현</a></td>
										<td><a href="/subinfo?scode=217">국제금융센터</a></td>
										<td><a href="/subinfo?scode=218">전포</a></td>
										<td><a href="/subinfo?scode=219">서면</a></td>
										<td><a href="/subinfo?scode=220">부암역</a></td>
									</tr>
									<tr>
										<td><a href="/subinfo?scode=221">가야역</a></td>
										<td><a href="/subinfo?scode=222">동의대</a></td>
										<td><a href="/subinfo?scode=223">개금</a></td>
										<td><a href="/subinfo?scode=224">냉정</a></td>
										<td><a href="/subinfo?scode=225">주례</a></td>
									</tr>
									<tr>
										<td><a href="/subinfo?scode=226">감전</a></td>
										<td><a href="/subinfo?scode=227">사상</a></td>
										<td><a href="/subinfo?scode=228">덕포</a></td>
										<td><a href="/subinfo?scode=229">모덕</a></td>
										<td><a href="/subinfo?scode=230">모라</a></td>

									</tr>
									<tr>
										<td><a href="/subinfo?scode=231">구남</a></td>
										<td><a href="/subinfo?scode=232">구명</a></td>
										<td><a href="/subinfo?scode=233">덕천</a></td>
										<td><a href="/subinfo?scode=234">수정</a></td>
										<td><a href="/subinfo?scode=235">화명</a></td>

									</tr>
									<tr>
										<td><a href="/subinfo?scode=236">율리</a></td>
										<td><a href="/subinfo?scode=237">동원</a></td>
										<td><a href="/subinfo?scode=238">금곡</a></td>
										<td><a href="/subinfo?scode=239">호포</a></td>
										<td><a href="/subinfo?scode=240">증산</a></td>

									</tr>
									<tr>
										<td><a href="/subinfo?scode=241">부산대양산</a></td>
										<td><a href="/subinfo?scode=242">남양산</a></td>
										<td><a href="/subinfo?scode=243">양산</a></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</table>
							</div>
						</section>

					</div>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<%@include file="../includes/busanFooter.jsp"%>
		<!-- Scripts -->
		<script src="/resources/assets/js/subway.js"></script>
		<script src="/resources/assets/js/jquery.min.js"></script>
		<script src="/resources/assets/js/browser.min.js"></script>
		<script src="/resources/assets/js/breakpoints.min.js"></script>
		<script src="/resources/assets/js/util.js"></script>
		<script src="/resources/assets/js/main.js"></script>
</body>
</html>