<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
response.setHeader("Access-Control-Allow-Origin", "*");
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Keys-Core</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/menu.css" rel="stylesheet" />
<link href="css/receipt.css" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<meta
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"
	name="viewport">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<script
	src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@tensorflow-models/speech-commands@0.4.0/dist/speech-commands.min.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />

<style>
/*  overflow scroll ???????????? ????????? */
.receipt::-webkit-scrollbar {
	display: none;
}


</style>

</head>
<body style="background-color: #F2F2F2;">
	
	<!-- Footer-->
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->

	<script type="text/javascript">
   document.querySelectorAll('.cartbutton').forEach(button => button.addEventListener('click', e => {
       if(!button.classList.contains('loading')) {
           button.classList.add('loading');
           setTimeout(() => button.classList.remove('loading'), 3700);
       }
       e.preventDefault();
   }));
   

   const cartButtons = document.querySelectorAll("button.cartbutton");
   cartButtons.forEach((cartButton)=> {
      if(cartButton.value == 0){
      cartButton.disabled = true}
      })
      



   </script>
	<script>var animateButton = function(e) {

	   e.preventDefault;
	   //reset animation
	   e.target.classList.remove('animate');
	   
	   e.target.classList.add('animate');
	   setTimeout(function(){
	     e.target.classList.remove('animate');
	   },700);
	 };

	 var bubblyButtons = document.getElementsByClassName("bubbly-button");

	 for (var i = 0; i < bubblyButtons.length; i++) {
	   bubblyButtons[i].addEventListener('click', animateButton, false);
	 }

	 </script>
	<script>


/*barcode from https://codepen.io/verpixelt/pen/cEJLa*/
 </script>
	<script
		src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

	<script>

function count(type)  {
  // ????????? ????????? element
  
  // ?????? ????????? ????????? ???
  let number = resultElement.innerText;
  // ?????????/??????
  if(type === 'plus') {
    number = parseInt(number) + 1;
  }else if(type === 'minus')  {
	  if(number > 1){
    number = parseInt(number) - 1;
  	}
  }
  
  // ?????? ??????
  resultElement.innerText = number;
  document.querySelector("div.modal-footer").innerHTML = `??? ?????? ?????? : `+${totalPrice}
  document.querySelector("div.modal-footer-1").innerHTML = `?????? ?????? :` + Math.round(parseInt(${totalPrice}) / parseInt(number))

}
	</script>
</body>
</html>