package Controller.User.History;

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

@WebServlet("/EditToHistoryPost")
public class EditToHistoryPost extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get parameters from the form submission
        String purchaseIdStr = request.getParameter("purchaseId");
        String userName = request.getParameter("userName");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String quantityStr = request.getParameter("quantity");
        double price = Double.parseDouble(request.getParameter("price"));
        try {
            // Parse the parameters
            int purchaseId = Integer.parseInt(purchaseIdStr);
            int quantity = Integer.parseInt(quantityStr);
            double totalPrice = price * quantity;
            // Update user information in the database
            updateUserInfo(purchaseId, userName, name, phone, address, quantity, totalPrice);

            // Redirect back to the user's profile page or another appropriate page
            response.sendRedirect("/ShowRoomCar/History?userName=" + userName);
        } catch (NumberFormatException | SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            // Handle exceptions accordingly and redirect to an error page or display an error message
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error updating user information");
        }
    }

    private void updateUserInfo(int purchaseId, String userName, String name, String phone, String address, int quantity, double totalPrice)
            throws ClassNotFoundException, SQLException {
    	String dbURL = "jdbc:sqlserver://LAPTOP-KSCIFN6A\\TUAN:1433;databaseName=managerCar;integratedSecurity=true;encrypt=true;trustServerCertificate=true";
		String dbUser = "sa";
		String dbPassword = "tuanqn2103";

        String updateQuery = "UPDATE HistoryUser SET Name = ?, Phone = ?, Address = ?, CurrentQuantity = ? , TotalPrice = ? WHERE PurchaseId = ? AND UserName = ?";

        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

        try (Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {

            preparedStatement.setString(1, name);
            preparedStatement.setString(2, phone);
            preparedStatement.setString(3, address);
            preparedStatement.setInt(4, quantity);
            preparedStatement.setDouble(5, totalPrice);
            preparedStatement.setInt(6, purchaseId);
            preparedStatement.setString(7, userName);

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("User information updated successfully");
            } else {
                System.out.println("No user found with the specified PurchaseId and UserName");
            }
        }
    }
}
