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
  <div id="userDetail" class="container p-b-30">
    <div class="row p-b-20">
      <div class="col-sm-12"><h4><i class="fa fa-user-circle" aria-hidden="true"></i> 회원정보</h4></div>
    </div>
    <div class="info border p-all-60 col-md-8 stext-114">
      <div class="row p-b-10 bor12">
        <div class="col-sm-4">아이디</div>
        <div class="col-sm-8">{{info.uid }}</div>
      </div>
      <div class="row p-tb-10 bor12">
        <div class="col-sm-4">이름</div>
        <div class="col-sm-8">{{info.name }}</div>
      </div>
      <div class="row p-tb-10 bor12">
        <div class="col-sm-4">성별</div>
        <div class="col-sm-8">{{info.gender }}</div>
      </div>
      <div class="row p-tb-10 bor12">
        <div class="col-sm-4">전화번호</div>
        <div class="col-sm-8">{{info.phone }}</div>
      </div>
      <div class="row p-tb-10 bor12">
        <div class="col-sm-4">주소</div>
        <div class="col-sm-8">
          <div>{{info.address1 }} {{info.address2 }} {{info.post }}</div>
        </div>
      </div>
      <div class="row p-tb-10 bor12">
        <div class="col-sm-4">비밀번호 찾기 질문</div>
        <div class="col-sm-8">
          <div>{{info.question }}</div>
        </div>
      </div>
      <div class="row p-tb-10 bor12">
        <div class="col-sm-4">비밀번호 찾기 답변</div>
        <div class="col-sm-8">
          <div>{{info.answer }}</div>
        </div>
      </div>
      <div class="row p-t-10">
        <div class="col-sm-4">가입일</div>
        <div class="col-sm-8">
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
	 		axios.get("http://13.125.104.199/project2/mypage/info_vue.do",{
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