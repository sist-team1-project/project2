<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/support.css">
</head>
<body>
  <script type="text/javascript">
    $(function() {
        $('#reply-btn').click(function() {
                
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
            $('#askReplyForm').submit();
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
      <div class="col-lg-12"><h3 class="text-center p-b-10">답변하기</h3></div>
      <div class="col-lg-12">
        <form id="askReplyForm" method=post action="../support/ask_reply_ok.do">
          <input type="hidden" name=no value="${no }">
          <div>
            <div class="p-tb-10">제목</div>
            <div><input id="title" type=text name=a_title class="fs-13 bor8 bg0 cl8 w-full p-lr-15 p-tb-5"></div>
          </div>
          <div>
            <div class="p-t-20 p-b-10">내용</div>
            <div><textarea id="content" rows=20 name=a_content class="fs-13 bor8 bg0 cl8 w-full p-all-15"></textarea></div>
          </div>
          <div class="flex-r p-tb-10">
            <input id="reply-btn" type=button value="답변" class="cl1 size-102 bg3 bor1 hov-btn3 trans-04 pointer dis-inline-block"> 
            <input id="cancel-btn" type=button value="취소" class="cl0 size-102 bg2 bor1 hov-btn3 trans-04 pointer dis-inline-block">
          </div>
        </form>
      </div>
    </div>
  </div>
</body>
</html>
