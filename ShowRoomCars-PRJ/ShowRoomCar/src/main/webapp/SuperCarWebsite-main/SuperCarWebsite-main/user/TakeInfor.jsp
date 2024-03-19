<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Car"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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

<title>Super car</title>
<style type="">
/* Add this CSS code to your stylesheet */

/* Style the container */
/* Style the form container */
.enter-infor-car__container {
	background-color: #f8f8f8;
	/* Update with your preferred background color */
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Add a subtle shadow */
}

/* Style the section title */
.enter-infor-car__title {
	color: #333;
	font-size: 28px;
	margin-bottom: 20px;
}

/* Style the section description */
.enter-infor-car__description {
	color: #666;
	font-size: 16px;
	margin-bottom: 30px;
	text-align: center;
}

/* Style the form */
.enter-infor-car__form {
	display: grid;
	gap: 20px;
}

/* Style the form labels and input boxes */
.enter-infor-car__form div {
	margin-bottom: 20px;
}

label {
	display: block;
	font-size: 18px;
	color: #333;
	margin-bottom: 8px;
}

input {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
	transition: border-color 0.2s;
}

input:focus {
	border-color: #007BFF;
}

/* Style the submit button */
button.enter-infor-car__button {
	background-color: #007BFF;
	color: #fff;
	border: none;
	padding: 14px 24px;
	font-size: 18px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
}

button.enter-infor-car__button:hover {
	background-color: #0056b3;
}

/* Style the "Add Information" button */
.enter-infor-car__button.add-info {
	background-color: #28a745;
}

.enter-infor-car__button.add-info:hover {
	background-color: #218838;
}
/* Style the "Add Information" button */
.enter-infor-car__button {
	display: inline-block;
	background-color: #28a745; /* Green color */
	color: #fff; /* Text color */
	padding: 14px 414px;
	font-size: 18px;
	border-radius: 5px;
	text-decoration: none;
	transition: background-color 0.3s;
}

.enter-infor-car__button:hover {
	background-color: #218838; /* Darker green color on hover */
}
</style>
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
					<a href="/ShowRoomCar/FullInforUser?userName=<%=userName%>"
						name="userName"><p>
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


	<!--==================== ENTER INFOMATION CAR ====================-->
	<section class="enter-infor-car section" id="enter-infor-car">
		<div class="enter-infor-car__container container grid">
			<div class="enter-infor-car__data">
				<h2 class="section__title enter-infor-car__title">Enter User
					Information</h2>
				<p class="enter-infor-car__description">Enter the details of the
					user you want to add to the system.</p>




				<form action="${pageContext.request.contextPath}/CheckInsertUser"
					method="post" class="enter-infor-car__form">
					<%-- <input type="hidden" id="carId" name="carId" value="${carId}">
					<input type="hidden" id="userName" name="userName"
						value="${userName}"> <input type="hidden"
						id="currentQuantity" name="currentQuantity"
						value="${currentQuantity}"> <input type="hidden"
						id="brand" name="brand" value="${brand}"> <input
						type="hidden" id="model" name="model" value="${model}"> <input
						type="hidden" id="price" name="price" value="${price}"> <input
						type="hidden" id="imageUrl" name="imageUrl" value="${imageUrl}"> --%>

					<div>
						<label for="fullName">Full Name:</label> <input type="text"
							id="fullName" name="Name"
							value="<%=request.getAttribute("fullName")%>" required
							class="clearNull">
					</div>

					<div>
						<label for="phone">Phone:</label> <input type="text" id="phone"
							name="Phone" value="<%=request.getAttribute("phone")%>" required
							class="clearNull">
					</div>

					<div>
						<label for="address">Address:</label> <input type="text"
							id="address" name="Address"
							value="<%=request.getAttribute("address")%>" required
							class="clearNull">
					</div>
					<input type="hidden" id="carId" name="carId"
						value="<%=request.getParameter("carId")%>"> <input
						type="hidden" id="userName" name="userName"
						value="<%=request.getParameter("userName")%>"> <input
						type="hidden" id="currentQuantity" name="currentQuantity"
						value="<%=request.getParameter("currentQuantity")%>"> <input
						type="hidden" id="brand" name="brand"
						value="<%=request.getParameter("brand")%>"> <input
						type="hidden" id="model" name="model"
						value="<%=request.getParameter("model")%>"> <input
						type="hidden" id="price" name="price"
						value="<%=request.getParameter("price")%>"> <input
						type="hidden" id="imageUrl" name="imageUrl"
						value="<%=request.getParameter("imageUrl")%>">


					<button type="submit" class="button enter-infor-car__button"
						value="<%=request.getParameter("imageUrl")%>">Buy</button>

					<%--                 <button type="button" onclick="buyCar(<%= request.getParameter("carId") %>, <%= request.getParameter("currentQuantity") %>)" class="button enter-infor-car__button">Buy</button>
 --%>

				</form>
				<a
					href="/ShowRoomCar/TakeInfor?carId=<%=request.getParameter("carId")%>&userName=<%=request.getParameter("userName")%>&fullName=<%=request.getAttribute("fullName")%>&phone=<%=request.getAttribute("phone")%>&address=<%=request.getAttribute("address")%>&carId=<%=request.getParameter("carId")%>&currentQuantity=<%=request.getParameter("currentQuantity")%>&brand=<%=request.getParameter("brand")%>&model=<%=request.getParameter("model")%>&price=<%=request.getParameter("price")%>&imageUrl=<%=request.getParameter("imageUrl")%>"
					class="button enter-infor-car__button">Add information</a>

			</div>
		</div>
	</section>


	<script>
    function buyCar(carId, quantity, userName, imageUrl) {
        var confirmResult = confirm(`Bạn có muốn mua ${quantity} chiếc xe này không?`);

        if (confirmResult) {
            window.location.href = "/ShowRoomCar/BuyTheCar?carId=" + carId + "&currentQuantity=" + quantity + "&userName=" + userName + "&imageUrl=" + imageUrl;
        }
    }
</script>



	<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Get all input elements with the class 'clearNull'
        var inputs = document.querySelectorAll('.clearNull');

        // Loop through each input element
        inputs.forEach(function (input) {
            // Check if the value is 'null' and clear it
            if (input.value.trim().toLowerCase() === 'null') {
                input.value = '';
            }
        });
    });
</script>

	<!-- ... your existing HTML code ... -->
	<%
	String insertFailedMessage = (String) request.getAttribute("insertFailed");
	if (insertFailedMessage != null) {
	%>
	<script>
    alert('<%=insertFailedMessage%>
			');
		</script>
	<%
	}
	%>



	<script>
			function validateForm() {
				var carId = document.getElementById("CarId").value;
				var brand = document.getElementById("Brand").value;
				var model = document.getElementById("Model").value;
				var price = document.getElementById("Price").value;
				var imageUrl = document.getElementById("ImageUrl").value;

				if (carId === "" || brand === "" || model === ""
						|| price === "" || imageUrl === "") {
					alert("You need to enter information to add products");
					return false;
				}

				return true;
			}
		</script>



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
				<p class="footer__description">x
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


	<!--========== SCROLL UP ==========-->

	<a href="" class="scrollup" id="scroll-up"> <i
		class="ri-arrow-up-s-line"></i>
	</a>


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