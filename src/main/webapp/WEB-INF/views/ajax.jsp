<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript"
   src="http://code.jquery.com/jquery-3.2.1.min.js"></script>




<script>

var current_type = -1;

function ProductAll(pType){
    $.ajax({
        type: 'get' ,
         url: '/home2' , 
         dataType : 'json' , 
         success: function(data) {
            current_type = pType;
            
            console.log(data);
            $('.product_list').remove(); 
            
            ProductId(data)
      },
      error : function(request, status, error) {
         console.log(err);
        }
});
};
function Kitchen(pType){
    $.ajax({
        type: 'get' ,
         url: '/kitchen' , 
         dataType : 'json' , 
         success: function(data) {
            current_type = pType;
            
            console.log(data);
            $('.product_list').remove(); 
            
            ProductId(data);
      },
      error : function(request, status, error) {
         console.log(err);
       }
});
};
function Digital(pType){
    $.ajax({
        type: 'get' ,
         url: '/digital' , 
         dataType : 'json' , 
         success: function(data) {
            current_type = pType;
            
            console.log(data);
            $('.product_list').remove(); 
            
            ProductId(data);
      },
      error : function(request, status, error) {
         console.log(err);
      }
});
};
function Beauty(pType){
    $.ajax({
        type: 'get' ,
         url: '/beauty' , 
         dataType : 'json' , 
         success: function(data) {
            current_type = pType;
            
            console.log(current_type);
            $('.product_list').remove(); 
            
            ProductId(data);
      },
      error : function(request, status, error) {
         console.log(err);
     }
});
};

function Price(){
    $.ajax({
        type: 'post' ,
         url: '/price' ,
         data: current_type+"", 
         dataType : 'json' ,
         contentType: "text/plain", 
         success: function(data) {
            console.log(current_type);
            $('.product_list').remove(); 
            
            ProductId(data);
      },
      error : function(request, status, error) {
         console.log(err);
    }
});
};

function order(){
    $.ajax({
        type: 'post' ,
         url: '/order' ,
         data: current_type+"", 
         dataType : 'json' ,
         contentType: "text/plain", 
         success: function(data) {
            console.log(current_type);
            $('.product_list').remove(); 
            
            ProductId(data);
      },
      error : function(request, status, error) {
         console.log(err);
   }
});
};


   /* $(function(){ */
      /*  $("#id").click(function(){  */
   /*       function Productid(){
          $.ajax({
              type: 'get' ,
               url: '/pro' , 
               dataType : 'json' , 
               success: function(data) {
                  console.log(data);
                  $('.product_list').remove(); 

                  
                  ProductId(data)
            },
            error : function(request, status, error) {
               console.log(err);
               }
       });
}; */



function ProductId(data){
      for(var d of data){
         var product_list = "<tr class='product_list'><td>"+d.id+"</td><th>"+d.ptype+"</th><th>"+d.pPrice+"</th><th>"+d.pOrder+"</th>";
         console.log(product_list);
         $("#test").before(product_list);
      }
      
      
   }
   
</script>

</head>
<body>


   <!-- <input type="button" id="id" value="ID"> -->



   <!-- <button onclick="ProductAll()" id="id">전체보기</button> -->
   <button onclick="ProductAll(-1)" id="id">전체보기</button>
   <button onclick="Kitchen(0)">주방</button>
   <button onclick="Digital(1)">디지털</button>
   <button onclick="Beauty(2)">화장품</button>
   <button onclick="Price()">가격순</button>
   <button onclick="order()">판매순</button>



   <table>
      <tr>
         <td>id</td>
         <td>type</td>
         <td>price</td>
         <td>order</td>
      </tr>

      <tr id="test"></tr>

      <c:forEach var="product" items="${products}">
         <tr class="product_list">
            <td>${product.id}</td>
            <th>${product.ptype}</th>
            <th>${product.pPrice}</th>
            <th>${product.pOrder}</th>
         </tr>

      </c:forEach>
   </table>

</body>

</html>