<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <script type="text/javascript">
    $(function() {
        $('#eventAddBtn').click(function() {
            let etitle = $('#e_title').val();
            if (etitle.trim() == "") {
                $('#e_title').focus();
                return;
            }
            alert('이벤트가 추가되었습니다');
            $('#submitEvent').submit();
        })
        $('#eventDelBtn').click(function() {
            let eid = $('#e_id').val();
            if (eid.trim() == "") {
                $('#e_id').focus();
                return;
            }
            alert('이벤트가 삭제 되었습니다');
            $('#deleteEvent').submit();
        })
    })
  </script>
  <div class="container p-b-60" id="eventAdd">
    <div class="row">
      <div class="col-lg-12 p-b-20">
        <h3><i class="fa fa-cogs" aria-hidden="true"></i>&nbsp; 이벤트 관리</h3>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12 col-lg-8">
        <div class="bor10 p-tb-40 p-lr-40 p-lr-0-sm">
          <!--   -------  이벤트 --------  -->
          <div class="flex-c-m">
            <h5> 이벤트</h5>
          </div>
          <div class="p-t-10 p-b-20 flex-c-m">
            <c:forEach var="e" items="${events }"><span class="dis-inline-block fs-13">${e.e_id }&nbsp;${e.e_title } &nbsp;&nbsp;</span></c:forEach>
          </div>
        
          <!--   -------  이벤트 이름  --------  -->
          <div class="p-tb-20 flex-c-m">
            <form id="submitEvent" method=post action="../admin/event_add_ok.do">  
              <input id="e_title" name=e_title type=text class="bor10 cl3 p-all-5 dis-inline-block" placeholder="추가할 이벤트 이름을 입력">
              <input type=button id="eventAddBtn" class="cl1 bg3 bor20 hov-btn3 p-lr-10 p-tb-5 size-126 pointer dis-inline-block" value="등록">
            </form>
          </div>
  
          <div class="p-b-20 flex-c-m">
            <form id="deleteEvent" method=post action="../admin/event_delete_ok.do">    
              <input id="e_id" name=e_id type=text class="bor10 cl3 p-all-5 dis-inline-block" placeholder="삭제할 이벤트 번호를 입력">
              <input type=button id="eventDelBtn" class="cl0 bg2 bor20 hov-btn3 p-lr-10 p-tb-5 size-126 pointer dis-inline-block" value="삭제">
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>