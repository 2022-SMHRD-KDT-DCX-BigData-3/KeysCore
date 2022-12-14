<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
response.setHeader("Access-Control-Allow-Origin", "*");
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Keys-Core</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/menu.css" rel="stylesheet" />
<link href="css/receipt.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@tensorflow-models/speech-commands@0.4.0/dist/speech-commands.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />
<link rel="stylesheet" href="@sweetalert2/theme-wordpress-admin/wordpress-admin.css">
<script src="sweetalert2/dist/sweetalert2.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="js/manager.js"></script>

<style>
/*  overflow scroll ???????????? ????????? */
.receipt::-webkit-scrollbar {
	display: none;
}

.receipt {
	overflow: scroll;
}
</style>

</head>
<body style="background-color: #F2F2F2;">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="/manager">????????? ?????????</a>
		</div>
	</nav>
	<!-- Header-->
	<!-- Section-->
	<div class="bgbg" style="display: inline-block;">
		<section class="py-6" style="float: right; width: 22%; height: 702px;">
			<div style="width: 130px"></div>
		</section>
		<section class="py-6" style="float: left; width: 14.8%; height: 702px;">
			<div class="container px-4 px-lg-5 mt-5">

				<div class="col mb-6">
					<form action="/stockreset" method="post">
						<div class="card h-100">
							<input type="submit" class="btn1 btn-outline-dark mt-auto" value="?????? ??????" onclick="stock_reset()">
						</div>
					</form>
				</div>
				<div class="col mb-6">
					<div class="card h-100">
						<a class="btn1 btn-outline-dark mt-auto" href="/manager">?????? ??????</a>
					</div>
				</div>
				<form method="get" id="rform" onsubmit="return false;">
					<div class="col mb-6">
						<div class="card h-100">
							<a class="btn1 btn-outline-dark mt-auto" href="#" onclick="payment();">?????? ??????</a>
						</div>
					</div>
				</form>
			</div>
		</section>
		<section class="py-6" style="float: right; width: 63.2%; height: 702px;">
			<div style="width: 770px">
				<!-- receipt -->
				<section class="py-6">
					<div class="container">
						<div class="tab"></div>
						<div class="paid">
							<p>????????? ?????????</p>
							<p>?????????????????? ???????????????.</p>
						</div>
						<div class="receipt">
							<div class="paper">
								<div class="date" style="font-size: 15px;">${receiptList[0].receipt_date}</div>
								<div class="title">
									<span class="title1">????????????</span>
								</div>
								<table style="font-size: 18px;">
									<tbody>
								<colgroup>
										<col>
										<col>
										<col>
										<col>
									</colgroup>
									<tr>
										<th style="position: relative; right: 80px; top: 15px">??????</th>
										<th style="position: relative; top: 15px">??????</th>
										<th style="position: relative; left: 70px; top: 15px">??????</th>
										<th style="position: relative; left: 120px; top: 15px">??????</th>
								</tr>
									<c:forEach var="rl" items="${receiptList}">
										<tr>
											<td style="position: relative; right: 95px; top: 20px">${rl.menu_name}</td>
											<td class="right" style="position: relative; top: 20px; right: 10px"><span class="price">${rl.menu_price}</span></td>
											<td style="position: relative; left: 74px; top: 20px">${rl.order_cnt}</td>
											<td style="position: relative; left: 110px; top: 20px"><span class="price">${rl.order_cnt*rl.menu_price}</span></td>
											<c:set var="sum" value="${sum+(rl.menu_price*rl.order_cnt)}" />
										</tr>
									</c:forEach>
									</tbody>
								</table>
								<footer style="margin-top: 20px;">
									<dl class="info">
										<div class="total">
											<h2>
												?????? &nbsp; :&nbsp;
												<span class="price" id="sumhere">${sum}???</span>
										</div>
									</dl>
									<tr>
										<td colspan="2" class="center"><input type="button" value="??????" onClick="pay()" /></td>
									</tr>
								</footer>
								<br> <br>
							</div>
						</div>
					</div>
				</section>
			</div>


		</section>
	</div>
	<div id="formContainer" style="display: none">
		<input name="id" value="1" /> <input name="menu" /> <input name="count" />
	</div>
	<!-- Footer-->
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
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
	<script src="js/ordering.js"></script>
	<script>
  function pay()
{
  $(".receipt").slideUp("slow");
  $(".paid").slideDown("slow");
}

/*barcode from https://codepen.io/verpixelt/pen/cEJLa*/
 </script>
</body>
</html>