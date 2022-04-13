<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/support.css">
</head>
<body>
    <div class="container" id="notice_insert">
      <h3 class="text-center p-b-20">공지사항 등록</h3>
        <div class="row">
          <table class="table">
            <tr>
              <th class="text-right">작성자</th>
              <td><input type=text id="u_id" size=20 v-model="u_id"></td>
            </tr>
            <tr>
              <th class="text-right">제목</th>
              <td><input type=text id="n_title" size=50 v-model="n_title"></td>
            </tr>
            <tr>
                 <th class="text-right">내용</th>
              <td><textarea rows="15" cols="110" id="n_content" v-model="n_content"></textarea></td>
            </tr>
            <tr>
              <td colspan="3" class="text-right">
                <button class="btn btn-sm bg-1" v-on:click="write()">글쓰기</button>
                <button class="btn btn-sm bg-2" v-on:click="cancel()">취소</button>
              </td>
            </tr>
          </table>
        </div>
    </div>
    
    
    <script>
    new Vue({
        el:'#notice_insert',
        data:{
            u_id:'',
            n_title:'',
            n_content:''
        },
        methods:{
            write:function(){
                if(this.u_id=='') {
                    let n=document.getElementById("u_id");
                    n.focus();
                    return;
                }
                if(this.n_title=='') {
                    let n=document.getElementById("n_title");
                    n.focus();
                    return;
                }
                if(this.n_content=='') {
                    let n=document.getElementById("n_content");
                    n.focus();
                    return;
                }
                
                axios.get('http://localhost:8080/web/support/notice_insert_ok.do',{
                    params:{
                        u_id:this.u_id,
                        n_title:this.n_title,
                        n_content:this.n_content

                    }
                }).then(res=>{
                    location.href="../support/notice.do"
                    
                })
            },
            cancel:function(){
                history.back();
            }
        }
    })
   </script>

</body>
</html>








