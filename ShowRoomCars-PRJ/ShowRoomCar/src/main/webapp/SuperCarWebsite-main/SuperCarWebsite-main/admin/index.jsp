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
/* Style the container */
.enter-infor-car__container {
	background-color: #040404;
	/* Update with your preferred background color */
	padding: 30px;
	color: #fff; /* Set text color to white */
}

/* Style the form */
.enter-infor-car__form {
	display: grid;
	gap: 20px;
}

/* Style the input boxes */
.enter-infor-car__input-box {
	display: flex;
	flex-direction: column;
}

.enter-infor-car__label {
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 8px;
}

enter-infor-car__input {
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
	transition: border-color 0.2s;
	background-color: #080808; /* Set input background color */
	color: #fff; /* Set input text color to white */
}

.enter-infor-car__input:focus {
	border-color: #007BFF;
}

/* Style the submit button */
enter-infor-car__button {
	background-color: #007BFF;
	color: #fff;
	border: none;
	padding: 12px 20px;
	font-size: 18px;
	border-radius: 5px;
	cursor: pointer;
}

enter-infor-car__button:hover {
	background-color: #0056b3;
}

/* Center the form */
.enter-infor-car__data {
	display: flex;
	flex-direction: column;
	align-items: center;
}
/* CSS for Total Quantity in ShowRoom */
.total-quantity-paragraph {
	background-color: #040404; /* Background color */
	padding: 10px; /* Adjust padding as needed */
	color: #fff; /* Text color */
	font-size: 18px; /* Font size */
	text-align: center; /* Center the text */
	margin-top: 20px; /* Add spacing between the sections */
}

.total-quantity-paragraph span {
	font-weight: bold; /* Make the total quantity bold */
	font-size: 20px; /* Adjust font size of the total quantity */
}
/* ... Add more styles as needed ... */
/* Style the total revenue paragraph */
.total-revenue-paragraph {
	background-color: #040404; /* Màu nền */
	padding: 10px; /* Điều chỉnh padding theo nhu cầu */
	color: #fff; /* Màu văn bản */
	font-size: 18px; /* Kích thước font */
	text-align: center; /* Căn giữa văn bản */
	margin-top: 20px; /* Thêm khoảng cách giữa các phần */
}

.total-revenue-paragraph span {
	font-weight: bold; /* Làm đậm tổng số lượng */
	font-size: 20px; /* Điều chỉnh kích thước font cho tổng số lượng */
}
</style>
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

	<!--************* MAIN CODE ****************-->

	<main class="main">


		<!--==================== FEATURED ====================-->
		<section class="featured section" id="featured">
			<h2 class="section__title">Featured Luxury Cars</h2>
			<div class="featured__container container">
				<ul class="featured__filters">
					<li>
						<button class="featured__item active-featured" data-filter="all">
							<span>All</span>
						</button>
					</li>
					<li>
						<button class="featured__item" data-filter=".tesla">
							<img
								src="/ShowRoomCar/SuperCarWebsite-main/SuperCarWebsite-main/assets/img/logo3.png"
								alt="">

						</button>
					</li>
					<li>
						<button class="featured__item" data-filter=".audi">
							<img
								src="/ShowRoomCar/SuperCarWebsite-main/SuperCarWebsite-main/assets/img/logo2.png"
								alt="">
						</button>
					</li>
					<li>
						<button class="featured__item" data-filter=".porsche">
							<img
								src="/ShowRoomCar/SuperCarWebsite-main/SuperCarWebsite-main/assets/img/logo1.png"
								alt="">
						</button>
					</li>
				</ul>

				<div class="featured__content grid">
					<%
					List<Car> cars = (List<Car>) request.getAttribute("newCar");
					if (cars != null) {
						for (Car car : cars) {
					%>
					<!-- Hiển thị thông tin về mỗi chiếc xe trong danh sách cars -->
					<article
						class="featured__card mix <%=car.getBrand().toLowerCase()%>">
						<div class="shape shape__smaller"></div>
						<h1 class="featured__title"><%=car.getBrand()%></h1>
						<a href="/ShowRoomCar/EditInforCar?carId=<%=car.getId()%>">
							<h3 class="featured__subtitle"><%=car.getModel()%></h3>
						</a> <img
							src="/ShowRoomCar/SuperCarWebsite-main/SuperCarWebsite-main/assets/img/<%=car.getImageUrl()%>"
							alt="" class="featured__img">
						<h3 class="featured__price">
							$<%=car.getPrice()%></h3>
						<button type="button" class="delete-button"
							onclick="deleteCartItem(<c:out value='<%=car.getId()%>'/>)">X</button>
						<button class="button featured__button">
							Quantity:
							<%=car.getQuantity()%>
						</button>
					</article>
					<%
					}
					} else {
					%>
					<p>newCar is null or not set.</p>
					<%
					}
					%>

				</div>
		</section>
		<script>
    // JavaScript functions for handling edit modal
    function editCar(carId) {
        // Fetch car information using carId and populate the modal fields
        // This part depends on how you retrieve car information in your application
        // You may need to use AJAX to fetch the data dynamically

        // Show the edit modal
        document.getElementById("editModal").style.display = "block";
    }

    function closeEditModal() {
        // Close the edit modal
        document.getElementById("editModal").style.display = "none";
    }
