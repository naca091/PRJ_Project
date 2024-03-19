/*
 * package CarManager;
 * 
 * import java.io.IOException; import java.io.PrintWriter;
 * 
 * import javax.servlet.ServletException; import
 * javax.servlet.annotation.WebServlet; import javax.servlet.http.HttpServlet;
 * import javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse;
 * 
 * @WebServlet("/TotalRevenue") public class TotalRevenueServlet extends
 * HttpServlet { protected void doGet(HttpServletRequest request,
 * HttpServletResponse response) throws ServletException, IOException {
 * response.setContentType("text/html");
 * 
 * // Retrieve the total revenue from the servlet context Double totalRevenue =
 * (Double) getServletContext().getAttribute("totalRevenue"); if (totalRevenue
 * == null) { totalRevenue = 0.0; }
 * 
 * // You can now use totalRevenue for any purpose, for example, printing it to
 * the response PrintWriter out = response.getWriter();
 * out.println("Total Revenue from Cars: $" + totalRevenue.toFixed(2)); } }
 */
package Controller;

