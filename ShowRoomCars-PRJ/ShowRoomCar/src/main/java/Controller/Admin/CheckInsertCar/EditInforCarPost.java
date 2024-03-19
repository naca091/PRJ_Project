package Controller.Admin.CheckInsertCar;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/EditInforCarPost")
@MultipartConfig

public class EditInforCarPost extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Get parameters from the form submission
		String carIdStr = request.getParameter("carId");
		String brand = request.getParameter("brand");
		String model = request.getParameter("model");
		double price = Double.parseDouble(request.getParameter("price"));
		String imageUrl = uploadImage(request);
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		int topSpeed = Integer.parseInt(request.getParameter("topSpeed"));
		int acceleration = Integer.parseInt(request.getParameter("acceleration"));
		int maxHorsepower = Integer.parseInt(request.getParameter("maxHorsepower"));

		try {
			// Parse the parameters
			int carId = Integer.parseInt(carIdStr);

			// Update car information in the database
			updateCarInfo(carId, brand, model, price, imageUrl, quantity, topSpeed, acceleration, maxHorsepower);

			// Redirect back to the appropriate page
			response.sendRedirect("/ShowRoomCar/LoadCarsAdmin");
		} catch (NumberFormatException | SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			// Handle exceptions accordingly and redirect to an error page or display an
			// error message
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error updating car information");
		}
	}

	private String uploadImage(HttpServletRequest request) throws IOException, ServletException {
		Part filePart = request.getPart("imageUrl");
		String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

		// Save the file to a directory
		String realPath = request.getServletContext().getRealPath("/img");
		if (!Files.exists(Paths.get(realPath))) {
			Files.createDirectories(Paths.get(realPath));
		}
		Files.walk(Paths.get(realPath)).filter(Files::isRegularFile).map(Path::toFile).forEach(File::delete);

		try (InputStream input = filePart.getInputStream()) {
			Files.copy(input, Paths.get(realPath, fileName), StandardCopyOption.REPLACE_EXISTING);
		}

		return fileName;
	}

	 private void updateCarInfo(int carId, String brand, String model, double price, String imageUrl, int quantity,
	            int topSpeed, int acceleration, int maxHorsepower) throws ClassNotFoundException, SQLException {
	        // Your database connection code
	        String dbURL = "jdbc:sqlserver://LAPTOP-KSCIFN6A\\TUAN:1433;databaseName=managerCar;integratedSecurity=true;encrypt=true;trustServerCertificate=true";
	        String dbUser = "sa";
	        String dbPassword = "tuanqn2103";

	        String updateQuery = "UPDATE Carss SET Brand = ?, Model = ?, Price = ?, ImageUrl = ?, "
	                + "Quantity = ?, TopSpeed = ?, Acceleration = ?, MaxHorsepower = ? WHERE CarId = ?";

	        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

	        try (Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);
	                PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {

	            preparedStatement.setString(1, brand);
	            preparedStatement.setString(2, model);
	            preparedStatement.setDouble(3, price);
	            preparedStatement.setString(4, imageUrl);
	            preparedStatement.setInt(5, quantity);
	            preparedStatement.setInt(6, topSpeed);
	            preparedStatement.setInt(7, acceleration);
	            preparedStatement.setInt(8, maxHorsepower);
	            preparedStatement.setInt(9, carId);

	            int rowsAffected = preparedStatement.executeUpdate();

	            if (rowsAffected > 0) {
	                System.out.println("Car information updated successfully");
	            } else {
	                System.out.println("No car found with the specified CarId");
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	            // Handle SQLException appropriately
	        }
	    }	
}
