<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon|Gamja+Flower|Hi+Melody|Sunflower:300&amp;subset=korean"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
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

h2.koreanFont {
	font-family: 'Do Hyeon', sans-serif;
}

#tourInfo h2.koreanFont {
	font-family: 'Do Hyeon', sans-serif;
	font-size: 40px;
}

#tourInfo h3.koreanFont {
	font-family: 'Do Hyeon', sans-serif;
	font-size: 30px;
}

.tourbutton {
	font-family: 'Sunflower', sans-serif;
}
</style>
<script>
	function replySubmit() {
		if ($("#replycontent").val() == "") {
			alert("내용을 입력하세요");
			return false;
		}
		if ($("#replyid").val() == "") {
			alert("아이디를 입력하세요");
			return false;
		}
		if ($("#replypass").val() == "") {
			alert("비밀번호를 입력하세요");
			return false;
		}
		$("#replySubmitForm").submit();

	}
	function deleteBtn(){
		if ($("#deletereplypass").val() == "") {
			alert("비밀번호를 입력하세요");
			return false;
		}
		var num = replyDeleteForm.num.value;
		var password = replyDeleteForm.deletereplypass.value;
		var bnum = replyDeleteForm.bnum.value;
		$.ajax({
			type:"post",
			url :"replyDelete",
			data :{"num":num,"password":password,"bnum":bnum},
			success:function(data){
				if(data==1){
					alert("삭제 되었습니다.")
					location.href="/get?num="+bnum
				}
				if(data==0){
					alert("비밀번호가 틀렸습니다.")
				}
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
										<li><a href="javascript:gutour('joong','중구')"
											class="tourbutton">중구</a></li>
										<li><a href="javascript:gutour('seo','서구')"
											class="tourbutton">서구</a></li>
										<li><a href="javascript:gutour('dong','동구')"
											class="tourbutton">동구</a></li>
										<li><a href="javascript:gutour('youngdo','영도구')"
											class="tourbutton">영도구</a></li>
										<li><a href="javascript:gutour('busanjin','부산진구')"
											class="tourbutton">부산진구</a></li>
										<li><a href="javascript:gutour('geumjeong','금정구')"
											class="tourbutton">금정구</a></li>
										<li><a href="javascript:gutour('gangseo','강서구')"
											class="tourbutton">강서구</a></li>
										<li><a href="javascript:gutour('sasang','사상구')"
											class="tourbutton">사상구</a></li>
									</ul>
								</div>
								<div class="col-6 col-12-small">
									<ul class="link-list">
										<li><a href="javascript:gutour('dongnea','동래구')"
											class="tourbutton">동래구</a></li>
										<li><a href="javascript:gutour('nam','남구')"
											class="tourbutton">남구</a></li>
										<li><a href="javascript:gutour('book','북구')"
											class="tourbutton">북구</a></li>
										<li><a href="javascript:gutour('haeundae','해운대구')"
											class="tourbutton">해운대구</a></li>
										<li><a href="javascript:gutour('saha','사하구')"
											class="tourbutton">사하구</a></li>
										<li><a href="javascript:gutour('yeonje','연제구')"
											class="tourbutton">연제구</a></li>
										<li><a href="javascript:gutour('suyoung','수영구')"
											class="tourbutton">수영구</a></li>
										<li><a href="javascript:gutour('gijang','기장군')"
											class="tourbutton">기장군</a></li>
									</ul>
								</div>
							</div>
						</div>
					</section>
				</div>
				<div class="col-8 col-12-medium imp-medium">

					<section>
						<div id=tourInfo>
							<h2 class="koreanFont">게시판</h2>
							<hr>
							<div id=div.board align=center>
								<h3 class="koreanFont">부산 여행 후기</h3>
								<input type=hidden id=num name=num value=${vo.num }>
								<hr>
								<br> <br>
								<table>
									<tr>
										<td width=200>글 제목</td>
										<td width=200 colspan=2>${vo.title }</td>
									</tr>
									<tr>
										<td width=100>작성자</td>
										<td width=200>${vo.writer }</td>
										<td width=100 height=50>작성일</td>
										<td width=150>${vo.writedate }</td>
									</tr>
									<tr>
										<th colspan=4 align=center height=50>내용</th>
									</tr>
									<tr>
										<td colspan=4 width=300 height=300 valign=top>${vo.content }</td>
									</tr>
									<tr>
										<td>비밀번호</td>
										<td><input type=password id=password name="password"></td>
										<td colspan=2 align=center><a
											href="javascript:checkpass()" class="smallbutton">수정/삭제</a></td>
									</tr>
								</table>
								<a href="/Board" class="smallbutton">전체목록</a>
								<!--댓글 모달-->
								<button type="button" class="smallbutton" data-toggle="modal"
									data-target="#replyModal">댓글쓰기</button>

								<table>
									<tr>
										<th width=400>댓글</th>
										<th width=200>작성자</th>
										<th width=200>작성일</th>
										<th width=100>비고</th>
									</tr>
									<c:forEach items="${replyarr }" var="i">
										<tr style="border-bottom:1pt solid black;height:60px">
											<td>${i.replycontent }</td>
											<td>${i.replyid }</td>
											<td>${i.replydate }</td>
											<td><a data-toggle="modal" href="#deleteModal">삭제</a></td>
											<td>
												<!-- 댓삭Modal -->
												<div id="deleteModal" class="modal fade" role="dialog">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal">&times;</button>
																<h4 class="modal-title">비밀번호 입력</h4>
															</div>
															<div class="modal-body">
																<form id="replyDeleteForm" name="replyDeleteForm">
																	<input type=hidden id=num name=num value="${i.num }">
																	<input type=hidden id=bnum name=bnum value="${vo.num }">
																	<p class="koreanFont">
																		비밀번호 <input type="password" id="deletereplypass"	name="deletereplypass">
																	</p>
																</form>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-default"
																	data-dismiss="modal" onclick="deleteBtn()">삭제</button>
																<button type="button" class="btn btn-default"
																	data-dismiss="modal">닫기</button>
															</div>
														</div>

													</div>
												</div>
											</td>
										</tr>
									</c:forEach>

								</table>
								<!-- 댓글Modal -->
								<div id="replyModal" class="modal fade" role="dialog">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">&times;</button>
												<h4 class="modal-title">댓글 입력</h4>
											</div>
											<div class="modal-body">
												<form action="reply" id="replySubmitForm">
													<input type=hidden id=bnum name=bnum value="${vo.num }">
													<p class="koreanFont">
														댓글 입력
														<textarea id="replycontent"	name="replycontent"  rows="10" cols="70"></textarea>
													</p>
													<p class="koreanFont">
														작성자 <input type="text" id="replyid" name="replyid">
														비밀번호 <input type="password" id="replypass"
															name="replypass">
													</p>
												</form>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal" onclick="replySubmit()">작성</button>
												<button type="button" class="btn btn-default"
													data-dismiss="modal">닫기</button>
											</div>
										</div>

									</div>
								</div>

							</div>
						</div>
					</section>

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
