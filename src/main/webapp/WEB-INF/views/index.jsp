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
<form action="/" method ="get" >

<input type="button" id="resultWhole" value="전체" >
<input type="button" id="resultKitchen" value="주방용품" ">
<input type="button" id="resultOffice" value="사무용품" >
<input type="button" id="resultBath" value="욕실용품" >
<input type="button" id="resultPrice" value="가격순">						
<input type="button" id="resultOrder" value="주문수량순서" >
<input type="button" id="resultMake" value="제조날짜 순서" >
<!-- onClick이벤트가 들어가면 한번 클릭으로 이벤트가 발생하지 않는다 
        그래서 $(선택자).click(function(){})를 이용하면 한번 클릭으로 이벤트를 발생시킬 수 있다.-->

<table class="origin-table">
<thead>
	<tr >
		<td>id</td>
		<td>제품번호</td>
		<td>제품명</td>
		<td>제품수량</td>
		<td>주문자 아이디</td>
		<td>주문자 나이</td>
		<td>제품가격</td>
		<td>카테고리</td>
		<td>제조날짜</td>
	</tr>
</thead>

<tbody class="origin-tbody">
	<c:forEach var="product" items="${products}">
	<tr >
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
</tbody>	
	</table>
	
	<!-- <div id="result1"></div> -->
	
</form>
</body>
<script>

$("#resultWhole").click(function(){
	$.ajax({
		method:"GET",
		url:"/whole",
		dateType:'json',
		success:function(data){
				
			$(".origin-tbody").remove();
			$(".new-tbody").remove();
				// $(".new-tbody").remove(); 안붙이면 클릭할때마다 계속 늘어난다.
				// 그래서 클릭시 만들더진 new-tbody는 제거가 된 후 다시 만들어져야 한다.
				//선택자는 여기$newTbody=$("<tbody class='new-tbody'></tbody>")에서 설정한 new-tbody이다.

			$newTbody=$("<tbody class='new-tbody'></tbody>");
			$(".origin-table").append($newTbody)

			for(let list of data){
					let $newRow=$(
							"<tr>"+
							   "<td>"+list.id+"</td>"+
							   "<td>"+list.make+"</td>"+
								"<td>"+list.p_name+"</td>"+
								"<td>"+list.order+"</td>"+
								"<td>"+list.uid+"</td>"+
								"<td>"+list.u_age+"</td>"+
								"<td>"+list.price+"</td>"+
								"<td>"+list.category+"</td>"+
								"<td>"+list.createTime+"</td>"+
								"</tr>"
							);
					$newTbody.append($newRow);
				} 
			
			},error:function(){
			alert("error");
				}
	});
});

$("#resultKitchen").click(function(){
	$.ajax({
		method:"GET",
		url:"/1",
		dateType:'json',
		success:function(data){

			createTable(data);
		/* 	$(".origin-tbody").remove();
			$(".new-tbody").remove();
				// $(".new-tbody").remove(); 안붙이면 클릭할때마다 계속 늘어난다.
				// 그래서 클릭시 만들더진 new-tbody는 제거가 된 후 다시 만들어져야 한다.

			$newTbody=$("<tbody class='new-tbody'></tbody>");
			$(".origin-table").append($newTbody)

			for(let list of data){
					let $newRow=$(
							"<tr>"+
							   "<td>"+list.id+"</td>"+
							   "<td>"+list.make+"</td>"+
								"<td>"+list.p_name+"</td>"+
								"<td>"+list.order+"</td>"+
								"<td>"+list.uid+"</td>"+
								"<td>"+list.u_age+"</td>"+
								"<td>"+list.price+"</td>"+
								"<td>"+list.category+"</td>"+
								"<td>"+list.createTime+"</td>"+
								"</tr>"
							);
					$newTbody.append($newRow);
				}    이 패턴이 반복되는데 이걸 함수로 만들면 좀 더 간단하게 작성을 할 수 있다. */


			
			},
			error:function(){
				alert("error");
				}
	});
});

 $("#resultOffice").click(function(){
	$.ajax({
		method:"GET",
		url:"/2",
		dateType:'json',
		success:function(data){

			createTable(data);
		}
	});
});

