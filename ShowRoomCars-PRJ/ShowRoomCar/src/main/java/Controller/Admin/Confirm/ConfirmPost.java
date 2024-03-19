package Controller.Admin.Confirm;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/ConfirmPost")
public class ConfirmPost extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		String userName = request.getParameter("userName");
		String name = request.getParameter("name");
		String brand = request.getParameter("brand");
		String model = request.getParameter("model");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
		double price = Double.parseDouble(request.getParameter("price"));

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String dbURL = "jdbc:sqlserver://LAPTOP-KSCIFN6A\\TUAN:1433;databaseName=managerCar;integratedSecurity=true;";
			String dbUser = "sa";
			String dbPassword = "tuanqn2103";

			// Xác nhận đơn đặt hàng
			int purchaseId = Integer.parseInt(request.getParameter("purchaseId")); // Lấy purchaseId từ request
			if (insertUserInfo(name, phone, address, brand, model, quantity, price, userName, totalPrice)) {
				try (Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPassword)) {
					String query = "UPDATE HistoryUser SET IsPurchased = 1 WHERE PurchaseId = ?";
					try (PreparedStatement statement = connection.prepareStatement(query)) {
						statement.setInt(1, purchaseId); // Set PurchaseId (index 2)
						statement.executeUpdate();
					}

				}

				// Chuyển hướng người dùng sau khi xác nhận đơn đặt hàng thành công
				response.sendRedirect("/ShowRoomCar/Confirm");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			// Handle database-related exceptions here
			response.sendRedirect("errorPage.jsp");
		}
	}

	/*
	 * private boolean insertUserInfo(String name, String phone, String address,
	 * String brand, String model, int quantity, double price, String user, double
	 * totalPrice) { try (Connection connection = getConnection(); PreparedStatement
	 * statement = connection.prepareStatement(
	 * "INSERT INTO InforUser (Name, Phone, Address, Brand, Model, Quantity, Price, NameUser, TotalPrice) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"
	 * )) { statement.setString(1, name); statement.setString(2, phone);
	 * statement.setString(3, address); statement.setString(4, brand);
	 * statement.setString(5, model); statement.setInt(6, quantity);
	 * statement.setDouble(7, price); statement.setString(8, user);
	 * statement.setDouble(9, totalPrice);
	 * 
	 * int rowsInserted = statement.executeUpdate(); return rowsInserted > 0; }
	 * catch (SQLException e) { e.printStackTrace(); return false; } }
	 */

	private boolean insertUserInfo(String name, String phone, String address, String brand, String model, int quantity,
			double price, String user, double totalPrice) {
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(
						"INSERT INTO InforUser (Name, Phone, Address, Brand, Model, Quantity, Price, NameUser, TotalPrice) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)")) {
			statement.setString(1, name);
			statement.setString(2, phone);
			statement.setString(3, address);
			statement.setString(4, brand);
			statement.setString(5, model);
			statement.setInt(6, quantity);
			statement.setDouble(7, price);
			statement.setString(8, user);
			statement.setDouble(9, totalPrice);

			int rowsInserted = statement.executeUpdate();
			return rowsInserted > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	private Connection getConnection() throws SQLException {
		String dbURL = "jdbc:sqlserver://LAPTOP-KSCIFN6A\\TUAN:1433;databaseName=managerCar;integratedSecurity=true;encrypt=true;trustServerCertificate=true";
		String dbUser = "sa";
		String dbPassword = "tuanqn2103";
		return DriverManager.getConnection(dbURL, dbUser, dbPassword);
	}

}
