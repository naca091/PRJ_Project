package Controller.Admin.ManagerUser;
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

@WebServlet("/DeleteUser")
public class DeleteUser extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve userId parameter from the request
        String userId = request.getParameter("userId");

        if (userId != null && !userId.isEmpty()) {
            Connection connection = null;
            try {
                // Establish a database connection
                // Load the SQL Server JDBC driver
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

                // Replace the connection URL, username, and password with your actual database information
                String dbURL = "jdbc:sqlserver://LAPTOP-KSCIFN6A\\TUAN:1433;databaseName=managerCar;integratedSecurity=true;";
                String dbUser = "sa";
                String dbPassword = "tuanqn2103";

                // Create a connection
                connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                // Prepare the delete statement
                String deleteQuery = "DELETE FROM Users WHERE ID = ?";
                try (PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery)) {
                    preparedStatement.setInt(1, Integer.parseInt(userId));

                    // Execute the delete statement
                    int rowsDeleted = preparedStatement.executeUpdate();

                    if (rowsDeleted > 0) {
                        // User deleted successfully
                        request.getRequestDispatcher("/ManagerUser").forward(request, response);
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
