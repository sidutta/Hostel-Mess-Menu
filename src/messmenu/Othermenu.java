package messmenu;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
			if (request.getAttribute("initialCall")!=null) {
				rsserving=st.executeQuery("SELECT itemname,type FROM servings natural join fooditems where servedon=current_date and hostelnumber='"+session.getAttribute("hostelno")+"'" );	
				request.setAttribute("hostelnumber",session.getAttribute("hostelno"));
			}
			else {
				rsserving=st.executeQuery("SELECT itemname,type FROM servings natural join fooditems where servedon=current_date and hostelnumber='"+request.getParameter("hostelnum")+"'" );
				request.setAttribute("hostelnumber",request.getParameter("hostelnum"));
			}

			ArrayList <String> bfast=new ArrayList<String>();
			ArrayList <String> lunch=new ArrayList<String>();
			ArrayList <String> tiffin=new ArrayList<String>();
			ArrayList <String> dinner=new ArrayList<String>();
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
			rd.forward(request, response);


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
