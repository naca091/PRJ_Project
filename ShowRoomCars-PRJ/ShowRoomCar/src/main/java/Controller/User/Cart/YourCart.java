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

/*@WebServlet("/YourCart")
*/public class YourCart extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userName = request.getParameter("userName");

        // Gọi đến DAO để lấy thông tin từ database
        List<CartItem> cartItems = new ArrayList<>();

        // Thực hiện kết nối database và truy vấn
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String dbURL = "jdbc:sqlserver://LAPTOP-KSCIFN6A\\TUAN:1433;databaseName=managerCar;integratedSecurity=true;encrypt=true;trustServerCertificate=true";
            String dbUser = "sa";
            String dbPassword = "tuanqn2103";

            try (Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                 PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Cart WHERE userName=?")) {

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
        RequestDispatcher dispatcher = request.getRequestDispatcher("/SuperCarWebsite-main/SuperCarWebsite-main/Cart/YourCart.jsp");
        dispatcher.forward(request, response);
    }
}
