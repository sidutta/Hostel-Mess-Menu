package authentication;

import java.io.IOException;



import java.io.PrintWriter;
import java.sql.PreparedStatement;
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

public class Putrating2 extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
	ServletException, IOException
	{
		Enumeration<String> parameterNames = request.getParameterNames();
		
		System.out.println("Yahooooo");
		String username="";
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
		ResultSet rs = null;
		Statement st = null;
		PreparedStatement pstmt=null;
		
		try {
			st = Connect.getConnection().createStatement();
			st.executeUpdate("set time zone interval '05:30' hour to minute");
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		Map<Integer, Integer> rating = new HashMap();
		Map<Integer, String> comments = new HashMap();

		 while (parameterNames.hasMoreElements()) {
                         
			String paramName = parameterNames.nextElement();
		
			System.out.println("key : "+paramName);
			String[] tp = {" "," "};
			tp = paramName.split(":");
			
			
			
			String paramval = request.getParameter(paramName);
			
			System.out.println("val : "+paramval);
			if(tp[0].equals("rate"))
				rating.put(Integer.parseInt(tp[1]), Integer.parseInt(paramval));
			else if(tp[0].equals("comment"))
				comments.put(Integer.parseInt(tp[1]), paramval);
			

		}
		 
		 for (Map.Entry<Integer, Integer> entry : rating.entrySet())
		 {
		     //entry.getKey() + "/" + entry.getValue());
			 String tocheck = "SELECT * FROM reviews where username='"+username+"' and sid='"+entry.getKey()+"'";
			 try {
				rs = st.executeQuery(tocheck);
				if(rs.next()){
					 String upd1 = "UPDATE reviews set rating='"+entry.getValue()+"' where username='"+username+"' and sid ='"+entry.getKey()+"'";
					 //String upd2 = "UPDATE reviews set  review='"+comments.get(entry.getKey())+"' where username='"+username+"' and sid ='"+entry.getKey()+"'";
					 String upd2 = "UPDATE reviews set  review=? where username='"+username+"' and sid ='"+entry.getKey()+"'";
					pstmt=Connect.getConnection().prepareStatement(upd2);
					pstmt.setString(1,comments.get(entry.getKey()));
					 st.executeUpdate(upd1);
					 pstmt.executeUpdate();
					 System.out.println("PreparedStatement working");

				 }
				else{
					 //String toex = "INSERT INTO reviews values('"+username+"','"+entry.getKey()+"','"+entry.getValue()+"','"+comments.get(entry.getKey())+"')";
					String toex = "INSERT INTO reviews values('"+username+"','"+entry.getKey()+"','"+entry.getValue()+"',?)";
					pstmt=Connect.getConnection().prepareStatement(toex);
					pstmt.setString(1,comments.get(entry.getKey()));
					 System.out.println(toex);
					 pstmt.executeUpdate();
					 System.out.println("PreparedStatement working");
					
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			 
			
			 
		 }
		 
		 PrintWriter out = response.getWriter();
		 	
			out.println("yo");

			out.close();
		 
					

	}
}
