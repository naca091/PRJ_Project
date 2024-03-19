package Controller.User.History;

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

import model.History;

@WebServlet("/History")
public class Historys extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        String userName = request.getParameter("userName");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String dbURL = "jdbc:sqlserver://LAPTOP-KSCIFN6A\\TUAN:1433;databaseName=managerCar;integratedSecurity=true;";
            String dbUser = "sa";
            String dbPassword = "tuanqn2103";

            List<History> purchasedCars = new ArrayList<>();

            try (Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPassword)) {
                String query = "SELECT * FROM HistoryUser WHERE UserName = ?";
                try (PreparedStatement statement = connection.prepareStatement(query)) {
                    statement.setString(1, userName);

                    try (ResultSet resultSet = statement.executeQuery()) {
                        while (resultSet.next()) {
                        	int id = resultSet.getInt("PurchaseId");
                        	String userNames = resultSet.getString("UserName");
                        	String name = resultSet.getString("Name");
                        	String phone = resultSet.getString("Phone");
                        	String address = resultSet.getString("Address");
                        	String brand = resultSet.getString("Brand");
                        	String model = resultSet.getString("Model");
                        	int currentQuantity = resultSet.getInt("CurrentQuantity");
                        	boolean isPurchased = resultSet.getBoolean("IsPurchased");
                        	double price = resultSet.getDouble("Price");
                        	String imageUrl = resultSet.getString("ImageUrl");
                        	double totalPrice = resultSet.getDouble("TotalPrice");


                            History ht = new History(id, userNames, name, phone, address, brand, model, currentQuantity, isPurchased, price, imageUrl, totalPrice);
                            purchasedCars.add(ht);
                        }
                    }

                }
            }

            // Set the list of purchased cars and user information in the request attributes
            request.setAttribute("purchasedCars", purchasedCars);

            // Forward the request to History.jsp
            request.getRequestDispatcher("/SuperCarWebsite-main/SuperCarWebsite-main/BuyCar/History.jsp").forward(request, response);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Handle database-related exceptions here
            response.sendRedirect("errorPage.jsp");
        }
    }
}
