package Controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Car;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/LoadCarsServlet")
public class LoadCarsServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Car> cars = new ArrayList<>();

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String dbURL = "jdbc:sqlserver://LAPTOP-KSCIFN6A\\TUAN:1433;databaseName=managerCar;integratedSecurity=true;encrypt=true;trustServerCertificate=true";
			String dbUser = "sa";
			String dbPassword = "tuanqn2103";

			Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);

			String query = "SELECT * FROM Carss";
			PreparedStatement statement = connection.prepareStatement(query);
			ResultSet resultSet = statement.executeQuery();

			while (resultSet.next()) {
				int carId = resultSet.getInt("CarId");
				String brand = resultSet.getString("Brand");
				String model = resultSet.getString("Model");
				double price = resultSet.getDouble("Price");
				String imageUrl = resultSet.getString("ImageUrl");

				Car car = new Car(carId, brand, model, price, imageUrl);
				cars.add(car);
			}

			connection.close();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("newCar", cars);

		request.getRequestDispatcher("/SuperCarWebsite-main/SuperCarWebsite-main/user/index.jsp").forward(request, response);
		
	}
}
