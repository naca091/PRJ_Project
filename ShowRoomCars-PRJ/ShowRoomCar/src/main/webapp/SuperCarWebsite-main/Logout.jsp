<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Car"%>
<%@ page import="java.util.List"%>
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
.hidden {
	display: none;
}
</style>
<title>Super car</title>
</head>

<body>
	<!--==================== HEADER ====================-->
	<header class="header" id="header">
		<div id="cart-notification" class="cart-notification hidden">
			You have added the item to your cart successfully.</div>

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
							Welcome,
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
					<li class="nav__item"><a href="/ShowRoomCar/LoadCarsServlet"
						class="nav__link"> Logout </a></li>

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

	<main class="main">
		<!--==================== HOME ====================-->
		<section class="home section" id="home">
			<div class="shapeX shape__big"></div>
			<div class="shapeX shape__small"></div>


			<div class="home__container container grid">
				<div class="home__data">
					<h1 class="home__title">Pick Your Best Car</h1>
					<h2 class="home__subtitle">Ferrari 458</h2>
					<h3 class="home__elec">
						<i class="ri-flashlight-fill"></i> RELENTLESS FORCE
					</h3>
				</div>

				<img
					src="/ShowRoomCar/SuperCarWebsite-main/SuperCarWebsite-main/assets/img/home5.png"
					alt="" class="home__img">
				<div class="home__car">
					<div class="home__car-data">
						<div class="home__car-icon">
							<i class="ri-temp-cold-line"></i>
						</div>
						<h2 class="home__car-number">3.0s</h2>
						<h3 class="home__car-name">0-100 km/h</h3>

					</div>

					<div class="home__car-data">
						<div class="home__car-icon">
							<i class="ri-dashboard-2-line"></i>
						</div>
						<h2 class="home__car-number">419</h2>
						<h3 class="home__car-name">POWER (KW)</h3>

					</div>
					<div class="home__car-data">
						<div class="home__car-icon">
							<i class="ri-flashlight-fill"></i>
						</div>
						<h2 class="home__car-number">325 km/h</h2>
						<h3 class="home__car-name">MAX. SPEED</h3>

					</div>

				</div>

				<a href="#featured" class="home__button">START</a>

				<div class="slider__bg">
					<div class="slider__bg-navBtn active"></div>
					<div class="slider__bg-navBtn"></div>
					<div class="slider__bg-navBtn"></div>
					<div class="slider__bg-navBtn"></div>
					<div class="slider__bg-navBtn"></div>

				</div>



			</div>
			<div class="home__social">
				<a href="#" class="home__social-icon"><i
					class="ri-facebook-fill"></i></a> <a href="#" class="home__social-icon"><i
					class="ri-instagram-fill"></i></a> <a href="#"
					class="home__social-icon"><i class="ri-twitter-fill"></i></a>

			</div>

		</section>
		<!--==================== GALLERY BANNER ====================-->
		<section class="gallery section">
			<div class="gallery__container container grid">
				<video class="video__slide active" src="assets/video/vid_1.mp4"
					autoplay muted loop></video>
				<video class="video__slide"
					src="/ShowRoomCar/SuperCarWebsite-main/SuperCarWebsite-main/assets/video/vid_4.mp4"
					autoplay muted loop></video>
				<video class="video__slide"
					src="/ShowRoomCar/SuperCarWebsite-main/SuperCarWebsite-main/assets/video/vid_3.mp4"
					autoplay muted loop></video>
				<video class="video__slide"
					src="/ShowRoomCar/SuperCarWebsite-main/SuperCarWebsite-main/assets/video/vid_2.mp4"
					autoplay muted loop></video>
				<video class="video__slide"
					src="/ShowRoomCar/SuperCarWebsite-main/SuperCarWebsite-main/assets/video/vid_5.mp4"
					autoplay muted loop></video>

			</div>

		</section>

		<!--==================== ABOUT ====================-->
		<section class="about section" id="about">
			<div class="about__container container grid">
				<div class="about__group">
					<img
						src="/ShowRoomCar/SuperCarWebsite-main/SuperCarWebsite-main/assets/img/about.png"
						alt="" class="about__img">

					<div class="about__card">
						<h3 class="about__card-title">2.500+</h3>
						<p class="about__card-description">Supercharges placed along
							popular routes</p>
					</div>
				</div>

				<div class="about__data">
					<h2 class="section__title about__title">
						Machines With <br> Future Technology
					</h2>
					<p class="about__description">See the future with
						high-performance electric cars produced by renowned brands. They
						feature futuristic builds and designs with new and innovative
						platforms that last a long time.</p>

					<a href="#" class="button">Know More</a>
				</div>


			</div>


		</section>

		<!--==================== FEATURES ====================-->
		<section class="features section">
			<h2 class="section__title">More Features</h2>

			<div class="features__container container grid">
				<div class="features__group">
					<img
						src="/ShowRoomCar/SuperCarWebsite-main/SuperCarWebsite-main/assets/img/features.png"
						alt="" class="features__img">


					<div class="features__card features__card-1">
						<h3 class="features__card-title">800v</h3>
						<p class="features__card-description">
							Turbo <br> Chargin
						</p>
					</div>

					<div class="features__card features__card-2">
						<h3 class="features__card-title">350</h3>
						<p class="features__card-description">
							Km <br> Range
						</p>
					</div>
					<div class="features__card features__card-3">
						<h3 class="features__card-title">480</h3>
						<p class="features__card-description">
							Km <br> Travel
						</p>
					</div>
				</div>
			</div>

			<img
				src="/ShowRoomCar/SuperCarWebsite-main/SuperCarWebsite-main/assets/img/map.svg"
				alt="" class="features__map">

		</section>

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
						class="featured__card mix <%=car.getId()%> <%=car.getBrand().toLowerCase()%> ">
						<div class="shape shape__smaller"></div>
						<h1 class="featured__title"><%=car.getBrand()%></h1>
						<a href="/ShowRoomCar/InforCar?carId=<%=car.getId()%>">
							<h3 class="featured__subtitle"><%=car.getModel()%></h3>
						</a> <img
							src="/ShowRoomCar/SuperCarWebsite-main/SuperCarWebsite-main/assets/img/<%=car.getImageUrl()%>"
							alt="" class="featured__img">
						<h3 class="featured__price">
							$<%=car.getPrice()%></h3>

						<a
							href="/ShowRoomCar/Cart?carId=<%=car.getId()%>&userName=<%=userName%>"
							class="button featured__button"> <i
							class="ri-shopping-bag-2-line"></i>
						</a>


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
						information about our products and new cars by email by
						subscribing to our mailing list.</p>

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


	<!--========== SCROLL UP ==========-->

	<a href="" class="scrollup" id="scroll-up"> <i
		class="ri-arrow-up-s-line"></i>
	</a>

	<!-- Đoạn mã JavaScript trong trang JSP -->





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