<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="container p-t-150 p-b-80">
    <div class="col-sm-5 bor10 p-lr-40 p-t-30 p-b-25 p-lr-15-sm">
      <form id="user_form" method="post" action="../users/join_ok.do">
      
        <div class="text-left"> 
          <div>
            <div>아이디</div>
            <input type="text" name="id" id="id" readonly>
            <input type="button" id="id-check-btn" value="중복 확인">
          </div>
        
          <div>
            <div>이름</div>
            <input type="text" name="name" id="name">
          </div>
          
          <div>
            <div>비밀번호 입력</div>
            <input type="password" name="password" id="password">
          </div>
          
          <div>
            <div>비밀번호 확인</div>
            <input type="password" id="password2">
          </div>
        
          <div>
            <div>성별</div>
            <input type="checkbox" name="gender" value="man">
            <input type="checkbox" name="gender" value="woman">
          </div>
        
          <div>
            <div>이메일</div>
            <input type="text" name="email" id="email" readonly>
            <input type="button" id="email-check-btn" value="중복 확인">
          </div>
        
          <div>
            <div>전화번호</div>
            <input type="text" name="phone" id="phone">
          </div>
        
          <div>
            <div>우편번호</div>
            <input type="text" name="post" readonly>
            <input type="button" id="post-btn" vlaue="우편번호 찾기">
            <div>주소</div>
            <input type="text" name="address1" id="address1" readonly>
            <div>상세주소</div>
            <input type="text" name="address2" id="address2">
          </div>
        
          <div>
            <div>비밀번호 찾기 질문</div>
            <select name=question id=question>
              <option value="기억에 남는 추억의 장소는?" >기억에 남는 추억의 장소는?</option>
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
            <input type="text" name=answer id=answer>
          </div>
        </div>
    
        <div>
          <input type="button" id="join-btn" class="btn btn-primary" value="회원가입">
          <a href="../users/login.do" id="cancle-btn" class="btn btn-primary">취소</a>
        </div>
      
      </form>
      
    </div>
  </div>
</body>
</html>