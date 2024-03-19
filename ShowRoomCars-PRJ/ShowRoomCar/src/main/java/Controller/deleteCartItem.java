package Controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Car;
import model.CartItem;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/deleteCartItem")
public class deleteCartItem extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Retrieve the cart item ID from the request
		String cartItemId = request.getParameter("cartItemId");
		int carIdValue = Integer.parseInt(cartItemId);

		// Perform the deletion logic (remove item from session, database, etc.)
		// Example: assuming cartItems is a session attribute storing the cart items
		HttpSession session = request.getSession();
		List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");

		// Your logic to remove the item with the specified ID from the list
		boolean deletionSuccess = false;

		Iterator<CartItem> iterator = cartItems.iterator();
		while (iterator.hasNext()) {
			CartItem cartItem = iterator.next();
			if (cartItem.getId() == (carIdValue)) {
				iterator.remove();
				deletionSuccess = true;
				break;
			}
		}

		// Send a JSON response indicating success or failure
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();

		if (deletionSuccess) {
			out.println("{\"success\": true}");
		} else {
			out.println("{\"success\": false}");
		}
	}
}