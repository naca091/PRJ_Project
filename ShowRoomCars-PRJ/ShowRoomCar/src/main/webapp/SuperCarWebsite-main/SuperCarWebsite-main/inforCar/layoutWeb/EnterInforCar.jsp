<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm Xe Mới</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
}

h2 {
	text-align: center;
}

form {
	max-width: 50%;
	margin: 0 auto;
	background: #ffffff;
	padding: 30px 30px;
	margin-top: 50px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	border-radius: 4px;
}

label, input {
	display: block;
	margin-bottom: 20px;
}

label {
	font-weight: bold;
}

input[type="file"], input[type="text"], input[type="number"] {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

input[type="submit"] {
	background: #333;
	color: #fff;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background: #555;
}

.error-message {
	color: red;
}
</style>
</head>
<body>
	<h2>Thêm Xe Mới</h2>
	<form action="${pageContext.request.contextPath}/CheckInsertCar"
		method="post" onsubmit="return validateForm();"
		enctype="multipart/form-data">
		<label for="picture">Hình ảnh:</label> <input type="file"
			name="picture" id="picture" required> <br> <br> <label
			for="brand">Hãng Xe:</label> <input type="text" name="brand"
			id="brand" required> <br> <br> <label for="model">Mẫu
			Xe:</label> <input type="text" name="model" id="model" required> <br>
		<br> <label for="year">Năm Sản Xuất:</label> <input type="number"
			name="year" id="year" required> <br> <br> <label
			for="price">Giá:</label> <input type="number" name="price" id="price"
			required> <br> <br> <input type="submit"
			value="Add Car">
	</form>

	<p class="error-message" id="error-message"></p>

	<script>
		function validateForm() {
			const picture = document.getElementById("picture").value;
			const brand = document.getElementById("brand").value;
			const model = document.getElementById("model").value;
			const year = document.getElementById("year").value;
			const price = document.getElementById("price").value;
			const errorMessage = document.getElementById("error-message");

			if (picture === "" || brand === "" || model === "" || year === ""
					|| price === "") {
				errorMessage.innerText = "You need to enter complete information to add a car";
				return false;
			} else {
				errorMessage.innerText = "";
				return true;
			}
		}
	</script>
</body>
</html>
