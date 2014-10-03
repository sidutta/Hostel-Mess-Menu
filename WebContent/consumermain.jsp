<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

<h1><center>Welcome <%=request.getAttribute("consumername") %></center></h1>

<form action="Othermenu" method="get">
<center>
Change Hostel
<select name="hostelnum">
  <option value="H1">H1</option>
  <option value="H2">H2</option>
  <option value="H3">H3</option>
  <option value="H4">H4</option>
  <option value="H5">H5</option>
  <option value="H6">H6</option>
  <option value="H7">H7</option>
  <option value="H8">H8</option>
  <option value="H9">H9</option>
  <option value="H10">H10</option>
  <option value="H11">H11</option>
  <option value="H12">H12</option>
  <option value="H13">H13</option>
  <option value="H14">H14</option>
  <option value="H15">H15</option>
  <option value="H16">H16</option>
</select>
<input type="submit" value="Change">
<input type="hidden" name="consumername" value=<%=request.getAttribute("consumername") %>>
</center>
</form>
<br>

<h2><center><%=request.getAttribute("hostelnumber") %>: Today's Menu</center></h2>
 <h3>Breakfast</h3>
 <%
 ArrayList<String> bfast=(ArrayList <String>)request.getAttribute("bfast");
 if(bfast.isEmpty())
 {%>
	 Data Not Available
 <%}
 else
 {
	 for (String fooditem : bfast)
	 {%>
		 <%= fooditem%><br>
 <%}
 }%>
 
 
 <h3>Lunch</h3>
  <%
 ArrayList<String> lunch=(ArrayList <String>)request.getAttribute("lunch");
 if(lunch.isEmpty())
 {%>
	 Data Not Available
 <%}
 else
 {
	 for (String fooditem : lunch)
	 {%>
		 <%= fooditem%><br>
 <%}
 }%>
 
 
  <h3>Tiffin</h3>
  <%
 ArrayList<String> tiffin=(ArrayList <String>)request.getAttribute("tiffin");
 if(tiffin.isEmpty())
 {%>
	 Data Not Available
 <%}
 else
 {
	 for (String fooditem : tiffin)
	 {%>
		 <%= fooditem%><br>
 <%}
 }%>
 
 
 <h3>Dinner</h3>
  <%
 ArrayList<String> dinner=(ArrayList <String>)request.getAttribute("dinner");
 if(dinner.isEmpty())
 {%>
	 Data Not Available
 <%}
 else
 {
	 for (String fooditem : dinner)
	 {%>
		 <%= fooditem%><br>
 <%}
 }%>
 <br><br>
 <a href="/hostel-menu-mgmt/login.jsp?status=logout">Logout</a>
</body>
</html>