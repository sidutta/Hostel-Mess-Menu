package authentication;

import java.io.IOException;



import java.io.PrintWriter;
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

import org.json.JSONException;
import org.json.JSONObject;

import messmenu.Connect;

public class Putrating extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
	ServletException, IOException
	{
		ResultSet rs = null;
		Statement st = null;

		String day = request.getParameter("day");
		String foodtype = request.getParameter("foodtype");

		if( day != null && foodtype != null && foodtype != "" && day != ""){
			System.out.println(day);
			System.out.println(foodtype);

			String username ="";
			String hostelno ="";

			Cookie cookie = null;
			Cookie[] cookies = null;
			// Get an array of Cookies associated with this domain
			cookies = request.getCookies();
			if( cookies != null ){
				for (int i = 0; i < cookies.length; i++){
					cookie = cookies[i];
					if((cookie.getName( )).toString().equals("username")){
						username = (cookie.getValue( )).toString(); 	
						break;
					}
				}
			}



			try {
				st = Connect.getConnection().createStatement();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			String dt;
			String[] tp = {" "," "," "};
			try {
				rs = st.executeQuery("SELECT now()::date");
				while(rs.next()){
					dt =rs.getString(1);
					tp = dt.split("-");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block

				e.printStackTrace();
			}
			Map<String, Integer> x = new HashMap();
			x.put("Monday", 1);
			x.put("Tuesday", 2);
			x.put("Wednesday", 3);
			x.put("Thursday", 4);
			x.put("Friday", 5);
			x.put("Saturday", 6);
			x.put("Sunday", 7);

			int asked = x.get(day);


			System.out.println(asked);

			Calendar c = Calendar.getInstance();
			c.set(Integer.parseInt(tp[0]), Integer.parseInt(tp[1]), Integer.parseInt(tp[0]));

			int day_of_week = c.get(Calendar.DAY_OF_WEEK);
			System.out.println(day_of_week);

			int back_forw = day_of_week - asked;
			String bs = String.valueOf(back_forw);
			try {
				rs = st.executeQuery("SELECT * FROM users WHERE username = '" + username +"'");
				rs.next();
				hostelno = rs.getString("hostelnumber");
				System.out.println(hostelno+ " "+foodtype);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			try {
				String toex = "SELECT itemname , itemid FROM servings natural join fooditems where type='"+foodtype+"' and servedon=current_date-"+bs+" and hostelnumber='"+hostelno+"'" ;
				System.out.println(toex);
				ResultSet rs1=st.executeQuery(toex);
				JSONObject obj = new JSONObject();

				while(rs1.next()){
					
					obj.put(rs1.getString(1), rs1.getString(2));
					
				}
				System.out.print(obj);

				PrintWriter out = response.getWriter();

				out.println(obj.toString());

				out.close();


			} catch (SQLException e) {
				e.printStackTrace();
			} catch (JSONException e) {
				e.printStackTrace();
			} 
		}

	}
}
