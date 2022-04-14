<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
</head>
<body>
  <div class="container" id="update_pwd" >
    <div class="row p-b-20">
      <div class="col-md-12 col-lg-6"><h4><i class="fa fa-unlock-alt" aria-hidden="true"></i>&nbsp;비밀번호 변경</h4></div>
    </div>
    <div class="info border col-md-12 col-lg-6 stext-114 p-tb-20">
      <form @submit="submitForm" method="post" action="../mypage/update_pwd_ok.do">
        <div class="row flex-c">
          <div class="p-b-20">
            <div class="p-b-8"><b>기존 비밀번호</b></div>
            <div><input type="password" class="text-111 bor8 bg0 cl8 size-111 p-lr-15" name="password" ref="password" placeholder="비밀번호를 입력하세요" v-model="password"></div>
          </div>
        </div>
        <div class="row flex-c">
          <div class="p-b-10">
            <div class="p-b-8"><b>새 비밀번호</b></div>
            <div><input type="password" class="text-111 bor8 bg0 cl8 size-111 p-lr-15" name="newPassword" ref="newPassword" placeholder="새 비밀번호를 입력하세요" @blur="pwdValidate" v-model="newPassword" @click="newPassword=''; newPassword2=''"></div> 
            <p class="fs-12 cl3">{{pwdOk}}</p>
            <div class="p-t-8"><input type="password" class="text-111 bor8 bg0 cl8 size-111 p-lr-15" ref="newPassword2" placeholder="새 비밀번호를 재입력하세요" @blur="pwd2Validate" v-model="newPassword2" @click="newPassword2=''"></div>
            <p class="fs-12 cl3 p-b-35">{{pwdOk2}}</p>
            <div class="flex-c"><input type="submit" class="cl1 size-101 w-full bg3 bor1 hov-btn3 trans-04 pointer dis-inline-block" value="수정"></div>
          </div>
        </div>
      </form>
    </div>
  </div>
</body>
</html>
  <script>
    new Vue({
        el:'#update_pwd',
        data:{
            password:'',
            newPassword:'',
            newPassword2: '',
            pwdOk:'',
            pwdOk2:''
        },
        methods:{
            submitForm:function(){
                if(this.password && this.newPassword && this.newPassword2 && this.password!=this.newPassword && !this.pwdOk) {
                    return true;
                }
                else if (this.password == '') {
                    this.$refs.password.focus();
                }
                else if(this.newPassword == '') {
                    this.$refs.newPassword.focus();
                }
                else if(this.newPassword2 == '') {
                    this.$refs.newPassword2.focus();
                }
                else if(this.password == this.newPassword) {
                    this.pwdOk = "비밀번호가 새 비밀번호와 일치합니다";
                }
                else if(this.pwdOk != '') {
                    this.$refs.newPassword.focus();
                }
                e.preventDefault();
            },
            pwdValidate:function() {
                let password = this.newPassword;
                let num = password.search(/[0-9]/g);
                let eng = password.search(/[a-z]/ig);
                if(password == '') {
                    this.pwdOk = '';
                    return;
                } if(password.length < 8 || password.length > 20){
                    this.pwdOk = '비밀번호를 8자리 ~ 20자리 이내로 입력해주세요.';
                    return;
                } else if(password.search(/\s/) != -1){
                    this.pwdOk = '비밀번호는 공백 없이 입력해주세요.';
                    return;
                } else if(num < 0 || eng < 0){
                    this.pwdOk = '비밀번호는 영문,숫자를 혼합하여 입력해주세요.';
                    return;
                } else {
                    this.pwdOk = ''
                    return;
                }
            },
            pwd2Validate:function() {
                if(this.newPassword != this.newPassword2) {
                    this.pwdOk2 = '재입력이 일치하지 않습니다.';
                } else {
                    this.pwdOk2 = '';
                }
            },
        }
    })
  </script>