<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
</head>
<body>
  <div id="update_pwd" class="container bg0 p-t-50 p-b-30">
  <div class="row p-b-20">
    <div class="col-md-7"><h4>비밀번호 변경</h4></div>
  </div>
  <div class="border col-md-5 p-lr-50 p-t-30 p-b-20">
      <div class="row flex-c">
        <div class="p-b-20">
          <div class="p-b-8"><b>기존 비밀번호</b></div>
          <div><input type="password" size=40% class="bor10 p-lr-5 p-tb-3 cl3 fs-13" name="password" ref="password" placeholder="비밀번호를 입력하세요" v-model="form.password"></div>
        </div>
      </div>
      <div class="row flex-c">
        <div class="p-b-10">
          <div class="p-b-8"><b>새 비밀번호</b></div>
          <div><input type="password" size=40% class="bor10 p-lr-5 p-tb-3 cl3 fs-13" name="newPassword" ref="newPassword" placeholder="새 비밀번호를 입력하세요" @blur="pwdValidate" v-model="form.newPassword" @click="form.newPassword=''; newPassword2=''"></div> 
          <p class="fs-12 cl3">{{pwdOk}}</p>
          <div class="p-t-8"><input type="password" size=40% class="bor10 p-lr-5 p-tb-3 cl3 fs-13" ref="newPassword2" placeholder="새 비밀번호를 재입력하세요" @blur="pwd2Validate" v-model="newPassword2" @click="newPassword2=''"></div>
          <p class="fs-12 cl3 p-b-30">{{pwdOk2}}</p>
          <div class="flex-c"><input type="button" class="flex-c-m stext-101 cl0 btn-sm btn-pro-color2 bor1 hov-btn1 p-lr-15 trans-04 fs-10" style="background-color:#dbd0be" value="제출" @click="submit()"></div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
  <script>
    new Vue({
        el:'#update_pwd',
        data:{
            form: {
                password:'',
                newPassword:''
            },
            newPassword2: '',
            pwdOk:'',
            pwdOk2:''
        },
        mounted:function(){
             
        },
        methods:{
            submit:function(){
                if (this.form.password == '') {
                    this.$refs.password.focus();
                    return;
                }
                if(this.form.newPassword == '') {
                    this.$refs.newPassword.focus();
                    return;
                }
                if(this.newPassword2 == '') {
                    this.$refs.newPassword2.focus();
                    return;
                }
                if(this.form.password == this.form.newPassword) {
                    this.pwdOk = "비밀번호가 새 비밀번호와 일치합니다";
                    return;
                }
                if(this.pwdOk != '') {
                    this.$refs.newPassword.focus();
                    return;
                }
                axios.post("http://localhost:8080/web/mypage/update_pwd_ok.do",this.form,{
                }).then(res => {
                    if(res.data=="YES") {
                        alert("비밀번호 변경이 완료되었습니다.");
                    } else {
                        console.log(res)
                        alert("정보가 일치하지 않습니다");
                    }
                })
            },
            pwdValidate:function() {
                let password = this.form.newPassword;
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
                if(this.form.newPassword != this.newPassword2) {
                    this.pwdOk2 = '재입력이 일치하지 않습니다.';
                } else {
                    this.pwdOk2 = '';
                }
            },
        }
    })
  </script>