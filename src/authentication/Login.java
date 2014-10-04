package authentication;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import messmenu.Connect;

public class Login extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
	ServletException, IOException
	{
		ResultSet rs = null;
		Statement st = null;
		boolean isCookie = false;
		try {
			st = Connect.getConnection().createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		HttpSession session = request.getSession();
		System.out.println(session);
		String temp = (String) session.getAttribute("username"); 
		if(temp!=null) {
			username = temp;
			isCookie = true; 
		}

		boolean valid = false;
		try {

			if(!isCookie) {
				rs = st.executeQuery("SELECT * FROM users WHERE username = '" + username + "' AND password = '"+password+"'" );
				if(!rs.next()) {
					response.sendRedirect("login.jsp?status=wrong");
				}
				else
				{
					// Create cookies for first and last names.      
					Cookie loggedinuser = new Cookie("username", username);
					// Set expiry date after 24 Hrs for both the cookies.
					loggedinuser.setMaxAge(60*60*24); 
					// Add both the cookies in the response header.
					response.addCookie( loggedinuser );
					// Set response content type
					response.setContentType("text/html");
					valid = true;
					session.setAttribute("username", username);
				}
			}
			else {
				valid = true;
				rs = st.executeQuery("SELECT * FROM users WHERE username = '" + username +"'");
				rs.next();
			}
			if(valid) {
				String category = rs.getString("category");
				session.setAttribute("category", category);
				String name = rs.getString("name");
				session.setAttribute("consumername", name);
				String hostelno = rs.getString("hostelnumber");
				session.setAttribute("hostelno", hostelno);
				if(category.equals("CONSUMER"))
				{				
					response.sendRedirect("/hostel-menu-mgmt/Othermenu?initialCall=True");
				}
			}

		}
		catch (SQLException e) {
			System.out.println("db query Exception");
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
	ServletException, IOException {
	}

}
