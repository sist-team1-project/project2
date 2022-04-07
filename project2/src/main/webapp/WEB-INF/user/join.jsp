<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="container p-t-150 p-b-80" id="user_join">
    <div class="col-sm-5 bor10 p-lr-40 p-t-30 p-b-25 p-lr-15-sm">
      <form ref="join_form" method="post" action="../user/join_ok.do">
      
        <div class="text-left"> 
          <div>
            <div>아이디</div>
            <input class=bor10 type="text" name="u_id" id="id" v-model="id">
            <input type="button" id="id-check-btn" v-on:click="id-check-btn" value="중복 확인">
          </div>
        
          <div>
            <div>이름</div>
            <input class=bor10 type="text" name="u_name" id="name" v-model="name">
          </div>
          
          <div>
            <div>비밀번호 입력</div>
            <input class=bor10 type="password" name="u_password" id="password" v-model="password">
          </div>
          
          <div>
            <div>비밀번호 확인</div>
            <input class=bor10 type="password" id="password2">
          </div>
        
          <div>
            <div>성별</div>
                <label class="radio-inline"><input class="form-check-input" type="radio" value="남자" name=u_gender v-model="gender"> 남자</label>
                <label class="radio-inline"><input class="form-check-input"  type="radio" value="여자" name=u_gender v-model="gender"> 여자</label>
          </div>
        
          <div>
            <div>이메일</div>
            <input class=bor10 type="text" name="u_email" id="email" v-model="email">
            <input type="button" id="email-check-btn" v-on:click="email-check-btn" value="중복 확인">
          </div>
        
          <div>
            <div>전화번호</div>
            <input class=bor10 type="text" name="u_phone" id="phone" v-model="phone">
          </div>
        
          <div>
            <div>우편번호</div>
            <input type="text" name="u_post" id="post" v-model="post">
            <input type="button" id="post-btn" v-on:click="post-btn" value="우편번호 찾기">
            <div>주소</div>
            <input type="text" name="u_address1" id="address1" v-model="address1">
            <div>상세주소</div>
            <input class=bor10 type="text" name="u_address2" id="address2" v-model="address2">
          </div>
        
          <div>
            <div>비밀번호 찾기 질문</div>
            <select name=u_question id=question v-model="question">
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
            <input class=bor10 type="text" name=u_answer id=answer v-model="answer">
          </div>
        </div>
    
        <div>
          <input type="button" id="join-btn" class="btn btn-primary" v-on:click="join()" value="회원가입">
          <a href="../user/login.do" id="cancle-btn" class="btn btn-primary">취소</a>
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
            email:'',
            phone:'',
            post:'',
            gender:'남자',
            address1:'',
            address2:'',
            question:'기억에 남는 추억의 장소는?',
            answer:''
        },
        mounted:function(){
              
        },
        methods:{
            join:function(){
                let id=$('#id').val();
                if(id.trim()=="")
                {
                    return;
                }
                let name=$('#name').val();
                if(name.trim()=="")
                {
                    $('#name').focus();
                    return;
                }
                let password=$('#password').val();
                if(password.trim()=="")
                {
                    $('#password').focus();
                    return;
                }
                let password2=$('#password2').val();
                if(password2.trim()=="")
                {
                    $('#password2').focus();
                    return;
                }
                let email=$('#email').val();
                if(email.trim()=="")
                {
                    $('#email').focus();
                    return;
                }
                let phone=$('#phone').val();
                if(phone.trim()=="")
                {
                    $('#phone').focus();
                    return;
                }
                let post=$('#post').val();
                if(post.trim()=="")
                {
                    return;
                }
                let address1=$('#address1').val();
                if(address1.trim()=="")
                {
                    $('#address1').focus();
                    return;
                }
                let question=$('#question').val();
                if(question.trim()=="")
                {
                    $('#question').focus();
                    return;
                }
                let answer=$('#answer').val();
                if(answer.trim()=="")
                {
                    $('#answer').focus();
                    return;
                }
                axios.post("http://localhost:8080/web/user/join_ok.do",null,{
                    params:{
                        u_id: this.id,
                        u_name: this.name,
                        u_password: this.password,
                        u_phone: this.phone,
                        u_email: this.email,
                        u_post: this.post,
                        u_gender: this.gender,
                        u_address1: this.address1,
                        u_address2: this.address2,
                        u_question: this.question,
                        u_answer: this.answer
                    }
                }).then(res=>{
                    location.href="../user/login.do";
                })
            }
        }
    })
  </script>
</body>
</html>