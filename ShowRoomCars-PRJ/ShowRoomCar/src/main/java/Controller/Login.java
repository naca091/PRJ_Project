package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/Login")
public class Login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin đăng nhập từ biểu mẫu
        String userName = request.getParameter("Name");
        String password = request.getParameter("Password");

        // Thực hiện kiểm tra thông tin đăng nhập và vai trò của người dùng
        String userRole = isValidUser(userName, password);

        if (userRole.equals("admin")) {
            // Nếu là admin, chuyển hướng đến trang chủ của admin
            HttpSession session = request.getSession();
            session.setAttribute("userName", userName);
            response.sendRedirect("/ShowRoomCar/LoadCarsAdmin"); // URL của trang chủ của admin
        } else if (userRole.equals("user")) {
            // Nếu là người dùng, chuyển hướng đến trang chủ của người dùng
            HttpSession session = request.getSession();

            // Kiểm tra nếu người dùng khác đã đăng nhập, thì xóa giỏ hàng cũ
            String currentUserName = (String) session.getAttribute("userName");
            if (currentUserName != null && !currentUserName.equals(userName)) {
                session.removeAttribute("cartItems"); // Xóa giỏ hàng của người dùng trước

                // Thêm thông báo thông báo xóa giỏ hàng (tuỳ chọn)
                request.setAttribute("cartClearedMessage", "Your cart has been cleared as you logged in with a different user.");
            }

            session.setAttribute("userName", userName);
            response.sendRedirect("/ShowRoomCar/LoadCarsLogout"); // URL của trang chủ của người dùng
        } else {
            // Đăng nhập không thành công, có thể hiển thị thông báo lỗi
            request.setAttribute("message", "Login unsuccessful. Please check your login information.");
            request.getRequestDispatcher("/SuperCarWebsite-main/SuperCarWebsite-main/inforCar/layoutWeb/loginNotification.jsp").forward(request, response);
        }
    }

    // Hàm kiểm tra thông tin đăng nhập trong cơ sở dữ liệu
    private String isValidUser(String userName, String password) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String dbURL = "jdbc:sqlserver://LAPTOP-KSCIFN6A\\TUAN:1433;databaseName=managerCar;integratedSecurity=true;encrypt=true;trustServerCertificate=true";
            String dbUser = "sa";
            String dbPassword = "tuanqn2103";
            Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);
            String query = "SELECT Role FROM Users WHERE Name = ? AND Password = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, userName);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getString("Role"); // Trả về vai trò của người dùng
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return "invalid"; // Trả về giá trị "invalid" nếu không tìm thấy người dùng
    }
}
