<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<h3>후기 글 작성</h3>
<form>
	<table>
		<tr>
			<th>글 제목</th>
			<td><input type="text" id="title"></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" id="writer"></td>
		</tr>
		<tr>
			<th colspan=2 align=center>내용</th>
		</tr>
		<tr>
			<td><textarea id=content rows=300 cols=300></textarea></td>
		</tr>
		<tr>
			<td>비밀번호
			</td>
			<td>
			<input type = password id=password>
			</td>
		</tr>
		<tr>
		<td colspan = 2 align = center><input type=button value="작성완료" onclick="confirmWrite()">
				<input type=reset value="취소"></td>
		</tr>
	</table>
</form>