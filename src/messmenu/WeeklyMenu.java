package messmenu;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import messmenu.Connect;

import org.json.JSONException;
import org.json.JSONObject;

public class WeeklyMenu extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
	ServletException, IOException
	{
		
		ResultSet rs = null;
		Statement st = null;

		String dateset = request.getParameter("dateset");

		HttpSession session = request.getSession();
		String hostelno = (String) session.getAttribute("hostelno");
		System.out.println("hostel num is "+ hostelno);
		
		try {
			st = Connect.getConnection().createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		JSONObject obj = new JSONObject();
		Map<String, String> foodtype = new HashMap<String, String>();
		foodtype.put("BREAKFAST", "2");
		foodtype.put("LUNCH", "3");
		foodtype.put("TIFFIN", "4");
		foodtype.put("DINNER", "5");
		
		try {
			
			rs = st.executeQuery("SELECT itemname, type, servedon FROM fooditems NATURAL JOIN servings WHERE servedon >= date '"+dateset+"' AND servedon < date '"+dateset+"' + interval '"+7+"' day AND hostelnumber = '"+hostelno+"' ORDER BY servedon");
			
			String type = "";
			String typeno = "";
			Date date = null;
			Date today = Date.valueOf(dateset);
			String datediff = "";
			
			while(rs.next()) {
				type = rs.getString("type");
				typeno = foodtype.get(type);
				date = rs.getDate("servedon");
				datediff = String.valueOf(date.compareTo(today)+1);
				obj.get(datediff+typeno);
			}
			
//			for(int i=0; i<7; i++) {
//				rs = st.executeQuery("SELECT itemname FROM fooditems NATURAL JOIN servings WHERE type='BREAKFAST' AND servedon >= date '"+dateset+"' AND servedon < date '"+dateset+"' + interval '"+i+"' day AND hostelnumber = '"+hostelno+"' ORDER BY servedon");
//				String items = "";
//				if(rs.next())
//					items = rs.getString("itemname");
//				else 
//					items = "Data not available";
//				while(rs.next()) {
//					items = items + ", " + rs.getString("itemname");
//				}
//				obj.put(""+(i+1)+"2", items);
//			}
//			for(int i=0; i<7; i++) {
//				rs = st.executeQuery("SELECT itemname FROM fooditems NATURAL JOIN servings WHERE type='LUNCH' AND servedon >= date '"+dateset+"' AND servedon < date '"+dateset+"' + interval '"+i+"' day AND hostelnumber = '"+hostelno+"' ORDER BY servedon");
//				String items = "";
//				if(rs.next())
//					items = rs.getString("itemname");
//				else 
//					items = "Data not available";
//				while(rs.next()) {
//					items = items + ", " + rs.getString("itemname");
//				}
//				obj.put(""+(i+1)+"3", items);
//			}
//			for(int i=0; i<7; i++) {
//				rs = st.executeQuery("SELECT itemname FROM fooditems NATURAL JOIN servings WHERE type='TIFFIN' AND servedon >= date '"+dateset+"' AND servedon < date '"+dateset+"' + interval '"+i+"' day AND hostelnumber = '"+hostelno+"' ORDER BY servedon");
//				String items = "";
//				if(rs.next())
//					items = rs.getString("itemname");
//				else 
//					items = "Data not available";
//				while(rs.next()) {
//					items = items + ", " + rs.getString("itemname");
//				}
//				obj.put(""+(i+1)+"4", items);
//			}
//			for(int i=0; i<7; i++) {
//				rs = st.executeQuery("SELECT itemname FROM fooditems NATURAL JOIN servings WHERE type='DINNER' AND servedon >= date '"+dateset+"' AND servedon < date '"+dateset+"' + interval '"+i+"' day AND hostelnumber = '"+hostelno+"' ORDER BY servedon");
//				String items = "";
//				if(rs.next())
//					items = rs.getString("itemname");
//				else 
//					items = "Data not available";
//				while(rs.next()) {
//					items = items + ", " + rs.getString("itemname");
//				}
//				obj.put(""+(i+1)+"5", items);
//			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (JSONException e) {
			e.printStackTrace();
		}

		System.out.println("Menu for the selected week is " + obj);
		PrintWriter out = response.getWriter();
		out.println(obj.toString());
		out.close();

	}
	
	public static void main(String[] args) {
		Date a = Date.valueOf("2014-03-17");
		Date b = Date.valueOf("2014-03-10");
		long c = (a.getTime() - b.getTime())/(3600000*24);
		System.out.println(c);
	}
	
}
