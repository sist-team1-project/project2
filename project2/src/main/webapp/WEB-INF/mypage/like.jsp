<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="wrap-table js-pscroll">
    <table class="table-checkout">
      <tr class="table_head">
        <th class="column-1">제품</th>
        <th class="column-2">즐겨찾기</th>
      </tr>
      <tr class v-for="cart in cartList" class="table_row">
        <td class="column-1"></td>
        <td class="column-2"><button class="delete_btn">삭제</button></td>
      </tr>

    </table>
  </div>
</body>
</html>