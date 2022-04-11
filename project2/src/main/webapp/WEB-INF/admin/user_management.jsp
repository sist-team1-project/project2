<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/order.css">
<link rel="stylesheet" type="text/css" href="../css/admin.css">
<style type="text/css">
td {
    width: 150px;
    margin: 0px auto;
}
</style>
</head>
<body>
  <div class="container bg0 p-t-70 p-b-10" id="usermg">
    <div class="row" id="orderpage">
      <div class="col-lg-12 m-lr-auto">
        <div class="p-b-20">
          <h3>유저관리</h3>
        </div>
      </div>

    </div>
    <div class="row p-t-10">
      <div class="col-lg-12 m-lr-auto p-tb-10 dis-flex flex-sb flex-m">
        <div class="fs-13">
            총 {{count | currency}} 명
        </div>
      </div>
    </div>
    <div class="col-lg-12 m-lr-auto m-b-50">
      <div class="wrap-table js-pscroll">
        <table class="table-checkout text-center">
          <tr class="table_head text-center">
            <th>아이디</th>
            <th>이름</th>
            <th>성별</th>
            <th>전화번호</th>
            <th>이메일</th>
            <th>가입일</th>
            <th>등급</th>
            <th>차단</th>
          </tr>
          <tr v-for="(u,index) in userlist" class="table_row_admin fs-13">
            <td>{{u.uid}}</td>
            <td>{{u.name}}</td>
            <td>{{u.gender}}</td>
            <td>{{u.phone}}</td>
            <td>{{u.email}}</td>
            <td>{{u.regdate}}</td>
            <td v-if="u.grade==-1">차단유저</td>
            <td v-if="u.grade==0">관리자</td>
            <td v-if="u.grade==1">일반유저</td>
            <td>
       		  <button v-if="u.grade==1" class="bor20 cl2 btn-pro-color2 p-tb-4 p-lr-10" value="-1" v-on:click="xclick($event, u.uid); u.grade=-1">차단</button>
       		  <button v-if="u.grade==-1" class="bor20 cl2 bg2 cl2 p-tb-4 p-lr-10" value="1" v-on:click="xclick($event, u.uid); u.grade=1">취소</button>
            </td>
           </tr>
        </table>
      </div>
    </div>
    
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
                axios.get("http://localhost:8080/web/admin/userlist_vue.do",{
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
        	    axios.post("http://localhost:8080/web/admin/user_grade_update_ok.do",null,{
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