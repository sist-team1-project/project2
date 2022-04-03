<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div id="userDetail" class="container">
  <div class="row border">
    <div class="col-md-12"><h3><b>회원정보</b></h3></div>
  </div>
  <div class="info">
    <div>
      <div class="col-sm-3"><b>아이디</b></div>
      <div class="col-sm-9">{{u_id }}</div>
    </div>
        <div>
      <div class="col-sm-3"><b>이름</b></div>
      <div class="col-sm-9">{{u_name }}</div>
    </div>
    <div>
      <div class="col-sm-3"><b>성별</b></div>
      <div class="col-sm-9">{{u_gender }}</div>
    </div>
    <div>
      <div class="col-sm-3"><b>주소</b></div>
      <div class="col-sm-9">
        <div>{{u_address1 }} {{u_address2 }} ({{u_post }})</div>
      </div>
    </div>
    <div>
      <div class="col-sm-3"><b>비밀번호 찾기 질문</b></div>
      <div class="col-sm-9">
        <div>{{u_question }}</div>
      </div>
    </div>
    <div>
      <div class="col-sm-3"><b>비밀번호 찾기 답변</b></div>
      <div class="col-sm-9">
        <div>{{u_answer }}</div>
      </div>
    </div>
  </div>
  </div>
  <script>
  	new Vue({
  		el:'#userDetail',
  		data:{
  			uid:${u_id}
  		},
  		mounted:function(){
  			axios.get('http://localhost:8080/web/mypage/mypage.do',{
  				params:{
  					uid:this.uid
  				}
  			}).then(res=>{
  				console.log(res.data)
  			})
  		}
  	})
  </script>

</body>
</html>