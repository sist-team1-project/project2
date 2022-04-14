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
  <div class="container" id="mypage_update">
    <div class="row p-b-20">
      <div class="col-sm-12"><h4><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 회원정보 수정</h4></div>
    </div>
    
    <div class="info border p-all-60 col-md-8 stext-114">
      <form @submit="submitForm" method="post" action="../mypage/update_ok.do">
        <div class="row p-b-15 bor12">
          <div class="col-sm-4">아이디</div>
          <div class="col-sm-8">
            <input class="text-111 bor8 bg0 cl8 size-111 p-lr-15" type="text" name="u_id" ref="id" v-model="u_id" readonly style="background-color:#eeeee6">
          </div>
        </div>
        <div class="row p-tb-15 bor12">
          <div class="col-sm-4">이름</div>
          <div class="col-sm-8">
            <input class="text-111 bor8 bg0 cl8 size-111 p-lr-15" type="text" name="u_name" ref="name" v-model="u_name" readonly style="background-color:#eeeee6">
          </div>
        </div>
        <div class="row p-tb-15 bor12">     
          <div class="col-sm-4">비밀번호</div>
          <div class="col-sm-8">
            <input class="text-111 bor8 bg0 cl8 size-111 p-lr-15" type="password" name="u_password" ref="password" v-model="u_password">
          </div>
        </div>
        <div class="row p-tb-15 bor12">      
          <div class="col-sm-4">이메일</div>
          <div class="col-sm-8">
            <input class="text-111 bor8 bg0 cl8 size-111 p-lr-15" type="text" name="u_email" ref="email" v-model="u_email" @blur="emailCheck">
            <p class="fs-12 cl3">{{emailOk}}</p>
          </div>
        </div>
        <div class="row p-tb-15 bor12">
          <div class="col-sm-4">전화번호</div>
          <div class="col-sm-8">
            <input class="text-111 bor8 bg0 cl8 size-111 p-lr-15" type="text" name="u_phone" ref="phone" v-model="u_phone">
          </div>
        </div>
        <div class="row p-tb-15 bor12">
          <div class="col-sm-4">우편번호</div>
          <div class="col-sm-8">
            <input type="text" class="size-111-5 bor8 bg0 cl8  p-lr-15 dis-inline-block" name="u_post" ref="post" v-model="u_post" readonly style="background-color:#eeeee6">
            &nbsp;&nbsp;<input type="button" class="cl0 btn-sm btn-pro-color2 bor20 hov-btn1 p-tb-10 dis-inline-block pointer" value="우편번호 찾기" @click="postFind">
            <div>주소</div>
            <input class="stext-111 bor8 bg0 cl8 size-111 p-lr-15" style="background-color:#eeeee6" type="text" name="u_address1" ref="address1" v-model="u_address1" readonly>
            <div>상세주소</div>
            <input class="stext-111 bor8 bg0 cl8 size-111 p-lr-15" type="text" name="u_address2" v-model="u_address2">
          </div>
        </div>
        <div class="row p-tb-15 bor12">
          <div class="col-sm-4">비밀번호 찾기 질문</div>
          <div class="col-sm-8">
            <select class="text-111 bor8 bg0 cl8 size-111 p-lr-15" name="u_question" ref="question" v-model="u_question">
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
          </div>
        </div>
        <div class="row p-tb-15 bor12">
          <div class="col-sm-4">비밀번호 찾기 답변</div>
          <div class="col-sm-8">
            <input class="text-111 bor8 bg0 cl8 size-111 p-lr-15" type="text" name="u_answer" ref="answer" v-model="u_answer">
          </div>
        </div>
        
        <div class="row p-t-15">
          <div class="col-sm-12">
            <input type="submit" class="cl1 size-101 w-full bg3 bor1 hov-btn3 trans-04 pointer dis-inline-block" value="수정">
          </div>
        </div>
      </form>
    </div>
  </div>
  <script>
 
    new Vue({
        el:'#mypage_update',
        data:{
        	u_password:'',
            u_phone:'',
            u_email:'',
            u_post:'',
            u_address1:'',
            u_address2:'',
            u_question:'',
            u_answer:'',
            u_id:'',
            u_name:'',
            emailOk:'',
        },
        mounted:function(){
              axios.get("http://localhost:8080/web/mypage/info_vue.do",{
              }).then(res=>{
            	  this.u_id=res.data.uid;
            	  this.u_name=res.data.name;
            	  this.u_phone=res.data.phone;
            	  this.u_email=res.data.email;
            	  this.u_post=res.data.post;
            	  this.u_address1=res.data.address1;
            	  this.u_address2=res.data.address2;
            	  this.u_question=res.data.question;
            	  this.u_answer=res.data.answer;
              })
        },
        methods:{
            submitForm:function(e){
                if(this.u_password && this.u_email && this.u_phone && this.u_post && this.u_address1 && this.u_question && this.u_answer && this.u_answer && !emailOk) {
                    return true;
                }
                else if(this.u_password == '') {
                    this.$refs.password.focus();
                }
                else if(this.u_email == '') {
                    this.$refs.email.focus();
                }
                else if(this.u_phone == '') {
                    this.$refs.phone.focus();
                }
                else if(this.u_post == '') {
                    alert('우편번호 찾기를 해주세요');
                }
                else if(this.u_address1 == '') {
                    alert('우편번호 찾기를 해주세요');
                }
                else if(this.u_question == '') {
                    this.$refs.question.focus();
                }
                else if(this.u_answer == '') {
                    this.$refs.answer.focus();
                }
                else if(this.emailOk != '') {
                    this.$refs.email.focus();
                }
                e.preventDefault();
	        },
            idCheck:function() {
                if(this.u_id != ''){
                    axios.get("http://localhost:8080/web/user/idcheck_ok.do",{
                        params:{
                            id: this.u_id
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
                if(this.u_email != ''){
                    axios.get("http://localhost:8080/web/user/emailcheck_ok.do",{
                        params:{
                            email: this.u_email
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
            // 이메일 형식 검증
            emailValidate:function() {
                let re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
                if(!re.test(this.u_email)) {
                    this.emailOk = '올바르지 않은 이메일 형식입니다';
                } else {
                    this.emailOk = '';
                }
            },
            // 우
            postFind:function() {
                this_ = this; // this 주소 저장
                new daum.Postcode({
                    oncomplete:function(data) {
                        this_.u_post = data.zonecode; // 이곳에선 기존 this 사용을 할 수 없음
                        this_.u_address1 = data.address;
                    }
                }).open()
            }
        }
    })
  </script>
</body>
</html>