package messmenu;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Connect extends HttpServlet {
	//Open the connection here
	static Connection conn = null;
	Statement st = null;
	public void init() throws ServletException {

		String hostname = "hmm.heliohost.org";
		String dbname = "siddutta_project";
		String username = "siddutta_team";
		String password = "iitbcse2016";

		//		String hostname = "localhost";
		//		String dbname = "mydb";
		//		String username = "Siddhartha";
		//		String password = "iitbcse2016";

		String dbURL = "jdbc:postgresql://"+hostname+"/"+dbname;
		String createTablesScript = "/Users/aditya/Downloads/HMR/HMR/Hostel-Mess-Menu/WebContent/scripts/createtables.sql";
		String fillTablesScript = "/Users/aditya/Downloads/HMR/HMR/Hostel-Mess-Menu/WebContent/scripts/filltables.sql";

		try {
			Class.forName("org.postgresql.Driver") ;
			conn = DriverManager.getConnection(dbURL, username, password);
			st = conn.createStatement();
			System.out.println("initialized connection: "+conn);
//			Runtime runtime = Runtime.getRuntime();
//			Process process = runtime.exec("/Applications/Postgres.app/Contents/Versions/9.3/bin/psql -U "+username+" -d "+dbname+" -h "+hostname+" -f "+createTablesScript);
//			process.waitFor();
//			if(process.exitValue()!=0) {
//				Scanner scanner = new Scanner(process.getErrorStream());
//				while (scanner.hasNext()) {
//					System.out.println(scanner.nextLine());
//				}
//				scanner.close();
//			}
//			else {
//				System.out.println("DB recreated");
//			}
//
//			process = runtime.exec("/Applications/Postgres.app/Contents/Versions/9.3/bin/psql -U "+username+" -d "+dbname+" -h "+hostname+" -f "+fillTablesScript);	
//			process.waitFor();
//			if(process.exitValue()!=0) {
//				Scanner scanner = new Scanner(process.getErrorStream());
//				while (scanner.hasNext()) {
//					System.out.println(scanner.nextLine());
//				}
//				scanner.close();
//			}
//			else {
//				System.out.println("DB refilled");
//			}

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

	public static Connection getConnection() {
		return conn;
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
	ServletException, IOException
	{
		response.sendRedirect("login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
	ServletException, IOException
	{

	}

}
