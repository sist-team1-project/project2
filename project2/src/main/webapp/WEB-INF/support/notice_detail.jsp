<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<tr>
         <th class="text-center" width=20%>제목</th>
         <td colspan="3">${vo.n_title }</td>
        </tr>
        <tr>
         <th class="text-center" width=20%>작성자</th>
         <td class="text-center" width=30%>${vo.u_id }</td>
         <th class="text-center" width=20%>작성일</th>
         <td class="text-center" width=30%>${vo.n_regdate }</td>
        </tr>
        <tr>
          <td colspan="4" valign="top" class="text-left" height="200">
           <pre style="border:none;background-color:white;white-space: pre-wrap;">${vo.n_content }</pre>
          </td>
        </tr>
        <tr>
         <th class="text-center" width=20%>조회수</th>
         <td class="text-center" width=30%>${vo.n_visits }</td>
        </tr>
        <tr>
          <td colspan="4" class="text-right">
            <a href="../support/notice_update.do?no=${vo.n_id }" class="btn btn-xs btn-danger">수정</a>
            <a href="../support/notice_delete.do?no=${vo.n_id }" class="btn btn-xs btn-success">삭제</a>
            <a href="notice.do" class="btn btn-xs btn-info">목록</a>
          </td>
        </tr>
      </table>
    </div>
    </div>
</body>
</html>




