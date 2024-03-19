package Controller.Admin.ManagerUser;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditUser")
public class EditUser extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String role = request.getParameter("role");
		String fullName = request.getParameter("fullName");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");

		if (userId != null && !userId.isEmpty()) {
			Connection connection = null;

			try {
				// Load the SQL Server JDBC driver
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

				// Replace the connection URL, username, and password with your actual database
				// information
				String dbURL = "jdbc:sqlserver://LAPTOP-KSCIFN6A\\TUAN:1433;databaseName=managerCar;integratedSecurity=true;";
				String dbUser = "sa";
				String dbPassword = "tuanqn2103";

				// Create a connection
				connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);

				// Prepare the update statement with the new fields
				String updateQuery = "UPDATE Users SET Name=?, Email=?, Password=?, Role=?, FullName=?, Phone=?, Address=? WHERE ID=?";
				try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
					preparedStatement.setString(1, username);
					preparedStatement.setString(2, email);
					preparedStatement.setString(3, password);
					preparedStatement.setString(4, role);
					preparedStatement.setString(5, fullName);
					preparedStatement.setString(6, phone);
					preparedStatement.setString(7, address);
					preparedStatement.setInt(8, Integer.parseInt(userId));

					// Execute the update statement
					int rowsUpdated = preparedStatement.executeUpdate();

					if (rowsUpdated > 0) {
						// User updated successfully
						response.sendRedirect("/ShowRoomCar/ManagerUser");
					} else {
						// No user found with the given userId
						response.sendRedirect("userNotFound.jsp");
					}
				}
			} catch (ClassNotFoundException | SQLException e) {
				// Handle exceptions
				e.printStackTrace();
				response.sendRedirect("errorPage.jsp");
			} finally {
				// Close the database connection in the finally block
				try {
					if (connection != null) {
						connection.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		} else {
			// Handle invalid or missing userId parameter
			response.sendRedirect("invalidUserId.jsp");
		}
	}
}
