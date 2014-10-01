package authentication;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import messmenu.Connect;

public class Registration extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
	ServletException, IOException
	{
		ResultSet rs = null;
		Statement st = null;
		try {
			st = Connect.getConnection().createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		String username = request.getParameter("username");
		String name = request.getParameter("first_name").toUpperCase();
		String password = request.getParameter("password");
		String hostelno = request.getParameter("hostelno").toUpperCase();
		String category = request.getParameter("category").toUpperCase();
		String emailid = request.getParameter("email").toUpperCase();
		try {
			rs = st.executeQuery("SELECT * FROM users WHERE username='"+username+"'");
			if(rs.next()) {
				response.sendRedirect("signup.jsp?status=usernametaken");
			}
			else {
				while(rs.next()) ;
				rs = st.executeQuery("SELECT * FROM users WHERE emailid='"+emailid+"'");
				if(rs.next()) {
					response.sendRedirect("signup.jsp?status=emailregistered");
				}
				else {
					while(rs.next()) ;
					st.executeUpdate("INSERT INTO users VALUES('"+username+"', '"+name+"', '"+password+"', '"+hostelno+"', '"+category+"', '"+emailid+"')");
					response.sendRedirect("login.jsp");
				}
			}
		} catch (SQLException e) {
			System.out.println("db update Exception");
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
	ServletException, IOException
	{

	}

}
