package Controller.User.Infor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TakeInfor")
public class TakeInfor extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String carId = request.getParameter("carId");
		String userName = request.getParameter("userName");
		String currentQuantity = request.getParameter("currentQuantity");
		String brand = request.getParameter("brand");
		String model = request.getParameter("model");
		String price = request.getParameter("price");
		String imageUrl = request.getParameter("imageUrl");

		if (userName != null && !userName.isEmpty()) {
			try {
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				String dbURL = "jdbc:sqlserver://LAPTOP-KSCIFN6A\\TUAN:1433;databaseName=managerCar;integratedSecurity=true;";
				String dbUser = "sa";
				String dbPassword = "tuanqn2103";

				try (Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);
						PreparedStatement statement = connection
								.prepareStatement("SELECT FullName, Phone, Address FROM Users WHERE Name = ?")) {
					statement.setString(1, userName);

					try (ResultSet resultSet = statement.executeQuery()) {
						if (resultSet.next()) {
							String fullName = resultSet.getString("FullName");
							String phone = resultSet.getString("Phone");
							String address = resultSet.getString("Address");

							request.setAttribute("fullName", fullName);
							request.setAttribute("phone", phone);
							request.setAttribute("address", address);
							request.setAttribute("carId", carId);
							request.setAttribute("userName", userName);
							request.setAttribute("currentQuantity", currentQuantity);
							request.setAttribute("brand", brand);
							request.setAttribute("model", model);
							request.setAttribute("price", price);
							request.setAttribute("imageUrl", imageUrl);

							RequestDispatcher dispatcher = request.getRequestDispatcher(
									"/SuperCarWebsite-main/SuperCarWebsite-main/user/TakeInfor.jsp");
							dispatcher.forward(request, response);
						} else {
							// Handle the case where the user with the given userName is not found
							response.sendRedirect("userNotFound.jsp");
						}
					}
				}
			} catch (SQLException | ClassNotFoundException e) {
				// Log the exception or redirect to an error page
				e.printStackTrace();
				response.sendRedirect("errorPage.jsp");
			}
		} else {
			// Handle invalid or missing userName parameter
			response.sendRedirect("invalidUserName.jsp");
		}
	}
}
