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


<link rel="stylesheet" id="rangecalendar-style-css"
	href="${pageContext.request.contextPath}/scripts/jQuery-Range-Calendar/css/rangecalendar.css"
	type="text/css" media="all">
<link rel="stylesheet" id="rangecalendar-style-css" href="css/style.css" type="text/css" media="all">
<link rel="stylesheet" id="jquery-ui-style-css" href="css/jquery-ui-1.10.3.custom.min.css" type="text/css" media="all">

	
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/jquery.js"></script>

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

<script>
	var jsondata;
	var day;
	var foodtype;
	var flag = false;
	$(function() {
		$('#myForm').on('submit', function(e) {

			e.preventDefault();
		});
	});
	function callAjax() {
		dataString = $("#myAjaxRequestForm").serialize();

		//get the form data using another method 
		if (flag == false) {
			day = $("#day").val();
			foodtype = $("#foodtype").val();
		}
		dataString = "day=" + day + "&foodtype=" + foodtype;
		flag = false;
		console.log("yo");

		// jsondata;
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
						console.log(data);
						var txt = "";
						txt += "<tr><th>ID</th><th>Item Name</th><th>Average Rating</th><th>Your Rating</th><th>Comments</th></td>";
						var i = 0;
						jsondata = data;
						var n;
						for ( var key in data) {
							if (data.hasOwnProperty(key)) {
								if (isNaN(key)) {
									txt += "<tr><td>" + data[key] + "</td><td>"
											+ key + "</td>";

									txt += "<td><span id = 'avg"+data[key]+"'></span></td>";
									txt += "<td><select class='combobox form-control' name='rate@"+data[key]+"' id='rate@"+data[key]+"'>"
											+ "<option value='' selected='selected'>Rate</option>"
											+ "<option value='1'>1</option>"
											+ "<option value='2'>2</option>"
											+ "<option value='3'>3</option>"
											+ "<option value='4'>4</option>"
											+ "<option value='5'>5</option>"
											+ "</select></td>";
									txt += "<td><textarea class='col-md-12 col-sm-12' rows='3' placeholder='Comment' name='comment@"+data[key]+"' id='comment@"+data[key]+"' required></textarea></td>";
									txt += "</tr>";

									i = i + 1;
								} else {

									console.log("Aditi");
								}
							}
						}

						if (txt != "") {
							//	txt += "<input type=submit onclick='sendratings()'>"
							//  txt += "</form>"
							$("#table").append(txt).removeClass("hidden");
							$('#butt').removeClass("hidden");
							//console.log(txt);
						} else {

							$("#message").append("No Data Available");
						}

						for ( var key in data) {
							if (data.hasOwnProperty(key)) {
								if (isNaN(key)) {

								} else {
									var createid = "avg" + key.toString();
									document.getElementById(createid).innerHTML = data[key];
								}
							}
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
						console.log("yoo3243o");
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
					<li><a href="${pageContext.request.contextPath}/login.jsp">Home</a></li>
					<li><a href="${pageContext.request.contextPath}/giverating.jsp">Rate</a></li>
					<li class="active"><a href="#">Weekly Menu</a></li>
					<li><a href="#">Downloads</a></li>
					<li><a href="#">About</a></li>
					<li><a href="${pageContext.request.contextPath}/login.jsp?status=logout">Logout</a></li>
				</ul>
			</div>

			<div class="row centered-form"
				style="margin-right: 0px; margin-left: 0px">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Weekly Menu</h3>
					</div>
					<div class="panel-body">

						<div class="row">
							<div class="col-lg-12">
							<div class="section">

								<div id="cal4"></div>
								<table class="table table-bordered">
								<tr>
									<th>Date</th>
									<th>Breakfast</th>
									<th>Lunch</th>
									<th>Tiffin</th>
									<th>Dinner</th>
								</tr>
								<tr>
									<td id="11"></td>
									<td id="12"></td>
									<td id="13"></td>
									<td id="14"></td>
									<td id="15"></td>
								</tr>
								<tr>
									<td id="21"></td>
									<td id="22"></td>
									<td id="23"></td>
									<td id="24"></td>
									<td id="25"></td>
								</tr>
								<tr>
									<td id="31"></td>
									<td id="32"></td>
									<td id="33"></td>
									<td id="34"></td>
									<td id="35"></td>
								</tr>
								<tr>
									<td id="41"></td>
									<td id="42"></td>
									<td id="43"></td>
									<td id="44"></td>
									<td id="45"></td>
								</tr>
								<tr>
									<td id="51"></td>
									<td id="52"></td>
									<td id="53"></td>
									<td id="54"></td>
									<td id="55"></td>
								</tr>
								<tr>
									<td id="61"></td>
									<td id="62"></td>
									<td id="63"></td>
									<td id="64"></td>
									<td id="65"></td>
								</tr>
								<tr>
									<td id="71"></td>
									<td id="72"></td>
									<td id="73"></td>
									<td id="74"></td>
									<td id="75"></td>
								</tr>
								</table>

							</div>
							</div>
						</div>

						<div class="row"></div>


						<center>
							<div class="text-muted" id="message"></div>
						</center>
					</div>
				</div>
					
			</div>
		</div>


	
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/scripts/jQuery-Range-Calendar/js/jquery.min.js">alert("frc");</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/scripts/jQuery-Range-Calendar/js/jquery-ui.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/scripts/jQuery-Range-Calendar/js/jquery.ui.touch-punch.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/scripts/jQuery-Range-Calendar/js/moment+langs.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/scripts/jQuery-Range-Calendar/js/jquery.rangecalendar.js"></script>
	
	
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/js/bootstrap-combobox.js"></script>
	
	
	<script type="text/javascript">
		$(document).ready(function() {
			$('.combobox').combobox();
		});
		
		$(document).ready(function(){

			
			
			var rangeCalendar =  $("#cal4").rangeCalendar({weekends:true,startRangeWidth:7,changeRangeCallback: rangeChanged});

			function rangeChanged(target,range){
		    
				
				console.log(range);
			    var startDay = moment(range.start).format('DD');
			    var startMonth = moment(range.start).format('MM');
			    var startYear = moment(range.start).format('YY');
			    
			    var today = new Date();
			    /* today.setDate(startDay);
			    today.setMonth(startMonth);
 */			    today.setFullYear(20+startYear,(parseInt(startMonth)-1),startDay); 
			    
			    $("#11").empty();
			    $("#21").empty();
			    $("#31").empty();
			    $("#41").empty();
			    $("#51").empty();
			    $("#61").empty();
			    $("#71").empty();
			    
			    $("#11").append(today.getDate() + "-" + (parseInt(today.getMonth())+1) + "-" + today.getFullYear());
			    today.setDate(today.getDate() + 1);
			    $("#21").append(today.getDate() + "-" + (parseInt(today.getMonth())+1) + "-" + today.getFullYear());
			    today.setDate(today.getDate() + 1);
			    $("#31").append(today.getDate() + "-" + (parseInt(today.getMonth())+1) + "-" + today.getFullYear());
			    today.setDate(today.getDate() + 1);
			    $("#41").append(today.getDate() + "-" + (parseInt(today.getMonth())+1) + "-" + today.getFullYear());
			    today.setDate(today.getDate() + 1);
			    $("#51").append(today.getDate() + "-" + (parseInt(today.getMonth())+1) + "-" + today.getFullYear());
			    today.setDate(today.getDate() + 1);
			    $("#61").append(today.getDate() + "-" + (parseInt(today.getMonth())+1) + "-" + today.getFullYear());
			    today.setDate(today.getDate() + 1);
			    $("#71").append(today.getDate() + "-" + (parseInt(today.getMonth())+1) + "-" + today.getFullYear());
			    
				for(var j=2; j<6; j++)
					for(var i=1; i<8; i++)
						$("#"+i+j).append("de");
			
			}
			
			
			function ragneChanged(target,range) {
				
				console.log(range);
			}
	    
		});

	</script>
	<script
		src="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script
		src="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/js/ie10-viewport-bug-workaround.js"></script>

</body>
</html>