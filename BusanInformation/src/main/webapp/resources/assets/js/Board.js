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

function Boardwrite() {
	location.href = "/BoardWrite"
}

function checkpass(){//비번 확인
	var num = $("#num").val()
	var password=$("#password").val()
	if($("#password").val()==""){
		alert("비밀번호를 입력해주세요");
		return false;
	}
	var num = $("#num").val()
	var password=$("#password").val()
	$.ajax({
		type:"post",
		url :"passCheck",
		data :{"num":num,"password":password},
		success:function(data){
			if(data==1){
				location.href="/BoardUpdate?num="+num
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
function confirmWrite() {//글 작성/ 수정
	if ($("#title").val() == "") {
		alert("제목을 입력해주세요");
		return false;
	}
	if ($("#writer").val() == "") {
		alert("이름을 입력해주세요");
		return false;
	}
	if ($("#content").val() == "") {
		alert("sodyd을 입력해주세요");
		return false;
	}
	if ($("#password").val() == "") {
		alert("비밀번호를 입력해주세요");
		return false;
	}
	$("#BoardFrm").submit();
}
function BoardDelete(num){//삭제
	if(confirm("정말 삭제하시겠습니까?")){
		location.href="/BoardDelete?num="+num
	}	
}
function searchBtn() {//검색
	var field = document.getElementById("field").value;
	var word = document.getElementById("word").value;
	if (field == "") {
		alert("검색 항목을 선택해주세요")
		return false;
	}
	location.href = "Board?field=" + field + "&word=" + word

}