<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h4 class="mtext-112 cl2 p-b-33">고객센터</h4>

  <ul>
    <li class="bor18">
      <a href="../support/notice.do" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-14 p-lr-4">
        공지사항
      </a>
    </li>
    <c:if test="${sessionScope.id!=null }">
      <li class="bor18">
        <a href="../support/ask.do" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-14 p-lr-4">
          1:1 문의
        </a>
      </li>
    </c:if>
  </ul>
</body>
</html>