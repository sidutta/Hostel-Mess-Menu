package authentication;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import messmenu.Connect;

public class Putrating extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
	ServletException, IOException
	{
		ResultSet rs = null;
		Statement st = null;
		
		String day = request.getParameter("day");
		String foodtype=request.getParameter("foodtype");
		
		System.out.println(day);
		System.out.println(foodtype);
		
		
	
		
		try {
			st = Connect.getConnection().createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		try {
			rs = st.executeQuery("SELECT GETDATE() AS CurrentDateTime");
			while(rs.next()){
				System.out.println(rs);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block

			e.printStackTrace();
		}
		String[] alldays =
	         {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};
		
		Calendar c = Calendar.getInstance();
	//	c.set(year, month, day);

		//int day_of_week = c.get(Calendar.DAY_OF_WEEK);

	}
}
