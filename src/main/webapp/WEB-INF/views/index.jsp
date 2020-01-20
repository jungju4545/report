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
</body>
</html>