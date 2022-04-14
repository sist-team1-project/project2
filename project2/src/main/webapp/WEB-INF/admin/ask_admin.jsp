<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/admin/ask.css">
</head>
<body>
  <div class="container p-b-10" id="">
    <div class="row">
      <div class="col-lg-12 m-lr-auto">
        <h3><i class="fa fa-whatsapp" aria-hidden="true"></i>&nbsp; 문의 관리</h3>
      </div>
      <div class="col-lg-12 flex-m"></div>
    </div>
    <div class="row p-t-10" id="askAdminResult">
      <div class="col-lg-12 m-lr-auto p-tb-10 dis-flex flex-sb flex-m">
        <div class="fs-13">총 ${count }개</div>
      </div>

      <div class="col-lg-12 m-lr-auto m-b-50" id="askAdmin">
        <div class="wrap-table js-pscroll">

          <table class="table-ask">
            <thead>
              <tr class="table_head">
                <th class="column-1">유형</th>
                <th class="column-2">제목</th>
                <th class="column-3">이름</th>
                <th class="column-4">작성일</th>
                <th class="column-5">상태</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="vo" items="${list }">
                <c:if test="${vo.a_group_step==0 }">
                  <tr class="table_row fs-13">
                    <td class="column-1">${vo.a_type }</td>
                    <td class="column-2 text-left"><a class="link" href="../admin/ask_detail.do?no=${vo.a_id }">${vo.a_title }</a>
                    </td>
                    <td class="column-3">${vo.u_id }</td>
                    <td class="column-4">${vo.a_regdate }</td>
                    <td class="column-5"><c:if test="${vo.a_group_tab==1 }">답변완료</c:if>
                    <c:if test="${vo.a_group_tab==0 }">미답변</c:if></td>
                  </tr>
                </c:if>

                <c:if test="${vo.a_group_step==1 }">
                  <tr class="table_row fs-13">
                    <td class="column-1"></td>
                    <td class="column-2 text-left">&nbsp;&nbsp;<i class="fa fa-reply fa-rotate-180" aria-hidden="true"></i>&nbsp;&nbsp;<a class="link" href="../admin/ask_detail.do?no=${vo.a_id }">${vo.a_title }</a></td>
                    <td class="column-3 text-center">${vo.u_id }</td>
                    <td class="column-4 text-center">${vo.a_regdate }</td>
                    <td class="column-5 text-center"></td>
                  </tr>
                </c:if>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

  <div class="text-center">
    <ul class="pagination">
      <c:if test="${startPage>1 }">
        <li class="page-item" data-page="${startPage-1 }">
          <button class="fa fa-chevron-left page-link paging"
            aria-hidden="true"></button>
        </li>
      </c:if>
      <c:forEach var="i" begin="${startPage }" end="${endPage }">
        <c:if test="${i==curpage }">
          <li class="paging page-item active" data-page="${i }">
            <button class="page-link">${i }</button>
          </li>
        </c:if>
        <c:if test="${i!=curpage }">
          <li class="paging page-item" data-page="${i }">
            <button class="page-link">${i }</button>
          </li>
        </c:if>
      </c:forEach>
      <c:if test="${endPage<totalpage }">
        <li class="page-item" data-page="${endPage+1 }">
          <button class="fa fa-chevron-right page-link paging" aria-hidden="true"></button>
        </li>
      </c:if>
    </ul>
  </div>

  <script>
    $(function() {
        $('.paging').css("cursor", "pointer");
        $('.paging').click(function() {
            let page = $(this).attr('data-page');
            location.href = '../admin/ask.do?page=' + page;
        })
    })
  </script>
</body>
</html>