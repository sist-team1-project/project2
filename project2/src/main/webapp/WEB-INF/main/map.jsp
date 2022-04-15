<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../vendor/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="../fonts/font-awesome-4.7.0/css/font-awesome.min.css">
  <script src="../vendor/jquery/jquery-3.2.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
  <script src="http://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
  <div class="container" class="flex-c-m">
    <div id="map" style="width:400px;height:300px;"></div>  
  </div>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e4f43388f2d2c586a0d439d74f4b4297&libraries=services"></script>
  <script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 6 // 지도의 확대 레벨
    };  
  
    //지도를 생성합니다    
    var map = new kakao.maps.Map(mapContainer, mapOption); 
    
    //주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();
    
    //주소로 좌표를 검색합니다
    geocoder.addressSearch('${address }', function(result, status) {
    
        // 정상적으로 검색이 완료됐으면 
        if (status === kakao.maps.services.Status.OK) {
      
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
      
            // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });
      
            // 인포윈도우로 장소에 대한 설명을 표시합니다
            var infowindow = new kakao.maps.InfoWindow({
                  content: '<div style="width:150px;text-align:center;padding:6px 0;font-size:13px;">${title }</div>'
            });
            infowindow.open(map, marker);
      
            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
            map.setCenter(coords);
        } 
    });    
  </script>
</body>
</html>