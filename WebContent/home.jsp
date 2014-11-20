<%@page import="messmenu.Connect"%>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ page import="java.util.*"%>
<%@ page import="messmenu.Connect.*"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Hostel Menu Management</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/css/bootstrap-theme.min.css">

<!-- Bootstrap ComboBox for dropdown menu -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/css/bootstrap-combobox.css">

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/css/justified-nav.css"
	rel="stylesheet">

<!-- Bootstrap ComboBox for dropdown menu -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/css/bootstrap-combobox.css">


<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script
	src="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- ajax json starts -->

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js"
	type="text/javascript"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
	type="text/javascript"></script>
<script>

 window.addEvent=function(e,ev,f,c){if(e.addEventListener){e.addEventListener(ev,f,c);}else if(e.attachEvent){var r=e.attachEvent('on'+ev,f);return r;}else{e['on'+ev]=f;}};

function updateValue(){ 
    callAjax();
    }

window.addEvent(window, "load", updateValue, false); 

	<%-- window.onload = function() {
		alert("fref");
		var aaa= <%=session.getAttribute("hostelno")%>;
		 document.getElementById("hostelnum").value = (String) session.getAttribute("hostelno"); 
		alert(aaa);
		callAjax();
		alert("vre"); 
	} --%>
 
	function callAjax() {
		//dataString = $("#myAjaxRequestForm").serialize();

		//get the form data using another method 
		var hnum = $("#hostelnum").val();
		if(hnum=="") hnum="<%=session.getAttribute("hostelno")%>";
		$("#hosteltitle").empty().append(hnum);
		dataString = "hostelnum=" + hnum + "&initialCall=False";
		console.log("yo");

		var jsondata;
		//make the AJAX request, dataType is set to json
		//meaning we are expecting JSON data in response from the server
		$.ajax({
			type : "GET",
			url : "Othermenu",
			data : dataString,
			dataType : "json",
			//if received a response from the server
			success : function(data, textStatus, jqXHR) {
				//our country code was correct so we have some information to display
				//$("#message").empty();
				//$("#table").empty();
				//alert("eeff" + data.dinner);

				//obj = JSON.parse(data);
				var bfastArray = data.bfast;//alert("eegg"+bfastArray);
				var lunchArray = data.lunch;//alert("eeff" + data.dinner);
				var tiffinArray = data.tiffin;
				var dinnerArray = data.dinner;//alert("eeff" + data.dinner);
				var bfasttxt = "";
				var lunchtxt = "";
				var tiffintxt = "";
				var dinnertxt = "";
				if (bfastArray.length == 0)
					bfasttxt = "Data not available";
				else {
					for (i = 0; i < bfastArray.length; i++) {
						bfasttxt += bfastArray[i] + "<br>";
					}
				}
				if (lunchArray.length == 0)
					lunchtxt = "Data not available";
				else {
					for (i = 0; i < lunchArray.length; i++) {
						lunchtxt += lunchArray[i] + "<br>";
					}
				}

				if (tiffinArray.length == 0)
					tiffintxt = "Data not available";
				else {
					for (i = 0; i < tiffinArray.length; i++) {
						tiffintxt += tiffinArray[i] + "<br>";
					}
				}

				if (dinnerArray.length == 0)
					dinnertxt = "Data not available";
				else {
					for (i = 0; i < dinnerArray.length; i++) {
						dinnertxt += dinnerArray[i] + "<br>";
					}
				}
				var appendtxt = "";

				appendtxt += "<tr>" + "<td>Breakfast</td>"  + "<td>"
						+ bfasttxt + "</td></tr>";

				appendtxt += "<tr>" + "<td>Lunch</td>"  + "<td>"
						+ lunchtxt + "</td></tr>";

				appendtxt += "<tr>" + "<td>Tiffin</td>"  + "<td>"
						+ tiffintxt + "</td></tr>";

				appendtxt += "<tr>" + "<td>Dinner</td>"  + "<td>"
						+ dinnertxt + "</td></tr>";
				
				$("#table").append(appendtxt); 
				
			},

			//If there was no resonse from the server
			error : function(jqXHR, textStatus, errorThrown) {
				console.log("Something really bad happened " + textStatus);
				$("#ajaxResponse").html(jqXHR.responseText);
			},

			//this is called after the response or error functions are finsihed
			//so that we can take some action
			complete : function(jqXHR, textStatus) {
				//enable the button 
				//$('#myButton').attr("disabled", false);
			},
			beforeSend : function(jqXHR, settings) {
				$("#table").empty();
			}

		});
	}
