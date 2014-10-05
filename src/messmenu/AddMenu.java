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

public class AddMenu extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
	ServletException, IOException
	{
		ResultSet rs = null;
		Statement st = null;
		Statement st2 = null;
		System.out.println("Gooooogle");

		String day = request.getParameter("day");
		//String foodtype = request.getParameter("foodtype");

		if( day != null){
			System.out.println(day);

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
					System.out.println( "tpcheck1");
					System.out.println( Integer.parseInt(tp[2]));
					System.out.println( "tpcheck1");
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block

				e.printStackTrace();
			}


			try {
				//String toex = "SELECT itemname , sid FROM servings natural join fooditems where type='"+foodtype+"' and servedon=current_date+"+bs+" and hostelnumber='"+hostelno+"'" ;

				ResultSet rsserving=null;
				ResultSet rsprevweek=null;
				ArrayList <String> bfast=new ArrayList<String>();
				ArrayList <String> lunch=new ArrayList<String>();
				ArrayList <String> tiffin=new ArrayList<String>();
				ArrayList <String> dinner=new ArrayList<String>();
				System.out.println("AddMenu1");
				if (day.equals("initial"))
				{
					System.out.println("AddMenu2");
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

					System.out.println("tpcheck2");
					System.out.println( Integer.parseInt(tp[2]));
					System.out.println("tpcheck2");
					
					Calendar c = Calendar.getInstance();
					c.set(Integer.parseInt(tp[0]), Integer.parseInt(tp[1])-1, Integer.parseInt(tp[2]));

					int day_of_week = c.get(Calendar.DAY_OF_WEEK);
					//day_of_week = (day_of_week+6)
					System.out.println(day_of_week);

					int back_forw = day_of_week - asked;
					String bs = String.valueOf(-back_forw);
					rsserving=st.executeQuery("SELECT distinct itemname,type FROM servings natural join fooditems where servedon=current_date+"+bs+"and hostelnumber='"+session.getAttribute("hostelno")+"'" );
					rsprevweek=st2.executeQuery("SELECT distinct itemname,type FROM servings natural join fooditems where servedon=current_date-7+"+bs+"and hostelnumber='"+session.getAttribute("hostelno")+"'" );
				}

				//request.setAttribute("hostelnumber",request.getParameter("hostelnum"));
				//System.out.println(request.getParameter("hostelnum"));
				int flagBfast=0;
				int flagLunch=0;
				int flagTiffin=0;
				int flagDinner=0;
				while(rsserving.next())
				{
					System.out.println("check1");
					String mealtype=rsserving.getString("type");
					if (mealtype.equals("BREAKFAST"))
					{
						flagBfast=1;
						bfast.add(rsserving.getString("itemname"));
					}	
					else if (mealtype.equals("LUNCH"))
					{
						flagLunch=1;
						System.out.println("KuchToGadbadHaiDaya");
						lunch.add(rsserving.getString("itemname"));
					}
					else if (mealtype.equals("TIFFIN"))
					{
						flagTiffin=1;
						tiffin.add(rsserving.getString("itemname"));
					}
					else
					{
						flagDinner=1;
						dinner.add(rsserving.getString("itemname"));
					}
				}
				while(rsprevweek.next())
				{
					System.out.println("check2");
					String mealtype=rsprevweek.getString("type");
					if (mealtype.equals("BREAKFAST") && flagBfast==0)
						bfast.add(rsprevweek.getString("itemname"));
					else if (mealtype.equals("LUNCH")&& flagLunch==0)
					{
						System.out.println("SabTheekHai");
						lunch.add(rsprevweek.getString("itemname") );
					}
					else if (mealtype.equals("TIFFIN") && flagTiffin==0)
						tiffin.add(rsprevweek.getString("itemname"));
					else if(flagDinner==0)
						dinner.add(rsprevweek.getString("itemname"));

				}

				Map<String, ArrayList<String>> listMap = new HashMap<String, ArrayList<String>>();
				listMap.put("bfast", bfast);
				listMap.put("lunch", lunch);
				listMap.put("tiffin", tiffin);
				listMap.put("dinner", dinner);

				String foodMap = new Gson().toJson(listMap);
				System.out.println("AddMenu0");
				System.out.println(foodMap);
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(foodMap);


			} catch (SQLException e) {
				e.printStackTrace();
			} 
		}

	}
}
