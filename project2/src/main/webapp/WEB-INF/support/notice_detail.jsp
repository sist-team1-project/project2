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
						<td colspan="4" class="text-left hg-400">${vo.n_content }</td>
					</tr>
					<tr>
						<td colspan="4" class="text-right">
					 	  <c:if test="${sessionScope.grade=='0' }">
						    <button class="btn btn-sm bg-1"> 수정</button>
						    <button class="btn btn-sm bg-1">삭제</button>
						  </c:if>
						    <button class="btn btn-sm bg-2">목록</button>
					    </td>
					</tr>
				</table>

        <div class="text-left" id="comment">
		  <h4 class="text-center p-b-20">댓글</h4>
          {{vo.co_content}}
            <c:if test="${sessionScope.id!=null }">
            <div class="row">
            <form id="review-form">
              <input type="hidden" name="u_id" value="${sessionScope.id }">
              <input type="hidden" name="n_id" value="{{vo.n_id}}">
          
            <div class="col-md-12 roomy-10">
              <textarea id="co_content" rows="6" name=co_content></textarea>
              <input type="button" value="댓글" id="review-insert-btn">
            </div>
          </form>
          </div>
      </c:if>
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




