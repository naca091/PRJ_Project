<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Car"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="model.History"%>

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
/* Style the form container */
section.featured {
	max-width: 600px;
	margin: auto;
}

/* Style the form header */
section.featured h1 {
	text-align: center;
	color: #333;
}

/* Style form labels */
section.featured label {
	display: block;
	margin: 10px 0;
	color: #555;
}

/* Style form input fields */
section.featured input, section.featured select {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	box-sizing: border-box;
}

/* Style form button */
section.featured button {
	background-color: #4CAF50;
	color: white;
	padding: 10px 15px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

section.featured button:hover {
	background-color: #007bff;
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

.featured {
	margin: 20px;
}

form {
	max-width: 400px;
	margin: auto;
	padding: 20px;
	background-color: #f4f4f4;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

label {
	display: block;
	margin-bottom: 8px;
	font-weight: bold;
}

input {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	box-sizing: border-box;
}

input[type="submit"] {
	background-color: #4caf50;
	color: white;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #45a049;
}

p {
	text-align: center;
	color: #555;
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
		<c:if test="${not empty user}">
			<form action="/ShowRoomCar/EditInforCarPost" method="post"
				enctype="multipart/form-data" enctype="multipart/mixed stream">
				<label for="brand">Brand:</label> <input type="text" id="brand"
					name="brand" value="${user.brand}" required /><br /> <label
					for="model">Model:</label> <input type="text" id="model"
					name="model" value="${user.model}" required /><br /> <label
					for="price">Price:</label> <input type="number" id="price"
					name="price" value="${user.price}" required /><br /> <label
					for="imageUrl">Image Upload:</label> <input type="file"
					id="imageUrl" name="imageUrl" onchange="previewImage(this)" /><br />

				<label for="imagePreview">Image Preview:</label> <img
					id="imagePreview"
					src="/ShowRoomCar/SuperCarWebsite-main/SuperCarWebsite-main/assets/img/${user.imageUrl}"
					alt="Image Preview" style="max-width: 300px; max-height: 200px" /><br />
				<label for="quantity">Quantity:</label> <input type="number"
					id="quantity" name="quantity" value="${user.quantity}" required /><br />

				<label for="topSpeed">Top Speed:</label> <input type="number"
					id="topSpeed" name="topSpeed" value="${user.topSpeed}" required /><br />

				<label for="acceleration">Acceleration:</label> <input type="number"
					id="acceleration" name="acceleration" value="${user.acceleration}"
					required /><br /> <label for="maxHorsepower">Max
					Horsepower:</label> <input type="number" id="maxHorsepower"
					name="maxHorsepower" value="${user.maxHorsepower}" required /><br />

				<!-- Add other fields as needed -->

				<input type="hidden" name="carId" value="${user.id}" /> <input
					type="submit" value="Save Changes" />
			</form>
		</c:if>

		<c:if test="${empty user}">
			<p>No car information available.</p>
		</c:if>
	</section>
	<script>
		function previewImage(input) {
			var preview = document.getElementById('imagePreview');
			var file = input.files[0];
			var reader = new FileReader();

			reader.onloadend = function() {
				preview.src = reader.result;
			};

			if (file) {
				reader.readAsDataURL(file);
			} else {
				preview.src = "/ShowRoomCar/SuperCarWebsite-main/SuperCarWebsite-main/assets/img/${user.imageUrl}";
			}
		}
	</script>
	<script>
		// Thêm sự kiện onchange cho trường input file
		document.getElementById('imageUrl').onchange = function() {
			// Lấy giá trị của input file
			var input = this;

			// Kiểm tra nếu có chọn hình ảnh
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				// Đọc đường dẫn của hình ảnh và gán vào trường Image Preview
				reader.onload = function(e) {
					document.getElementById('imagePreview').src = e.target.result;
				};

				// Đọc dữ liệu của hình ảnh
				reader.readAsDataURL(input.files[0]);

				// Tự động điền đường dẫn vào trường imageUrl
				var imagePath = "/ShowRoomCar/SuperCarWebsite-main/SuperCarWebsite-main/assets/img/"
						+ input.files[0].name;
				document.getElementById('imageUrl').value = imagePath;
			}
		};
	</script>

	<script>
		// Lấy giá trị từ input
		var inputValue = document.getElementById('acceleration').value;

		// Chuyển đổi giá trị thành số và kiểm tra xem có phải số nguyên hay không
		var intValue = parseInt(inputValue);
		if (!isNaN(intValue)) {
			// Đã chuyển thành công, gán giá trị mới vào input
			document.getElementById('acceleration').value = intValue;
		} else {
			// Giá trị không phải số nguyên, có thể giữ nguyên giá trị hoặc thực hiện xử lý khác theo yêu cầu
			console.log("Giá trị không phải số nguyên");
		}
	</script>
	<script>
		// Đảm bảo rằng mã JavaScript sẽ chạy sau khi trang đã tải xong
		document.addEventListener("DOMContentLoaded", function() {
			// Lấy phần tử input và thêm sự kiện "input" để kiểm tra số lượng khi người dùng nhập
			var quantityInput = document.getElementById("quantity");
			quantityInput.addEventListener("input", validateQuantity);

			function validateQuantity() {
				// Lấy giá trị số lượng từ input
				var enteredQuantity = quantityInput.value;

				// Kiểm tra xem số lượng có nhỏ hơn 1 hay không
				if (enteredQuantity < 1) {
					// Nếu nhỏ hơn 1, đặt giá trị về 1
					quantityInput.value = 1;
				}
			}
		});
	</script>
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
