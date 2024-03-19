package Controller.Admin.TotalRevenue;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.managerListTotalPrice;

@WebServlet("/TotalRevenue")
public class TotalRevenue extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<managerListTotalPrice> userList = getUserListFromDatabase(); // Assuming User is your correct model class
		request.setAttribute("userList", userList);
		request.getRequestDispatcher("/SuperCarWebsite-main/SuperCarWebsite-main/admin/TotalRevenue.jsp")
				.forward(request, response);
	}

	private List<managerListTotalPrice> getUserListFromDatabase() {
		List<managerListTotalPrice> userList = new ArrayList<>();

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace(); // Handle or log appropriately
			return userList; // or throw an exception
		}

		try (Connection connection = DriverManager.getConnection(
				"jdbc:sqlserver://LAPTOP-KSCIFN6A\\TUAN:1433;databaseName=managerCar;integratedSecurity=true;encrypt=true;trustServerCertificate=true",
				"sa", "tuanqn2103");
				PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM InforUser");
				ResultSet resultSet = preparedStatement.executeQuery()) {

			while (resultSet.next()) {
				int userID = resultSet.getInt("UserID");
				String name = resultSet.getString("Name");
				String phone = resultSet.getString("Phone");
				String address = resultSet.getString("Address");
				String brand = resultSet.getString("Brand");
				String model = resultSet.getString("Model");
				int quantity = resultSet.getInt("Quantity");
				String price = resultSet.getString("Price");
				String nameUser = resultSet.getString("NameUser");
				managerListTotalPrice user = new managerListTotalPrice(userID, name, phone, address, brand, model,
						quantity, price, nameUser);
				userList.add(user);
			}

		} catch (SQLException e) {
			e.printStackTrace(); // Handle or log appropriately
		}

		return userList;
	}
}
