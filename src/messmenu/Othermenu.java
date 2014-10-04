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
			ArrayList <String> bfast=new ArrayList<String>();
			ArrayList <String> lunch=new ArrayList<String>();
			ArrayList <String> tiffin=new ArrayList<String>();
			ArrayList <String> dinner=new ArrayList<String>();
			if (request.getAttribute("initialCall")!=null) {
				System.out.println("enteredyo");
				rsserving=st.executeQuery("SELECT itemname,type FROM servings natural join fooditems where servedon=current_date and hostelnumber='"+session.getAttribute("hostelno")+"'" );	
				request.setAttribute("hostelnumber",session.getAttribute("hostelno"));
				
				while(rsserving.next())
				{
					String mealtype=rsserving.getString("type");
					if (mealtype.equals("BREAKFAST"))
						bfast.add(rsserving.getString("itemname"));
					else if (mealtype.equals("LUNCH"))
						lunch.add(rsserving.getString("itemname"));
					else if (mealtype.equals("TIFFIN"))
						tiffin.add(rsserving.getString("itemname"));
					else
						dinner.add(rsserving.getString("itemname"));
				}
				request.setAttribute("bfast",bfast);
				request.setAttribute("lunch",lunch);
				request.setAttribute("tiffin",tiffin);
				request.setAttribute("dinner",dinner);
				//request.setAttribute("consumername",request.getParameter("consumername"));
				//request.setAttribute("hostelnumber",request.getParameter("hostelnum"));
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/home.jsp");
				System.out.println("enteredyo123");
				rd.forward(request, response);
			}
			else {
				System.out.println("enteredyo11");
				rsserving=st.executeQuery("SELECT itemname,type FROM servings natural join fooditems where servedon=current_date and hostelnumber='"+request.getParameter("hostelnum")+"'" );
				request.setAttribute("hostelnumber",request.getParameter("hostelnum"));
				while(rsserving.next())
				{
					String mealtype=rsserving.getString("type");
					if (mealtype.equals("BREAKFAST"))
						bfast.add(rsserving.getString("itemname"));
					else if (mealtype.equals("LUNCH"))
						lunch.add(rsserving.getString("itemname"));
					else if (mealtype.equals("TIFFIN"))
						tiffin.add(rsserving.getString("itemname"));
					else
						dinner.add(rsserving.getString("itemname"));

				}
				Map<String, ArrayList<String>> listMap = new HashMap<String, ArrayList<String>>();
				listMap.put("bfast", bfast);
				listMap.put("lunch", lunch);
				listMap.put("tiffin", tiffin);
				listMap.put("dinner", dinner);

				String foodMap = new Gson().toJson(listMap);
				
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(foodMap);
			}
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
