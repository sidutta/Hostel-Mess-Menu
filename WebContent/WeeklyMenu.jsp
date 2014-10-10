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
	href="${pageContext.request.contextPath}/jQuery-Range-Calendar/css/rangecalendar.css"
	type="text/css" media="all">
<link rel="stylesheet" id="rangecalendar-style-css"
	href="${pageContext.request.contextPath}/jQuery-Range-Calendar/css/style.css"
	type="text/css" media="all">
<link rel="stylesheet" id="jquery-ui-style-css"
	href="${pageContext.request.contextPath}/jQuery-Range-Calendar/css/jquery-ui-1.10.3.custom.min.css"
	type="text/css" media="all">



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
	
	
$(document).ready(function(){
		
		var defaultCalendar = $("#cal1").rangeCalendar();
		
		
		$("#setDateBt").click(function () {
			var newDate = new Date(2014, 4, 24);
			rangeCalendar.setStartDate(newDate);
			
			rangeCalendar.update();
		});
		
		$("#addMonthBt").click(function () {
		
			var newDate = moment().add('months', 1);
			rangeCalendar.setStartDate(newDate);
		});
		
		
		
		
		var customizedRangeCalendar = $("#cal2").rangeCalendar({theme:"full-green-theme"});
		var languageCalendar = $("#cal3").rangeCalendar({lang:"it"});
		var rangeCalendar =  $("#cal4").rangeCalendar({weekends:false});
		var callbackRangeCalendar =  $("#cal5").rangeCalendar({changeRangeCallback: rangeChanged,weekends:false});
		
		function rangeChanged(target,range){
	    
			
			console.log(range);
		    var startDay = moment(range.start).format('DD');
		    var startMonth = moment(range.start).format('MMM');
		    var startYear = moment(range.start).format('YY');
		    var endDay = moment(range.end).format('DD');
		    var endMonth = moment(range.end).format('MMM');
		    var endYear = moment(range.end).format('YY');
		    
		    
		    $(".calendar-values .start-date .value").html(startDay);
		    $(".calendar-values .start-date .label").html("");
		    $(".calendar-values .start-date .label").append(startMonth);
		    $(".calendar-values .start-date .label").append("<small>"+startYear+"</small>");
		    $(".calendar-values .end-date .value").html(endDay);
		    $(".calendar-values .end-date .label").html("");
		    $(".calendar-values .end-date .label").append(endMonth);
		    $(".calendar-values .end-date .label").append("<small>"+endYear+"</small>");
		    $(".calendar-values .days-width .value").html(range.width);
		    $(".calendar-values .from-now .label").html(range.fromNow);
		    
		}
    
		function ragneChanged(target,range) {
			
			console.log(range);
		}
    
	});
</script>
</head>		



<body>
	<form id='myForm'>
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
					<li class="active"><a href="${pageContext.request.contextPath}/giverating.jsp">Rate</a></li>
					<li><a href="#">Services</a></li>
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
							<div class="section">
								<h2>Set date programmatically</h2>

								<div id="setDateBt" class="btn btn-primary btn-lg">Set a
									new date programmatically</div>
								<div id="addMonthBt" class="btn btn-primary btn-lg">+ 1
									month from now</div>


								<div id="cal4"></div>


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


	</form>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/jQuery-Range-Calendar/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/jQuery-Range-Calendar/js/jquery-ui.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/jQuery-Range-Calendar/js/jquery.ui.touch-punch.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/jQuery-Range-Calendar/js/moment+langs.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/jQuery-Range-Calendar/js/jquery.rangecalendar.js"></script>

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