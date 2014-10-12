package messmenu;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
		Map<String, Integer> foodtype = new HashMap<String, Integer>();
		foodtype.put("Breakfast", 2);
		foodtype.put("Breakfast", 3);
		foodtype.put("Breakfast", 4);
		foodtype.put("Dinner", 5);
		try {
			for(int i=0; i<7; i++) {
				rs = st.executeQuery("SELECT itemname FROM fooditems NATURAL JOIN servings WHERE type='BREAKFAST' AND servedon >= date '"+dateset+"' AND servedon < date '"+dateset+"' + interval '"+i+"' day AND hostelnumber = '"+hostelno+"' ORDER BY servedon");
				String items = "";
				if(rs.next())
					items = rs.getString("itemname");
				else 
					items = "Data not available";
				while(rs.next()) {
					items = items + ", " + rs.getString("itemname");
				}
				obj.put(""+(i+1)+"2", items);
			}
			for(int i=0; i<7; i++) {
				rs = st.executeQuery("SELECT itemname FROM fooditems NATURAL JOIN servings WHERE type='LUNCH' AND servedon >= date '"+dateset+"' AND servedon < date '"+dateset+"' + interval '"+i+"' day AND hostelnumber = '"+hostelno+"' ORDER BY servedon");
				String items = "";
				if(rs.next())
					items = rs.getString("itemname");
				else 
					items = "Data not available";
				while(rs.next()) {
					items = items + ", " + rs.getString("itemname");
				}
				obj.put(""+(i+1)+"3", items);
			}
			for(int i=0; i<7; i++) {
				rs = st.executeQuery("SELECT itemname FROM fooditems NATURAL JOIN servings WHERE type='TIFFIN' AND servedon >= date '"+dateset+"' AND servedon < date '"+dateset+"' + interval '"+i+"' day AND hostelnumber = '"+hostelno+"' ORDER BY servedon");
				String items = "";
				if(rs.next())
					items = rs.getString("itemname");
				else 
					items = "Data not available";
				while(rs.next()) {
					items = items + ", " + rs.getString("itemname");
				}
				obj.put(""+(i+1)+"4", items);
			}
			for(int i=0; i<7; i++) {
				rs = st.executeQuery("SELECT itemname FROM fooditems NATURAL JOIN servings WHERE type='DINNER' AND servedon >= date '"+dateset+"' AND servedon < date '"+dateset+"' + interval '"+i+"' day AND hostelnumber = '"+hostelno+"' ORDER BY servedon");
				String items = "";
				if(rs.next())
					items = rs.getString("itemname");
				else 
					items = "Data not available";
				while(rs.next()) {
					items = items + ", " + rs.getString("itemname");
				}
				obj.put(""+(i+1)+"5", items);
			}
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
}
