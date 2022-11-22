<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>Start-Screen</title>

<!-- Bootstrap Icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/index.css" rel="stylesheet" />



</head>
<body id="page-top">
<<<<<<< HEAD


	</div>
	<!-- Navigation-->
=======
	<!-- 로고헤더-->
>>>>>>> branch 'master' of https://github.com/2022-SMHRD-KDT-DCX-BigData-3/KeysCore.git
	<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
		<div class="container px-4 px-lg-5">
			<a href="/" class="navbar-brand"><img src="assets/index/logo.png" height="70" width="200"></a>
		</div>
	</nav>
	<!-- 간판-->
	<header class="masthead">
		<div class="container px-4 px-lg-5 h-100">
			<div class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center">
				<div class="col-lg-8 align-self-end">
					<h1 class="text-white font-weight-bold">키코네 맥주</h1>
					<hr class="divider" />
				</div>
				<div class="col-lg-8 align-self-baseline">
					<p class="text-white-75 mb-5">
						<!-- 마이크 아이콘 -->
						<i style="font-size: 40px;" class="bi bi-mic"></i>
					<ul class="music">
						<!-- 음성막대 효과 -->
						<c:forEach var="i" begin="1" end="17">
							<li id="bar${i}"></li>
						</c:forEach>
					</ul>
					</p>

					<!-- 안내문 -->
					<p style="color: white">
						1. "하이키코"를 부릅니다. <br>2. "메인 메뉴 보여줘" 라고 카테고리를 말합니다.<br> 3. "생맥주 2잔이랑 바지락 술국 주문해줘" 라고 주문사항을 말합니다.<br> <br> <br>
					</p>
					<!-- 터치주문 버튼 -->
					<a class="btn btn-primary btn-xl" href="menu">터치로 주문하기</a>

				</div>
			</div>
		</div>
	</header>
	
<div id="formContainer" style="display:none">
</div>


	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- SimpleLightbox plugin JS-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
	

	<script type="module" src="/js/listen.js"></script>

</body>
</html>