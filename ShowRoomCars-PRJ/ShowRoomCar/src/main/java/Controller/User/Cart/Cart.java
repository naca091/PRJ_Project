/*
 * package YourCart;
 * 
 * import java.io.IOException; import java.sql.Connection; import
 * java.sql.DriverManager; import java.sql.PreparedStatement; import
 * java.sql.ResultSet; import java.sql.SQLException; import java.util.ArrayList;
 * import java.util.List;
 * 
 * import javax.servlet.ServletException; import
 * javax.servlet.annotation.WebServlet; import javax.servlet.http.HttpServlet;
 * import javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse;
 * 
 * import model.Car;
 * 
 * @WebServlet("/Cart") public class Cart extends HttpServlet { protected void
 * doGet(HttpServletRequest request, HttpServletResponse response) throws
 * ServletException, IOException { response.setContentType("text/html");
 * 
 * // Retrieve the carId parameter from the request String carId =
 * request.getParameter("carId"); String userName =
 * request.getParameter("userName"); if (carId == null || carId.isEmpty()) { //
 * Redirect or display an error message as needed request.getRequestDispatcher(
 * "/SuperCarWebsite-main/SuperCarWebsite-main/Cart/cart.jsp").forward(request,
 * response); return; }
 * 
 * try { // Attempt to parse carId as an integer int carIdValue =
 * Integer.parseInt(carId);
 * 
 * // Establish a database connection String dbURL =
 * "jdbc:sqlserver://LAPTOP-KSCIFN6A\\TUAN:1433;databaseName=managerCar;integratedSecurity=true;";
 * String dbUser = "sa"; String dbPassword = "tuanqn2103";
 * 
 * try (Connection connection = DriverManager.getConnection(dbURL, dbUser,
 * dbPassword); PreparedStatement statement = connection
 * .prepareStatement("SELECT Brand, Model, Price, ImageUrl FROM Carss WHERE CarId = ?"
 * )) { statement.setInt(1, carIdValue);
 * 
 * try (ResultSet resultSet = statement.executeQuery()) { if (resultSet.next())
 * { // Create a Car object to store car information Car car = new Car();
 * car.setId(carIdValue); car.setBrand(resultSet.getString("Brand"));
 * car.setModel(resultSet.getString("Model"));
 * car.setPrice(resultSet.getDouble("Price"));
 * car.setImageUrl(resultSet.getString("ImageUrl"));
 * 
 * // Retrieve cart from session List<Car> cart = (List<Car>)
 * request.getSession().getAttribute("cartItems");
 * 
 * if (cart == null) { cart = new ArrayList<>();
 * request.getSession().setAttribute("cartItems", cart); }
 * 
 * boolean carExistsInCart = false;
 * 
 * for (Car item : cart) { if (item.getId() == car.getId()) { // Car already
 * exists in the cart, increase quantity item.setQuantity(item.getQuantity() +
 * 1); carExistsInCart = true; break; } }
 * 
 * if (!carExistsInCart) { // Car is not in the cart, add it car.setQuantity(1);
 * cart.add(car);
 * 
 * // Execute SQL statement to insert data executeInsertStatement(connection,
 * car, request.getParameter("userName")); }
 * 
 * // Forward the request to cart.jsp request.getRequestDispatcher("/YourCart")
 * .forward(request, response); } else { // Redirect or display an error message
 * as needed response.sendRedirect("carNotFound.jsp"); } } } } catch
 * (NumberFormatException | SQLException e) { // Handle exceptions by forwarding
 * to an error page request.getRequestDispatcher(
 * "/SuperCarWebsite-main/SuperCarWebsite-main/Cart/errorPage.jsp")
 * .forward(request, response); } }
 * 
 * private void executeInsertStatement(Connection connection, Car car, String
 * userName) throws SQLException { // SQL statement to insert data into the
 * table String insertDataSQL =
 * "INSERT INTO Cart (Id, UserName, Brand, Model, Price, ImageUrl, Quantity) VALUES (?, ?, ?, ?, ?, ?, ?)"
 * ;
 * 
 * try (PreparedStatement insertDataStatement =
 * connection.prepareStatement(insertDataSQL)) {
 * 
 * // Insert data into the table insertDataStatement.setInt(1, car.getId());
 * insertDataStatement.setString(2, userName); insertDataStatement.setString(3,
 * car.getBrand()); insertDataStatement.setString(4, car.getModel());
 * insertDataStatement.setDouble(5, car.getPrice());
 * insertDataStatement.setString(6, car.getImageUrl());
 * insertDataStatement.setInt(7, car.getQuantity());
 * 
 * insertDataStatement.executeUpdate(); } } }
 */
package Controller.User.Cart;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Car;
import model.CartItem;

