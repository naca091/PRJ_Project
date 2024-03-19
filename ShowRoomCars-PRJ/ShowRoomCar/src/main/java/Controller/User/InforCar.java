package Controller.User;

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

import model.Car;

@WebServlet("/InforCar")
public class InforCar extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");

        // Retrieve the carId parameter from the request
        String carId = request.getParameter("carId");

        if (carId == null || carId.isEmpty()) {
            // Redirect or display an error message as needed
            request.getRequestDispatcher("/ShowRoomCar/LoadCarsLogout").forward(request, response);
            return;
        }

        try {
            // Attempt to parse carId as an integer
            int carIdValue = Integer.parseInt(carId);

            // Establish a database connection
            String dbURL = "jdbc:sqlserver://LAPTOP-KSCIFN6A\\TUAN:1433;databaseName=managerCar;integratedSecurity=true;";
            String dbUser = "sa";
            String dbPassword = "tuanqn2103";

            try (Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                 PreparedStatement statement = connection.prepareStatement("SELECT CarId, Brand, Model, Price, ImageUrl, MaxHorsepower, TopSpeed, Acceleration FROM Carss WHERE CarId = ?")) {
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
                        car.setMaxHorsepower(resultSet.getInt("MaxHorsepower"));
                        car.setTopSpeed(resultSet.getInt("TopSpeed"));
                        car.setAcceleration(resultSet.getFloat("Acceleration"));

                        List<Car> carList = new ArrayList<>();
                        carList.add(car);

                        request.setAttribute("carList", carList);
                        request.getRequestDispatcher("/SuperCarWebsite-main/SuperCarWebsite-main/user/inforCar.jsp").forward(request, response);
                    } else {
                        // Redirect or display an error message as needed
                        response.sendRedirect("carNotFound.jsp");
                    }
                }
            }
        } catch (NumberFormatException | SQLException e) {
            // Redirect or display an error message as needed
            response.sendRedirect("errorPage.jsp");
        }
    }
}
