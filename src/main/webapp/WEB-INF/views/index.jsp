<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/" method ="get">

<input type="button" value="주방용품" onClick="kitchin()">
<input type="button" value="사무용품" onClick="office()">
<input type="button" value="욕실용품" onClick="bath()">
<input type="button" value="가격순" onClick="price()">						
<input type="button" value="주문수량순서" onClick="order()">

<table>
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
		<td>${product.pid}</td>
		<td>${product.p_name}</td>
		<td>${product.p_order}</td>
		<td>${product.uid}</td>
		<td>${product.u_age}</td>
		<td>${product.p_prise}</td>
		<td>${product.p_type}</td>
		<td>${product.createTime}</td>
	</tr>
	</c:forEach>
	</table>
</form>
</body>
<script>
function kitchin(){
	var xhttp = new XMLHttpRequest();
	xhttp.open("GET","http://localhost:8000/category",true);
	
	
}


</script>
</html>