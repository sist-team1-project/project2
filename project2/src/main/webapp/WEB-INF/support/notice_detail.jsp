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
	  <h3 class="text-center p-b-20">공지사항</h3>
	    <div class="row">
				<table class="table">
					<tr>
						<th class="text-center">번호</th>
						<td class="text-center">${vo.n_id }</td>
						<th class="text-center">작성일</th>
						<td class="text-center">${vo.n_regdate }</td>
					</tr>
					<tr>
						<th class="text-center">이름</th>
						<td class="text-center">${vo.u_id }</td>
						<th class="text-center">조회수</th>
						<td class="text-center">${vo.n_visits }</td>
					</tr>
					<tr>
						<th class="text-center">제목</th>
						<td colspan="3">${vo.n_title }</td>
					</tr>
					<tr>
						<td colspan="4" class="col-sm-12 p-lr-15 p-tb-20 cl3 fs-13" style="height: 400px;"><pre>${vo.n_content }</pre></td>
					</tr>
					<tr>
						<td colspan="4" class="text-right">
					 	  <c:if test="${sessionScope.grade=='0' }">
						    <a href="../support/notice_update.do?no=${vo.n_id }"><button class="cl1 bg2 bor2 hov-btn3 p-lr-15 size-126">수정</button></a>
						    <a href="../support/notice_delete.do?no=${vo.n_id }"><button class="cl1 bg2 bor2 hov-btn3 p-lr-15 size-126">삭제</button></a>
						  </c:if>
						    <a href="../support/notice.do"><button class="cl1 bg3 bor2 hov-btn3 p-lr-15 size-126">목록</button></a>
					    </td>
					</tr>
				</table>
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




