package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Register")
public class Register extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("Name");
        String email = request.getParameter("Email");
        String password = request.getParameter("Password");
        String fullName = request.getParameter("FullName");
        String phone = request.getParameter("Phone");
        String address = request.getParameter("Address");

        String errorMessage = null;

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String dbUrl = "jdbc:sqlserver://LAPTOP-KSCIFN6A\\TUAN:1433;databaseName=managerCar;integratedSecurity=true;encrypt=true;trustServerCertificate=true";
            String dbUser = "sa";
            String dbPassword = "tuanqn2103";
            Connection connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

            // Kiểm tra xem tên đã tồn tại trong cơ sở dữ liệu chưa
            String checkExistingUserSql = "SELECT Name FROM Users WHERE Name=?";
            PreparedStatement checkStatement = connection.prepareStatement(checkExistingUserSql);
            checkStatement.setString(1, name);
            ResultSet resultSet = checkStatement.executeQuery();

            if (resultSet.next()) {
                // Tên đã tồn tại, gán thông báo lỗi
                errorMessage = "Name is already taken. Please choose a different name.";
            } else {
                // Tên không tồn tại, kiểm tra email
                String checkExistingEmailSql = "SELECT Email FROM Users WHERE Email=?";
                PreparedStatement checkEmailStatement = connection.prepareStatement(checkExistingEmailSql);
                checkEmailStatement.setString(1, email);
                ResultSet emailResultSet = checkEmailStatement.executeQuery();

                if (emailResultSet.next()) {
                    // Email đã tồn tại, gán thông báo lỗi
                    errorMessage = "Email is already in use. Please use a different email.";
                } else {
                    // Email không tồn tại, thêm bản ghi mới
                	String insertUserSql = "INSERT INTO Users (Name, Email, Password, Role, FullName, Phone, Address) VALUES (?, ?, ?, 'user', ?, ?, ?)";
                	PreparedStatement insertStatement = connection.prepareStatement(insertUserSql);
                	insertStatement.setString(1, name);
                	insertStatement.setString(2, email);
                	insertStatement.setString(3, password);
                	insertStatement.setString(4, fullName);
                	insertStatement.setString(5, phone);
                	insertStatement.setString(6, address);
                	int rows = insertStatement.executeUpdate();

                	// ... (existing code)


                    if (rows > 0) {
                        // Thông báo thành công
                        errorMessage = "You have successfully created an account";
                    } else {
                        // Thông báo thất bại
                        errorMessage = "Registration failed";
                    }
                    insertStatement.close();
                }
                checkEmailStatement.close();
                emailResultSet.close();
            }

            checkStatement.close();
            resultSet.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            errorMessage = "An error occurred.";
        }

        request.setAttribute("errorMessage", errorMessage);
        request.getRequestDispatcher("inforCar/layoutWeb/RegisterForm.jsp").forward(request, response);
    }
}
