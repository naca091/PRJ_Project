package Controller.User.History;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Car;
import model.CartItem;
import model.UserInfo;

@WebServlet("/BuyTheCar")
@MultipartConfig

public class BuyTheCar extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String carId = request.getParameter("carId");
		String userName = request.getParameter("userName");
		String name = request.getParameter("Name");
		String phone = request.getParameter("Phone");
		String address = request.getParameter("Address");
		String brand = request.getParameter("brand");
		String model = request.getParameter("model");
		String imageUrl = request.getParameter("imageUrl");
		String pricep = request.getParameter("price");
		if (carId != null) {
			try {
				int carIdValue = Integer.parseInt(carId);
				int currentQuantity = Integer.parseInt(request.getParameter("currentQuantity"));
				int remainingQuantity = getRemainingQuantity(carIdValue);
				double price = Double.parseDouble(pricep);
				if (remainingQuantity >= currentQuantity) {
					int newQuantity = remainingQuantity - currentQuantity;
					if (updateCarAndIsPurchased(carIdValue, newQuantity)) {

						// Lấy chi tiết xe đã mua
						Car purchasedCar = getCarDetails(carIdValue);
						double totalPrice = purchasedCar.getPrice() * currentQuantity;

						// Lấy thông tin người dùng từ session
						HttpSession session = request.getSession();

						// Lưu thông tin mua xe vào bảng HistoryUser
						if (insertPurchaseInfo(userName, name, phone, address, brand, model, currentQuantity,
								price, imageUrl, totalPrice)) {

							// Lưu thông tin người dùng vào bảng InforUser
						/*	if (insertUserInfo(name, phone, address, brand, model, currentQuantity, price,
									userName, totalPrice)) {*/
								deleteCart(carIdValue);
								session.setAttribute("userInfo",
										new UserInfo(name, phone, address, brand, model, userName));
								// Lưu thông tin xe đã mua vào session
								session.setAttribute("purchasedCar", purchasedCar);
								session.setAttribute("currentQuantity", currentQuantity);
								session.setAttribute("totalPrice", totalPrice);

								// Chuyển hướng đến trang hiển thị thông tin xe đã mua
								response.sendRedirect(request.getContextPath() + "/History?userName=" + userName + "&imageUrl=" + imageUrl);
								return;
							} else {
								response.getWriter()
										.write("Failed to insert user information. Please try again later.");
							}
						} else {
							response.getWriter()
									.write("Failed to record purchase information. Please try again later.");
						}
					} else {
						response.getWriter().write("Failed to purchase the car. Please try again later.");
					}
					/*
					 * } else { response.getWriter().
					 * write("Not enough stock. The car is no longer available."); }
					 */
			} catch (NumberFormatException e) {
				response.getWriter().write("Invalid car ID or quantity.");
			}
		} else {
			response.getWriter().write("Car ID not provided.");
		}
	}
//LẤY TỔNG SỐ LƯỢNG CỦA XE DỰA VÀO CARID
	private int getRemainingQuantity(int carId) {
		int quantity = 0;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection
						.prepareStatement("SELECT Quantity FROM Carss WHERE CarId = ?")) {
			statement.setInt(1, carId);
			try (ResultSet resultSet = statement.executeQuery()) {
				if (resultSet.next()) {
					quantity = resultSet.getInt("Quantity");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return quantity;
	}

	private boolean updateCarAndIsPurchased(int carId, int quantity) {
		try (Connection connection = getConnection()) {
			connection.setAutoCommit(false);

			try {
				if (updateData(connection, "UPDATE Carss SET Quantity = ? WHERE CarId = ?", quantity, carId)
						&& updateData(connection, "UPDATE Carss SET IsPurchased = 1 WHERE CarId = ?", carId)) {
					connection.commit();
					return true;
				} else {
					connection.rollback();
					return false;
				}
			} catch (SQLException e) {
				connection.rollback();
				e.printStackTrace();
				return false;
			} finally {
				connection.setAutoCommit(true);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	private boolean updateData(Connection connection, String query, Object... params) throws SQLException {
		try (PreparedStatement statement = connection.prepareStatement(query)) {
			for (int i = 0; i < params.length; i++) {
				statement.setObject(i + 1, params[i]);
			}
			int rowsUpdated = statement.executeUpdate();
			return rowsUpdated > 0;
		}
	}

	private Car getCarDetails(int carId) {
		Car purchasedCar = null;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(
						"SELECT Brand, Model, Price, ImageUrl, IsPurchased FROM Carss WHERE CarId = ?")) {
			statement.setInt(1, carId);
			try (ResultSet resultSet = statement.executeQuery()) {
				if (resultSet.next()) {
					purchasedCar = new Car();
					purchasedCar.setId(carId);
					purchasedCar.setBrand(resultSet.getString("Brand"));
					purchasedCar.setModel(resultSet.getString("Model"));
					purchasedCar.setPrice(resultSet.getDouble("Price"));
					purchasedCar.setImageUrl(resultSet.getString("ImageUrl"));
					purchasedCar.setIsPurchased(resultSet.getBoolean("IsPurchased"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return purchasedCar;
	}

	private CartItem deleteCart(int Id) {
		CartItem delete = null;
		try (Connection cn = getConnection();
				PreparedStatement statement = cn.prepareStatement("DELETE FROM Cart WHERE Id = ?")) {
			statement.setInt(1, Id);

			// Use executeUpdate for DELETE queries
			int rowsAffected = statement.executeUpdate();

			if (rowsAffected > 0) {
				// If a cart item was deleted, set its details before deletion
				delete = new CartItem();
				delete.setId(Id);
			} else {
				System.out.println("No cart item found with the specified ID");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return delete;
	}

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

	private boolean insertPurchaseInfo(String userName, String fullName, String phone, String address, String brand,
			String model, int currentQuantity, double price, String imageUrl, double totalPrice) {
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(
						"INSERT INTO HistoryUser (UserName, Name, Phone, Address, Brand, Model, CurrentQuantity, IsPurchased, Price, ImageUrl, TotalPrice) "
								+ "VALUES (?, ?, ?, ?, ?, ?, ?, 0, ?, ?, ?)")) {
			statement.setString(1, userName);
			statement.setString(2, fullName);
			statement.setString(3, phone);
			statement.setString(4, address);
			statement.setString(5, brand);
			statement.setString(6, model);
			statement.setInt(7, currentQuantity);
			statement.setDouble(8, price);
			statement.setString(9, imageUrl);
			statement.setDouble(10, totalPrice);


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
