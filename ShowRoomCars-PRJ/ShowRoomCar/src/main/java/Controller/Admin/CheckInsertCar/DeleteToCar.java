package Controller.Admin.CheckInsertCar;

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

@WebServlet("/DeleteToCar")
public class DeleteToCar extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the cart item ID from the request
        String cartItemIdStr = request.getParameter("Id");

        // Check if cartItemId is not null and not empty
        if (cartItemIdStr != null && !cartItemIdStr.isEmpty()) {
            try {
                // Parse the cart item ID to an integer
                int cartItemId = Integer.parseInt(cartItemIdStr);

                // JDBC URL, username, and password of SQL Server
                String jdbcUrl = "jdbc:sqlserver://LAPTOP-KSCIFN6A\\TUAN:1433;databaseName=managerCar;integratedSecurity=true;encrypt=true;trustServerCertificate=true";
                String dbUser = "sa";
                String dbPassword = "tuanqn2103";

                // SQL query to delete a cart item by ID
                String deleteQuery = "DELETE FROM Carss WHERE CarId = ?";

                // Load the JDBC driver
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

                // Establish a connection
                try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
                        // Create a prepared statement with the delete query
                        PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery)) {

                    // Set the parameter (cartItemId) for the delete query
                    preparedStatement.setInt(1, cartItemId);

                    // Execute the delete query
                    int rowsAffected = preparedStatement.executeUpdate();

                    if (rowsAffected > 0) {
                        // Redirect back to the cart page after deletion
                		request.getRequestDispatcher("/LoadCarsAdmin").forward(request, response);

                    } else {
                        System.out.println("No cart item found with the specified ID");
                    }
                }
            } catch (NumberFormatException | ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                // Handle exceptions accordingly
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing request");
            }
        } else {
            // Handle the case where cartItemId is null or empty
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing cart item ID");
        }
    }
}
