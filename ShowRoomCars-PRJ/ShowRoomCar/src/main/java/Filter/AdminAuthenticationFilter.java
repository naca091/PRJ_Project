
package Filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/LoadCarsAdmin/*")
public class AdminAuthenticationFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;

		HttpSession session = httpRequest.getSession(false);

		boolean loggedIn = session != null && session.getAttribute("userName") != null;
		boolean loginRequest = httpRequest.getRequestURI().equals("/Login.jsp");

		if (loggedIn || loginRequest) {
			chain.doFilter(request, response);
		} else {
			httpResponse.sendRedirect(httpRequest.getContextPath()
					+ "/SuperCarWebsite-main/SuperCarWebsite-main/inforCar/layoutWeb/loginNotification.jsp");
		}
	}

	@Override
	public void destroy() { // TODO Auto-generated method stub

	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException { // TODO Auto-generated method stub

	}
}
// Các phương thức khác của interface Filter (không cần triển khai trongt rường
// // hợp này) }
