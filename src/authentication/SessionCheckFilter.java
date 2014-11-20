package authentication;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SessionCheckFilter implements Filter {

	private String contextPath;

	public void init(FilterConfig fc) throws ServletException {
		contextPath = fc.getServletContext().getContextPath();
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain fc) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;  
		if (req.getSession().getAttribute("category") == null) { //checks if there's a LOGIN_USER set in session...
			res.sendRedirect(contextPath + "/login.jsp"); //or page where you want to redirect
		} else {
			String userType = (String) req.getSession().getAttribute("category");
			if (!userType.toUpperCase().equals("ADMINISTRATOR")){ //check if user type is not admin
				res.sendRedirect(contextPath + "/unauthorized.jsp"); //or page where you want to  
			}
			fc.doFilter(request, response);
		}
	}

	public void destroy() {
	}
}