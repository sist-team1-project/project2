<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="../css/join.css">
  <script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
  <div class="container p-t-100 p-b-60 flex-c-m" id="user_join">
    <div class="col-sm-5 bor10 p-lr-40 p-t-30 p-b-25 p-lr-15-sm">
      <h4>회원가입</h4>
      <form method="post" action="../user/join_ok.do" @submit="submitForm">
        <div class="text-left"> 
          <div class="p-t-20 p-b-10">
            <div>아이디</div>
            <input class="bor10 p-lr-5 p-tb-3 cl3 fs-13 w-full" type="text" name="u_id" ref="id" v-model="id" @blur="idCheck">
            <p class="fs-12 cl3">{{idOk}}</p>
          </div>
          
          <div class="p-tb-10">
            <div>이름</div>
            <input class="bor10 p-lr-5 p-tb-3 cl3 fs-13 w-full" type="text" name="u_name" ref="name" v-model="name">
          </div>
          
          <div class="p-tb-10">
            <div>비밀번호 입력</div>
            <input class="bor10 p-lr-5 p-tb-3 cl3 fs-13 w-full" type="password" name="u_password" ref="password" v-model="password" @blur="pwdValidate" @click="password=''; password2=''">
            <p class="fs-12 cl3">{{pwdOk}}</p>
          </div>
          
          <div class="p-tb-10">
            <div>비밀번호 확인</div>
            <input class="bor10 p-lr-5 p-tb-3 cl3 fs-13 w-full" type="password" ref="password2" v-model="password2" @blur="pwd2Validate" @click="password2=''">
            <p class="fs-12 cl3">{{pwdOk2}}</p>
          </div>
        
          <div class="p-tb-10">
            <div>성별</div>
            <input class="dis-inline-block cl3 fs-13" type="radio" name="u_gender" value="남자" v-model="gender"> 남자
            <input class="dis-inline-block cl3 fs-13"  type="radio" name="u_gender" value="여자" v-model="gender"> 여자
          </div>
        
          <div class="p-tb-10">
            <div>이메일</div>
            <input class="bor10 p-lr-5 p-tb-3 cl3 fs-13 w-full" type="text" name="u_email" ref="email" v-model="email" @blur="emailCheck">
            <p class="fs-12 cl3">{{emailOk}}</p>
          </div>
        
          <div class="p-tb-10">
            <div>전화번호</div>
            <input class="bor10 p-lr-5 p-tb-3 cl3 fs-13 w-full" type="text" name="u_phone" ref="phone" v-model="phone">
          </div>
        
          <div class="p-tb-10">
            <div>우편번호</div>
            <input type="text" class="bor10 p-lr-5 p-tb-3 cl3 fs-13 dis-inline-block" name="u_post" ref="post" v-model="post" readonly>
            <input type="button" class="cl0 bg2 fs-13 bor4 p-lr-5 p-tb-4 trans-04 pointer dis-inline-block" value="우편번호 찾기" @click="postFind">
            <div>주소</div>
            <input type="text" class="bor10 p-lr-5 p-tb-3 cl3 fs-13 w-full" name="u_address1" ref="address1" v-model="address1" readonly>
            <div>상세주소</div>
            <input class="bor10 p-lr-5 p-tb-3 cl3 fs-13 w-full" name="u_address2" type="text" v-model="address2">
          </div class="p-tb-10">
        
          <div class="p-tb-10">
            <div>비밀번호 찾기 질문</div>
            <select class="bor10 p-lr-5 p-tb-3 cl3 fs-13 w-full" name="u_question" ref="question" v-model="question">
              <option value="기억에 남는 추억의 장소는?" selected>기억에 남는 추억의 장소는?</option>
              <option value="자신의 인생 좌우명은?" >자신의 인생 좌우명은?</option>
              <option value="자신의 보물 제1호는?" >자신의 보물 제1호는?</option>
              <option value="가장 기억에 남는 선생님 성함은?" >가장 기억에 남는 선생님 성함은?</option>
              <option value="타인이 모르는 자신만의 신체비밀이 있다면?" >타인이 모르는 자신만의 신체비밀이 있다면?</option>
              <option value="추억하고 싶은 날짜가 있다면?" >추억하고 싶은 날짜가 있다면? </option>
              <option value="받았던 선물 중 기억에 남는 독특한 선물은?" >받았던 선물 중 기억에 남는 독특한 선물은?</option>
              <option value="유년시절 가장 생각나는 친구 이름은?" >유년시절 가장 생각나는 친구 이름은?</option>
              <option value="인상 깊게 읽은 책 이름은?" >인상 깊게 읽은 책 이름은? </option>
              <option value="읽은 책 중에서 좋아하는 구절이 있다면?" >읽은 책 중에서 좋아하는 구절이 있다면?</option>
              <option value="자신이 두번째로 존경하는 인물은?" >자신이 두번째로 존경하는 인물은?</option>
              <option value="친구들에게 공개하지 않은 어릴 적 별명이 있다면?" >친구들에게 공개하지 않은 어릴 적 별명이 있다면?</option>
              <option value="초등학교 때 기억에 남는 짝꿍 이름은?" >초등학교 때 기억에 남는 짝꿍 이름은?</option>
              <option value="다시 태어나면 되고 싶은 것은?" >다시 태어나면 되고 싶은 것은?</option>
              <option value="내가 좋아하는 캐릭터는?" >내가 좋아하는 캐릭터는? </option>
            </select>
            <div>비밀번호 찾기 답변</div>
            <input class="bor10 p-lr-5 p-tb-3 cl3 fs-13 w-full" type="text" name="u_answer" ref="answer" v-model="answer">
          </div>
        </div>
    
        <div class="flex-c-m p-t-30">
          <input type="submit" class="cl1 size-101 bg3 bor1 hov-btn3 trans-04 pointer dis-inline-block" value="회원가입">
          <input type="button" @click="location.href='../user/login.do'" class="cl2 size-101 bg2 bor1 hov-btn3 trans-04 pointer dis-inline-block" value="취소">
        </div>
      </form>
    </div>
  </div>
  <script>
 
    new Vue({
        el:'#user_join',
        data:{
            id:'',
            name:'',
            password:'',
            phone:'',
            email:'',
            gender:'남자',
            post:'',
            address1:'',
            address2:'',
            question:'기억에 남는 추억의 장소는?',
            answer:'',
            password2:'',
            idOk:'',
            pwdOk:'',
            pwdOk2:'',
            emailOk:''
        },
        mounted:function(){
              
        },
        methods:{
            submitForm:function(e){
                if(this.id && this.name && this.password && this.password2 && this.email && this.phone && this.post && this.address1 && this.question && this.answer && !this.idOk && !this.pwdOk && !this.emailOk) {
                    return true;
                }
                if(this.id == '' || this.idOk != '') {
                    this.$refs.id.focus();
                }
                else if(this.name == '') {
                    this.$refs.name.focus();
                }
                else if(this.password == '') {
                    this.$refs.password.focus();
                }
                else if(this.password2 == '') {
                    this.$refs.password2.focus();
                }
                else if(this.password != this.password2) {
                    this.password == '';
                    this.password2 == '';
                }
                else if(this.email == '') {
                    this.$refs.email.focus();
                }
                else if(this.phone == '') {
                    this.$refs.phone.focus();
                }
                else if(this.post == '') {
                    alert('우편번호 찾기를 해주세요');
                }
                else if(this.address1 == '') {
                    alert('우편번호 찾기를 해주세요');
                }
                else if(this.question == '') {
                    this.$refs.question.focus();
                }
                else if(this.answer == '') {
                    this.$refs.answer.focus();
                }
                else if(this.pwdOk != '') {
                    this.$refs.password.focus();
                } 
                else if(this.emailOk != '') {
                    this.$refs.email.focus();
                }
                e.preventDefault();
            },
            idCheck:function() {
                if(this.id != ''){
                    axios.get("http://13.125.104.199/project2/user/idcheck_ok.do",{
                        params:{
                            id: this.id
                        }
                    }).then(res=>{
                        if(res.data=='no'){ // 사용 불가능하면
                            this.idOk = '이미 존재하는 아이디입니다';
                        }
                        else { // 사용 가능
                            this.idValidate(res.data);
                        }
                    })
                } else {
                    this.idOk = '';
                }
            },
            emailCheck:function() {
                if(this.email != ''){
                    axios.get("http://13.125.104.199/project2/user/emailcheck_ok.do",{
                        params:{
                            email: this.email
                        }
                    }).then(res=>{
                        if(res.data=='no'){ // 사용 불가능하면
                            this.emailOk = '이미 존재하는 이메일입니다';
                        }
                        else { // 사용 가능
                            this.emailValidate(res.data);
                        }
                    })
                } else {
                    this.emailOk = '';
                }
            },
            idValidate:function(id) {
                let num = id.search(/[0-9]/g);
                let eng = id.search(/[a-z]/ig);
                
                if(id.length < 6 || id.length > 12){
                    this.idOk = '아이디는 6자리 ~ 12자리 이내로 입력해주세요';
                    return;
                } else if(id.search(/\s/) != -1){
                    this.idOk = '아이디는 공백 없이 입력해주세요.';
                    return;
                } else if(num < 0 || eng < 0){
                    this.idOk = '아이디는 영문,숫자를 혼합하여 입력해주세요.';
                    return;
                } else {
                    this.idOk = '';
                    return;
                }
            },
            pwdValidate:function() {
                let password = this.password;
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
                if(this.password != this.password2) {
                    this.pwdOk2 = '재입력이 일치하지 않습니다.';
                } else {
                    this.pwdOk2 = '';
                }
            },
            emailValidate:function() {
                let re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
                if(!re.test(this.email)) {
                    this.emailOk = '올바르지 않은 이메일 형식입니다';
                } else {
                    this.emailOk = '';
                }
            },
            postFind:function() {
                this_ = this; // this 주소 저장
                new daum.Postcode({
                    oncomplete:function(data) {
                        this_.post = data.zonecode; // 이곳에선 기존 this 사용을 할 수 없음
                        this_.address1 = data.address;
                    }
                }).open()
            }
        }
    })
  </script>
</body>
</html>