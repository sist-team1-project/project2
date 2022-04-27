<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/admin/user.css">
</head>
<body>
  <div class="container p-b-10" id="usermg">
    <div class="row" id="orderpage">
      <div class="col-lg-12 m-lr-auto">
        <div><h3><i class="fa fa-users" aria-hidden="true"></i>&nbsp; 유저관리</h3></div>
      </div>
    </div>
    <div class="row p-t-10">
      <div class="col-lg-12 p-tb-10">
        <div class="fs-13">
            총 {{count | currency}} 명
        </div>
      </div>
    
      <div class="col-lg-12 m-b-50">
        <div class="wrap-table js-pscroll">
          <table class="table-user">
            <tr class="table_head">
              <th class="column-1">아이디</th>
              <th class="column-2">이름</th>
              <th class="column-3">성별</th>
              <th class="column-4">전화번호</th>
              <th class="column-5">이메일</th>
              <th class="column-6">가입일</th>
              <th class="column-7">등급</th>
              <th class="column-8">차단</th>
            </tr>
            <tr v-for="(u,index) in userlist" class="table_row fs-13">
              <td class="column-1">{{u.uid}}</td>
              <td class="column-2">{{u.name}}</td>
              <td class="column-3">{{u.gender}}</td>
              <td class="column-4">{{u.phone}}</td>
              <td class="column-5">{{u.email}}</td>
              <td class="column-6">{{u.regdate}}</td>
              <td class="column-7" v-if="u.grade==-1">차단유저</td>
              <td class="column-7" v-if="u.grade==0">관리자</td>
              <td class="column-7" v-if="u.grade==1">일반유저</td>
              <td class="column-8">
         		  <button v-if="u.grade==1" class="bor20 cl2 btn-pro-color2 p-tb-4 p-lr-10" value="-1" v-on:click="xclick($event, u.uid); u.grade=-1">차단</button>
         		  <button v-if="u.grade==-1" class="bor20 cl2 bg2 cl2 p-tb-4 p-lr-10" value="1" v-on:click="xclick($event, u.uid); u.grade=1">취소</button>
              </td>
             </tr>
          </table>
        </div>
      </div>
    </div>
    <!---------- 페이징 --------------->
    <div class="text-center">
      <ul class="pagination">
        <li class="page-item" :class="{'disabled':startPage==1}">
          <button class="page-link" :value="startPage-1" @click="getpage($event)"><i class="fa fa-chevron-left" aria-hidden="true"></i></button>
        </li>
        <li class="page-item" v-for="i in pages" :class="{'active':i==curpage}">
          <button class="page-link" :value="i" @click="getpage($event)">{{i}}</button>
        </li>
        <li class="page-item" :class="{'disabled':endPage==totalpage}">
          <button class="page-link" :value="endPage+1" @click="getpage($event)"><i class="fa fa-chevron-right" aria-hidden="true"></i></button>
        </li>
      </ul>
    </div>
  </div>
  <script>
    new Vue({
        el:'#usermg',
        data:{
            userlist: [],
            curpage : 1,
            totalpage : 0,
            startPage : 0,
            endPage : 0,
            pages : [],
            count : 0
        },
        mounted:function(){
            this.uList();
        },
        methods:{
            uList:function(){
                axios.get("http://13.125.104.199/project2/admin/userlist_vue.do",{
                    params:{
                        page: this.curpage
                    }
                }).then(res=>{
                    this.userlist = res.data;
                    this.curpage = res.data[0].curpage;
                    this.totalpage = res.data[0].totalpage;
                    this.startPage = res.data[0].startPage;
                    this.endPage = res.data[0].endPage;
                    this.count = res.data[0].count;
                    this.pages=[];
                    for(i = this.startPage; i <= this.endPage; i++) {
                        this.pages.push(i);
                    }
                })
            },
            getpage : function(event){
            	this.curpage = event.currentTarget.value;
                this.uList();
            },
            xclick:function(event, uid){
        	    let grade = event.currentTarget.value;
        	    axios.post("http://13.125.104.199/project2/admin/user_grade_update_ok.do",null,{
                    params:{
                        grade: grade,
                        uid: uid
                    }
        	    })
            }
        }
    })
  </script>
</body>
</html>