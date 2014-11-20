package messmenu;
import java.sql.ResultSet;

import messmenu.Connect;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddItems
 */
public class AddItems extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddItems() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("AddItemsCheck0");
		Enumeration <String> en = request.getParameterNames();
		Statement st = null;
		// enumerate through the keys and extract the values 
		// from the keys! 
		try
		{
			while (en.hasMoreElements()) {
				String parameterName = (String) en.nextElement();

				//System.out.println(parameterName+":");

				String[] valueArray = request.getParameterValues(parameterName);
				int bfast=0;
				int lunch=0;
				int tiffin=0;
				int dinner=0;

				for(int i = 0; i < valueArray.length; i++){
					System.out.println("AddItemsCheck1");
					if(valueArray[i].equals(""))
						break;
					if(valueArray.length==1)
					{
						bfast=lunch=tiffin=dinner=1;
					}
					if(valueArray[i].equals("BREAKFAST"))
						bfast=1;
					else if(valueArray[i].equals("LUNCH"))
						lunch=1;
					else if(valueArray[i].equals("TIFFIN"))
						tiffin=1;
					else if(valueArray[i].equals("DINNER"))
						dinner=1;				  
				} 
				System.out.println("AddItemsCheck2");
				if (!valueArray[0].equals(""))
				{
					System.out.println("AddItemsCheck3");
					//st=Connect.getConnection().createStatement();;
					//st.executeQuery("SELECT * FROM insert_item('"+valueArray[0]+"','"+bfast+"','"+lunch+"','"+tiffin+"','"+dinner+"')");
					PreparedStatement pstmt=Connect.getConnection().prepareStatement("SELECT * FROM insert_item(?,'"+bfast+"','"+lunch+"','"+tiffin+"','"+dinner+"')");
					pstmt.setString(1, valueArray[0]);
					pstmt.executeQuery();
					System.out.println("Prepared Statement working");
					System.out.println(valueArray[0]+"inserted!");
				}
			}
		}
		catch (SQLException e) {
			System.out.println("db query Exception");
			e.printStackTrace();
		}
		response.sendRedirect("manager_home.jsp");


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
