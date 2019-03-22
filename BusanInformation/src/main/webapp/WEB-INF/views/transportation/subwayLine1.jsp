<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Gamja+Flower|Hi+Melody|Sunflower:300&amp;subset=korean" rel="stylesheet">
<style>
td{
width :200px; 
height:50px;
align : center;
}
#lineInfo h2.koreanFont{
font-family: 'Do Hyeon', sans-serif;
font-size: 50px;
}
section h2.koreanFont{
font-family: 'Do Hyeon', sans-serif;
font-size: 50px;
}
.col-4 h2.koreanFont{
font-family: 'Do Hyeon', sans-serif;
font-size: 40px;
}
.tranportButton{
font-family: 'Sunflower', sans-serif;
}
table th{
font-family: 'Gamja Flower', cursive;
}
table td{
font-family: 'Gamja Flower', cursive;
font-size: 25px;
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
							<h2 align=center class='koreanFont'>대중교통 정보</h2>
							<div>
								<h2 class='koreanFont'>버스</h2>
								<div class="col-6 col-12-small">
									<ul class="link-list">
										<li><a href="javascript:bus('busInfo','일반버스',1)" class=tranportButton>노선버스</a></li>
										<li><a href="javascript:bus('busInfo','좌석버스',1)" class=tranportButton>좌석버스</a></li>
										<li><a href="javascript:bus('busInfo','급행버스',1)" class=tranportButton>급행버스</a></li>
										<li><a href="javascript:bus('busInfo','심야버스',1)" class=tranportButton>심야버스</a></li>
									</ul>
								</div>
								<h2 class='koreanFont'>지하철</h2>
								<div class="col-6 col-12-small">
									<ul class="link-list">
										<li><a href="/subwayLine1" class=tranportButton>1호선</a></li>
										<li><a href="/subwayLine2" class=tranportButton>2호선</a></li>
										<li><a href="/subwayLine3" class=tranportButton>3호선</a></li>
										<li><a href="/subwayLine4" class=tranportButton>4호선</a></li>
										<li><a href="#" class=tranportButton>경전철</a></li>
									</ul>
								</div>
							</div>
						</section>

					</div>
					<div class="col-8 col-12-medium imp-medium">

						<section>
						<span id = "lineInfo">
							<h2 class='koreanFont'>1호선 정보</h2>
							<div align = center>
							<table>
								<tr>
									<td><a href="/subinfo?scode=095">다대포 해수욕장</a></td>
									<td><a href="/subinfo?scode=096">다대포 항</a></td>
									<td><a href="/subinfo?scode=097">낫개</a></td>
									<td><a href="/subinfo?scode=098">신장림</a></td>
									<td><a href="/subinfo?scode=099">장림</a></td>
								</tr>
								<tr>
									<td><a href="/subinfo?scode=100">동매</a></td>
									<td><a href="/subinfo?scode=101">신평</a></td>
									<td><a href="/subinfo?scode=102">하단</a></td>
									<td><a href="/subinfo?scode=103">당리</a></td>
									<td><a href="/subinfo?scode=104">사하</a></td>
								</tr>
								<tr>
									<td><a href="/subinfo?scode=105">괴정</a></td>
									<td><a href="/subinfo?scode=106">대티</a></td>
									<td><a href="/subinfo?scode=107">서대신</a></td>
									<td><a href="/subinfo?scode=108">동대신</a></td>
									<td><a href="/subinfo?scode=109">토성</a></td>
								</tr>
								<tr>
									<td><a href="/subinfo?scode=110">자갈치</a></td>
									<td><a href="/subinfo?scode=111">남포</a></td>
									<td><a href="/subinfo?scode=112">중앙</a></td>
									<td><a href="/subinfo?scode=113">부산역</a></td>
									<td><a href="/subinfo?scode=114">초량</a></td>
								</tr>
								<tr>
									<td><a href="/subinfo?scode=115">부산진</a></td>
									<td><a href="/subinfo?scode=116">좌천</a></td>
									<td><a href="/subinfo?scode=117">범일</a></td>
									<td><a href="/subinfo?scode=118">범내골</a></td>
									<td><a href="/subinfo?scode=119">서면</a></td>
								</tr>
								<tr>
									<td><a href="/subinfo?scode=120">부전</a></td>
									<td><a href="/subinfo?scode=121">양정</a></td>
									<td><a href="/subinfo?scode=122">시청</a></td>
									<td><a href="/subinfo?scode=123">연산</a></td>
									<td><a href="/subinfo?scode=124">교대</a></td>
								</tr>
								<tr>
									<td><a href="/subinfo?scode=125">동래</a></td>
									<td><a href="/subinfo?scode=126">명륜</a></td>
									<td><a href="/subinfo?scode=127">온천장</a></td>
									<td><a href="/subinfo?scode=128">부산대</a></td>
									<td><a href="/subinfo?scode=129">장전</a></td>
								</tr>
								<tr>
									<td><a href="/subinfo?scode=130">구서</a></td>
									<td><a href="/subinfo?scode=131">두실</a></td>
									<td><a href="/subinfo?scode=132">남산</a></td>
									<td><a href="/subinfo?scode=133">범어사</a></td>
									<td><a href="/subinfo?scode=134">노포</a></td>
								</tr>
							</table>
							</div>
							</span>
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