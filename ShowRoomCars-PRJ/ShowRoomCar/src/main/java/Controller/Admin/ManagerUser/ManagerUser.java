package Controller.Admin.ManagerUser;

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

import model.User;

@WebServlet("/ManagerUser")
public class ManagerUser extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String dbURL = "jdbc:sqlserver://LAPTOP-KSCIFN6A\\TUAN:1433;databaseName=managerCar;integratedSecurity=true;";
            String dbUser = "sa";
            String dbPassword = "tuanqn2103";

            try (Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                 PreparedStatement statement = connection.prepareStatement("SELECT * FROM Users");
                 ResultSet resultSet = statement.executeQuery()) {

                List<User> userList = new ArrayList<>();

                while (resultSet.next()) {
                    User user = new User();
                    user.setUserId(resultSet.getInt("ID"));
                    user.setUsername(resultSet.getString("Name"));
                    user.setEmail(resultSet.getString("Email"));
                    user.setPassword(resultSet.getString("Password"));
                    user.setRole(resultSet.getString("Role"));
                    user.setFullName(resultSet.getString("FullName"));
                    user.setPhone(resultSet.getString("Phone"));
                    user.setAddress(resultSet.getString("Address"));

                    userList.add(user);
                }

                request.setAttribute("userList", userList);
                request.getRequestDispatcher("/SuperCarWebsite-main/SuperCarWebsite-main/admin/ManagerUser.jsp").forward(request, response);

            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Handle the exception as needed
            response.sendRedirect("errorPage.jsp");
        }
    }
}
