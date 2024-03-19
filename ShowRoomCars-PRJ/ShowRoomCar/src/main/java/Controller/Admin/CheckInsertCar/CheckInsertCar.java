package Controller.Admin.CheckInsertCar;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.Car;

@MultipartConfig
@WebServlet("/CheckInsertCar")
public class CheckInsertCar extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("CarId"));
            String brand = request.getParameter("Brand");
            String model = request.getParameter("Model");
            double price = Double.parseDouble(request.getParameter("Price"));
            int quantity = Integer.parseInt(request.getParameter("Quantity"));
            double maxHorsepower = Double.parseDouble(request.getParameter("MaxHorsepower"));
            int topSpeed = Integer.parseInt(request.getParameter("TopSpeed"));
            double acceleration = Double.parseDouble(request.getParameter("Acceleration"));

            Part part = request.getPart("ImageUrl");

            String contentType = part.getContentType();
            if (!contentType.startsWith("image/")) {
                response.sendError(HttpServletResponse.SC_UNSUPPORTED_MEDIA_TYPE, "Invalid file type");
                return;
            }

            String realPath = request.getServletContext().getRealPath("/img");
            String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();

            if (!Files.exists(Paths.get(realPath))) {
                Files.createDirectories(Paths.get(realPath));
            }
            part.write(realPath + "/" + fileName);

            if (insertCar(id, brand, model, price, fileName, quantity, maxHorsepower, topSpeed, acceleration)) {
                List<Car> cars = new ArrayList<>();
                request.setAttribute("newCar", cars);
                request.getRequestDispatcher("/LoadCarsAdmin").forward(request, response);
            } else {
                request.setAttribute("insertFailed", "Adding vehicles failed. Please try again.");
                request.getRequestDispatcher("/LoadCarsAdmin").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private boolean insertCar(int id, String brand, String model, double price, String imageUrl, int quantity, double maxHorsepower, int topSpeed, double acceleration) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String dbURL = "jdbc:sqlserver://LAPTOP-KSCIFN6A\\TUAN:1433;databaseName=managerCar;integratedSecurity=true;encrypt=true;trustServerCertificate=true";
            String dbUser = "sa";
            String dbPassword = "tuanqn2103";
            Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);
            String query = "INSERT INTO Carss (CarId, Brand, Model, Price, Quantity, ImageUrl, MaxHorsepower, TopSpeed, Acceleration) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            statement.setString(2, brand);
            statement.setString(3, model);
            statement.setDouble(4, price);
            statement.setInt(5, quantity);
            statement.setString(6, imageUrl);
            statement.setDouble(7, maxHorsepower);
            statement.setInt(8, topSpeed);
            statement.setDouble(9, acceleration);

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
