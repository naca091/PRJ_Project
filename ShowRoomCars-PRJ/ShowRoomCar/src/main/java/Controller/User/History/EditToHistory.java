package Controller.User.History;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.History;

@WebServlet("/EditToHistory")
public class EditToHistory extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get parameters from the request
        String purchaseIdStr = request.getParameter("purchaseId");
        String userId = request.getParameter("userId");

        // Check if parameters are not null and not empty
        if (purchaseIdStr != null && !purchaseIdStr.isEmpty() && userId != null && !userId.isEmpty()) {
            try {
                // Parse the purchaseId to an integer
                int purchaseId = Integer.parseInt(purchaseIdStr);

                // Fetch user information from the database based on PurchaseId
                History user = getUserInfo(purchaseId);

                // Set user information as an attribute in the request
                request.setAttribute("user", user);

                // Forward to the JSP page where you can display the edit form with pre-filled data
                request.getRequestDispatcher("/SuperCarWebsite-main/SuperCarWebsite-main/BuyCar/EditUserInfor.jsp").forward(request, response);
            } catch (NumberFormatException e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid purchaseId format");
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving user information");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing or empty parameters");
        }
    }

    private History getUserInfo(int purchaseId) throws ClassNotFoundException, SQLException {
        String jdbcUrl = "jdbc:sqlserver://LAPTOP-KSCIFN6A\\TUAN:1433;databaseName=managerCar;integratedSecurity=true;encrypt=true;trustServerCertificate=true";
        String dbUser = "sa";
        String dbPassword = "tuanqn2103";

        String selectQuery = "SELECT * FROM HistoryUser WHERE PurchaseId = ?";

        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
                PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {

            preparedStatement.setInt(1, purchaseId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                History user = new History();
                user.setPurchaseId(resultSet.getInt("PurchaseId"));
                user.setUserName(resultSet.getString("UserName"));
                user.setName(resultSet.getString("Name"));
                user.setPhone(resultSet.getString("Phone"));
                user.setAddress(resultSet.getString("Address"));
                user.setBrand(resultSet.getString("Brand"));
                user.setModel(resultSet.getString("Model"));
                user.setCurrentQuantity(resultSet.getInt("CurrentQuantity"));
                user.setPurchased(resultSet.getBoolean("IsPurchased"));
                user.setPrice(resultSet.getDouble("Price"));
                user.setTotalPrice(resultSet.getDouble("TotalPrice"));

                // Set other properties as needed
                return user;
            }
        }

        return null;
    }

}