</script>
		<script>
    function deleteCartItem(cartItemId) {
        if (confirm("Bạn có muốn xóa sản phẩm này khỏi ShowRoom không?")) {
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
            xhr.open("GET", "/ShowRoomCar/DeleteToCar?Id=" + cartItemId, true);

            // Remove the request header since GET requests do not typically have a request body
            // xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

            // Send the request
            xhr.send();
        }
    }
</script>
		<!--==================== TOTAL QUANTITY CAR ====================-->
		<%
		List<Car> carss = (List<Car>) request.getAttribute("newCar");
		int totalQuantity = 0; // Biến để lưu tổng số lượng
		if (cars != null) {
			for (Car car : cars) {
				totalQuantity += car.getQuantity(); // Cộng số lượng của xe vào tổng số lượng
			}
		}
		%>
		<p class="total-quantity-paragraph">
			Total Quantity in ShowRoom: <span><%=totalQuantity%></span>
		</p>


		<!--==================== ENTER INFOMATION CAR ====================-->
		<section class="enter-infor-car section" id="enter-infor-car">
			<div class="enter-infor-car__container container grid">
				<div class="enter-infor-car__data">
					<h2 class="section__title enter-infor-car__title">Enter Car
						Information</h2>
					<p class="enter-infor-car__description">Enter the details of
						the car you want to add to the system.</p>
					<form action="${pageContext.request.contextPath}/CheckInsertCar"
						method="post" class="enter-infor-car__form"
						onsubmit="return validateForm()" enctype="multipart/form-data"
						enctype="multipart/mixed stream">
						<div class="enter-infor-car__input-box">
							<label for="CarId" class="enter-infor-car__label">Car ID</label>
							<input type="number" id="CarId" name="CarId"
								class="enter-infor-car__input" required>
						</div>
						<div class="enter-infor-car__input-box">
							<label for="Brand" class="enter-infor-car__label">Car
								Brand</label> <input type="text" id="Brand" name="Brand"
								class="enter-infor-car__input" required>
						</div>
						<div class="enter-infor-car__input-box">
							<label for="Model" class="enter-infor-car__label">Car
								Model</label> <input type="text" id="Model" name="Model"
								class="enter-infor-car__input" required>
						</div>
						<div class="enter-infor-car__input-box">
							<label for="Price" class="enter-infor-car__label">Car
								Price</label> <input type="number" id="Price" name="Price"
								class="enter-infor-car__input" required>
						</div>
						<div class="enter-infor-car__input-box">
							<label for="ImageUrl" class="enter-infor-car__label">Image
								URL</label> <input type="file" id="ImageUrl" name="ImageUrl"
								class="enter-infor-car__input" onchange="previewImage(this)"
								required> <img id="imagePreview" src="#" alt="Preview"
								style="display: none; max-width: 100%; max-height: 150px;">
						</div>

						<div class="enter-infor-car__input-box">
							<label for="Quantity" class="enter-infor-car__label">Car
								Quantity</label> <input type="number" id="Quantity" name="Quantity"
								class="enter-infor-car__input" required>
						</div>
						<div class="enter-infor-car__input-box">
							<label for="MaxHorsepower" class="enter-infor-car__label">Max
								Horsepower</label> <input type="number" id="MaxHorsepower"
								name="MaxHorsepower" class="enter-infor-car__input" required>
						</div>

						<div class="enter-infor-car__input-box">
							<label for="TopSpeed" class="enter-infor-car__label">Top
								Speed</label> <input type="number" id="TopSpeed" name="TopSpeed"
								class="enter-infor-car__input" required>
						</div>

						<div class="enter-infor-car__input-box">
							<label for="Acceleration" class="enter-infor-car__label">Acceleration
								(seconds)</label> <input type="number" id="Acceleration"
								name="Acceleration" class="enter-infor-car__input" step="0.01"
								required>
						</div>

						<button type="submit" class="button enter-infor-car__button">Submit</button>
					</form>
				</div>
			</div>
		</section>

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
    document.addEventListener("DOMContentLoaded", function () {
        var quantityInput = document.getElementById("Quantity");

        // Thêm sự kiện "input" để kiểm tra giá trị khi người dùng nhập
        quantityInput.addEventListener("input", function () {
            // Lấy giá trị số lượng từ input
            var enteredQuantity = parseInt(quantityInput.value);

            // Kiểm tra xem giá trị có nhỏ hơn 1 không
            if (enteredQuantity < 1) {
                // Nếu giá trị nhỏ hơn 1, đặt giá trị là 1
                quantityInput.value = 1;
            }
        });
    });
</script>
		<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Lấy tất cả các trường số (number fields)
        var numberFields = document.querySelectorAll('input[type="number"]');

        // Thêm sự kiện "input" cho mỗi trường số
        numberFields.forEach(function (field) {
            field.addEventListener("input", function () {
                // Kiểm tra xem giá trị có nhỏ hơn 1 không
                if (parseFloat(field.value) < 1) {
                    // Nếu nhỏ hơn 1, đặt giá trị là 1
                    field.value = 1;
                }
            });
        });
    });
</script>

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

		<script>
		function previewImage(input) {
		    var imagePreview = document.getElementById('imagePreview');
		    var fileInput = input.files[0];

		    if (fileInput) {
		        var reader = new FileReader();

		        reader.onload = function(e) {
		            imagePreview.src = e.target.result;
		            imagePreview.style.display = 'block';
		        };

		        reader.readAsDataURL(fileInput);
		    } else {
		        imagePreview.style.display = 'none';
		    }
		}

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