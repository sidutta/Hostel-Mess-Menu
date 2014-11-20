package messmenu;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;

import com.google.gson.Gson;

public class Othermenu extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
	ServletException, IOException
	{
		Statement st = null;
		try {
			st = Connect.getConnection().createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		try {
			HttpSession session = request.getSession();
			ResultSet rsserving=null;
			//bfast stores today's breakfast menu
			ArrayList <String> bfast=new ArrayList<String>();
			//lunch stores today's breakfast menu
			ArrayList <String> lunch=new ArrayList<String>();
			//tiffin stores today's breakfast menu
			ArrayList <String> tiffin=new ArrayList<String>();
			//dinner stores today's breakfast menu
			ArrayList <String> dinner=new ArrayList<String>();

			//Query to get today's menu of selected hostel
			rsserving=st.executeQuery("SELECT itemname,type FROM servings natural join fooditems where servedon=current_date and hostelnumber='"+request.getParameter("hostelnum")+"'" );

			request.setAttribute("hostelnumber",request.getParameter("hostelnum"));
			System.out.println(request.getParameter("hostelnum"));
			//Iterate over the result set containing today's menu
			while(rsserving.next())
			{
				//mealtype stores the type of meal of the current food item
				String mealtype=rsserving.getString("type");
				//If mealtype is BREAKFAST, add to bfast arraylist
				if (mealtype.equals("BREAKFAST"))
					bfast.add(rsserving.getString("itemname"));
				//If mealtype is LUNCH, add to lunch arraylist
				else if (mealtype.equals("LUNCH"))
					lunch.add(rsserving.getString("itemname"));
				//If mealtype is TIFFIN, add to tiffin arraylist
				else if (mealtype.equals("TIFFIN"))
					tiffin.add(rsserving.getString("itemname"));
				//If mealtype is DINNER, add to dinner arraylist
				else
					dinner.add(rsserving.getString("itemname"));

			}
			//listMap contains the meal type mapped to corresponding food items
			Map<String, ArrayList<String>> listMap = new HashMap<String, ArrayList<String>>();
			listMap.put("bfast", bfast);
			listMap.put("lunch", lunch);
			listMap.put("tiffin", tiffin);
			listMap.put("dinner", dinner);

			//foodMap contains the JSON object corresponding to listMap to be passed in response
			String foodMap = new Gson().toJson(listMap);

			System.out.println(foodMap);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(foodMap);

		}
		catch (SQLException e) {
			System.out.println("db query Exception");
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
	ServletException, IOException
	{

	}

}
