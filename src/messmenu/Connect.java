package messmenu;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Connect {
	//Open the connection here
	Connection conn = null;
	Statement st = null;
	public void init() throws ServletException {

		String hostname = "hmm.heliohost.org";
		String dbname = "siddutta_project";
		String dbURL = "jdbc:postgresql://"+hostname+"/"+dbname;
		String username = "siddutta_team";
		String password = "iitbcse2016";
		String scriptfile = "../scripts/createtables.sql";

		try {
			Class.forName("org.postgresql.Driver");
			conn = DriverManager.getConnection(dbURL, username, password);
			st = conn.createStatement();
			System.out.println("init"+conn);
			//Runtime.getRuntime().exec("psql -U "+username+" -d "+dbname+" -h "+hostname+" -f "+scriptfile);
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
		//String option= request.getParameter("option");
		try {

		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

}
