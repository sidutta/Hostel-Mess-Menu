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

public class Viewrating3 extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
	ServletException, IOException
	{
		ResultSet rs = null;
		Statement st = null;
		Statement st2 = null;
		
		System.out.println("sdfssdfsdfdf");
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
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				Date d1 = formatter.parse(date_start);
				Date d2 = formatter.parse(date_end);
				
				  System.out.println(date_start);
				  System.out.println(date_end);
				long daysdiff=0;
				Calendar cal = Calendar.getInstance(); 
				long diff = (long) (d2.getTime() - d1.getTime());
				long diffDays = diff / (24 * 60 * 60 * 1000)+1;
				  daysdiff = diffDays;
				  long add = daysdiff/10;
				  String query = "";
				 
				  System.out.println(diffDays);
				  System.out.println(diff);

				  if(hno != "ALL"){
				for(int i=1; i<=10; i++){
				//	
					 query = "select avg(rating) from servings natural join fooditems natural join reviews where servedon>=TIMESTAMP '"+date_start+"'+ INTERVAL '"+Long.toString(add*(i-1))+" days' and servedon<TIMESTAMP '"+date_start+"'+ INTERVAL '"+Long.toString(add*i)+" days' and hostelnumber='"+hno+"' and itemname='"+itemname+"'";						
					
					 rs = st.executeQuery(query);
					 if(rs.next()){
						 if(rs.getString(1) ==  null)
							 obj.put(Integer.toString(i),"0");
						 else
						 obj.put(Integer.toString(i),rs.getString(1));
						
					 }
					 
					 
					 
				}
				obj.put("daydiff", Long.toString(add));
				
				  }
				  else{
					  for(int i=1; i<=10; i++){
							 

							 query = "select avg(rating) from servings natural join fooditems natural join reviews where servedon>=TIMESTAMP '"+date_start+"'+ INTERVAL '"+Long.toString(add*(i-1))+" days' and servedon<TIMESTAMP '"+date_start+"'+ INTERVAL '"+Long.toString(add*i)+" days' and itemname='"+itemname+"'";						
							 rs = st.executeQuery(query);
							 while(rs.next()){
								 if(rs.getString(1) ==  null)
									 obj.put(Integer.toString(i),"0");
								 else
								 obj.put(Integer.toString(i),rs.getString(1));
								 
							 }
							 
						}  
					  obj.put("daydiff", Long.toString(add));
				  }
				
			}
			catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("--------");
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
