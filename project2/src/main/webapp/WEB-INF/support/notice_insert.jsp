<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/support/notice.css">
</head>
<body>
  <script type="text/javascript">
    $(function() {
        $('#insertBtn').click(function() {
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
            $('#noticeInsertForm').submit();
        })
    })
  </script>
  <div class="container">
    <div class="row" id="notice">
      <div class="col-lg-12"><h3 class="text-center p-b-20">공지 작성</h3></div>
      <div class="col-lg-12">
        <form id="noticeInsertForm" method=post action="../support/notice_insert_ok.do">
          <div>
            <div class="p-t-20 p-b-10">제목</div>
            <div><input id="title" type=text name="n_title" class="fs-13 bor8 bg0 cl8 w-full p-lr-15 p-tb-5"></div>
          </div>
          <div>
            <div class="p-t-20 p-b-10">내용</div>
            <div><textarea id="content" rows=20 name="n_content" class="fs-13 bor8 bg0 cl8 w-full p-all-15"></textarea></div>
          </div>
          <div class="flex-r p-tb-10">
            <input id="insertBtn" type=button value="글쓰기" class="cl1 size-126 bg3 bor1 hov-btn3 trans-04 pointer dis-inline-block"> 
            <input type=button value="취소" onclick="if(confirm('작성을 취소하시겠습니까?')) {return history.back();}" class="cl0 size-126 bg2 bor1 hov-btn3 trans-04 pointer dis-inline-block">
          </div>
        </form>
      </div>
    </div>
  </div>
</body>
</html>