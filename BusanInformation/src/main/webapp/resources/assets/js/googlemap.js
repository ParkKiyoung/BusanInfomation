function initMap() { // 지도 요청시 callback으로 호출될 메서드 부분으로 지도를 맨처음 초기화하고, 표시해주는
						// 함수

	var latVal = 35.157515; // 게시글 DTO에서 위도값을 가져옴
	var lngVal = 129.060689; // 게시글 DTO에서 경도값을 가져옴
	var mapLocation = {
		lat : latVal,
		lng : lngVal
	}; // 위도, 경도를 가지는 객체를 생성
	/*
	 * var map = new google.maps.Map(document.getElementById('map'), { // 위의 div
	 * id="map" 부분에 지도를 추가하는 부분 zoom: 18, // 확대 정도(ZOOM) center: uluru // 지도에
	 * 표시해주는 중심이 우리가 만든 객체의 위치를 지정해주도록 함 });
	 */
	var mapOptions = {
		center : mapLocation, // 지도에서 가운데로 위치할 위도와 경도(변수)
		zoom : 18, // 지도 zoom단계
		mapTypeId : google.maps.MapTypeId.ROADMAP
	};
	var map = new google.maps.Map(document.getElementById("map"), // id:
																	// map-canvas,
																	// body에 있는
																	// div태그의
																	// id와 같아야 함
	mapOptions);
	var size_x = 60; // 마커로 사용할 이미지의 가로 크기
	var size_y = 60; // 마커로 사용할 이미지의 세로 크기

	// 마커로 사용할 이미지 주소

	var marker = new google.maps.Marker({
		position : uluru,
		map : map
	});

}