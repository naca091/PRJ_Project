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
/* Optional: Add some styling to the body for better aesthetics */

/* Styling for the total price container */
#total {
    margin-top: 20px;
    padding: 15px;
    background-color: #163d66; /* Blue color, you can customize this */
    color: #fff; /* White text color */
    text-align: center;
    border-radius: 5px;
    font-size: 18px;
}

/* Styling for the total price span */
#totalPrice {
    font-weight: bold;
    font-size: 24px;
    color: #ffcc00; /* Yellow color, you can customize this */
}

/* Optional: Add hover effect to the total price container */
#total:hover {
    background-color: #2980b9; /* Darker blue on hover */
    transition: background-color 0.3s ease-in-out;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px; /* Adjust the margin as needed */
}

th, td {
	padding: 12px;
	text-align: left;
}

/* Alternate row background color for better readability */

/* Style for table header */
th {
	background-color: #163d66; /* Header background color */
	color: white;
}

/* Style for table cells */
td {
	border: 1px solid #ddd; /* Cell border color */
}

/* Hover effect for table rows */

/* Responsive design for small screens */
@media screen and (max-width: 600px) {
	table {
		overflow-x: auto;
	}
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
<head>
<title>Your Cart</title>
</head>
<body>
	<!--==================== HEADER ====================-->
	<header class="header" id="header">
		<nav class="nav container">
			<a href="/ShowRoomCar/LoadCarsAdmin" class="nav__logo"> <i
				class="ri-steering-fill"></i> NextCar
			</a>
			<div class="nav__menu" id="nav-menu">
				<ul class="nav__list">
					<li class="nav__item"><a href="/ShowRoomCar/LoadCarsAdmin"
						class="nav__link active-link">Home</a></li>
					<li class="nav__item"><a href="/ShowRoomCar/LoadCarsAdmin"
						class="nav__link">Manager Car</a></li>
					<li class="nav__item"><a href="/ShowRoomCar/ManagerUser"
						class="nav__link">Manager User</a></li>

					<li class="nav__item"><a href="/ShowRoomCar/TotalRevenue">Total
							Revenue</a></li>
					<li class="nav__item"><a href="/ShowRoomCar/Confirm">Manager
							Oder</a></li>

					<%
					String userName = (String) session.getAttribute("userName");
					if (userName != null) {
					%>
					<p>
						Welcome,
						<%=userName%></p>
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
					<li class="nav__item"><a href="/ShowRoomCar/LoadCarsServlet"
						class="nav__link">Logout</a></li>
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

	<section class="featured section" id="featured">
		<table border="1">
			<tr>
				<th>User ID</th>
				<th>Name</th>
				<th>Phone</th>
				<th>Address</th>
				<th>Brand</th>
				<th>Model</th>
				<th>Quantity</th>
				<th>Price</th>
				<th>User Name</th>
			</tr>
			<tbody>
				<%
				List<model.managerListTotalPrice> userList = (List<model.managerListTotalPrice>) request.getAttribute("userList");
				double totalPrice = 0.0; // Initialize the total price variable

				if (userList != null && !userList.isEmpty()) {
					for (model.managerListTotalPrice user : userList) {
				%>
				<tr>
					<td><%=user.getUserID()%></td>
					<td><%=user.getName()%></td>
					<td><%=user.getPhone()%></td>
					<td><%=user.getAddress()%></td>
					<td><%=user.getBrand()%></td>
					<td><%=user.getModel()%></td>
					<td><%=user.getQuantity()%></td>
					<td class="price"><%=user.getPrice()%></td>
					<td><%=user.getNameUser()%></td>
				</tr>
				<%
				}
				} else {
				%>
				<tr>
					<td colspan="9">No data available</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</section>
	<p id = "total">
		Total Price: $<span id="totalPrice"></span>
	</p>
	<script>
		// Function to calculate the sum of prices
		function calculateTotal() {
			var total = 0;
			var priceElements = document.getElementsByClassName("price");

			for (var i = 0; i < priceElements.length; i++) {
				total += parseFloat(priceElements[i].innerText);
			}

			document.getElementById("totalPrice").innerText = total.toFixed(2);
		}

		// Call the function when the page is loaded
		window.onload = function() {
			calculateTotal();
		};
	</script>
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
