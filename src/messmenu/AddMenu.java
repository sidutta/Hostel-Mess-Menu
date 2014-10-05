package messmenu;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddMenu extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
	ServletException, IOException
	{

		ResultSet rs = null;
		Statement st = null;

		String day = request.getParameter("day");
		String hostelno = request.getParameter("hostelno");
	
	}
}
