<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Car"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!--=============== FAVICON ===============-->
<link rel="shortcut icon" href="assets/img/favicon.png"
	type="image/x-icon" class="favicon">

<!--=============== REMIX ICONS ===============-->
<link
	href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css"
	rel="stylesheet">

<!--=============== SWIPER CSS ===============-->
<link rel="stylesheet"
	href="/ShowRoomCar/SuperCarWebsite-main/SuperCarWebsite-main/assets/css/swiper-bundle.min.css">

<!--=============== CSS ===============-->
<link rel="stylesheet"
	href="/ShowRoomCar/SuperCarWebsite-main/SuperCarWebsite-main/assets/css/styles.css">
<link rel="stylesheet"
	href="/ShowRoomCar/SuperCarWebsite-main/SuperCarWebsite-main/assets/css/myCustom.css">
<style type="">
.login-message {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	background: rgba(0, 0, 0, 0.8);
	color: white;
	text-align: center;
	padding: 10px;
	z-index: 9999;
}
/* CSS cho số lượng xe */
.quantity-form {
	display: flex;
	align-items: center;
}

.quantity-btn {
	background-color: #007BFF;
	color: #fff;
	font-size: 18px;
	padding: 5px 10px;
	border: none;
	cursor: pointer;
}

.quantity-btn:hover {
	background-color: #0056b3;
}

.quantity-value {
	font-size: 16px;
	margin: 0 10px;
}

/* CSS để căn giữa số lượng và nút giảm và tăng */
.quantity-btn.minus {
	margin-right: 5px;
}

.quantity-btn.plus {
	margin-left: 5px;
}
/* Định dạng các phần tử <p> chứa thông tin chi tiết */
.car-details {
	margin: 10px 0;
	font-size: 16px;
	text-align: left;
}

/* Định dạng phần tiêu đề (strong) */
.car-details strong {
	font-weight: bold;
}

/* Định dạng các giá trị, ví dụ: 500 horsepower */
.car-details span {
	font-weight: normal;
	color: #007BFF;
}

/* Căn giữa nội dung trong phần tử cha */
.featured__card {
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: center;
}

/* Định dạng nút "Buy" */
.buy-button {
	background-color: #007BFF;
	color: #fff;
	font-size: 18px;
	padding: 10px 20px;
	text-decoration: none;
}

.buy-button:hover {
	background-color: #0056b3;
}
/* Để căn giữa phần "Infor Car" */
.featured {
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: center;
}

/* Để định dạng kiểu chữ màu đen */
.featured__title, .featured__subtitle, .featured__price, .car-details strong,
	.car-details span {
	color: #fff;
}
</style>
<title>Super car</title>
</head>

