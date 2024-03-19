package Controller.User.Infor;


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

import model.User;

@WebServlet("/FullInforUser")
public class FullInforUser extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId = request.getParameter("userName");

        if (userId != null && !userId.isEmpty()) {
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                String dbURL = "jdbc:sqlserver://LAPTOP-KSCIFN6A\\TUAN:1433;databaseName=managerCar;integratedSecurity=true;";
                String dbUser = "sa";
                String dbPassword = "tuanqn2103";

                try (Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                     PreparedStatement statement = connection.prepareStatement("SELECT * FROM Users WHERE Name = ?");
                ) {
                    statement.setString(1, userId);

                    try (ResultSet resultSet = statement.executeQuery()) {
                        if (resultSet.next()) {
                            User user = new User();
                            user.setUsername(resultSet.getString("Name"));
                            user.setEmail(resultSet.getString("Email"));
                            user.setPassword(resultSet.getString("Password"));
                            user.setFullName(resultSet.getString("FullName"));
                            user.setPhone(resultSet.getString("Phone"));
                            user.setAddress(resultSet.getString("Address"));

                            request.setAttribute("user", user);
                            request.getRequestDispatcher("/SuperCarWebsite-main/SuperCarWebsite-main/user/FullInforUser.jsp").forward(request, response);
                        } else {
                            // Handle the case where the user with the given ID is not found
                            response.sendRedirect("userNotFound.jsp");
                        }
                    }
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                // Handle the exception as needed
                response.sendRedirect("errorPage.jsp");
            }
        } else {
            // Handle invalid or missing userId parameter
            response.sendRedirect("invalidUserId.jsp");
        }
    }
}
