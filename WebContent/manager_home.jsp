<%@page import="messmenu.Connect"%>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="messmenu.Connect.*"%>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/css/multiselect.css">
<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/css/justified-nav.css"
	rel="stylesheet">

<link
	href="${pageContext.request.contextPath}/scripts/select2-3.5.1/select2.css"
	rel="stylesheet" />




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
	margin-top: 20px;
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

 window.addEvent=function(e,ev,f,c){if(e.addEventListener){e.addEventListener(ev,f,c);}else if(e.attachEvent){var r=e.attachEvent('on'+ev,f);return r;}else{e['on'+ev]=f;}};

function updateValue(){ 
	callAjax();
    callAjax2();
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
		var hnum ="<%=session.getAttribute("hostelno")%>";
		$("#hosteltitle").empty().append("This week's menu at "+ hnum);
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
	function callAjax2() {
		console.log("f3fdd");
		$.ajax({
			type : "GET",
			url : "AddMenu",
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
				var dinnertxt = "";alert("f3f");

				for (i = 0; i < bfastArray.length; i++) {
						var o = new Option(bfastArray[i], bfastArray[i]);
						$(o).html(bfastArray[i]);
						$("#bfast").append(o);
						
					}
					for (i = 0; i < lunchArray.length; i++) {
						var o = new Option(lunchArray[i], lunchArray[i]);
						$(o).html(lunchArray[i]);
						$("#lunch").append(o);
					}

					for (i = 0; i < tiffinArray.length; i++) {
						var o = new Option(tiffinArray[i], tiffinArray[i]);
						$(o).html(tiffinArray[i]);
						$("#tiffin").append(o);
					}
					for (i = 0; i < dinnerArray.length; i++) {
						var o = new Option(dinnerArray[i], dinnerArray[i]);
						$(o).html(dinnerArray[i]);
						$("#dinner").append(o);
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
				console.log("f3f");
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

			<div class="row centered-form">
				<div class="col-lg-5"></div>
				<div class="col-lg-2">
					<form>
						<center>
							<div class="form-group">
								<select class="combobox form-control" name="day"
									onchange="callAjax2()" id="day">
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
						</center>
					</form>
				</div>

			</div>

			<div class="row" style="margin-right: 0px; margin-left: 0px">
				<div class=""></div>
				<div class="panel panel-default col-lg-5"
					style="margin-right: 0px; margin-left: 3.8%">
					<div class="panel-heading">
						<h3 class="panel-title" id="hosteltitle">This week's menu</h3>
					</div>
					<div class="panel-body">


						<center>
							<table id="table" class="table">

							</table>
							<div class="text-muted" id="message"></div>
						</center>
					</div>
				</div>
				<div class="col-lg-1"></div>
				<div class="panel panel-default col-lg-5">
					<div class="panel-heading">
						<h3 class="panel-title">Set this week's menu</h3>

					</div>
					<div class="panel-body">

						<div class="row">
							<div class="col-lg-5">
								<h4>Breakfast</h4>

								<select multiple id="bfast">
									<option value="AL">Alabama</option>
									<option value="WY">Wyoming</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-5">
								<h4>Lunch</h4>
								<select multiple id="lunch">
									<option value="AL">Alabama</option>
									<option value="WY">Wyoming</option>
								</select>
							</div>
						</div>
						
						<div class="row">
							<div class="col-lg-5">
								<h4>Tiffin</h4>

								<select multiple id="tiffin">
									<option value="AL">Alabama</option>
									<option value="WY">Wyoming</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-5">
								<h4>Dinner</h4>
								<select multiple id="dinner">
									<option value="AL">Alabama</option>
									<option value="WY">Wyoming</option>
								</select>
							</div>
						</div>

					</div>
				</div>

			</div>
		</div>
	</form>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/jquery.js"></script>
	<%-- <script type="text/javascript"
		src="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/js/multiselect.js"></script> --%>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/js/bootstrap-combobox.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			$('.combobox').combobox();
		});
		$("#btnLeft").click(function() {
			var selectedItem = $("#rightValues option:selected");
			$("#leftValues").append(selectedItem);
		});

		$("#btnRight").click(function() {
			var selectedItem = $("#leftValues option:selected");
			alert(selectedItem.text());
			$("#rightValues").append(selectedItem);
		});

		$("#rightValues").change(function() {
			var selectedItem = $("#rightValues option:selected");
			$("#txtRight").val(selectedItem.text());
		});
	</script>
	<script
		src="${pageContext.request.contextPath}/scripts/select2-3.5.1/select2.js"></script>
	<script>
        $(document).ready(function() {
        	$("#bfast").select2({
            placeholder: "Select an item"
        	});
        	$("#lunch").select2({
                placeholder: "Select an item",
                allowClear: true
            	});
        	$("#tiffin").select2({
                placeholder: "Select an item",
                allowClear: true
            	});
        	$("#dinner").select2({
                placeholder: "Select an item",
                allowClear: true
            	});
        });
    </script>
	<script
		src="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script
		src="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/js/ie10-viewport-bug-workaround.js"></script>

</body>
</html>