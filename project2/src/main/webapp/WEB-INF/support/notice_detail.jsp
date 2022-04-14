<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/support/notice.css">
</head>
<body>
  <div class="container bg0">
    <h3 class="text-center p-b-20">공지사항</h3>
    <div id="ask" class="container">
      <div class="row bor10 p-all-30">
        <div class="col-sm-12 p-tb-10 cl3"><h5>${vo.n_title }</h5></div>
        <div class="col-sm-12 p-tb-10 bor12 cl3 fs-13"><b>작성일</b>&nbsp;&nbsp;${vo.n_regdate }&nbsp;&nbsp;&nbsp;<b>조회수</b>&nbsp;&nbsp;${vo.n_visits }</div>
        <div id="ask-content" class="col-sm-12 p-lr-15 p-tb-20 cl3 fs-13"><pre>${vo.n_content }</pre></div>
      </div>
      <div class="row">
        <div class="col-sm-12 dis-flex flex-r p-t-20">
          <c:if test="${sessionScope.grade=='0'}">
            <a id="deleteBtn" href="../support/notice_update.do?no=${vo.n_id }" class="flex-c-m cl0 bg2 bor2 hov-btn3 p-lr-15 size-126">수정</a>
            <a id="deleteBtn" href="../support/notice_delete.do?no=${vo.n_id }" class="flex-c-m cl0 bg2 bor2 hov-btn3 p-lr-15 size-126">삭제</a>
          </c:if>
          <a href="../support/notice.do" class="flex-c-m cl0 bg2 bor2 hov-btn3 p-lr-15 size-126">목록</a>
        </div>
      </div>
    </div>
  </div>
  <script>
    new Vue({
         el:'#comment',
         data:{
           vo:{},
           no:${no}
         },
         mounted:function(){
           axios.get('http://localhost:8080/web/support/comment_vue.do',{
             params:{
               no:this.no
             }
           }).then(res=>{
             console.log(res.data)
             this.vo=res.data;
           })
         },
         
      methods:{
           list:function(){
             location.href="notice.do"
           },
           update:function(){
             location.href="notice_update.do?no="+this.no
           },
           del:function(){
             location.href="notice_delete.do?no="+this.no;
           }
         }
  }) 
  </script>
</body>
</html>




