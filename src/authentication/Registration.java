package authentication;

import java.io.IOException;
import java.sql.PreparedStatement;
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
		//Statement st = null;
		PreparedStatement pstmt=null;
		/*try {
			//st = Connect.getConnection().createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}*/
		

		
		
		String username = request.getParameter("username");
		String name = request.getParameter("first_name").toUpperCase();
		String password = request.getParameter("password");
		String hostelno = request.getParameter("hostelno").toUpperCase();
		//HOSTELTYPE hostelno=HOSTELTYPE.valueOf(request.getParameter("hostelno").toUpperCase());
		String category = request.getParameter("category").toUpperCase();
		//USERTYPE category=USERTYPE.valueOf(request.getParameter("category").toUpperCase());
		String emailid = request.getParameter("email").toUpperCase();
		
		if(hostelno.equals(""))
		{
			hostelno="H1";
		}
		if(category.equals(""))
		{
			category="CONSUMER";
		}
		
		System.out.println("Registration Prepared statement working");
		try {
			//rs = st.executeQuery("SELECT * FROM users WHERE username='"+username+"'");
			
			pstmt=Connect.getConnection().prepareStatement("SELECT * FROM users WHERE username=? " );
			pstmt.setString(1,username);
			rs=pstmt.executeQuery();
			
			
			if(rs.next()) {
				response.sendRedirect("signup.jsp?status=usernametaken");
			}
			else {
				while(rs.next()) ;
				//rs = st.executeQuery("SELECT * FROM users WHERE emailid='"+emailid+"'");
				pstmt=Connect.getConnection().prepareStatement("SELECT * FROM users WHERE emailid= ?" );
				pstmt.setString(1,emailid);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					response.sendRedirect("signup.jsp?status=emailregistered");
				}
				else {
					while(rs.next()) ;
					//st.executeUpdate("INSERT INTO users VALUES('"+username+"', '"+name+"', '"+password+"', '"+hostelno+"', '"+category+"', '"+emailid+"')");
					
					pstmt=Connect.getConnection().prepareStatement("INSERT INTO users VALUES(?,?,?,'"+hostelno+"','"+category+"',?)" );
					
					pstmt.setString(1,username);
					pstmt.setString(2,name);
					pstmt.setString(3,password);
					pstmt.setString(4,emailid);
					
					pstmt.executeUpdate();
					
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