$("#resultBath").click(function(){
	$.ajax({
		method:"GET",
		url:"/3",
		dateType:'json',
		success:function(data){

			$(".origin-tbody").remove();
			$(".new-tbody").remove();
			$newTbody=$("<tbody class='new-tbody'></tbody>");
			$(".origin-table").append($newTbody)

			for(let list of data){
					let $newRow=$(
							"<tr>"+
							   "<td>"+list.id+"</td>"+
							   "<td>"+list.make+"</td>"+
								"<td>"+list.p_name+"</td>"+
								"<td>"+list.order+"</td>"+
								"<td>"+list.uid+"</td>"+
								"<td>"+list.u_age+"</td>"+
								"<td>"+list.price+"</td>"+
								"<td>"+list.category+"</td>"+
								"<td>"+list.createTime+"</td>"+
								"</tr>"
							);
					$newTbody.append($newRow);
				}
		

			
			},
			error:function(){
				alert("error");
				}
	});
});
///////////////가격순서/////////////
var count=0;
$("#resultPrice").click(function(){
count++;
	if(count%2==1){
	$.ajax({
		method:"GET",
		url:"/pdesc",
		dateType:'json',
		success:function(data){
			createTable(data);
		  },
			error:function(){
				alert("error");
				}
	   });
			
	} // 클릭 한번하면 내림차순
	
	else{
			$.ajax({
				method:"GET",
				url:"/pasc",
				dateType:'json',
				success:function(data){

					createTable(data);

			},
			error:function(){
				alert("error");
				}
	
		});
	}//한번 더 하면 오름차순 >> 반복
	
});

$("#resultOrder").click(function(){
	count++;
	if(count%2==1){
	$.ajax({
		method:"GET",
		url:"/odesc",
		dateType:'json',
		success:function(data){
			createTable(data);
		  },
			error:function(){
				alert("error");
				}
	   });
			
	} // 클릭 한번하면 내림차순
	
	else{
			$.ajax({
				method:"GET",
				url:"/oasc",
				dateType:'json',
				success:function(data){

					createTable(data);

			},
			error:function(){
				alert("error");
				}
	
		});
	}//한번 더 하면 오름차순 >> 반복
	
});


$("#resultMake").click(function(){
	count++;
	if(count%2==1){
	$.ajax({
		method:"GET",
		url:"/makedesc",
		dateType:'json',
		success:function(data){
			createTable(data);
		  },
			error:function(){
				alert("error");
				}
	   });
	} // 클릭 한번하면 내림차순
	else{
			$.ajax({
				method:"GET",
				url:"/makeasc",
				dateType:'json',
				success:function(data){
					createTable(data);
			},
			error:function(){
				alert("error");
				}
		});
	}//한번 더 하면 오름차순 >> 반복
	
});

function createTable(data){
	$(".origin-tbody").remove();
	$(".new-tbody").remove();
	$newTbody=$("<tbody class='new-tbody'></tbody>");
	$(".origin-table").append($newTbody)

	for(let list of data){
			let $newRow=$(
					"<tr>"+
					   "<td>"+list.id+"</td>"+
					   "<td>"+list.make+"</td>"+
						"<td>"+list.p_name+"</td>"+
						"<td>"+list.order+"</td>"+
						"<td>"+list.uid+"</td>"+
						"<td>"+list.u_age+"</td>"+
						"<td>"+list.price+"</td>"+
						"<td>"+list.category+"</td>"+
						"<td>"+list.createTime+"</td>"+
						"</tr>"
					);
			$newTbody.append($newRow);
		}
}

</script>
</html>