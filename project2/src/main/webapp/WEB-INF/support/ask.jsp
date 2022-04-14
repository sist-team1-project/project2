<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/support/ask.css">
</head>
<body>
  <div class="container bg0">
    <h3 class="text-left p-b-20">1:1 문의</h3>
    <div class="row">
      <div class="col-lg-12 m-lr-auto">
        <div class="wrap-table js-pscroll">
          <table class="table-ask">
            <thead>
              <tr class="table_head">
                <th class="text-center wd-15">유형</th>
                <th class="text-center wd-50">제목</th>
                <th class="text-center">작성일</th>
                <th class="text-center">답변여부</th>
              </tr>
            </thead>
            <!--  -----------------   관리자   -----------------  -->
            <tbody>
              <c:if test="${sessionScope.grade=='0' }">
                <c:forEach var="avo" items="${alist }">
                  <!-- 문의 -->
                  <c:if test="${avo.a_group_step==0 }"> 
                    <tr class="table_row fs-13">
                      <td class="column-1">${avo.a_type }</td>
                      <td class="column-2"><a class="link" href="../support/ask_detail.do?no=${avo.a_id }">${avo.a_title }</a></td>
                      <td class="column-3">${avo.a_regdate }</td>
                      <td class="column-4">
                        <c:if test="${avo.a_group_tab==1 }">답변완료</c:if> 
                        <c:if test="${avo.a_group_tab==0 }">미답변</c:if>
                      </td>
                    </tr>
                  </c:if>
                  
                  <!-- 답변 -->
                  <c:if test="${avo.a_group_step==1 }">
                    <tr class="table_row fs-13">
                      <td class="column-1">${avo.a_type }</td>
                      <td class="column-2">&nbsp;&nbsp;<i class="fa fa-reply fa-rotate-180" aria-hidden="true"></i>&nbsp;&nbsp;<a class="link" href="../support/ask_detail.do?no=${avo.a_id }">${avo.a_title }</a></td>
                      <td class="column-3">${avo.a_regdate }</td>
                      <td class="column-4"></td>
                    </tr>
                  </c:if>
                </c:forEach>
              </c:if>
            
              <!--  ---------------    일반 사용자    ---------------  -->
              <c:if test="${sessionScope.grade==1 }">
                <c:forEach var="vo" items="${list }">
                  <!-- 문의 -->
                  <c:if test="${vo.a_group_step==0 }">
                    <tr class="table_row fs-13">
                      <td class="column-1">${vo.a_type }</td>
                      <td class="column-2"><a class="link" href="../support/ask_detail.do?no=${vo.a_id }">${vo.a_title }</a></td>
                      <td class="column-3">${vo.a_regdate }</td>
                      <td class="column-4">
                        <c:if test="${vo.a_group_tab==1 }">답변완료</c:if> 
                        <c:if test="${vo.a_group_tab==0 }">미답변</c:if>
                      </td>
                    </tr>
                  </c:if>
                  
                  <!-- 답변 -->
                  <c:if test="${count+1 == vo.a_id  }">
                    <c:if test="${vo.a_group_step==1 }">
                      <tr class="table_row fs-13">
                        <td class="column-1">${vo.a_type }</td>
                        <td class="column-2">&nbsp;&nbsp;<i class="fa fa-reply fa-rotate-180" aria-hidden="true"></i>&nbsp;&nbsp;<a class="link" href="../support/ask_detail.do?no=${vo.a_id }">${vo.a_title }</a></td>
                        <td class="column-3">${vo.a_regdate }</td>
                        <td class="column-4"></td>
                      </tr>
                    </c:if>
                  </c:if>
                </c:forEach>
              </c:if>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    
    <!--  ---------------   글쓰기 버튼   ---------------  -->
    <div class="flex-r m-t-20">
      <c:if test="${sessionScope.id != null}">
        <a href="../support/ask_insert.do" class="flex-c-m cl1 bg3 bor2 hov-btn3 p-lr-15 size-126">글쓰기</a>
      </c:if>
    </div>
  </div>
    
  <div class="text-center">
    <!--  ---------------   페이지   ---------------  -->
    <c:if test="${sessionScope.grade=='0' }">
      <ul class="pagination">
        <c:if test="${astartPage>1 }">
          <li class="page-item" data-page="${astartPage-1 }">
            <button class="fa fa-chevron-left page-link paging"
              aria-hidden="true"></button>
          </li>
        </c:if>
        <c:forEach var="i" begin="${astartPage }" end="${aendPage }">
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
        <c:if test="${aendPage<atotalpage }">
          <li class="page-item" data-page="${aendPage+1 }">
            <button class="fa fa-chevron-right page-link paging" aria-hidden="true"></button>
          </li>
        </c:if>
      </ul>
    </c:if>
    
    <c:if test="${sessionScope.grade=='1' }">
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
    </c:if>
  </div>
  <script>
    $(function() {
      $('.paging').css("cursor", "pointer");
      $('.paging').click(function() {
        let page = $(this).attr('data-page');
        
        location.href = '../support/ask.do?page=' + page;
      })
    })
  </script>
</body>
</html>
