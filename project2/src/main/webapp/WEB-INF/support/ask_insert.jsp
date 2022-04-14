<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/support/ask.css" id="insert-form">
</head>
<body>
  <script type="text/javascript">
    $(function() {
        $('#insert-btn').click(function() {
            let category = $('#category').val();
            if (category.trim() == "-1") {
                alert("문의 유형을 선택해주세요")
                return;
            }
    
            let title = $('#title').val();
            if (title.trim() == "") {
                $('#title').focus();
                return;
            }
    
            let content = $('#content').val();
            if (content.trim() == "") {
                $('#content').focus();
                return;
            }
            $('#askForm').submit();
        })
        
                
        $('#cancel-btn').click(function() {
            var result = confirm('작성을 취소하시겠습니까?');
            if (result) {
                history.back();
            } else {
  
            }
        })
    })
  </script>
  <div class="container">
    <div class="row" id="ask">
      <div class="col-lg-12"><h3 class="text-center p-b-20">문의사항 등록</h3></div>
      <div class="col-lg-12">
        <form id="askForm" method=post action="../support/ask_insert_ok.do">
          <div>
            <div class="p-b-10">문의유형</div>
            <select id="category" class="fs-13 bor8 bg0 cl8 p-lr-15 p-tb-5" name=a_type>
              <option value="-1">문의유형 선택</option>
              <option value="교환">교환</option>
              <option value="환불">환불</option>
              <option value="취소">취소(출하 전 취소)</option>
              <option value="배송">배송</option>
              <option value="A/S">A/S</option>
              <option value="주문/결제">주문/결제</option>
              <option value="회원 관련">회원 관련</option>
              <option value="기타 문의">기타 문의</option>
            </select>
          </div>
          <div>
            <div class="p-t-20 p-b-10">제목</div>
            <div><input id="title" type=text name=a_title class="fs-13 bor8 bg0 cl8 w-full p-lr-15 p-tb-5"></div>
          </div>
          <div>
            <div class="p-t-20 p-b-10">내용</div>
            <div><textarea id="content" rows=20 name=a_content class="fs-13 bor8 bg0 cl8 w-full p-all-15"></textarea></div>
          </div>
          <div class="flex-r p-tb-10">
         	<input id="insert-btn" type=button value="글쓰기" class="cl1 size-126 bg3 bor1 hov-btn3 trans-04 pointer dis-inline-block"> 
            <input id="cancel-btn" type=button value="취소" class="cl0 size-126 bg2 bor1 hov-btn3 trans-04 pointer dis-inline-block">
          </div>
        </form>
      </div>
    </div>
  </div>
</body>
</html>