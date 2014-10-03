<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ page import="java.util.*"%>

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



<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script
	src="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>

.centered-form {
	margin-top: 60px;
}

.centered-form .panel {
	background: rgba(255, 255, 255, 0.8);
	box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
}
</style>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js"
	type="text/javascript"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
	type="text/javascript"></script>
<script>
	function callAjax() {
		dataString = $("#myAjaxRequestForm").serialize();

		//get the form data using another method 
		var day = $("#day").val();
		var foodtype = $("#foodtype").val();
		dataString = "day=" + day + "&foodtype=" + foodtype;
		console.log("yo");

		var jsondata;
		//make the AJAX request, dataType is set to json
		//meaning we are expecting JSON data in response from the server
		$
				.ajax({
					type : "POST",
					url : "Putrating",
					data : dataString,
					dataType : "json",

					//if received a response from the server
					success : function(data, textStatus, jqXHR) {
						//our country code was correct so we have some information to display
						$("#message").empty();
						$("#table").empty();
						var txt = "";
						var i = 0;
						for ( var key in data) {
							if (data.hasOwnProperty(key)) {
								txt += "<tr><td>" + data[key] + "</td><td>"
										+ key + "</td>";

								txt += "<td><select class='combobox form-control' name='rating"+i+"' id='rating"+i+"'>"
										+ "<option value='' selected='selected'>Rate</option>"
										+ "<option value='Consumer'>1</option>"
										+ "<option value='Administrator'>2</option>"
										+ "</select></td>";
								txt += "<td><select class='combobox form-control' name='rate"+i+"' id='rate"+i+"'>"
										+ "<option value='' selected='selected'>Rate</option>"
										+ "<option value='Consumer'>1</option>"
										+ "<option value='Administrator'>2</option>"
										+ "</select></td>";
								txt += "<td><textarea class='col-md-12 col-sm-12' rows='3' placeholder='Comment' name='comment"+i+"' id='comment"+i+"' required></textarea></td>";
								txt += "</tr>";
								i = i + 1;
							}
						}
						if (txt != "") {
							
							$("#table").append(txt).removeClass("hidden");
							console.log(txt);
						}
						else {
							
							$("#message").append("No Data Available");
						}

					},

					//If there was no resonse from the server
					error : function(jqXHR, textStatus, errorThrown) {
						console.log("Something really bad happened "
								+ textStatus);
						$("#ajaxResponse").html(jqXHR.responseText);
					},

					//capture the request before it was sent to server
					beforeSend : function(jqXHR, settings) {
						$("#message").empty().append("Loading...");
						$("#table").empty();
						//adding some Dummy data to the request
						settings.data += "&dummyData=whatever";
						//disable the button until we get the response
						// $('#myButton').attr("disabled", true);
					},

					//this is called after the response or error functions are finsihed
					//so that we can take some action
					complete : function(jqXHR, textStatus) {
						//enable the button 
						//$('#myButton').attr("disabled", false);
					}

				});
	}
</script>
</head>



<body>
	<form>
		<div class="container">

			<div class="masthead">
				<!-- <table>
			<tr> -->
				<div class="row">
					<!-- <td class='col-md-10	'> -->
					<h3 class="text-muted col-md-10">Hostel Menu Management</h3>
					<!-- </td> -->
					<!-- <td> -->
					<h4 class="text col-md-2" align="right" vertical-align="center"
						style="margin-top: 25px;">
						<%=session.getAttribute("consumername")%>
					</h4>
					<!-- </td> -->
				</div>
				<!-- </tr>
			</table> -->
				<ul class="nav nav-justified">
					<li><a href="/hostel-menu-mgmt/login.jsp">Home</a></li>
					<li class="active"><a href="/hostel-menu-mgmt/giverating.jsp">Rate</a></li>
					<li><a href="#">Services</a></li>
					<li><a href="#">Downloads</a></li>
					<li><a href="#">About</a></li>
					<li><a href="/hostel-menu-mgmt/login.jsp?status=logout">Logout</a></li>
				</ul>
			</div>

			<div class="row centered-form" style="margin-right:0px; margin-left:0px">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Give your Rating</h3>
					</div>
					<div class="panel-body">

						<div class="row">
							<div class="col-xs-3 col-sm-3 col-md-3 col-md-offset-2">
								<div class="form-group">
									<select class="combobox form-control" name="day"
										onchange="callAjax()" id="day">
										<option value="" selected="selected">Day</option>
										<option value="Monday">Monday</option>
										<option value="Tuesday">Tuesday</option>
										<option value="Wednesday">Wednesday</option>
										<option value="Thursday">Thursday</option>
										<option value="Friday">Friday</option>
										<option value="Saturday">Saturday</option>
										<option value="Sunday">Sunday</option>
									</select>
								</div>
							</div>


							<div class="col-xs-3 col-sm-3 col-md-3 col-md-offset-2 ">
								<div class="form-group">
									<select class="combobox form-control" name="foodtype"
										onchange="callAjax()" id="foodtype">
										<option value="" selected="selected">Type</option>
										<option value="BREAKFAST">Breakfast</option>
										<option value="LUNCH">Lunch</option>
										<option value="TIFFIN">Snacks</option>
										<option value="DINNER">Dinner</option>
									</select>
								</div>
							</div>



						</div>

						<div class="row">
							<div class="col-xs-3 col-sm-12 col-md-12  ">
								<table id="table" class="hidden table">
									<tr>
										<th class='col-md-2 col-sm-2'>ItemId</th>
										<th class='col-md-2 col-sm-2'>Food Name</th>
										<th class='col-md-2 col-sm-2'>Rating</th>
										<th class='col-md-2 col-sm-2'>Rate</th>
										<th class='col-md-4 col-sm-4'>Comment</th>
									</tr>
								</table>
							</div>
						</div>
						<center><div class="text-muted" id="message"> </div></center>
					</div>
				</div>
			</div>
		</div>
	</form>

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