<body>
	<!--==================== HEADER ====================-->
	<header class="header" id="header">

		<nav class="nav container">
			<a href="/ShowRoomCar/LoadCarsLogout" class="nav__logo"> <i
				class="ri-steering-fill"></i> NextCar
			</a>
			<div class="nav__menu" id="nav-menu">
				<ul class="nav__list">
					<li class="nav__item"><a href="/ShowRoomCar/LoadCarsLogout"
						class="nav__link active-link">Home</a></li>
					<li class="nav__item"><a href="#about" class="nav__link ">About</a>
					</li>
					<li class="nav__item"><a href="#featured" class="nav__link">Super
							Cars</a></li>
					<li class="nav__item"><a href="#featured" class="nav__link">Featured</a>
					</li>
					<%
					String userName = (String) session.getAttribute("userName");
					if (userName != null) {
					%>
					<a
						href="/ShowRoomCar/FullInforUser?userName=<%=userName%>" name="userName"><p>
							<%=userName%></p></a>
					<%-- Hiển thị tên người dùng thay vì thẻ đăng nhập --%>
					<%
					} else {
					%>
					<li class="nav__item"><a
						href="/ShowRoomCar/SuperCarWebsite-main/SuperCarWebsite-main/inforCar/layoutWeb/Login.jsp"
						class="nav__link">Login</a></li>
					<%
					}
					%>
					<li class="nav__item"><a
						href="/ShowRoomCar/SuperCarWebsite-main/SuperCarWebsite-main/user/index.jsp"
						class="nav__link">Logout</a></li>
					<li class="nav__item"><a
						href="/ShowRoomCar/YourCart?userName=<%=userName%>"
						class="nav__link"><i class="fa-solid fa-cart-shopping"></i>
							Cart</a></li>
					<li class="nav__item"><a
						href="/ShowRoomCar/History?userName=<%=userName%>"
						class="nav__link"> Purchase History </a></li>

				</ul>

				<div class="nav__close" id="nav-close">
					<i class="ri-close-line"></i>
				</div>
			</div>

			<!-- Togglar Button -->
			<div class="nav__toggle" id="nav-toggle">
				<i class="ri-menu-line"></i>
			</div>

		</nav>
	</header>

	<!--************* MAIN CODE ****************-->


	<!--==================== FEATURED ====================-->
	<c:if test="${not empty carList}">
		<section class="featured section" id="featured" style="">
			<h2 class="section__title">Infor Car</h2>
			<div class="featured__container container">
				<div class="featured__content grid">
					<c:forEach var="car" items="${carList}">
						<article
							class="featured__card mix ${car.getBrand().toLowerCase()}">
							<div class="shape shape__smaller"></div>
							<h1 class="featured__title">${car.getBrand()}</h1>
							<a href="/ShowRoomCar/InforCar?carId=${car.id}">
								<h3 class="featured__subtitle">${car.getModel()}</h3>
							</a> <img
								src="/ShowRoomCar/SuperCarWebsite-main/SuperCarWebsite-main/assets/img/${car.imageUrl}"
								alt="" class="featured__img">
							<h3 class="featured__price">$${car.price}</h3>
							<p class="car-details">
								<strong>MaxHorsepower:</strong> <span>${car.maxHorsepower}
									horsepower</span>
							</p>
							<p class="car-details">
								<strong>TopSpeed:</strong> <span>Over ${car.topSpeed} mph</span>
							</p>
							<p class="car-details">
								<strong>Acceleration:</strong> <span>0-60 mph in under
									${car.acceleration} seconds</span>
							</p>
							<a
								href="/ShowRoomCar/Cart?carId=${car.id}&userName=<%=userName%>"
								class="button featured__button"> <i
								class="ri-shopping-bag-2-line"></i>
							</a>
						</article>
					</c:forEach>
				</div>
			</div>
		</section>
	</c:if>

	<c:if test="${empty carList}">
		<p>No data available.</p>
	</c:if>






	<!--==================== OFFER ====================-->
	<section class="offer section">

		<div class="offer__container container grid">

			<img
				src="/ShowRoomCar/SuperCarWebsite-main/SuperCarWebsite-main/assets/img/offer-bg.png"
				alt="" class="offer__bg">

			<div class="offer__data">
				<h2 class="section__title offer__title">
					Do You Want To Receive <br> Special Offers?
				</h2>

				<p class="offer__description">Be the first to receive all the
					information about our products and new cars by email by subscribing
					to our mailing list.</p>

				<a href="#" class="button">Subscribe Now</a>
			</div>

			<img
				src="/ShowRoomCar/SuperCarWebsite-main/SuperCarWebsite-main/assets/img/offer.png"
				alt="" class="offer__img">

		</div>

	</section>

	<!--==================== LOGOS ====================-->
	<section class="logos section">
		<div class="logos__container container grid">
			<div class="logos__content">
				<img
					src="/ShowRoomCar/SuperCarWebsite-main/SuperCarWebsite-main/assets/img/logo1.png"
					alt="" class="logos__img">
			</div>
			<div class="logos__content">
				<img
					src="/ShowRoomCar/SuperCarWebsite-main/SuperCarWebsite-main/assets/img/logo6.png"
					alt="" class="logos__img">
			</div>
			<div class="logos__content">
				<img
					src="/ShowRoomCar/SuperCarWebsite-main/SuperCarWebsite-main/assets/img/logo5.png"
					alt="" class="logos__img">
			</div>
			<div class="logos__content">
				<img
					src="/ShowRoomCar/SuperCarWebsite-main/SuperCarWebsite-main/assets/img/logo4.png"
					alt="" class="logos__img">
			</div>
			<div class="logos__content">
				<img
					src="/ShowRoomCar/SuperCarWebsite-main/SuperCarWebsite-main/assets/img/logo3.png"
					alt="" class="logos__img">
			</div>
			<div class="logos__content">
				<img
					src="/ShowRoomCar/SuperCarWebsite-main/SuperCarWebsite-main/assets/img/logo2.png"
					alt="" class="logos__img">
			</div>

		</div>



	</section>
	</main>

	<!--==================== FOOTER ====================-->
	<footer class="footer section">
		<div class="shapeX shape__big"></div>
		<div class="shapeX shape__small"></div>

		<div class="footer__container container grid">
			<div class="footer__content">
				<a href="#" class="footer__logo"> <i class="ri-steering-line"></i>
					NextCar
				</a>
				<p class="footer__description">
					We offer the best cars of <br> the most recognized brands in <br>
					the world.
				</p>
			</div>


			<div class="footer__content">

				<h3 class="footer__title">Company</h3>

				<ul class="footer__links">
					<li><a href="#" class="footer__links">About</a></li>
					<li><a href="#" class="footer__links">Cars</a></li>
					<li><a href="#" class="footer__links">History</a></li>
					<li><a href="#" class="footer__links">Shop</a></li>
					<li><a href="#" class="footer__links"></a></li>
				</ul>
			</div>

			<div class="footer__content">
				<h3 class="footer__title">Information</h3>
				<ul class="footer__links">
					<li><a href="#" class="footer__links">Request a quote</a></li>
					<li><a href="#" class="footer__links">Find a dealer</a></li>
					<li><a href="#" class="footer__links">Contact us</a></li>
					<li><a href="#" class="footer__links">Services</a></li>

				</ul>
			</div>

			<div class="footer__content">
				<h3 class="footer__title">Follow us</h3>

				<ul class="footer__social">
					<a href="" target="_blank" class="footer__social-link"> <i
						class="ri-facebook-fill"></i>
					</a>
					<a href="" target="_blank" class="footer__social-link"> <i
						class="ri-instagram-line"></i>
					</a>
					<a href="" target="_blank" class="footer__social-link"> <i
						class="ri-twitter-line"></i>
					</a>
				</ul>
			</div>
		</div>
		<span class="footer__copy"> &#169; <a target="_blank"
			href="abdullahmoin.web.app" class="footer__dev-link">abdullah-moin.</a>
			All rigths reserved
			<p id="date"></p>
		</span>
	</footer>

	<div id="login-message" class="login-message">You need to log in
		to see more detailed information</div>

	<!--========== SCROLL UP ==========-->

	<a href="" class="scrollup" id="scroll-up"> <i
		class="ri-arrow-up-s-line"></i>
	</a>

	<script>
		// Hàm để lưu trạng thái thời gian vào cookie
		function setCookie(name, value, minutes) {
			var date = new Date();
			date.setTime(date.getTime() + minutes * 60 * 1000);
			var expires = "expires=" + date.toUTCString();
			document.cookie = name + "=" + value + ";" + expires + ";path=/";
		}

		// Hàm để kiểm tra thời gian và xóa dữ liệu nếu cần
		function checkAndClearCart() {
			// Kiểm tra xem cookie "lastAction" có tồn tại
			var lastAction = getCookie("lastAction");
			if (lastAction) {
				var currentTime = new Date().getTime();
				var lastActionTime = parseInt(lastAction);
				var elapsedMinutes = (currentTime - lastActionTime)
						/ (1000 * 60);

				if (elapsedMinutes >= 5) {
					// Nếu đã qua 5 phút, xóa dữ liệu trong giỏ hàng
					clearCart();
				}
			}

			// Cập nhật cookie "lastAction" với thời gian hiện tại
			setCookie("lastAction", new Date().getTime(), 5);
		}

		// Hàm để xóa dữ liệu trong giỏ hàng
		function clearCart() {
			// Xóa dữ liệu trong giỏ hàng (có thể gửi yêu cầu tới máy chủ để xóa hoặc xóa trên máy chủ)
			// Sau đó, làm mới trang hoặc hiển thị thông báo
			document.location.reload();
		}

		// Hàm để lấy giá trị cookie
		function getCookie(name) {
			var cookieName = name + "=";
			var cookies = document.cookie.split(';');
			for (var i = 0; i < cookies.length; i++) {
				var cookie = cookies[i].trim();
				if (cookie.indexOf(cookieName) === 0) {
					return cookie.substring(cookieName.length, cookie.length);
				}
			}
			return null;
		}
		// Kiểm tra và xóa dữ liệu trong giỏ hàng khi trang web được tải
		checkAndClearCart();
	</script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							$(".quantity-btn")
									.click(
											function() {
												var carId = $(this).siblings(
														"input[name='carId']")
														.val();
												var action = $(this).data(
														"action");

												$
														.ajax({
															type : "POST",
															url : "/ShowRoomCar/UpdateCartQuantity",
															data : {
																carId : carId,
																action : action
															},
															success : function(
																	response) {
																var quantityElement = $("#quantity-"
																		+ carId);
																var currentQuantity = parseInt(quantityElement
																		.text()
																		.split(
																				":")[1]
																		.trim());

																if (action === "increment") {
																	currentQuantity++;
																} else if (action === "decrement"
																		&& currentQuantity > 0) {
																	currentQuantity--;
																}

																quantityElement
																		.text("Quantity: "
																				+ currentQuantity);
															},
															error : function() {
																alert("Failed to update quantity.");
															}
														});
											});
						});
	</script>






	<!--=============== SCROLL REVEAL - PAGE ANNIMATION ===============-->
	<script
		src="/ShowRoomCar/SuperCarWebsite-main/SuperCarWebsite-main/assets/js/scrollrevealAnimation.min.js"></script>

	<!--=============== SWIPER JS - PRODUCT SLIDER ===============-->
	<script
		src="/ShowRoomCar/SuperCarWebsite-main/SuperCarWebsite-main/assets/js/swiper-bundle.min.js"></script>

	<!--=============== MIXITUP JS - FILTER PRODUCT ===============-->
	<script
		src="/ShowRoomCar/SuperCarWebsite-main/SuperCarWebsite-main/assets/js/mixitup.min.js"></script>

	<!--=============== MAIN JS ===============-->
	<script
		src="/ShowRoomCar/SuperCarWebsite-main/SuperCarWebsite-main/assets/js/main.js"></script>



</body>



</html>