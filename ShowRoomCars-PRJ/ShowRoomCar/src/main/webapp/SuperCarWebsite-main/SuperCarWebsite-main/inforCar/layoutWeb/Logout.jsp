

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop của tôi</title>
<link rel="stylesheet" type="text/css" href="style.css">
<style type="">
/* CSS cho phần "Xin chào" */
.user-info {
  text-align: center; /* Căn giữa nội dung */
  background-color: #f0f0f0; /* Màu nền */
  padding: 10px; /* Khoảng cách giữa nội dung và khung */
  border: 1px solid #ccc; /* Viền xung quanh */
  margin: 10px; /* Khoảng cách với phần khác */
  border-radius: 5px; /* Bo góc */
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.2); /* Đổ bóng */
}

/* CSS cho phần "Xin chào, [userName]" */
.user-info h3 {
  font-size: 24px; /* Kích thước chữ */
  color: #333; /* Màu chữ */
  font-weight: bold; /* Đậm */
  margin: 0; /* Loại bỏ khoảng cách dưới */
}

</style>
</head>
<body>

	<header>
		<h2>
			<a href="Page.jsp">Showroom Mercedes</a>
		</h2>
		<nav>
			<ul>
				<li><a href="Page.jsp">Trang chủ</a></li>
				<li><a href="#">Sản phẩm</a></li>
				<li><a href="#">Giỏ hàng</a></li>
				<li><a href="#">Liên hệ</a></li>
				<li><a href="Page.jsp">Đăng xuất</a></li>

			</ul>
		</nav>
	</header>

	<%-- Kiểm tra nếu người dùng đã đăng nhập, hiển thị thông tin người dùng --%>
	<% if (session.getAttribute("userName") != null) { %>
	<section class="user-info">
		<h3>
			Xin chào,
			<%= session.getAttribute("userName") %></h3>
	</section>
	<div class="product">
		<img
			src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR56VBlod95CvSsgYOTMT8qHdZAvGqt2kL67g&usqp=CAU"
			alt="Sản phẩm 1">
		<h3>Sản phẩm 1</h3>
		<p>Giá: $50</p>
		<button>Mua ngay</button>
	</div>
	<div class="product">
		<img
			src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1VuJXinh1EcnYsf8HqdF6cZXWHZve-_uDjA&usqp=CAU"
			alt="Sản phẩm 2">
		<h3>Sản phẩm 2</h3>
		<p>Giá: $60</p>
		<button>Mua ngay</button>
	</div>
	<% } else { %>
	<section class="featured-products">
		<h2>Sản phẩm nổi bật</h2>

	</section>
	<% } %>

	<footer>
		<p>&copy; 2023 Shop của tôi. Tất cả các quyền được bảo lưu.</p>
	</footer>
	<script type="script.js"></script>
</body>
</html>
