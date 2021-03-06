package messmenu;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import messmenu.Connect;

import org.json.JSONException;
import org.json.JSONObject;

public class GetComments extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
	ServletException, IOException
	{
		ResultSet rs = null;
		
		Statement st = null;
		

		String itemname = request.getParameter("itemname");
		String hno = request.getParameter("hostelnum");
		String date_start = request.getParameter("date_start");
		String date_end = request.getParameter("date_end");
		if( hno != null && itemname != null && date_start != null  && date_end != null && hno != "" && date_start != "" && date_end != ""  && itemname != "" ){
			
			
			try {
				st = Connect.getConnection().createStatement();
				st.executeUpdate("set time zone interval '05:30' hour to minute");
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			
			JSONObject obj = new JSONObject();
			
			try{
				String query= "";
				
				if(!hno.equals("ALL")){
				 query = "select username,review from servings natural join fooditems natural join reviews where servedon>='"+date_start+"'and servedon<='"+date_end+"' and hostelnumber='"+hno+"' and itemname='"+itemname+"'";						 
				}else{
					 query = "select username,review from servings natural join fooditems natural join reviews where servedon>='"+date_start+"'and servedon<='"+date_end+"' and itemname='"+itemname+"'";						 

				}
				rs = st.executeQuery(query);
				while( rs.next()){
					obj.put(rs.getString(1), rs.getString(2));
					
				}
				
			}
			catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			System.out.println(obj);
			PrintWriter out = response.getWriter();

			out.println(obj.toString());

			out.close();

		}

	}
	public static void main(String[] args) {
		String hostname = "hmm.heliohost.org";
		String dbname = "siddutta_project";
		String username = "siddutta_team";
		String password = "iitbcse2016";

		//		String hostname = "localhost";
		//		String dbname = "mydb";
		//		String username = "Siddhartha";
		//		String password = "iitbcse2016";

		String dbURL = "jdbc:postgresql://"+hostname+"/"+dbname;
		Connection conn = null;
		Statement st =null;
		try {
			Class.forName("org.postgresql.Driver") ;
			conn = DriverManager.getConnection(dbURL, username, password);
			st = conn.createStatement();
			st.executeUpdate("set time zone interval '05:30' hour to minute");
			System.out.println("initialized connection: "+conn);


		} catch (Exception e) {
			System.out.println("JDBC Connection/ db initialization Exception");
			e.printStackTrace();

		}
		
		ResultSet rs = null;
		try {
			rs = st.executeQuery("SELECT now()::date");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String dt =null;
		String tp[] = null;
		try {
			while(rs.next()){
				dt =rs.getString(1);
				tp = dt.split("-");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Calendar c = Calendar.getInstance();
		c.set(Integer.parseInt(tp[0]), Integer.parseInt(tp[1]), Integer.parseInt(tp[2]));

		System.out.println(tp[0] + " " + tp[1] + " " + tp[2]);
		System.out.println(Calendar.MONDAY +" "+  Calendar.DAY_OF_WEEK);
		int day_of_week = c.get(Calendar.DAY_OF_WEEK);
		//day_of_week = (day_of_week+6)
		System.out.println(day_of_week);
	}
}
