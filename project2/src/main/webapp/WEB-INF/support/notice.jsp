<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="container bg0 p-b-30">
      <div class="row">
      <h3 style="padding-bottom: 20px;"><b>공지사항</b></h3>
     <table class="table">
      <tr style="background-color: #eee">
        <th width=10% class="text-center">번호</th>
        <th width=60% class="text-center">제목</th>
        <th width=10% class="text-center">작성자</th>
        <th width=20% class="text-center">작성일</th>
      </tr>
      <c:set var="count" value="${count }"/>
      <c:forEach var="vo" items="${list }">
       <tr>
        <td width=10% class="text-center">${count }</td>
        <td width=45%><a href="../support/notice_detail.do?nid=${vo.n_id }">${vo.n_title }</a></td>
        <td width=15% class="text-center">${vo.u_id }</td>
        <td width=20% class="text-center">${vo.n_regdate }</td>
       </tr>
       <c:set var="count" value="${count-1 }"/>
      </c:forEach>
     </table>
     <div style="float: right;">
         <a href="notice_insert.do" class="btn btn-sm btn-info">새글</a>
     </div>
    <nav class="pagination">
        <ul>
          <c:if test="${startPage>1 }">
           <li><a href="../support/notice.do?page=${startPage-1 }">&laquo; Previous</a></li>
          </c:if>
          <c:forEach var="i" begin="${startPage }" end="${endPage }">
           <c:if test="${i==curpage }">
            <c:set var="style" value="class=current"/>
           </c:if>
           <c:if test="${i!=curpage }">
            <c:set var="style" value=""/>
           </c:if>
           <li ${style }><a href="../support/notice.do?page=${i }">${i }</a></li>
          </c:forEach>
          
          <c:if test="${endPage<totalpage }">
          <li><a href="../support/notice.do?page=${endPage+1 }">Next &raquo;</a></li>
          </c:if>
        </ul>
      </nav>
    </div>
  </div>
</body>
</html>