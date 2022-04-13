<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container bg0 p-t-70 p-b-10" id="eventAdd">
		<div class="row">
			<div class="col-lg-12 m-lr-auto">
				<div class="p-b-20">
					<h3>카테고리&이벤트 관리</h3>
				</div>
			</div>
			<div class="col-lg-12-add flex-m">
				<div class="col-sm-12-add col-md-12 m-lr-auto m-b-50">
					<div class="bor10 p-lr-40 p-t-30 p-b-40 p-lr-0-sm">



						<form @submit.prevent="submitCateForm">
							<div class="flex-w flex-t bor12 p-b-20">
								<div class="size-208 w-full-ssm">
									<span class="stext-110 cl2"> 카테고리 </span>
								</div>
								<div class="size-209 p-b-20">
									<select ref="select1" v-model="cid1" @change="selectIndex($event)" class="bor10 cl3 p-tb-3 p-lr-5">
										<option v-for="cate in categories1" :value="cate.cid">{{cate.title}}</option>
									</select>
									&nbsp;&nbsp;
									<select ref="good" v-model="cid2" class="bor10 cl3 p-tb-3 p-lr-5">
										<option v-for="cate2 in categories2[cindex]" :value="cate2.cid">{{cate2.title}}</option>
									</select>
								</div>

								<!--   -------  대분류 --------  -->
								<div class="size-208 w-full-ssm">대분류</div>
								<div class="p-b-20 p-lr-10">
									<input ref="category1" type=text class="bor10 cl3 p-tb-3 p-lr-5 dis-inline-block" v-model="category1">
								</div>
								<div class="p-b-20 p-lr-10">
									<input ref="catitle1" type=text class="bor10 cl3 p-tb-3 p-lr-5 " v-model="catitle1">
								</div>

								<!--   -------  소분류 --------  -->
								<div class="size-208 w-full-ssm">소분류</div>
								<div class="p-b-20 p-lr-10">
									<input ref="category2" type=text class="bor10 cl3 p-tb-3 p-lr-5  dis-inline-block" v-model="category2">
								</div>
								<div class="p-b-20 p-lr-10">
									<input ref="catitle2" type=text class="bor10 cl3 p-tb-3 p-lr-5 " v-model="catitle2">
								</div>

								<!--   -------  버튼 --------  -->
								<div class="p-lr-15">
									<input type=submit class="btn flex-c-m stext-101 cl0 bg1 bor14 hov-btn3 trans-04 pointer btn-pro-color2 dis-inline-block" value="등록">
								</div>
								<div class="p-lr-10">
									<input type=button class="btn flex-c-m stext-101 cl0 bg1 bor14 hov-btn3 trans-04 pointer btn-pro-color2 dis-inline-block" v-on:click="cate_delete" value="삭제">
								</div>
							</div>
						</form>
						<form @submit.prevent="submitEveForm">
							<!--   -------  이벤트 --------  -->
							<div class="flex-w flex-t bor12 p-t-20 p-b-20">
								<div class="size-208 w-full-ssm">
									<span class="stext-110 cl2"> 이벤트</span>
								</div>
								<div class="row size-209 p-b-20">
									<span v-for="e in events" class="dis-inline-block">{{e.eid}}&nbsp;{{e.etitle}} &nbsp;&nbsp;</span>
								</div>

								<!--   -------  이벤트 이름  --------  -->
								<div class="size-208 w-full-ssm">이벤트 이름</div>
								<div class="p-b-20 p-lr-10">
									<input ref="eidname" type=text class="bor10 cl3 p-tb-3 p-lr-5  dis-inline-block" v-model="eidname">
								</div>

								<!--   -------  버튼 --------  -->
								<div class="p-lr-15">
									<input type=submit class="btn flex-c-m stext-101 cl0 bg1 bor14 hov-btn3 trans-04 pointer btn-pro-color2 dis-inline-block" value="등록">
								</div>
								<div class="p-lr-10">
									<input type=button class="btn flex-c-m stext-101 cl0 bg1 bor14 hov-btn3 trans-04 pointer btn-pro-color2 dis-inline-block" v-on:click="event_delete()" value="삭제">
								</div>
							</div>

						</form>


					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
    new Vue({
        el: '#eventAdd',
        data: {
            cid1: '',
            cid2: '',
            eid: [],
            categories1: [],
            categories2: [],
            cindex: 0,
            events: [],
            category1: '',
            category2: '',
            catitle1: '',
            catitle2: '',
            eidname:'',
            c_id1:'',
            c1_title:'',
            c_id2:'',
            c2_title:''
        },
        mounted: function() {
            this.cate1();
            this.cate2();
            this.eventList();
        },
        methods: {
            cate1: function() {
                axios.get("http://localhost:8080/web/main/category_1_vue.do", {}).then(result => {
                    this.categories1 = result.data;
                    this.cid1 = result.data[0].cid
                })
            },
            cate2: function() {
                axios.get("http://localhost:8080/web/main/category_2_vue.do", {}).then(result => {
                    this.categories2 = result.data;
                    this.cid2 = result.data[0][0].cid
                })
            },
            eventList: function() {
                axios.get("http://localhost:8080/web/admin/event_list.do", {}).then(result => {
                    this.events = result.data;
                })
            },
            selectIndex: function(event) {
                this.cindex = event.target.selectedIndex;
                this.cid2 = this.categories2[this.cindex][0].cid;
            },
            submitCateForm:function(){
                
               	console.log("category1 : "+ this.category1);
               	console.log("cat1 title : "+ this.catitle1);
               	console.log("category2 : "+ this.category2);
               	console.log("cat2 title : "+ this.catitle2);
                
               	let form = new FormData();
               	form.append('c_id1',this.category1);
               	form.append('c_id2',this.category2);
               	form.append('c1_title',this.catitle1);
               	form.append('c2_title',this.catitle2);
               	
                axios.post('http://localhost:8080/web/admin/category_add_ok.do', form, {
                }).then((response) => {
                    location.href="../admin/event_Insert.do"
                })
            },
            submitEveForm:function(){
            
		            let form = new FormData();
		            form.append('e_title', this.eidname);
		            
		           	console.log("event name : "+ this.eidname);
		            
		            axios.post('http://localhost:8080/web/admin/event_add_ok.do', form, {
		            	}) .then((response) => {
		                location.href="../admin/event_Insert.do"
		            	})
        		},
	        	cate_delete:function(){
		        		if (this.category2 == "" || this.catitle2=="") {
									this.$refs.category2.focus();
									alert("삭제할 카테고리번호와 이름을 입력해주세요");
									return;
		        		}
        				console.log("category2 : " + this.category2);
               	console.log("cat2 title : " + this.catitle2);
	               	
               	let form = new FormData();
              	form.append('c_id', this.category2);
            		form.append('c_title', this.catitle2);
	            	
               	axios.post('http://localhost:8080/web/admin/category_delete_ok.do', form, {
               	}).then((response) => {
               			location.href="../admin/event_Insert.do";
               	})
	        	},
	        	event_delete:function(){
	        		if (this.eidname == "" ) {
								this.$refs.eidname.focus();
								alert("삭제할 이벤트 이름을 입력해주세요");
								return;
	        		}
    				
           	console.log("event title : " + this.eidname);
               	
           	let form = new FormData();
          	form.append('e_title', this.eidname);
            	
           	axios.post('http://localhost:8080/web/admin/event_delete_ok.do', form, {
           	}).then((response) => {
           			location.href="../admin/event_Insert.do";
           	})
        	}
        }
    })
  </script>
</body>
</html>