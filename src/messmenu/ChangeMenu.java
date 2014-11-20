package messmenu;

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
import javax.servlet.http.HttpSession;

import messmenu.Connect;

import org.json.JSONException;
import org.json.JSONObject;

import com.google.gson.Gson;

//Used to set or change menu of a particular day
public class ChangeMenu extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
	ServletException, IOException
	{
		ResultSet rs = null;
		Statement st = null;
		Statement st2 = null;


		String day = request.getParameter("day");
		//repeat: Number of weeks this menu has to be repeated
		String repeat=request.getParameter("repeat");
		String bfast=request.getParameter("bfast");

		String lunch=request.getParameter("lunch");
		String tiffin=request.getParameter("tiffin");
		String dinner=request.getParameter("dinner");

		if( day != null){
			HttpSession session = request.getSession();
			String hostelno =(String)session.getAttribute("hostelno");
			String dt;
			String[] tp = {" "," "," "};

			try {
				st = Connect.getConnection().createStatement();
				st.executeUpdate("set time zone interval '05:30' hour to minute");
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			try {
				st2 = Connect.getConnection().createStatement();
				st2.executeUpdate("set time zone interval '05:30' hour to minute");
			} catch (SQLException e1) {
				e1.printStackTrace();
			}


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


			try {
				//Menu is to be set for today
				if (day.equals("initial"))
				{
					//Loop to make the changes for each repetition of menu
					for(int i=0;i<Integer.parseInt(repeat);i++)
					{
						String addDay=String.valueOf(7*i);
						//Delete the previous menu for the requested day
						st.executeUpdate("DELETE FROM servings WHERE servedon=current_date+"+addDay+" AND hostelnumber='"+hostelno+"'");
						for (String bf: bfast.split(",")){
							//Add breakfast menu 
							st.executeQuery("select * from insert_serving('"+bf+"','BREAKFAST',current_date+"+addDay+",'"+hostelno+"')");
						}
						for (String bf: lunch.split(",")){
							//Add lunch menu
							st.executeQuery("select * from insert_serving('"+bf+"','LUNCH',current_date+"+addDay+",'"+hostelno+"')");
						}
						for (String bf: tiffin.split(",")){
							//Add tiffin menu
							st.executeQuery("select * from insert_serving('"+bf+"','TIFFIN',current_date+"+addDay+",'"+hostelno+"')");
						}
						for (String bf: dinner.split(",")){
							//Add dinner menu
							st.executeQuery("select * from insert_serving('"+bf+"','DINNER',current_date+"+addDay+",'"+hostelno+"')");
						}
					}
				}
				else
				{//The day for which the menu is to be set is not today

					Map<String, Integer> x = new HashMap();
					x.put("Monday", 2);
					x.put("Tuesday", 3);
					x.put("Wednesday", 4);
					x.put("Thursday", 5);
					x.put("Friday", 6);
					x.put("Saturday", 7);
					x.put("Sunday", 1);

					int asked = x.get(day);
					Calendar c = Calendar.getInstance();
					c.set(Integer.parseInt(tp[0]), Integer.parseInt(tp[1])-1, Integer.parseInt(tp[2]));

					int day_of_week = c.get(Calendar.DAY_OF_WEEK);

					int back_forw = day_of_week - asked;
					
					//Loop to make the changes for each repetition of menu
					for(int i=0;i<Integer.parseInt(repeat);i++)
					{
						int changeDate=-back_forw+7*i;
						String addDay=String.valueOf(changeDate);
						
						//Delete the previous menu for the requested day
						st.executeUpdate("DELETE FROM servings WHERE servedon=current_date+"+addDay+" AND hostelnumber='"+hostelno+"'");
						for (String bf: bfast.split(",")){
							st.executeQuery("select * from insert_serving('"+bf+"','BREAKFAST',current_date+"+addDay+",'"+hostelno+"')");
						}
						for (String bf: lunch.split(",")){
							st.executeQuery("select * from insert_serving('"+bf+"','LUNCH',current_date+"+addDay+",'"+hostelno+"')");
						}
						for (String bf: tiffin.split(",")){
							st.executeQuery("select * from insert_serving('"+bf+"','TIFFIN',current_date+"+addDay+",'"+hostelno+"')");
						}
						for (String bf: dinner.split(",")){
							st.executeQuery("select * from insert_serving('"+bf+"','DINNER',current_date+"+addDay+",'"+hostelno+"')");
						}
					}

				}


				response.getWriter().write("Success");


			} catch (SQLException e) {
				e.printStackTrace();
			} 
		}

	}
}
