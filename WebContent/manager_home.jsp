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
	callAjax2();
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
		var day = $("#day").val();
		if(day=="") day="initial";
		//if(day=="") hnum="<%=session.getAttribute("hostelno")%>";
		
		
		
		//get the form data using another method 
		var hnum ="<%=session.getAttribute("hostelno")%>";
		if(day=="initial")
		$("#settitle").empty().append("Set today's menu");
		else
			$("#settitle").empty().append("Set "+day+"'s menu");
		
		if(day=="initial")
			$("#hosteltitle").empty().append("Today's menu at "+ hnum);
			else
				$("#hosteltitle").empty().append(day+"'s menu at "+ hnum);
		
		dataString = "day=" + day + "&initialCall=False";
		console.log("yocallhua");

		var jsondata;
		//make the AJAX request, dataType is set to json
		//meaning we are expecting JSON data in response from the server
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
				console.log("yocallreturnhua");
				var lunchArray = data.lunch;//alert("eeff" + data.dinner);
				var tiffinArray = data.tiffin;
				var dinnerArray = data.dinner;//alert("eeff" + data.dinner);
				var bfastArray = data.bfast;//alert("eegg"+bfastArray);
				var bfasttxt = "";
				var lunchtxt = "";
				var tiffintxt = "";
				var dinnertxt = "";
				
				$("#bfast").select2("val", bfastArray);
				$("#lunch").select2("val", lunchArray);
				$("#tiffin").select2("val", tiffinArray);
				$("#dinner").select2("val", dinnerArray);
				$("#table").empty();
				if ((bfastArray.length == 0) || (bfastArray[0]=="prevweek"))
					bfasttxt = "Data not available";
				else {
					for (i = 1; i < bfastArray.length; i++) {
						bfasttxt += bfastArray[i] + "<br>";
					}
				}
				if (lunchArray.length == 0 || (lunchArray[0]=="prevweek"))
					lunchtxt = "Data not available";
				else {
					for (i = 1; i < lunchArray.length; i++) {
						lunchtxt += lunchArray[i] + "<br>";
					}
				}

				if (tiffinArray.length == 0 || (tiffinArray[0]=="prevweek"))
					tiffintxt = "Data not available";
				else {
					for (i = 1; i < tiffinArray.length; i++) {
						tiffintxt += tiffinArray[i] + "<br>";
						//$("#tiffin").select2("val", tiffinArray[i]);

					}
				}

				if (dinnerArray.length == 0 || (dinnerArray[0]=="prevweek"))
					dinnertxt = "Data not available";
				else {
					for (i = 1; i < dinnerArray.length; i++) {
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
				$("#table").append("Loading...");
			}

		});
	}
	function callAjax2() {
		console.log("Ajax2callhua");
		$.ajax({
			type : "GET",
			url : "GetItems",
			dataType : "json",
			//if received a response from the server
			success : function(data, textStatus, jqXHR) {
				//our country code was correct so we have some information to display
				//$("#message").empty();
				//$("#table").empty();
				//alert("eeff" + data.dinner);

				//obj = JSON.parse(data);
				console.log("Ajax2callreturnhua");
				/*var bfastArray = data.bfast;//alert("eegg"+bfastArray);
				var lunchArray = data.lunch;//alert("eeff" + data.dinner);
				var tiffinArray = data.tiffin;
				var dinnerArray = data.dinner;//alert("eeff" + data.dinner);
				var bfasttxt = "";
				var lunchtxt = "";
				var tiffintxt = "";
				var dinnertxt = "";*/

				for (i = 0; i < data.length; i++) {
						var o = new Option(data[i], data[i]);
						//o.setAttribute("selected","selected");
						$(o).html(data[i]);
						$("#bfast").append(o);
						
					}
				for (i = 0; i < data.length; i++) {
					var o = new Option(data[i], data[i]);
					//o.setAttribute("selected","selected");
					$(o).html(data[i]);
					$("#lunch").append(o);
					
				}

				for (i = 0; i < data.length; i++) {
					var o = new Option(data[i], data[i]);
					//o.setAttribute("selected","selected");
					$(o).html(data[i]);
					$("#tiffin").append(o);
					
				}
				for (i = 0; i < data.length; i++) {
					var o = new Option(data[i], data[i]);
					//o.setAttribute("selected","selected");
					$(o).html(data[i]);
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
				
			}

		});
	}
	
	function callAjax3() {
		//alert($("#dinner").val());
		var day=$("#day").val();
		if(day=="") day="initial";
		var bfast=$("#bfast").val();
		var lunch=$("#lunch").val();
		var tiffin=$("#tiffin").val();
		var dinner=$("#dinner").val();
		var repeat=$("#repeat").val();
		console.log(bfast);
		console.log(lunch);
		console.log(repeat);
		if(bfast==null)
			{
			alert("Breakfast can not be empty.");
			return;
			}
		if(lunch==null)
		{
		alert("Lunch can not be empty.");
		return;
		}
		if(tiffin==null)
		{
		alert(" Tiffin not be empty.");
		return;
		}
		if(dinner==null)
		{
		alert("Dinner can not be empty.");
		return;
		}
		
		dataString = "day=" + day + "&bfast="+bfast+ "&lunch="+lunch+ "&tiffin="+tiffin+ "&dinner="+dinner+ "&repeat="+repeat;
		console.log(dataString);

		var jsondata;
		//make the AJAX request, dataType is set to json
		//meaning we are expecting JSON data in response from the server
		$.ajax({
			type : "GET",
			url : "ChangeMenu",
			data : dataString,
			dataType : "json",
			//if received a response from the server
			success : function(data, textStatus, jqXHR) {
			},

			//If there was no resonse from the server
			error : function(jqXHR, textStatus, errorThrown) {
				console.log("Something really bad happened " + textStatus);
				$("#ajaxResponse").html(jqXHR.responseText);
			},

			//this is called after the response or error functions are finsihed
			//so that we can take some action
			complete : function(jqXHR, textStatus) {
				//$("#table").empty();
				callAjax();
				//enable the button 
				//$('#myButton').attr("disabled", false);
			},
			beforeSend : function(jqXHR, settings) {
				$("#table").empty();
				$("#table").append("Loading...");
			}

		});

	} 
</script>
</head>



<body>

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
	<li><a href="${pageContext.request.contextPath}/login.jsp">Home</a></li>
	<li class="active"><a
		href="${pageContext.request.contextPath}/giverating.jsp">Rate</a></li>
	<li><a href="#">Services</a></li>
	<li><a href="#">Downloads</a></li>
	<li><a href="#">About</a></li>
	<li><a
		href="${pageContext.request.contextPath}/login.jsp?status=logout">Logout</a></li>
</ul>
</div>

<div class="row centered-form">
<div class="col-lg-5"></div>
<div class="col-lg-2">
<form>
<center>
<div class="form-group"><select class="combobox form-control"
	name="day" id="day" onchange="callAjax()">
	<option value="" selected="selected">Day</option>
	<option value="Monday">Monday</option>
	<option value="Tuesday">Tuesday</option>
	<option value="Wednesday">Wednesday</option>
	<option value="Thursday">Thursday</option>
	<option value="Friday">Friday</option>
	<option value="Saturday">Saturday</option>
	<option value="Sunday">Sunday</option>
</select></div>
</center>
</form>
</div>

<div class="row centered-form">
<div class="col-lg-5"></div>
<div class="col-lg-2">
<form>
<center>
Repeat
<div class="form-group"><select class="combobox form-control"
	name="repeat" id="repeat">
	<option value="1" selected="selected">1 Week</option>
	<option value="2">2 Weeks</option>
	<option value="3">3 Weeks</option>
</select></div>
</center>
</form>
</div>

</div>

<div class="row" style="margin-right: 0px; margin-left: 0px">
<div class=""></div>
<div class="panel panel-default col-lg-5"
	style="margin-right: 0px; margin-left: 3.8%">
<div class="panel-heading">
<h3 class="panel-title" id="hosteltitle">Today's menu</h3>
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
<h3 class="panel-title" id="settitle">Set this week's menu</h3>

</div>
<div class="panel-body">

<div class="row">
<div class="col-lg-5">
<h4>Breakfast</h4>

<select multiple id="bfast" style="width: 300px min-width :       300px">

</select></div>
</div>
<div class="row">
<div class="col-lg-5">
<h4>Lunch</h4>
<select multiple id="lunch" style="width: 300px min-width :       300px">

</select></div>
</div>

<div class="row">
<div class="col-lg-5">
<h4>Tiffin</h4>

<select multiple id="tiffin"
	style="width: 300px min-width :       300px">

</select></div>
</div>
<div class="row">
<div class="col-lg-5">
<h4>Dinner</h4>
<select multiple id="dinner"
	style="width: 300px min-width :       300px">

</select></div>
</div>
<br />
<div class="row">
<div class="col-lg-1">
<button id="button2" onclick="callAjax3()" class="btn">Submit</button>
</div>
</div>
</div>
</div>

</div>
</div>


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