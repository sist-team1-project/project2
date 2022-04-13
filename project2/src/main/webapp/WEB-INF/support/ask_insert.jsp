<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/support.css">
</head>
<body>
  <div class="container bg0">
    <h3 class="text-center p-b-20">문의사항 등록</h3>
    <div class="row">
      <form method=post action="../support/ask_insert_ok.do">
      
        <table class="table">
          <tr>
            <th class="text-right">문의유형</th>
            <td><select class="form-select" name=a_type>
              <option selected disabled>문의유형 선택</option>
              <option value="교환">교환</option>
              <option value="환불">환불</option>
              <option value="취소">취소(출하 전 취소)</option>
              <option value="배송">배송</option>
              <option value="A/S">A/S</option>
              <option value="주문/결제">주문/결제</option>
              <option value="회원 관련">회원 관련</option>
              <option value="기타 문의">기타 문의</option>
            </select></td>
          </tr>
          <tr>
            <th class="text-right">작성자</th>
            <td><input name=u_id value="${sessionScope.id }" readonly="readonly"></td>
          </tr>
          <tr>
            <th class="text-right">제목</th>
            <td><input type=text name=a_title size=55></td>
          </tr>
          <tr>
            <th class="text-right">내용</th>
            <td><textarea rows="15" cols="110" name=a_content></textarea></td>
          </tr>
          <tr>
        	<td colspan="2" class="text-right">
         	 <input type=submit value="글쓰기" class="btn btn-sm bg-1"> 
         	 <input type=button value="취소" class="btn btn-sm bg-2" onclick="javasecript:history.back()">
            </td>
          </tr>
        </table>
        
      </form>
    </div>
  </div>
</body>
</html>
