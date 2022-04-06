<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/admin.css">
</head>
<body>
	<!-- 테이블이 필요하실땐 cart나 checkout쪽에서 사용한 테이블 사용하시면 편할거에요 -->

	<div class="container bg0 p-t-70 p-b-10" id="GoodsAdd">
		<div class="row">
			<div class="col-lg-12 m-lr-auto">
				<div class="p-b-20">
					<h3>상품 등록</h3>
				</div>
			</div>
			<div class="col-lg-12-add flex-m">
				<div class="col-sm-12-add col-md-12 m-lr-auto m-b-50">
					<div class="bor10 p-lr-40 p-t-30 p-b-40 p-lr-0-sm">

						<form name="adminAdd" method="post" action="goods_add_ok.do">

							<div class="flex-w flex-t bor12 p-b-20">
								<div class="size-208 w-full-ssm">
									<span class="stext-110 cl2"> 카테고리 </span>
								</div>
								<div class="size-209">

									<select name="c_id_1" id="select1" onchange="categoryChange(this.value)">
										<option value="100">카테고리 대분류</option>
										<option value="001">텐트(001)</option>
										<option value="002">타프/쉘터(002)</option>
										<option value="003">폴대/펙/스트링(003)</option>
										<option value="004">테이블/체어(004)</option>
										<option value="005">침구(005)</option>
										<option value="006">스토브/랜턴(006)</option>
										<option value="007">기타(007)</option>
										<option value="008">화로(008)</option>
									</select>
									&nbsp;&nbsp;
									<select id="good" name="c_id_2" style="display: none;">
										<option>카테고리 소분류</option>
									</select>

								</div>
							</div>

							<div class="flex-w flex-t bor12 p-t-20 p-b-20">
								<div class="size-208 w-full-ssm">
									<span class="stext-110 cl2"> 상품명 </span>
								</div>
								<div class="size-209">
									<input type=text size=65 class="input-sm bor15" name=g_name>
									<!-- <span class="mtext-110 cl2"> $10 </span> -->
								</div>
							</div>

							<div class="flex-w flex-t bor12 p-t-20 p-b-20">
								<div class="size-208 w-full-ssm">
									<span class="stext-110 cl2"> 브랜드 </span>
								</div>
								<div class="size-209">
									<input type=text size=65 class="input-sm bor15" name=g_brand>
									<!-- <span class="mtext-110 cl2"> $10 </span> -->
								</div>
							</div>

							<div class="flex-w flex-t bor12 p-t-20 p-b-20">
								<div class="size-208 w-full-ssm">
									<span class="stext-110 cl2"> 가격 </span>
								</div>
								<div class="size-209">
									<input type=text size=65 class="input-sm bor15" name=g_price>
									<!-- <span class="mtext-110 cl2"> $10 </span> -->
								</div>
							</div>

							<div class="flex-w flex-t bor12 p-t-20 p-b-20">
								<div class="size-208 w-full-ssm">
									<span class="stext-110 cl2"> 할인율 </span>
								</div>
								<div class="size-209">
									<input type=text size=65 class="input-sm bor15" name=g_sale>
									<!-- <span class="mtext-110 cl2"> $10 </span> -->
								</div>
							</div>

							<div class="flex-w flex-t bor12 p-t-20 p-b-20">
								<div class="size-208 w-full-ssm">
									<span class="stext-110 cl2"> 배송비 </span>
								</div>
								<div class="size-209">
									<input type=text size=65 class="input-sm bor15" name=g_delivery>
									<!-- <span class="mtext-110 cl2"> $10 </span> -->
								</div>
							</div>

							<div class="flex-w flex-t bor12 p-t-20 p-b-20">
								<div class="size-208 w-full-ssm">
									<span class="stext-110 cl2"> 재고수량 </span>
								</div>
								<div class="size-209">
									<input type=text size=65 class="input-sm bor15" name=g_stock>
									<!-- <span class="mtext-110 cl2"> $10 </span> -->
								</div>
							</div>

							<div class="flex-w flex-t bor12 p-t-20 p-b-20">
								<div class="size-208 w-full-ssm">
									<span class="stext-110 cl2"> 판매 상태 </span>
								</div>
								<div class="size-209">
									<select name="g_status" id="selectStatus">
										<option value="">판매상태</option>
										<option value="1">판매중</option>
										<option value="0">판매중단</option>
									</select>
									<!-- <span class="mtext-110 cl2"> $10 </span> -->
								</div>
							</div>

							<div class="flex-w flex-t bor12 p-t-20 p-b-20">
								<div class="size-208">
									<span class="stext-110 cl2"> 대표이미지 첨부 </span>
								</div>
								<div class="size-209">
									<input type=text size=65 class="input-sm bor15" name=g_image>
									<!-- <span class="mtext-110 cl2"> $89.65 </span> -->
								</div>
							</div>

							<div class="flex-w flex-t bor12 p-t-20 p-b-20">
								<div class="size-208 w-full-ssm">
									<span class="stext-110 cl2"> 상세정보 </span>
								</div>
								<div class="size-209">
									<input type=text size=65 class="input-sm bor15" name=g_detail>
									<!-- <span class="mtext-110 cl2"> $10 </span> -->
								</div>
							</div>

							<div class="flex-w flex-t bor12 p-t-20 p-b-20">
								<div class="size-208 w-full-ssm">
									<span class="stext-110 cl2"> 이벤트 여부 </span>
								</div>
								<div class="row size-209">
									<input type="checkbox" class="input-sm bor15" name="e_id" value="1">
									&nbsp; 인기상품 &nbsp; &nbsp;
									<input type="checkbox" class="input-sm bor15" name="e_id" value="2">
									&nbsp; 추천상품 &nbsp; &nbsp;
									<input type="checkbox" class="input-sm bor15" name="e_id" value="3">
									&nbsp; 할인상품 &nbsp; &nbsp;
									<!-- <span class="mtext-110 cl2"> $10 </span> -->
								</div>
							</div>

							<div class="row">
								<div class="p-t-35 col-md-6">
									<input type=button class="btn flex-c-m stext-101 cl1 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer" value="등록" onclick="subtest()" v-on:click="submittest()">
								</div>
								<div class="p-t-35 col-md-6">
									<input type=button class="btn flex-c-m stext-101 cl1 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer" value="취소" onclick="javascript:history.back()">
								</div>
							</div>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var c_id = "";

		$(function() {
			categoryChange('100', '1000');
		});

		function categoryChange(type, select) {
			$('#good').empty();

			if (type == '001') {
				$('#good').append("<option value='01' >거실형텐트(리빙쉘)</option>'");
				$('#good').append("<option value='02' >면/티피텐트</option>'");
				$('#good').append("<option value='03' >돔/터널형(4인이상)</option>'");
				$('#good')
						.append("<option value='04' >미니멀/백패킹(1~3인)</option>'");
				$('#good').append("<option value='05' >차박텐트</option>'");
				$('#good').append("<option value='06' >이너룸/이너텐트</option>'");
				$('#good').append(
						"<option value='07' >이너매트/그라운드시트/풋프린트</option>'");
				$('#good').append("<option value='08' >카페트/러그</option>'");
			} else if (type == '002') {
				$('#good').append("<option value='01' >렉타타프(사각)</option>'");
				$('#good').append("<option value='02' >헥사/옥타/윙타프</option>'");
				$('#good').append("<option value='03' >쉘터</option>'");
				$('#good').append("<option value='04' >윈드스크린/진막</option>'");
			} else if (type == '003') {
				$('#good').append("<option value='01' >폴대</option>'");
				$('#good').append("<option value='02' >펙/망치</option>'");
				$('#good').append("<option value='03' >스토퍼/스트링/로프</option>'");
			} else if (type == '004') {
				$('#good').append("<option value='01' >스노우피크 IGT</option>'");
				$('#good').append("<option value='02' >캠핑테이블</option>'");
				$('#good').append("<option value='03' >경량테이블</option>'");
				$('#good').append("<option value='04' >폴딩/로우체어</option>'");
				$('#good').append("<option value='05' >경량체어</option>'");
				$('#good').append("<option value='06' >수납/거치대</option>'");
				$('#good').append("<option value='07' >랙소토</option>'");
				$('#good').append("<option value='08' >체어스킨/커버</option>'");
				$('#good').append("<option value='09' >기타용품</option>'");
			} else if (type == '005') {
				$('#good').append("<option value='01' >코트/야전침대</option>'");
				$('#good').append("<option value='02' >자충/에어매트</option>'");
				$('#good').append("<option value='03' >침낭</option>'");
				$('#good').append("<option value='04' >베게/쿠션/방석</option>'");
				$('#good').append("<option value='05' >블랭킷/담요/타월</option>'");
				$('#good').append("<option value='06' >발포/폴딩/패브릭</option>'");
				$('#good').append("<option value='07' >기타용품</option>'");
			} else if (type == '006') {
				$('#good').append("<option value='01' >스토브/버너</option>'");
				$('#good').append("<option value='02' >전기/배터리랜턴</option>'");
				$('#good').append("<option value='03' >가스/오일랜턴</option>'");
				$('#good').append("<option value='04' >헤드랜턴</option>'");
				$('#good').append("<option value='05' >스토브/랜턴용품</option>'");
				$('#good').append("<option value='06' >토치</option>'");
				$('#good').append("<option value='07' >이소가스</option>'");
			} else if (type == '007') {
				$('#good').append("<option value='01' >없음</option>'");
			} else if (type == '008') {
				$('#good').append("<option value='01' >화로대</option>'");
				$('#good').append("<option value='02' >BBQ화로</option>'");
				$('#good').append("<option value='03' >삼각대/앵커</option>'");
				$('#good').append("<option value='04' >그리들/팬</option>'");
				$('#good').append("<option value='05' >그릴/플레이트</option>'");
				$('#good').append("<option value='06' >차콜스타터</option>'");
				$('#good').append("<option value='07' >화로대/BBQ용품</option>'");
				$('#good').append("<option value='08' >수납/케이스</option>'");
			} else if (type == '100') {
				$('#good').append("<option value='1000' >선택해주세요</option>'");
			}

			document.getElementById("good").style.display = "";

			if ($.trim(select) != "") {
				$('#select1').val(type);
				$('#good').val(select);
			}
		}

		function subtest() {
			var adminAdd = document.adminAdd;
			
			c_id = $('#select1').val().concat($('#good').val());
			var gname = $('input[name=g_name]').val();
			var gbrand = $('input[name=g_brand]').val();
			var gprice = $('input[name=g_price]').val();
			var gsale = $('input[name=g_sale]').val();
			var gdelivery = $('input[name=g_delivery]').val();
			var gstock = $('input[name=g_stock]').val();
			var gstatus = $('#selectStatus').val();
			var gimage = $('input[name=g_image]').val();
			
			if (gname == "") {
				$('input[name=g_name]').focus();
				return;
			}else if (gbrand == "") {
				$('input[name=g_brand]').focus();
				return;
			}else if (gprice == "") {
				$('input[name=g_price]').focus();
				return;
			}else if (gsale == "") {
				$('input[name=g_sale]').focus();
				return;
			}else if (gdelivery == "") {
				$('input[name=g_delivery]').focus();
				return;
			}else if (gstock == "") {
				$('input[name=g_stock]').focus();
				return;
			}else if (gimage == "") {
				$('input[name=g_image]').focus();
				return;
			}else if (!$('#selectStatus>option:selected').val()) {
				alert("상태 확인 필요");
				return;
			}
			
			/* const query = 'input[name="e_id"]:checked';
			const selectedEls = document.querySelectorAll(query);
			let eid = '';
			selectedEls.forEach((el) => {
				eid += el.value + '';
			}) */
		}
	</script>

	<!-- ################################################################################################ -->

	<script>
	new Vue({
		el: '#GoodsAdd',
		data:{
			c_id:'',
			gname:'',
			gbrand:'',
			gprice:'',
			gsale:'',
			gdelivery:'',
			gdetail:'',
			gstock:'',
			gstatus:'',
			gimage:'',
			e_id:''
		},
		mounted:function(){
			
		},
		methods:{
			submittest : function() {
				let c_id = $('#select1').val().concat($('#good').val());
				let gname = $('input[name=g_name]').val();
				let gbrand = $('input[name=g_brand]').val();
				let gprice = $('input[name=g_price]').val();
				let gsale = $('input[name=g_sale]').val();
				let gdelivery = $('input[name=g_delivery]').val();
				let gdetail = $('input[name=g_detail]').val();
				let gstock = $('input[name=g_stock]').val();
				let gstatus = $('#selectStatus').val();
				let gimage = $('input[name=g_image]').val();
				
				const query = 'input[name="e_id"]:checked';
				const selectedEls = document.querySelectorAll(query);
				let eid = '';
				selectedEls.forEach((el) => {
					eid += el.value + '';
				})
				
				console.log("======= vue ========")
				console.log("c_id : " + c_id);
				console.log("대분류 : " + $('#select1').val());
				console.log("소분류 : " + $('#good').val());
				console.log("name : " + gname)
				console.log("eid : " + eid);
				console.log("gdetail : " + gdetail);
				console.log("gstatus : " +  gstatus);
				
				axios.post("http://localhost:8080/web/user/goods_add_ok.do",null,{
					params:{
						c_id : this.c_id,
						g_name : this.gname,
						g_brand : this.gbrand,
						g_price : this.gprice,
						g_sale : this.gsale,
						g_image : this.gimage,
						g_detail : this.gdetail,
						//g_delivery : this.gdelivery,
						g_stock : this.gstock,
						g_status : this.gstatus,
						e_id : this.eid
					}
				}).then(res=>{
					location.href='../admin/adlist.do';
				})
				
			}
		}
	})
	
	
	</script>

</body>
</html>