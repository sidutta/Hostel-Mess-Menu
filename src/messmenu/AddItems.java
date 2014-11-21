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


public class AddItems extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public AddItems() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("AddItemsCheck0");
		Enumeration <String> en = request.getParameterNames();
		Statement st = null;
		try
		{
			// enumerate through the keys and extract the values 
			// from the keys! 
			while (en.hasMoreElements()) {
				String parameterName = (String) en.nextElement();
				
				//valueArray contains all the values corresponding to a particular key
				String[] valueArray = request.getParameterValues(parameterName);
				//bfast denotes whether the item to be added is of type breakfast
				int bfast=0;
				//lunch denotes whether the item to be added is of type breakfast
				int lunch=0;
				//tiffin denotes whether the item to be added is of type breakfast
				int tiffin=0;
				//dinner denotes whether the item to be added is of type breakfast
				int dinner=0;

				for(int i = 0; i < valueArray.length; i++){
					
					//if item name is empty
					if(valueArray[i].equals(""))
						break;
					//if item type is empty
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
				
				if (!valueArray[0].equals(""))
				{
					System.out.println("AddItemsCheck3");
					//Insert the given item in fooditems and foodtype table using a SQL function
					PreparedStatement pstmt=Connect.getConnection().prepareStatement("SELECT * FROM insert_item(?,'"+bfast+"','"+lunch+"','"+tiffin+"','"+dinner+"')");
					pstmt.setString(1, valueArray[0]);
					pstmt.executeQuery();
				}
			}
		}
		catch (SQLException e) {
			System.out.println("db query Exception");
			e.printStackTrace();
		}
		//Redirect to managet_home.jsp
		response.sendRedirect("manager_home.jsp");


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
