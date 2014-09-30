package messmenu;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Connect extends HttpServlet {
	//Open the connection here
	Connection conn = null;
	Statement st = null;
	public void init() throws ServletException {

//		String hostname = "hmm.heliohost.org";
//		String dbname = "siddutta_project";
//		String username = "siddutta_team";
//		String password = "iitbcse2016";
		
		String hostname = "localhost";
		String dbname = "mydb";
		String username = "Siddhartha";
		String password = "iitbcse2016";
		
		String dbURL = "jdbc:postgresql://"+hostname+"/"+dbname;
		String scriptfile = "/Users/Siddhartha/Documents/HMR/Hostel-Mess-Menu/scripts/createtables.sql";

		try {
			Class.forName("org.postgresql.Driver");
			conn = DriverManager.getConnection(dbURL, username, password);
			st = conn.createStatement();
			System.out.println("init"+conn);
			Runtime.getRuntime().exec("/Applications/Postgres.app/Contents/Versions/9.3/bin/psql -U "+username+" -d "+dbname+" -h "+hostname+" -f "+scriptfile);
		} catch (Exception e) {
			System.out.println("JDBC Connection/ db initialization Exception");
			e.printStackTrace();
		}
	}



	public void destroy() {
		//Close the connection here
		try{
			conn.close();
			System.out.println("Connection Closed");
		}catch(Exception e)
		{
			System.out.println(e);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
	ServletException, IOException
	{
		ResultSet rs = null;
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		try {
			rs = st.executeQuery("SELECT password FROM users WHERE username = '" + username + "'");
			if(!rs.next()) {
				response.sendRedirect("login.jsp?status=wrong");
			}
		} catch (SQLException e) {
			System.out.println("db query Exception");
			e.printStackTrace();
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
	ServletException, IOException
	{

	}

}
