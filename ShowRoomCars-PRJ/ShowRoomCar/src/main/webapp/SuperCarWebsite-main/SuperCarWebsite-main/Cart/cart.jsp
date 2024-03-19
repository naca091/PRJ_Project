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

/* Add this CSS to your existing stylesheet or in a style tag in your HTML */
.delete-button {
	position: absolute;
	top: 0px; /* Adjust this value to set the top position */
	right: 0px; /* Adjust this value to set the right position */
	background-color: red; /* Optional: Set the background color */
	color: white; /* Optional: Set the text color */
	border: none; /* Optional: Remove the button border */
	padding: 13px 26px;
	/* Optional: Add padding for better appearance */
	cursor: pointer;
	/* Optional: Change cursor on hover */
	border-radius: 0 1rem 0 1rem;
	outline: none;
	cursor: pointer
}

.delete-button:hover {
	background-color: #DD0000;
}

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
						href="/ShowRoomCar/FullInforUser?userName=<%=userName%>"><p>
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
					<li class="nav__item"><a href="/ShowRoomCar/History"
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
	<section class="featured section" id="featured">
		<h2 class="section__title">Your cart</h2>
		<div class="featured__container container">
			<div class="featured__content grid">

				<c:forEach var="car" items="${cartItems}">
					<article class="featured__card mix ${car.getBrand().toLowerCase()}">
						<form action="/ShowRoomCar/InforUser" method="post">

							<div class="shape shape__smaller"></div>
							<h1 class="featured__title" name="Brand">${car.getBrand()}</h1>
							<a href="/ShowRoomCar/InforCar?carId=${car.id}">
								<h3 class="featured__subtitle" name="Model">${car.getModel()}</h3>
							</a> <img
								src="/ShowRoomCar/SuperCarWebsite-main/SuperCarWebsite-main/assets/img/${car.imageUrl}"
								alt="" class="featured__img">
							<h3 class="featured__price">$${car.price}</h3>
							<form class="quantity-form">
								<input type="hidden" name="carId" value="${car.id}"> <input
									type="hidden" name="currentQuantity" value="${car.quantity}">
								<button type="button" class="quantity-btn minus"
									data-action="decrement">-</button>
								<span name="quantity" class="quantity-value">${car.quantity}</span>
								<button type="button" class="quantity-btn plus"
									data-action="increment">+</button>
							</form>
							<button type="button" class="delete-button"
								onclick="deleteCartItem(<c:out value='${cartItem.id}'/>)">X</button>




							<!-- Thêm onclick vào thẻ <a> -->
							<a class="button featured__button buy-button"
								onclick="confirmPurchase(${car.id}, getQuantity())"
								type="submit">Buy</a>
						</form>
					</article>
				</c:forEach>
				<c:if test="${empty cartItems}">
					<p>No data available.</p>
				</c:if>
			</div>
		</div>
	</section>

	<script>
    function deleteCartItem(cartItemId) {
        if (confirm("Are you sure you want to delete this item?")) {
            // Make an AJAX request to the server to delete the item
            var xhr = new XMLHttpRequest();

            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        // If the request was successful, you might want to update the UI
                        // For example, remove the deleted item from the displayed list
                        // Reload the page or update the UI using JavaScript without reloading
                        location.reload(); // Example: Reload the page
                    } else {
                        // Handle the error
                        console.error("Error deleting item");
                    }
                }
            };

            // Specify the method (GET), URL, and set asynchronous to true
            xhr.open("GET", "/ShowRoomCar/DeleteToCart?cartItemId=" + cartItemId, true);

            // Remove the request header since GET requests do not typically have a request body
            // xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

            // Send the request
            xhr.send();
        }
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
	<!-- lưu trữ dữ liệu -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- lấy ra số lượng xe -->
	<script>
	document.addEventListener("DOMContentLoaded", function () {
	    const decrementBtn = document.querySelector(".quantity-btn.minus");
	    const incrementBtn = document.querySelector(".quantity-btn.plus");
	    const quantitySpan = document.querySelector(".quantity-value");

	    let currentQuantity = parseInt(quantitySpan.textContent);

	    decrementBtn.addEventListener("click", function () {
	        if (currentQuantity > 1) {
	            currentQuantity--;
	            quantitySpan.textContent = currentQuantity;
	        } else {
	            // If quantity is 1, ask for confirmation to remove from the cart
	            confirmRemoveFromCart();
	        }
	    });

	    incrementBtn.addEventListener("click", function () {
	        currentQuantity++;
	        quantitySpan.textContent = currentQuantity;
	    });

	    const buyButton = document.querySelector(".buy-button");
	    buyButton.addEventListener("click", function () {
	        confirmPurchase(currentQuantity);
	    });

	    function confirmRemoveFromCart() {
	        var confirmResult = confirm("Bạn có muốn xóa sản phẩm này khỏi giỏ hàng không?");

	        if (confirmResult) {
	            // Perform the removal action or redirect to a servlet to handle the removal
	            removeFromCart();
	        } else {
	            // If the user cancels, restore the quantity to 1
	            currentQuantity = 1;
	            quantitySpan.textContent = currentQuantity;
	        }
	    }

	    function removeFromCart() {
	        // Add logic here to remove the item from the cart
	        // This can involve an AJAX request to update the server-side cart
	        // For simplicity, I'll reload the page in this example
	        location.reload();
	    }

	    function confirmPurchase(quantity) {
	        var confirmResult = confirm(`Bạn có muốn mua ${quantity} chiếc xe này không?`);

	        if (confirmResult) {
	            var carId = document.querySelector("input[name='carId']").value;
	            var brand = document.querySelector("h1[name='Brand']").innerText;
	            var model = document.querySelector("h3[name='Model']").innerText;
	            var userName = document.querySelector("p[name='userName']").innerText;
	            window.location.href = "/ShowRoomCar/InforUser?carId=" + carId + "&userName=" + userName + "&currentQuantity=" + quantity + "&brand=" + brand + "&model=" + model;
	        }
	    }
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