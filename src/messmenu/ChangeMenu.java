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

public class ChangeMenu extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
	ServletException, IOException
	{
		ResultSet rs = null;
		Statement st = null;
		Statement st2 = null;
		System.out.println("Gooooogle");

		String day = request.getParameter("day");
		String repeat=request.getParameter("repeat");
		String bfast=request.getParameter("bfast");
		System.out.println("Check This");
		System.out.println(bfast);
		System.out.println("Check This");
		String lunch=request.getParameter("lunch");
		String tiffin=request.getParameter("tiffin");
		String dinner=request.getParameter("dinner");
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

				
				System.out.println("AddMenu1");
				if (day.equals("initial"))
				{
					
					//st.executeQuery("SELECT distinct itemname,type FROM servings natural join fooditems where servedon=current_date and hostelnumber='"+session.getAttribute("hostelno")+"'" );
					//st2.executeQuery("select * from insert_serving('IDLI','BREAKFAST','2014-10-16','H4');" );
					for(int i=0;i<Integer.parseInt(repeat);i++)
					{
						String addDay=String.valueOf(7*i);
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
					//String bs = String.valueOf(-back_forw);
					for(int i=0;i<Integer.parseInt(repeat);i++)
					{
						int changeDate=-back_forw+7*i;
						String addDay=String.valueOf(changeDate);
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
					//rsserving=st.executeQuery("SELECT distinct itemname,type FROM servings natural join fooditems where servedon=current_date+"+bs+"and hostelnumber='"+session.getAttribute("hostelno")+"'" );
					//rsprevweek=st2.executeQuery("SELECT distinct itemname,type FROM servings natural join fooditems where servedon=current_date-7+"+bs+"and hostelnumber='"+session.getAttribute("hostelno")+"'" );
				}

				//request.setAttribute("hostelnumber",request.getParameter("hostelnum"));
				//System.out.println(request.getParameter("hostelnum"));
				response.getWriter().write("Success");
				

			} catch (SQLException e) {
				e.printStackTrace();
			} 
		}

	}
}
