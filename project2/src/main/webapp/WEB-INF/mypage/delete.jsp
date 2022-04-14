<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div id="update_pwd" class="container p-b-30">
    <div class="row p-b-20">
      <div class="col-md-12"><h4>&nbsp;&nbsp;<i class="fa fa-user-times" aria-hidden="true"></i>&nbsp;회원탈퇴 </h4></div>
    </div>
    <form @submit="submitForm" method="post" action="../mypage/delete_ok.do">
      <div class="border col-md-12 col-lg-6 p-lr-50 p-t-40 p-b-25">
        <div class="row flex-c">
          <div class="p-b-25">
            <div class="fs-16 flex-c p-b-15"><b>회원 탈퇴</b></div>
            <div>
              <input class="text-111 bor8 bg0 cl8 size-111 p-lr-15" type="password" name="password" ref="password" v-model="password" placeholder="비밀번호를 입력하세요" >
            </div>
            <div class="flex-c p-t-20">
              <input type="submit" id="submit-btn" class="cl1 size-101 w-full bg3 bor1 hov-btn3 trans-04 pointer dis-inline-block" value="제출">
            </div>
          </div>
        </div>
      </div>
    </form>
  </div>
  <script>
    new Vue({
        el:'#update_pwd',
        data:{
            password:''
        },
        methods:{
            submitForm:function(){
                if(this.password) {
                    return true;
                }
                else if (this.password == '') {
                    this.$refs.password.focus();
                }
                e.preventDefault();
            }
        }
    })
  </script>
</body>
</html>