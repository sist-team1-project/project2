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
  <div class="container p-t-50 p-b-60" id="mypage_update">
    <div class="col-sm-6 bor10 p-lr-40 p-t-30 p-b-25 p-lr-15-sm">
      <h4>회원정보 변경</h4>
      <form @submit.prevent="submitForm">
        <div class="text-left"> 
          <div class="p-t-20 p-b-10">
            <div>아이디</div>
            <input class="bor10 p-lr-5 p-tb-3 cl3 fs-13 w-full" type="text" ref="id" v-model="form.u_id" @blur="idCheck" readonly style="background-color:#eeeee6">
            <p class="fs-12 cl3">{{idOk}}</p>
          </div>
          
          <div class="p-tb-10">
            <div>이름</div>
            <input class="bor10 p-lr-5 p-tb-3 cl3 fs-13 w-full" type="text" ref="name" v-model="form.u_name" readonly style="background-color:#eeeee6">
          </div>
          
          <div class="p-tb-10">
            <div>비밀번호 입력</div>
            <input class="bor10 p-lr-5 p-tb-3 cl3 fs-13 w-full" type="password" ref="password" v-model="form.u_password" @blur="pwdValidate" @click="form.u_password=''; password2=''">
            <p class="fs-12 cl3">{{pwdOk}}</p>
          </div>
          
          <div class="p-tb-10">
            <div>비밀번호 확인</div>
            <input class="bor10 p-lr-5 p-tb-3 cl3 fs-13 w-full" type="password" ref="password2" v-model="password2" @blur="pwd2Validate" @click="password2=''">
            <p class="fs-12 cl3">{{pwdOk2}}</p>
          </div>
        
          <div class="p-tb-10">
            <div>성별</div>
            <input class="dis-inline-block cl3 fs-13" type="radio" value="남자" v-model="form.u_gender"> 남자
            <input class="dis-inline-block cl3 fs-13"  type="radio" value="여자" v-model="form.u_gender"> 여자
          </div>
        
          <div class="p-tb-10">
            <div>이메일</div>
            <input class="bor10 p-lr-5 p-tb-3 cl3 fs-13 w-full" type="text" ref="email" v-model="form.u_email" @blur="emailCheck">
            <p class="fs-12 cl3">{{emailOk}}</p>
          </div>
        
          <div class="p-tb-10">
            <div>전화번호</div>
            <input class="bor10 p-lr-5 p-tb-3 cl3 fs-13 w-full" type="text" ref="phone" v-model="form.u_phone">
          </div>
        
          <div class="p-tb-10">
            <div>우편번호</div>
            <input type="text" class="bor10 p-lr-5 p-tb-3 cl3 fs-13 dis-inline-block" ref="post" v-model="form.u_post" readonly>
            <input type="button" class="cl0 bg2 fs-13 bor4 p-lr-5 p-tb-4 trans-04 pointer dis-inline-block" value="우편번호 찾기" @click="postFind">
            <div>주소</div>
            <input type="text" class="bor10 p-lr-5 p-tb-3 cl3 fs-13 w-full" ref="address1" v-model="form.u_address1" readonly>
            <div>상세주소</div>
            <input class="bor10 p-lr-5 p-tb-3 cl3 fs-13 w-full" type="text" v-model="form.u_address2">
          </div class="p-tb-10">
        
          <div class="p-tb-10">
            <div>비밀번호 찾기 질문</div>
            <select class="bor10 p-lr-5 p-tb-3 cl3 fs-13 w-full" ref="question" v-model="form.u_question">
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
            <input class="bor10 p-lr-5 p-tb-3 cl3 fs-13 w-full" type="text" ref="answer" v-model="form.u_answer">
          </div>
        </div>
    
        <div class="flex-c-m p-t-30">
          <input type="submit" class="cl1 size-101 bg3 bor1 hov-btn3 trans-04 pointer dis-inline-block" value="수정">
          
        </div>
      </form>
    </div>
  </div>
  <script>
 
    new Vue({
        el:'#mypage_update',
        data:{
            form: {
                u_id:'',
                u_name:'',
                u_password:'',
                u_phone:'',
                u_email:'',
                u_gender:'남자',
                u_post:'',
                u_address1:'',
                u_address2:'',
                u_question:'기억에 남는 추억의 장소는?',
                u_answer:''
            },
            password2:'',
            idOk:'',
            pwdOk:'',
            pwdOk2:'',
            emailOk:'',
            
        },
        mounted:function(){
              axios.get("http://localhost:8080/web/mypage/info_vue.do",{
            	  params:{
            		 u_id: this.uid
            	  }
              }).then(res=>{
            	  this.info=res.data;
            	  this.form.u_id=res.data.uid;
            	  this.form.u_name=res.data.name;
            	  this.form.u_phone=res.data.phone;
            	  this.form.u_email=res.data.email;
            	  this.form.u_post=res.data.post;
            	  this.form.u_address1=res.data.address1;
            	  this.form.u_address2=res.data.address2;
            	  this.form.u_question=res.data.question;
            	  this.form.u_answer=res.data.answer;
              })
        },
        methods:{
            submitForm:function(){
                if(this.form.u_id == '' || this.idOk != '') {
                    this.$refs.id.focus();
                    return;
                }
                if(this.form.u_name == '') {
                    this.$refs.name.focus();
                    return;
                }
                
                if(this.form.u_password == '') {
                    this.$refs.password.focus();
                    return;
                }
                
                if(this.password2 == '') {
                    this.$refs.password2.focus();
                    return;
                }
                
                if(this.form.u_password != this.password2) {
                    this.form.u_password == '';
                    this.password2 == '';
                    return;
                }
                
                if(this.form.u_email == '') {
                    this.$refs.email.focus();
                    return;
                }
                if(this.form.u_phone == '') {
                    this.$refs.phone.focus();
                    return;
                }
                if(this.form.u_post == '') {
                    alert('우편번호 찾기를 해주세요');
                    return;
                }
                if(this.form.u_address1 == '') {
                    alert('우편번호 찾기를 해주세요');
                    return;
                }
                if(this.form.u_question == '') {
                    this.$refs.question.focus();
                    return;
                }
                if(this.form.u_answer == '') {
                    this.$refs.answer.focus();
                    return;
                }
       
	            axios.post('http://localhost:8080/web/mypage/update_ok.do', this.form, {

	            }).then(res=> {
	            	if(res.data=="YES") {
                        alert("변경이 완료되었습니다.");
                        location.href = "../mypage/mypage.do"
	            	} else {
                        console.log(res)
                        alert("정보가 일치하지 않습니다");
                    }
	            })
	        },
            idCheck:function() {
                if(this.form.u_id != ''){
                    axios.get("http://localhost:8080/web/user/idcheck_ok.do",{
                        params:{
                            id: this.form.u_id
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
                if(this.form.u_email != ''){
                    axios.get("http://localhost:8080/web/user/emailcheck_ok.do",{
                        params:{
                            email: this.form.u_email
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
                password = this.form.u_password;
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
                if(this.form.u_password != this.password2) {
                    this.pwdOk2 = '재입력이 일치하지 않습니다.';
                } else {
                    this.pwdOk2 = '';
                }
            },
            emailValidate:function() {
                let re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
                if(!re.test(this.form.u_email)) {
                    this.emailOk = '올바르지 않은 이메일 형식입니다';
                } else {
                    this.emailOk = '';
                }
            },
            postFind:function() {
                this_ = this; // this 주소 저장
                new daum.Postcode({
                    oncomplete:function(data) {
                        this_.form.u_post = data.zonecode; // 이곳에선 기존 this 사용을 할 수 없음
                        this_.form.u_address1 = data.address;
                    }
                }).open()
            }
        }
    })
  </script>
</body>
</html>