<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/join.css">
</head>
<body>
  <div id="userDetail" class="container bg0 p-t-50 p-b-30">
  <div class="row">
    <div class="col-sm-12 p-b-20 p-l-30"><h4><i class="fa fa-user-circle" aria-hidden="true"></i>&nbsp;회원정보</h4></div>
  </div>
  <div class="container">
  <div class="info border p-all-60 p-r-80 col-8 stext-114 ">
    <div class="row p-b-8 bor12">
      <div class="col-sm-4"><b>아이디</b></div>
      <div class="col-sm-8">{{info.uid }}</div>
    </div>
    <div class="row p-tb-8 p-b-4 bor12">
      <div class="col-sm-4"><b>이름</b></div>
      <div class="col-sm-8">{{info.name }}</div>
    </div>
    <div class="row p-tb-8 p-b-4 bor12">
      <div class="col-sm-4"><b>성별</b></div>
      <div class="col-sm-8">{{info.gender }}</div>
    </div>
    <div class="row p-tb-8 p-b-4 bor12">
      <div class="col-sm-4"><b>전화번호</b></div>
      <div class="col-sm-8">{{info.phone }}</div>
    </div>
    <div class="row p-tb-8 p-b-4 bor12">
      <div class="col-sm-4"><b>주소</b></div>
      <div class="col-sm-8">
        <div>{{info.address1 }} {{info.address2 }} {{info.post }}</div>
      </div>
    </div>
    <div class="row p-tb-8 p-b-4 bor12">
      <div class="col-sm-4"><b>비밀번호 찾기 질문</b></div>
      <div class="col-sm-8">
        <div>{{info.question }}</div>
      </div>
    </div>
    <div class="row p-tb-8 p-b-4 bor12">
      <div class="col-sm-4"><b>비밀번호 찾기 답변</b></div>
      <div class="col-sm-8">
        <div>{{info.answer }}</div>
      </div>
    </div>
    <div class="row p-t-8">
      <div class="col-sm-4"><b>가입일</b></div>
      <div class="col-sm-8">
        <div>{{info.regdate }}</div>
      </div>
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