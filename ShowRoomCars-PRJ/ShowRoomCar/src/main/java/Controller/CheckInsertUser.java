package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CheckInsertUser")
public class CheckInsertUser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy thông tin từ biểu mẫu
        String userName = request.getParameter("userName");
        String name = request.getParameter("Name");
        String phone = request.getParameter("Phone");
        String address = request.getParameter("Address");
        String carId = request.getParameter("carId");
        String currentQuantity = request.getParameter("currentQuantity");
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        String price = request.getParameter("price");
        String imageUrl = request.getParameter("imageUrl"); // Add this line

        // Kiểm tra xem các thông tin có khác null hay không
        if (userName != null && !userName.isEmpty() && name != null && !name.isEmpty() && phone != null
                && !phone.isEmpty() && address != null && !address.isEmpty() && carId != null && !carId.isEmpty()
                && currentQuantity != null && !currentQuantity.isEmpty() && brand != null && !brand.isEmpty()
                && model != null && !model.isEmpty() && price != null && !price.isEmpty() && imageUrl != null
                && !imageUrl.isEmpty()) {
            // Chuyển hướng đến servlet /BuyTheCar
            response.sendRedirect(request.getContextPath() + "/BuyTheCar?carId=" + carId + "&userName=" + userName
                    + "&currentQuantity=" + currentQuantity + "&Name=" + name + "&Phone=" + phone + "&Address="
                    + address + "&brand=" + brand + "&model=" + model + "&price=" + price + "&imageUrl=" + imageUrl); // Add imageUrl
        } else {
            // Xuất thông báo lỗi nếu có thông tin bị thiếu
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<h2>Error:</h2>");
            out.println("<p>Some information is missing. Please fill in all fields.</p>");
            out.println("</body></html>");
        }
    }
}
