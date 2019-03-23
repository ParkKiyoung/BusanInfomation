<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Gamja+Flower|Hi+Melody|Sunflower:300&amp;subset=korean" rel="stylesheet">
<style>
.boardlink:link {
	text-decoration: none;
}

.boardlink:hover {
	text-decoration: none;
}

.boardtable td {
	height: 40px;
}
h2.koreanFont{
font-family: 'Do Hyeon', sans-serif;
}
#tourInfo h2.koreanFont{
font-family: 'Do Hyeon', sans-serif;
font-size: 40px;
}
#tourInfo h3.koreanFont{
font-family: 'Do Hyeon', sans-serif;
font-size: 30px;
}
.tourbutton{
font-family: 'Sunflower', sans-serif;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	function gutour(area, guname) {
		$.ajax({
			type : "get",
			url : "gutour",
			data : {
				"area" : area
			},
			success : function(data) {
				data = $.parseJSON(data);
				var tourSpot = ""
				tourSpot += "<h2>" + guname + "의 여행기</h2>"
				for (var i = 0; i < data.length; i++) {
					tourSpot += "<p>"
					tourSpot += "<a href="+data[i].link+">" + data[i].title
							+ "</a><br>"
					tourSpot += data[i].content + "</p>"
				}
				$("#tourInfo").html(tourSpot)
			},
			error : function(e) {
				alert("error : " + e)
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
	<%@include file="../includes/busanHeader.jsp"%>
	<!-- Main -->
	<div id="main">
		<div class="container">
			<div class="row main-row">
				<div class="col-4 col-12-medium">
					<section>
						<h2 class=koreanFont>가볼만한 곳 추천/후기</h2>
						<div>
							<div class="row">
								<div class="col-6 col-12-small">
									<ul class="link-list">
										<li><a href="javascript:gutour('joong','중구')" class=tourbutton>중구</a></li>
										<li><a href="javascript:gutour('seo','서구')" class=tourbutton>서구</a></li>
										<li><a href="javascript:gutour('dong','동구')" class=tourbutton>동구</a></li>
										<li><a href="javascript:gutour('youngdo','영도구')" class=tourbutton>영도구</a></li>
										<li><a href="javascript:gutour('busanjin','부산진구')" class=tourbutton>부산진구</a></li>
										<li><a href="javascript:gutour('geumjeong','금정구')" class=tourbutton>금정구</a></li>
										<li><a href="javascript:gutour('gangseo','강서구')" class=tourbutton>강서구</a></li>
										<li><a href="javascript:gutour('sasang','사상구')" class=tourbutton>사상구</a></li>
									</ul>
								</div>
								<div class="col-6 col-12-small">
									<ul class="link-list">
										<li><a href="javascript:gutour('dongnea','동래구')" class=tourbutton>동래구</a></li>
										<li><a href="javascript:gutour('nam','남구')" class=tourbutton>남구</a></li>
										<li><a href="javascript:gutour('book','북구')" class=tourbutton>북구</a></li>
										<li><a href="javascript:gutour('haeundae','해운대구')" class=tourbutton>해운대구</a></li>
										<li><a href="javascript:gutour('saha','사하구')" class=tourbutton>사하구</a></li>
										<li><a href="javascript:gutour('yeonje','연제구')" class=tourbutton>연제구</a></li>
										<li><a href="javascript:gutour('suyoung','수영구')" class=tourbutton>수영구</a></li>
										<li><a href="javascript:gutour('gijang','기장군')" class=tourbutton>기장군</a></li>
									</ul>
								</div>
							</div>
						</div>
					</section>
				</div>
				<div class="col-8 col-12-medium imp-medium">
					<div id=tourInfo>
						<h2 class=koreanFont>게시판</h2>
						<hr>
						<div id=div.board align=center>
							<h3 class=koreanFont>여행 후기를 볼 수 있는 게시판입니다.</h3>
							<hr>
							<table class="boardtable">
								<thead>
									<tr>
										<td width=100px height=30px>글번호</td>
										<td width=400px>제목</td>
										<td width=100px>작성자</td>
										<td width=100px>작성일</td>
									</tr>
								</thead>
								<c:forEach items="${boardlist}" var="i">
									<tr>
										<td>${i.num }</td>
										<td><a class="boardlink" href="/get?num=${i.num}">${fn:substring(i.title,0,15) }
												<c:if test="${fn:length(i.title)>15 }">
											...
											</c:if>
										</a></td>
										<td>${fn:substring(i.writer,0,3)}<c:if
												test="${fn:length(i.writer)>3 }">
											...
											</c:if>
										</td>
										<td>${i.writedate }</td>
									</tr>
								</c:forEach>
							</table>
							<br> ${pageHtml } <br> 
							<select id=field name=field>
								<option value="">선택</option>
								<option value=writer>작성자</option>
								<option value=title>제목</option>
								<option value=content>내용</option>
							</select> <input type=text id="word" name="word"> <a
								href="javascript:searchBtn()" class="smallbutton">검색</a> <a
								href="Board" class="smallbutton">전체보기</a><a
								href="javascript:Boardwrite()" class="smallbutton">글 작성</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- Footer -->
	<%@include file="../includes/busanFooter.jsp"%>
	<!-- Scripts -->
	<script src="/resources/assets/js/Board.js"></script>
	<script src="/resources/assets/js/jquery.min.js"></script>
	<script src="/resources/assets/js/browser.min.js"></script>
	<script src="/resources/assets/js/breakpoints.min.js"></script>
	<script src="/resources/assets/js/util.js"></script>
	<script src="/resources/assets/js/main.js"></script>
</body>
</html>