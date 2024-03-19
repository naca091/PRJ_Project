package Controller.User.Infor;


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

@WebServlet("/EditInfor")
public class EditInfor extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String fullName = request.getParameter("fullName");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");

		if (username != null && !username.isEmpty()) {
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
				String updateQuery = "UPDATE Users SET Email=?, Password=?, FullName=?, Phone=?, Address=? WHERE Name=?";
				try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
					preparedStatement.setString(1, email);
					preparedStatement.setString(2, password);
					preparedStatement.setString(3, fullName);
					preparedStatement.setString(4, phone);
					preparedStatement.setString(5, address);
					preparedStatement.setString(6, username);

					// Execute the update statement
					int rowsUpdated = preparedStatement.executeUpdate();

					if (rowsUpdated > 0) {
						// User updated successfully
						response.sendRedirect("/ShowRoomCar/FullInforUser?userName="+username);
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
