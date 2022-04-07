<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div id="userDetail" class="container bg0 p-t-50 p-b-30">
  <div class="row">
    <div class="col-md-12 p-b-20"><h3>회원정보</h3></div>
  </div>
  <div class="info border">
    <div>
      <div class="col-sm-3"><b>아이디</b></div>
      <div class="col-sm-9">{{info.uid }}</div>
    </div>
    <div>
      <div class="col-sm-3"><b>이름</b></div>
      <div class="col-sm-9">{{info.name }}</div>
    </div>
    <div>
      <div class="col-sm-3"><b>성별</b></div>
      <div class="col-sm-9">{{info.gender }}</div>
    </div>
    <div>
      <div class="col-sm-3"><b>주소</b></div>
      <div class="col-sm-9">
        <div>{{info.address1 }} {{info.address2 }} {{info.post }}</div>
      </div>
    </div>
    <div>
      <div class="col-sm-3"><b>비밀번호 찾기 질문</b></div>
      <div class="col-sm-9">
        <div>{{info.question }}</div>
      </div>
    </div>
    <div>
      <div class="col-sm-3"><b>비밀번호 찾기 답변</b></div>
      <div class="col-sm-9">
        <div>{{info.answer }}</div>
      </div>
    </div>
    <div>
      <div class="col-sm-3"><b>가입일</b></div>
      <div class="col-sm-9">
        <div>{{info.regdate }}</div>
      </div>
    </div>
  </div>
  </div>
  <script>
  new Vue({
	 	el:'#userDetail',
	 	data:{
	 		info:{}
	 	},
	 	mounted:function(){
	 		axios.get("http://localhost:8080/web/mypage/info_vue.do",{
                params:{
                    
                }
            }).then(res=>{
                this.info=res.data;
            })
	    },
	 	methods:{
	 		
	 	}
	})
  </script>
</body>
</html>