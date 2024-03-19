package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/InforUser")
public class InforUser extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String carId = request.getParameter("carId");
        String currentQuantity = request.getParameter("currentQuantity");
        String userName = request.getParameter("userName");
        String priceParameter = request.getParameter("price");

        // Remove the dollar sign before attempting to parse
        priceParameter = priceParameter.replace("$", "");

        double price = 0.0;

        // Handle null or empty price parameter
        if (priceParameter != null && !priceParameter.isEmpty()) {
            try {
                price = Double.parseDouble(priceParameter);
            } catch (NumberFormatException e) {
                // Handle the case where the parameter is not a valid double
                // Log the exception or handle it appropriately
                e.printStackTrace();
            }
        }

        String url = request.getParameter("image");

        // Forward to JSP with parameters
        request.getRequestDispatcher("/SuperCarWebsite-main/SuperCarWebsite-main/user/InsertInfor.jsp?carId=" + carId
                + "&currentQuantity=" + currentQuantity + "&userName=" + userName + "&image=" + url + "&price=" + price)
                .forward(request, response);
    }
}
