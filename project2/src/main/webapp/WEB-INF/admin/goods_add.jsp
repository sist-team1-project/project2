<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

						<form method="post" action="goods_add_ok.do">

							<div class="flex-w flex-t bor12 p-b-20">
								<div class="size-208 w-full-ssm">
									<span class="stext-110 cl2"> 카테고리 </span>
								</div>
								<div class="size-209">

									<select name="c_id_1" onchange="categoryChange(this)">
										<option>카테고리 대분류</option>
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
									<select id="good" name="c_id_2">
										<option value="c_id">카테고리 소분류</option>
									</select>

								</div>
							</div>

							<div class="flex-w flex-t bor12 p-t-20 p-b-20">
								<div class="size-208 w-full-ssm">
									<span class="stext-110 cl2"> 상품명 </span>
								</div>
								<div class="size-209">
									<input type=text size=65 class="input-sm bor15" name=g_name value=" g_name">
									<!-- <span class="mtext-110 cl2"> $10 </span> -->
								</div>
							</div>

							<div class="flex-w flex-t bor12 p-t-20 p-b-20">
								<div class="size-208 w-full-ssm">
									<span class="stext-110 cl2"> 브랜드 </span>
								</div>
								<div class="size-209">
									<input type=text size=65 class="input-sm bor15" name=g_brand value=" g_brand">
									<!-- <span class="mtext-110 cl2"> $10 </span> -->
								</div>
							</div>

							<div class="flex-w flex-t bor12 p-t-20 p-b-20">
								<div class="size-208 w-full-ssm">
									<span class="stext-110 cl2"> 가격 </span>
								</div>
								<div class="size-209">
									<input type=text size=65 class="input-sm bor15" name=g_price value=" g_price">
									<!-- <span class="mtext-110 cl2"> $10 </span> -->
								</div>
							</div>

							<div class="flex-w flex-t bor12 p-t-20 p-b-20">
								<div class="size-208 w-full-ssm">
									<span class="stext-110 cl2"> 할인율 </span>
								</div>
								<div class="size-209">
									<input type=text size=65 class="input-sm bor15" name=g_sale value=" g_sale">
									<!-- <span class="mtext-110 cl2"> $10 </span> -->
								</div>
							</div>

							<div class="flex-w flex-t bor12 p-t-20 p-b-20">
								<div class="size-208 w-full-ssm">
									<span class="stext-110 cl2"> 배송비 </span>
								</div>
								<div class="size-209">
									<input type=text size=65 class="input-sm bor15" name=g_name value=" g_name">
									<!-- <span class="mtext-110 cl2"> $10 </span> -->
								</div>
							</div>

							<div class="flex-w flex-t bor12 p-t-20 p-b-20">
								<div class="size-208 w-full-ssm">
									<span class="stext-110 cl2"> 재고수량 </span>
								</div>
								<div class="size-209">
									<input type=text size=65 class="input-sm bor15" name=g_stock value=" g_stock">
									<!-- <span class="mtext-110 cl2"> $10 </span> -->
								</div>
							</div>

							<div class="flex-w flex-t bor12 p-t-20 p-b-20">
								<div class="size-208 w-full-ssm">
									<span class="stext-110 cl2"> 판매 상태 </span>
								</div>
								<div class="size-209">
									<select name="c_id_2">
										<option value="">판매상태</option>
										<option value="학생">판매중</option>
										<option value="회사원">판매중단</option>
									</select>
									<!-- <span class="mtext-110 cl2"> $10 </span> -->
								</div>
							</div>

							<div class="flex-w flex-t bor12 p-t-20 p-b-20">
								<div class="size-208">
									<span class="stext-110 cl2"> 대표이미지 첨부 </span>
								</div>
								<div class="size-209">
									<input type=text size=65 class="input-sm bor15" name=g_image value=" g_image">
									<!-- <span class="mtext-110 cl2"> $89.65 </span> -->
								</div>
							</div>

							<div class="flex-w flex-t bor12 p-t-20 p-b-20">
								<div class="size-208 w-full-ssm">
									<span class="stext-110 cl2"> 상세정보 </span>
								</div>
								<div class="size-209">
									<input type=text size=65 class="input-sm bor15" name=g_detail value=" g_detail">
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
									<input type=submit class="btn flex-c-m stext-101 cl1 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer" value="등록">
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
		function categoryChange(e) {
			var good_a = [ "거실형텐트(리빙쉘)", "면/티피텐트", "돔/터널형(4인이상)", "미니멀/백패킹(1~3인)", "차박텐트", "이너룸/이너텐트", "이너매트/그라운드시트/풋프린트", "카페트/러그" ];
			var good_b = [ "렉타타프(사각)", "헥사/옥타/윙타프", "쉘터", "윈드스크린/진막"];
			var good_c = [ "01", "02", "03"];
			var good_d = [ "01", "02", "03", "04", "05", "06", "07", "08", "09" ];
			var good_e = [ "01", "02", "03", "04", "05", "06", "07"];
			var good_f = [ "01", "02", "03", "04", "05", "06", "07"];
			var good_f = [];
			var good_g = [ "01", "02", "03", "04", "05", "06", "07", "08" ];
			var target = document.getElementById("good");

			if (e.value == "001")
				var d = good_a;
			else if (e.value == "002")
				var d = good_b;
			else if (e.value == "003")
				var d = good_c;
			else if (e.value == "004")
				var d = good_d;
			else if (e.value == "005")
				var d = good_e;
			else if (e.value == "006")
				var d = good_f;
			else if (e.value == "007")
				var d = good_g;
			else if (e.value == "008")
				var d = good_h;

			target.options.length = 0;

			for (x in d) {
				var opt = document.createElement("option");
				opt.value = d[x];
				opt.innerHTML = d[x];
				target.appendChild(opt);
			}
		}
	</script>
</body>
</html>