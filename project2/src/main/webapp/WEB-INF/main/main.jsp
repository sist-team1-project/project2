<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Healing Camp</title>
  <link rel="icon" type="image/png" href="../images/icons/favicon.png"/>
  <link rel="stylesheet" type="text/css" href="../vendor/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="../fonts/font-awesome-4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="../fonts/iconic/css/material-design-iconic-font.min.css">
  <link rel="stylesheet" type="text/css" href="../fonts/linearicons-v1.0.0/icon-font.min.css">
  <link rel="stylesheet" type="text/css" href="../vendor/animate/animate.css">
  <link rel="stylesheet" type="text/css" href="../vendor/css-hamburgers/hamburgers.min.css">
  <link rel="stylesheet" type="text/css" href="../vendor/animsition/css/animsition.min.css">
  <link rel="stylesheet" type="text/css" href="../vendor/select2/select2.min.css">
  <link rel="stylesheet" type="text/css" href="../vendor/daterangepicker/daterangepicker.css">
  <link rel="stylesheet" type="text/css" href="../vendor/slick/slick.css">
  <link rel="stylesheet" type="text/css" href="../vendor/MagnificPopup/magnific-popup.css">
  <link rel="stylesheet" type="text/css" href="../vendor/perfect-scrollbar/perfect-scrollbar.css">
  <link rel="stylesheet" type="text/css" href="../css/util.css">
  <link rel="stylesheet" type="text/css" href="../css/main.css">
  <script src="../vendor/jquery/jquery-3.2.1.min.js"></script>
  <script src="../vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
  <script src="../vendor/select2/select2.min.js"></script>
  
</head>
<body>
    
  <!-- 헤더 -->
  <tiles:insertAttribute name="header"/>
  
  <!-- 내용 -->
  <tiles:insertAttribute name="content"/>
  
  <!-- 푸터 -->
  <tiles:insertAttribute name="footer"/>
  
  
  <!-- 위로 올리기 -->
  <div class="btn-back-to-top" id="myBtn">
    <span class="symbol-btn-back-to-top">
      <i class="zmdi zmdi-chevron-up"></i>
    </span>
  </div>

  <script src="../vendor/animsition/js/animsition.min.js"></script>
    
  <script src="../vendor/bootstrap/js/popper.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

  <script src="../vendor/daterangepicker/moment.min.js"></script>
  <script src="../vendor/daterangepicker/daterangepicker.js"></script>
  
  <!-- Slick Slider -->
  <script src="../vendor/slick/slick.min.js"></script>
  <script src="../js/slick-custom.js"></script>
  
  <script src="../vendor/parallax100/parallax100.js"></script>
  <script>
      $('.parallax100').parallax100();
  </script>
  <!-- 그리드 이미지 정렬 플러그인 -->
  <script src="../vendor/isotope/isotope.pkgd.min.js"></script>
  
  <script src="../js/main.js"></script>
  
</body>
</html>