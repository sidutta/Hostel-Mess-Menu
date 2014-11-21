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

//To show menu on Set Menu Page
public class AddMenu extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
	ServletException, IOException
	{
		ResultSet rs = null;
		Statement st = null;
		Statement st2 = null;

		String day = request.getParameter("day");

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
				e.printStackTrace();
			}


			try {
				ResultSet rsserving=null;
				ResultSet rsprevweek=null;
				ArrayList <String> bfast=new ArrayList<String>();
				ArrayList <String> lunch=new ArrayList<String>();
				ArrayList <String> tiffin=new ArrayList<String>();
				ArrayList <String> dinner=new ArrayList<String>();
				
				//Required day is today
				if (day.equals("initial"))
				{
					//Get today's menu for this week and previous week
					rsserving=st.executeQuery("SELECT distinct itemname,type FROM servings natural join fooditems where servedon=current_date and hostelnumber='"+session.getAttribute("hostelno")+"'" );
					rsprevweek=st2.executeQuery("SELECT distinct itemname,type FROM servings natural join fooditems where servedon=current_date-7 and hostelnumber='"+session.getAttribute("hostelno")+"'" );
				}
				else
				{
					
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
					//bs contains the required date offset (with respect to today's date)
					String bs = String.valueOf(-back_forw);
					//Get menu for required day (for this week as well as previous week)
					rsserving=st.executeQuery("SELECT distinct itemname,type FROM servings natural join fooditems where servedon=current_date+"+bs+"and hostelnumber='"+session.getAttribute("hostelno")+"'" );
					rsprevweek=st2.executeQuery("SELECT distinct itemname,type FROM servings natural join fooditems where servedon=current_date-7+"+bs+"and hostelnumber='"+session.getAttribute("hostelno")+"'" );
				}

				//flagBfast shows whether the required day's breakfast menu has been set (for current week)
				int flagBfast=0;
				//flagLunch shows whether the required day's lunch menu has been set (for current week)
				int flagLunch=0;
				//flagTiffin shows whether the required day's tiffin menu has been set (for current week)
				int flagTiffin=0;
				//flagDinner shows whether the required day's dinner menu has been set (for current week)
				int flagDinner=0;

				while(rsserving.next())
				{
					
					String mealtype=rsserving.getString("type");
					//If mealtype is BREAKFAST, add item to bfast ArrayList
					if (mealtype.equals("BREAKFAST"))
					{
						flagBfast=1;
						if(bfast.isEmpty())
							bfast.add("thisweek");
						bfast.add(rsserving.getString("itemname"));
					}
					//If mealtype is LUNCH, add item to lunch ArrayList
					else if (mealtype.equals("LUNCH"))
					{
						flagLunch=1;
						if(lunch.isEmpty())
							lunch.add("thisweek");
					
						lunch.add(rsserving.getString("itemname"));
					}
					//If mealtype is TIFFIN, add item to tiffin ArrayList
					else if (mealtype.equals("TIFFIN"))
					{
						flagTiffin=1;
						if(tiffin.isEmpty())
							tiffin.add("thisweek");
						tiffin.add(rsserving.getString("itemname"));
					}
					//If mealtype is DINNER, add item to dinner ArrayList
					else
					{
						flagDinner=1;
						if(dinner.isEmpty())
							dinner.add("thisweek");
						dinner.add(rsserving.getString("itemname"));
					}
				}
				
				
				while(rsprevweek.next())
				{
					
					String mealtype=rsprevweek.getString("type");
					//If current week's required day's breakfast menu is not set, add previous week's menu to bfast
					if (mealtype.equals("BREAKFAST") && flagBfast==0)
					{
						if(bfast.isEmpty())
							bfast.add("prevweek");
						bfast.add(rsprevweek.getString("itemname"));
					}
					//If current week's required day's lunch menu is not set, add previous week's menu to lunch
					else if (mealtype.equals("LUNCH")&& flagLunch==0)
					{
						if(lunch.isEmpty())
							lunch.add("prevweek");
						
						lunch.add(rsprevweek.getString("itemname") );
					}
					//If current week's required day's tiffin menu is not set, add previous week's menu to tiffin
					else if (mealtype.equals("TIFFIN") && flagTiffin==0)
					{
						if(tiffin.isEmpty())
							tiffin.add("prevweek");
						tiffin.add(rsprevweek.getString("itemname"));
					}
					//If current week's required day's dinner menu is not set, add previous week's menu to dinner
					else if(flagDinner==0)
					{
						if(dinner.isEmpty())
							dinner.add("prevweek");
						dinner.add(rsprevweek.getString("itemname"));
					}

				}
				//listMap contains the mapping from food type to items
				Map<String, ArrayList<String>> listMap = new HashMap<String, ArrayList<String>>();
				listMap.put("bfast", bfast);
				listMap.put("lunch", lunch);
				listMap.put("tiffin", tiffin);
				listMap.put("dinner", dinner);
				
				//foodMap conatains the JSON object corresponding to listMap
				String foodMap = new Gson().toJson(listMap);
				
				
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(foodMap);


			} catch (SQLException e) {
				e.printStackTrace();
			} 
		}

	}
}
