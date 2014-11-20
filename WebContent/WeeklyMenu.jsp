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
	href="${pageContext.request.contextPath}/scripts/jQuery-Range-Calendar2/css/rangecalendar.css"
	type="text/css" media="all">
<link rel="stylesheet" id="rangecalendar-style-css" href="${pageContext.request.contextPath}/scripts/jQuery-Range-Calendar2/css/style.css"
	type="text/css" media="all">
<link rel="stylesheet" id="jquery-ui-style-css"
	href="${pageContext.request.contextPath}/scripts/jQuery-Range-Calendar2/css/jquery-ui-1.10.3.custom.min.css" type="text/css" media="all">



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
				
	<%String category=(String)session.getAttribute("category");
		if (category.equals("ADMINISTRATOR"))
			{
			String context=request.getContextPath();
	out.println("<li><a href=\""+context+"/manager_home.jsp\">Set Menu</a></li>");
		;} %>
				
				<li class="active"><a href="#">Weekly Menu</a></li>
				<li><a href="#">Downloads</a></li>
				<li><a href="#">About</a></li>
				<li><a
					href="${pageContext.request.contextPath}/login.jsp?status=logout">Logout</a></li>
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
		src="${pageContext.request.contextPath}/scripts/jQuery-Range-Calendar2/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/scripts/jQuery-Range-Calendar2/js/jquery-ui.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/scripts/jQuery-Range-Calendar2/js/jquery.ui.touch-punch.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/scripts/jQuery-Range-Calendar2/js/moment+langs.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/scripts/jQuery-Range-Calendar2/js/jquery.rangecalendar.js"></script>


	<script type="text/javascript"
		src="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/js/bootstrap-combobox.js"></script>


	<script type="text/javascript">
		$(document).ready(function() {
			$('.combobox').combobox();
		});
		
		$(document).ready(function(){
			
			  var currentTime = new Date();
			var month = currentTime.getMonth();
			var day = currentTime.getDate()-13;
			var year = currentTime.getFullYear();
			 
			var rangeCalendar =  $("#cal4").rangeCalendar({startDate: new Date(year, month, day), weekends:true,startRangeWidth:7,changeRangeCallback: rangeChanged});
			/* rangeCalendar.setStartDate(); */
				
			function rangeChanged(target,range){
		    
				
				console.log(range);
			    var startDay = moment(range.start).format('DD');
			    var startMonth = moment(range.start).format('MM');
			    var startYear = moment(range.start).format('YY');
			    
			    var today = new Date();
			    /* today.setDate(startDay);
			    today.setMonth(startMonth);
 */			    today.setFullYear(20+startYear,(parseInt(startMonth)-1),startDay-13); 
			    
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
			    
			    today.setDate(today.getDate() - 6);
			    var date1 = "";
			    if(today.getDate()<10) {
			    	date1 = "0" + today.getDate();
			    } 
			    else {
			    	date1 = "" + today.getDate();
			    }
			    var month1 = "";
			    if(today.getMonth()<9) {
			    	month1 = "0" + (parseInt(today.getMonth())+1);
			    } 
			    else {
			    	month1 = (parseInt(today.getMonth())+1);
			    }
				var dateset = today.getFullYear() + "-" + (parseInt(today.getMonth())+1) + "-" + date1;
				
				$.ajax({
					type : "GET",
					url : "WeeklyMenu",
					data : "dateset="+dateset,
					dataType : "json",
					//if received a response from the server
					success : function(data, textStatus, jqXHR) {
						for ( var key in data) {
							$("#"+key).empty();
							$("#"+key).append(data[key]); 
						}
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
						for(var i=1; i<=7; i++)
							for(var j=2; j<=5; j++) {
						$("#"+i+j).empty();
						$("#"+i+j).append("Loading...");
					}
					}
					

				});
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