@WebServlet({ "/Cart", "/YourCart" })
public class Cart extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");

		String userName = request.getParameter("userName");

		if (request.getServletPath().equals("/Cart")) {
			// Handling the addition of items to the cart
			handleAddToCart(request, response, userName);
		} else if (request.getServletPath().equals("/YourCart")) {
			// Handling the retrieval of items from the cart
			handleRetrieveCart(request, response, userName);
		}
	}

	private void handleAddToCart(HttpServletRequest request, HttpServletResponse response, String userName)
			throws ServletException, IOException {
		// Retrieve the carId parameter from the request
		String carId = request.getParameter("carId");

		if (carId == null || carId.isEmpty()) {
			// Redirect or display an error message as needed
			request.getRequestDispatcher("/SuperCarWebsite-main/SuperCarWebsite-main/Cart/cart.jsp").forward(request,
					response);
			return;
		}

		try {
			// Attempt to parse carId as an integer
			int carIdValue = Integer.parseInt(carId);
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

			// Establish a database connection
			String dbURL = "jdbc:sqlserver://LAPTOP-KSCIFN6A\\TUAN:1433;databaseName=managerCar;integratedSecurity=true;";
			String dbUser = "sa";
			String dbPassword = "tuanqn2103";

			try (Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);
					PreparedStatement statement = connection
							.prepareStatement("SELECT Brand, Model, Price, ImageUrl FROM Carss WHERE CarId = ?")) {
				statement.setInt(1, carIdValue);

				try (ResultSet resultSet = statement.executeQuery()) {
					if (resultSet.next()) {
						// Create a Car object to store car information
						Car car = new Car();
						car.setId(carIdValue);
						car.setBrand(resultSet.getString("Brand"));
						car.setModel(resultSet.getString("Model"));
						car.setPrice(resultSet.getDouble("Price"));
						car.setImageUrl(resultSet.getString("ImageUrl"));

						// Retrieve cart from session
						List<Car> cart = (List<Car>) request.getSession().getAttribute("cartItems");

						if (cart == null) {
							cart = new ArrayList<>();
							request.getSession().setAttribute("cartItems", cart);
						}

						boolean carExistsInCart = false;

						for (Car item : cart) {
							if (item.getId() == car.getId()) {
								// Car already exists in the cart, increase quantity
								item.setQuantity(item.getQuantity() + 1);
								carExistsInCart = true;
								break;
							}
						}

						if (!carExistsInCart) {
							// Car is not in the cart, add it
							car.setQuantity(1);
							cart.add(car);

							// Execute SQL statement to insert data
							executeInsertStatement(connection, car, userName);
						}

						// Forward the request to cart.jsp
						request.getRequestDispatcher("/YourCart").forward(request, response);
					} else {
						// Redirect or display an error message as needed
						response.sendRedirect("carNotFound.jsp");
					}
				}
			}
		} catch (NumberFormatException | SQLException | ClassNotFoundException e) {
			// Handle exceptions by forwarding to an error page
			request.getRequestDispatcher("/SuperCarWebsite-main/SuperCarWebsite-main/Cart/errorPage.jsp")
					.forward(request, response);
		}

	}

	private void handleRetrieveCart(HttpServletRequest request, HttpServletResponse response, String userName)
			throws ServletException, IOException {
		// Gọi đến DAO để lấy thông tin từ database
		List<CartItem> cartItems = new ArrayList<>();

		// Thực hiện kết nối database và truy vấn
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String dbURL = "jdbc:sqlserver://LAPTOP-KSCIFN6A\\TUAN:1433;databaseName=managerCar;integratedSecurity=true;encrypt=true;trustServerCertificate=true";
			String dbUser = "sa";
			String dbPassword = "tuanqn2103";

			try (Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);
					PreparedStatement preparedStatement = connection
							.prepareStatement("SELECT * FROM Cart WHERE userName=?")) {

				preparedStatement.setString(1, userName);

				try (ResultSet resultSet = preparedStatement.executeQuery()) {
					while (resultSet.next()) {
						int id = resultSet.getInt("Id");
						String name = resultSet.getString("UserName");
						String brand = resultSet.getString("Brand");
						String model = resultSet.getString("Model");
						double price = resultSet.getDouble("Price");
						String url = resultSet.getString("ImageUrl");
						int quantity = resultSet.getInt("Quantity");

						CartItem cartItem = new CartItem(id, name, brand, model, price, url, quantity);
						cartItems.add(cartItem);
					}
				}

			} catch (SQLException e) {
				// Log the exception using a logging framework
				e.printStackTrace();
			}

		} catch (ClassNotFoundException e) {
			// Log the exception using a logging framework
			e.printStackTrace();
		}

		// Chuyển thông tin qua JSP để hiển thị
		request.setAttribute("cartItems", cartItems);
		RequestDispatcher dispatcher = request
				.getRequestDispatcher("/SuperCarWebsite-main/SuperCarWebsite-main/Cart/YourCart.jsp");
		dispatcher.forward(request, response);
	}

	private void executeInsertStatement(Connection connection, Car car, String userName) throws SQLException {
		// SQL statement to insert data into the table
		String insertDataSQL = "INSERT INTO Cart (Id, UserName, Brand, Model, Price, ImageUrl, Quantity) VALUES (?, ?, ?, ?, ?, ?, ?)";

		try (PreparedStatement insertDataStatement = connection.prepareStatement(insertDataSQL)) {

			// Insert data into the table
			insertDataStatement.setInt(1, car.getId());
			insertDataStatement.setString(2, userName);
			insertDataStatement.setString(3, car.getBrand());
			insertDataStatement.setString(4, car.getModel());
			insertDataStatement.setDouble(5, car.getPrice());
			insertDataStatement.setString(6, car.getImageUrl());
			insertDataStatement.setInt(7, car.getQuantity());

			insertDataStatement.executeUpdate();
		}
	}
}