</script>




</head>

<body>
<%
		if (session.getAttribute("consumername") == null)
			response.sendRedirect("login.jsp");
	%>
<div class="container">

<div class="masthead"><!-- <table>
			<tr> -->
<div class="row"><!-- <td class='col-md-10	'> -->
<h3 class="text-muted col-md-10">Hostel Menu Management</h3>
<!-- </td> --> <!-- <td> -->
<h4 class="text col-md-2" align="right" vertical-align="center"
	style="margin-top: 25px;"><%=session.getAttribute("consumername")%>
</h4>
<!-- </td> --></div>
<!-- </tr>
			</table> -->
<ul class="nav nav-justified">
	<li class="active"><a
		href="${pageContext.request.contextPath}/home.jsp">Home</a></li>
	<li><a href="${pageContext.request.contextPath}/giverating.jsp">Rate</a></li>
	
	<%String category=(String)session.getAttribute("category");
		if (category.equals("ADMINISTRATOR"))
			{
			String context=request.getContextPath();
	out.println("<li><a href=\""+context+"/manager_home.jsp\">Set Menu</a></li>");
		;} %>
		
	<li><a href="${pageContext.request.contextPath}/WeeklyMenu.jsp">Weekly
	Menu</a></li>	
	<li><a href="#">Downloads</a></li>
	<li><a href="#">About</a></li>
	<li><a
		href="${pageContext.request.contextPath}/login.jsp?status=logout">Logout</a></li>
</ul>
</div>

<!-- Jumbotron -->
<div class="jumbotron"
	style="margin-bottom: 0px; padding-bottom: 0px; padding-top: 0px">
<%
				Statement st = Connect.getConnection().createStatement();
				ResultSet rs = st
						.executeQuery("SELECT * FROM timeFoodType WHERE current_time>=startTime AND current_time<=endTime");
				rs.next();
				String mealJustEaten = rs.getString("type");
			%>
<h2><%=mealJustEaten%></h2>

<p><a class="btn btn-lg btn-success" href="#" role="button">Review
It!</a></p>
</div>

<!-- Example row of columns -->
<div class="row">
<div class="col-lg-3">
<h2>
<center>Reviews</center>
</h2>
<p class="text-danger">As of v7.0.1, Safari exhibits a bug in which
resizing your browser horizontally causes rendering errors in the
justified nav that are cleared upon refreshing.</p>
<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus,
tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum
massa justo sit amet risus. Etiam porta sem malesuada magna mollis
euismod. Donec sed odio dui.</p>
<p><a class="btn btn-primary" href="#" role="button">View
details &raquo;</a></p>
</div>
<div class="col-lg-6">



<h2>
<center>Today's Menu at
<div id="hosteltitle"></div>
</center>
</h2>

<table id="table" class="table">

</table>
<br>
<div id="message"></div>
<br>



<div class="row">
<div class="col-lg-3">
<form>
<center>
<div class="form-group"><select class="combobox form-control"
	id="hostelnum">
	<option value="" selected="selected">Hostel</option>
	<option value="H1">H-1</option>
	<option value="H2">H-2</option>
	<option value="H3">H-3</option>
	<option value="H4">H-4</option>
	<option value="H5">H-5</option>
	<option value="H6">H-6</option>
	<option value="H7">H-7</option>
	<option value="H8">H-8</option>
	<option value="H9">H-9</option>
	<option value="H10">H-10</option>
	<option value="H11">H-11</option>
	<option value="H12">H-12</option>
	<option value="H13">H-13</option>
	<option value="H14">H-14</option>
	<option value="H15">H-15</option>

</select> <br>

</div>
</center>
</form>
</div>
<div class="col-lg-3">
<button class="btn btn-sm btn-primary btn-block" value="Change"
	onclick="callAjax();">Go</button>
<br>
</div>
</div>

</div>
<div class="col-lg-3">
<h2>
<center>Trending</center>
</h2>
<p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in,
egestas eget quam. Vestibulum id ligula porta felis euismod semper.
Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh,
ut fermentum massa.</p>
<p><a class="btn btn-primary" href="#" role="button">View
details &raquo;</a></p>
</div>
</div>

<!-- Site footer -->
<div class="footer">
<p>&copy; Developed by Siddhartha, Shivam and Aditya</p>
</div>

</div>
<!-- /container -->

<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/js/bootstrap-combobox.js"></script>

<script type="text/javascript">
		$(document).ready(function() {
			$('.combobox').combobox();
		});
	</script>
<script
	src="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/js/bootstrap.min.js"></script>

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script
	src="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
