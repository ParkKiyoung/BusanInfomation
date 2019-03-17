<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
function boardwrite(){
	alert("dd")
	$("#div.board").html(<%@include file="./BoardWrite.jsp"%>)
	}
</script>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/main.css">
</head>
<body>
	<div align=center>
		<h3>부산여행의 후기를 마음 껏 작성해주세요</h3>
		<table>
			<tr>
				<td colspan=4 align=right><input type=button value="글 작성"
					onclick="boardwrite()"></td>
			</tr>
			<tr>
				<td width=70px height=100px>글번호</td>
				<td width=200px>제목</td>
				<td width=90px>작성자</td>
				<td width=70px>작성일</td>
			</tr>
		</table>
	</div>
</body>
