<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Result</title>
<script>
        function checkAndRedirect() {
            <c:if test="${empty errorMessage}">
                alert("You have successfully created an account.");
                window.location.href = 'inforCar/layoutWeb/Page.jsp';
            </c:if>
            <c:if test="${not empty errorMessage}">
                alert("${errorMessage}");
                window.location.href = 'inforCar/layoutWeb/RegisterForm.jsp';
            </c:if>
        }
    </script>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        text-align: center;
    }

    h1 {
        color: #333;
    }

    p {
        font-size: 20px;
        color: #555;
    }

    input[type="button"] {
        padding: 10px 20px;
        background-color: #007BFF;
        color: #fff;
        font-size: 18px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    input[type="button"]:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body onload="checkAndRedirect()">
    <h1>Registration Result</h1>
    <c:if test="${empty errorMessage}">
        <p>You have successfully created an account.</p>
    </c:if>
    <c:if test="${not empty errorMessage}">
        <p>${errorMessage}</p>
    </c:if>

    <c:if test="${empty errorMessage}">
        <input type="button" value="Return to Home Page" onclick="window.location.href='inforCar/layoutWeb/Page.jsp'" />
    </c:if>
    <c:if test="${not empty errorMessage}">
        <input type="button" value="Try Again" onclick="window.location.href='inforCar/layoutWeb/Register.jsp'" />
    </c:if>
</body>
</html>
