package authentication;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.*;

import messmenu.Connect;

public class Login extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
	ServletException, IOException
	{
		ResultSet rs = null;
		Statement st = null;
		boolean isCookie = false;
		try {
			st = Connect.getConnection().createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
        HttpSession session = request.getSession();
        System.out.println(session);
        String temp = (String) session.getAttribute("username"); 
        if(temp!=null) {
        	username = temp;
        	isCookie = true; 
        }

//		Cookie cookie = null;
//		Cookie[] cookies = null;
//		// Get an array of Cookies associated with this domain
//		cookies = request.getCookies();
//		if( cookies != null ){
//			for (int i = 0; i < cookies.length; i++){
//				cookie = cookies[i];
//				if((cookie.getName( )).toString().equals("username")){
//					username = (cookie.getValue( )).toString(); 	
//					isCookie = true;
//					break;
//				}
//			}
//		}

		
		
		boolean valid = false;
		try {

			if(!isCookie) {
				rs = st.executeQuery("SELECT * FROM users WHERE username = '" + username + "' AND password = '"+password+"'" );
				if(!rs.next()) {
					response.sendRedirect("login.jsp?status=wrong");
				}
				else
				{
					// Create cookies for first and last names.      
					Cookie loggedinuser = new Cookie("username", username);
					// Set expiry date after 24 Hrs for both the cookies.
					loggedinuser.setMaxAge(60*60*24); 
					// Add both the cookies in the response header.
					response.addCookie( loggedinuser );
					// Set response content type
					response.setContentType("text/html");
					valid = true;
					session.setAttribute("username", username);
				}
			}
			else {
				valid = true;
				rs = st.executeQuery("SELECT * FROM users WHERE username = '" + username +"'");
				rs.next();
			}
			if(valid) {
				String category=rs.getString("category");
				//System.out.println(category);
				if(category.equals("CONSUMER"))
				{
					//System.out.println(rs.getString("name"));

					request.setAttribute("consumername",rs.getString("name"));
					request.setAttribute("hostelnumber",rs.getString("hostelnumber"));

					ResultSet rsserving=st.executeQuery("SELECT itemname,type FROM servings natural join fooditems where servedon=current_date and hostelnumber='"+rs.getString("hostelnumber")+"'" );
					session.setAttribute("hostelno", rs.getString("hostelnumber"));
					ArrayList <String> bfast=new ArrayList<String>();
					ArrayList <String> lunch=new ArrayList<String>();
					ArrayList <String> tiffin=new ArrayList<String>();
					ArrayList <String> dinner=new ArrayList<String>();
					while(rsserving.next())
					{System.out.println("dedexe");
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
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/consumermain.jsp");
					rd.forward(request, response);
				}
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
