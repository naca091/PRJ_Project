<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="model.Car"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="model.User"%>

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
#counts-container {
	margin-top: 20px;
	padding: 15px;
	background-color: #163d66;
	border: 1px solid #ddd;
	border-radius: 5px;
	text-align: center;
	font-family: 'Arial', sans-serif;
}

#counts-container p {
	margin: 10px 0;
}

#counts-container span {
	font-weight: bold;
	color: #007bff; /* Blue color, you can customize this */
}

/* Optional: Add hover effect to the counts */
#counts-container p:hover {
	background-color: #d8d8d8;
	transition: background-color 0.3s ease-in-out;
}

/* Style the action buttons in the user table */
td a {
	display: inline-block;
	padding: 8px 16px;
	margin: 4px;
	text-decoration: none;
	color: #fff;
	border-radius: 4px;
	transition: background-color 0.3s, color 0.3s;
}

/* Style the delete button */
td a.delete {
	background-color: #dc3545; /* Red color for delete button */
	border: 1px solid #dc3545;
}

/* Style the edit button */
td a.edit {
	background-color: #007bff; /* Blue color for edit button */
	border: 1px solid #007bff;
}

/* Hover styles for both buttons */
td a:hover {
	background-color: #555; /* Darker color on hover */
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
				<th>Username</th>
				<th>Email</th>
				<th>Password</th>
				<th>Role</th>
				<th>FullName</th>
				<th>Phone</th>
				<th>Address</th>
				<th>Edit</th>
			</tr>

			<%
        List<User> userList = (List<User>) request.getAttribute("userList");
        if (userList != null) {
            for (User user : userList) {
        %>
			<tr>
				<td><%=user.getUserId()%></td>
				<td><%=user.getUsername()%></td>
				<td><%=user.getEmail()%></td>
				<td><%=user.getPassword()%></td>
				<td><%=user.getRole()%></td>
				<td><%=user.getFullName()%></td>
				<td><%=user.getPhone()%></td>
				<td><%=user.getAddress()%></td>
				<td class="action-buttons">
				<a class="button delete"
					href="<%=request.getContextPath()%>/DeleteUser?userId=<%=user.getUserId()%>">Delete</a>
					<a class="button edit"
					href="<%=request.getContextPath()%>/EditUsers?userId=<%=user.getUserId()%>">Edit</a>
				</td>
			</tr>
			<%
            }
        }
        %>
		</table>
	</section>

	<div id="counts-container">
		<p>
			Total Accounts: <span id="total-accounts">0</span>
		</p>
		<p>
			Admins: <span id="admin-count">0</span>
		</p>
		<p>
			Users: <span id="user-count">0</span>
		</p>
	</div>
	<script>
		// JavaScript code to calculate and display the total number of accounts, admins, and users
		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							var totalAccounts =
	<%=userList != null ? userList.size() : 0%>
		;
							var adminCount = 0;
							var userCount = 0;

							// Iterate through the userList to count admins and users
	<%for (User user : userList) {%>
		
	<%if ("admin".equals(user.getRole())) {%>
		adminCount++;
	<%} else {%>
		userCount++;
	<%}%>
		
	<%}%>
		// Display counts on the webpage
							document.getElementById("total-accounts").textContent = totalAccounts;
							document.getElementById("admin-count").textContent = adminCount;
							document.getElementById("user-count").textContent = userCount;
						});
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
