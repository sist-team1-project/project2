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
					<h3>상품 수정</h3>
				</div>
			</div>
			<div class="col-lg-12-add flex-m">
				<div class="col-sm-12-add col-md-12 m-lr-auto m-b-50">
					<div class="bor10 p-lr-40 p-t-30 p-b-40 p-lr-0-sm">

						<form method="post" action="goods_update_ok.do">

							<div class="flex-w flex-t bor12 p-b-20">
								<div class="size-208 w-full-ssm">
									<span class="stext-110 cl2"> 카테고리 </span>
								</div>
								<div class="size-209">

									<select name="c_id_1">
										<option value="">직업선택</option>
										<option value="학생">학생</option>
										<option value="회사원">회사원</option>
										<option value="기타">기타</option>
									</select>
									&nbsp;&nbsp;
									<select name="c_id_2">
										<option value="">직업선택</option>
										<option value="학생">학생</option>
										<option value="회사원">회사원</option>
										<option value="기타">기타</option>
									</select>

								</div>
							</div>

							<div class="flex-w flex-t bor12 p-t-20 p-b-20">
								<div class="size-208 w-full-ssm">
									<span class="stext-110 cl2"> 상품명 </span>
								</div>
								<div class="size-209">
									<input type=text size=65 class="input-sm bor15" name=g_name value=" ">
									<input type=hidden name=g_name value="">
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
									<input type=submit class="btn flex-c-m stext-101 cl1 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer" value="저장">
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
</body>
</html>