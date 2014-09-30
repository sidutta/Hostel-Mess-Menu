package messmenu;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Connect {
	//Open the connection here
	Connection conn = null;
	Statement st = null;
	public void init() throws ServletException {

		String dbURL2 = "jdbc:postgresql://10.105.1.12/cs387";
		String user = "db120040005";
		String pass = "sdutta123";

		try {
			Class.forName("org.postgresql.Driver");

			conn = DriverManager.getConnection(dbURL2, user, pass);
			st = conn.createStatement();
			System.out.println("init"+conn);
		} catch (Exception e) {
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

		//Connection conn1 = null;
		String option= request.getParameter("option");
		ResultSet rs, rs2, rs3, rs4, rs5;
		try {
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

}
