<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
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
	function confirmWrite(){
		if($("#title").val()==""){
			alert("제목을 입력해주세요");
			return false;
		}
		if($("#writer").val()==""){
			alert("이름을 입력해주세요");
			return false;
		}
		if($("#content").val()==""){
			alert("sodyd을 입력해주세요");
			return false;
		}
		if($("#password").val()==""){
			alert("비밀번호를 입력해주세요");
			return false;
		}
		$("#BoardFrm").submit();
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
						<h2>가볼만한 곳 추천/후기</h2>
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
						<div id=tourInfo>
							<h3>후기 글 작성</h3>
							<form action="BoardWrite" method="post" id="BoardFrm">
								<table>
									<tr>
										<td>글 제목</td>
										<td><input type="text" id="title"></td>
									</tr>
									<tr>
										<td>작성자</td>
										<td><input type="text" id="writer"></td>
									</tr>
									<tr>
										<th colspan=2 align=center>내용</th>
									</tr>
									<tr>
										<td colspan=2><textarea id=content rows=20 cols=80></textarea></td>
									</tr>
									<tr>
										<td>비밀번호</td>
										<td><input type=password id=password></td>
									</tr>
									<tr>
										<td colspan=2 align=center><input type=button
											value="작성완료" onclick="confirmWrite()"> <input
											type=reset value="취소"></td>
									</tr>
								</table>
							</form>
						</div>
				</div>
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
