<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<body>
<form action="/" method ="get" id="result1">

<input type="button" id="whole" value="전체" onClick="whole()">
<input type="button" id="resultKitchen" value="주방용품" onClick="kitchen()">
<input type="button" id="resultOffice" value="사무용품" onClick="office()">
<input type="button" id="resultBath" value="욕실용품" onClick="bath()">
<input type="button" id="resultPrice" value="가격순" onClick="price()">						
<input type="button" id="resultOrder" value="주문수량순서" onClick="order()">
<input type="button" id="resultMake" value="제조날짜 순서" onClick="make()">

<table >
	<tr>
		<td>id</td>
		<td>제품번호</td>
		<td>제품명</td>
		<td>제품수량</td>
		<td>주문자 아이디</td>
		<td>주문자 나이</td>
		<td>제품가격</td>
		<td>카테고리</td>
		<td>생산날짜</td>
	</tr>
	
	<c:forEach var="product" items="${products}">
	<tr>
		<td>${product.id}</td>
		<td>${product.make}</td>
		<td>${product.p_name}</td>
		<td>${product.order}</td>
		<td>${product.uid}</td>
		<td>${product.u_age}</td>
		<td>${product.price}</td>
		<td>${product.category}</td>
		<td>${product.createTime}</td>
	</tr>
	</c:forEach>
	</table>
	
	<!-- <div id="result1"></div> -->
	
</form>
</body>
<script>

function whole(){
	$("#resultWhole").click(function(){
			$.ajax({
				method:"GET",
				url:"/",
				success:function(result){
						console.log(result);
						$("#result1").html(result);
					}
				});
		});
	 }

 function kitchen(){
	$("#resultKitchen").click(function(){
			$.ajax({
				method:"GET",
				url:"/1",
				success:function(result){
						console.log(result);
						$("#result1").html(result);
					}
				});
		});
	 }
 function office(){
		$("#resultOffice").click(function(){
				$.ajax({
					method:"GET",
					url:"/2",
					success:function(result){
							console.log(result);
							$("#result1").html(result);
						}
					});
			});
		
		 } 

 function bath(){
		$("#resultBath").click(function(){
				$.ajax({
					method:"GET",
					url:"/3",
					success:function(result){
							console.log(result);
							$("#result1").html(result);
						}
					});
			});
		
		 } 

 function price(){
		$("#resultPrice").click(function(){
				$.ajax({
					method:"GET",
					url:"/pdesc",
					success:function(result){
							
							$("#result1").html(result);
						}
					});
			});
		
		 } 

 function order(){
		$("#resultOrder").click(function(){
				$.ajax({
					method:"GET",
					url:"/odesc",
					success:function(result){
							
							$("#result1").html(result);
						}
					});
			});
		
		 } 
 function make(){
		$("#resultMake").click(function(){
				$.ajax({
					method:"GET",
					url:"/makedesc",
					success:function(result){
							
							$("#result1").html(result);
						}
					});
			});
		
		 } 

</script>
</html>