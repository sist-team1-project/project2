<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
</head>
<body>
  <div class="container bg0" id="notice_delete">
    <h3 class="text-center p-b-20">삭제하기</h3>
    <div class="text-center p-t-10">
      <button class="btn btn-sm" style="background-color: #eeeee6" v-on:click="del()">삭제</button>
      <button class="btn btn-sm" style="background-color: #dbd0be" v-on:click="cancel()">취소</button>
    </div>
  </div>
  <script>
    new Vue({
        el:'#notice_delete',
        data:{
            no:${no},
            msg:''
        },
        methods:{
            cancel:function(){
                history.back();
            },
            del:function(){
                let _this=this;
                axios.get('http://localhost:8080/web/support/notice_delete_ok.do',{
                    params:{
                        no:this.no,
                    }
                }).then(function(res){
                    console.log(res.data);
                    _this.msg=res.data
                    if(_this.msg=="YES")
                    {
                        location.href="../support/notice.do";
                    }
                })
            }
        }
    })
  </script>
</body>
</html>