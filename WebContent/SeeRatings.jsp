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
<link rel="stylesheet" id="rangecalendar-style-css"
	href="${pageContext.request.contextPath}/scripts/jQuery-Range-Calendar2/css/style.css"
	type="text/css" media="all">
<link rel="stylesheet" id="jquery-ui-style-css"
	href="${pageContext.request.contextPath}/scripts/jQuery-Range-Calendar2/css/jquery-ui-1.10.3.custom.min.css"
	type="text/css" media="all">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/css/multiselect.css">
<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/css/justified-nav.css"
	rel="stylesheet">

<link
	href="${pageContext.request.contextPath}/scripts/select2-3.5.1/select2.css"
	rel="stylesheet" />

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js"
	type="text/javascript"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
	type="text/javascript"></script>
<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : 'yy-mm-dd',
			changeMonth : true
		});
		$("#datepicker_start").datepicker({
			dateFormat : 'yy-mm-dd',
			changeMonth : true
		});
		$("#datepicker_end").datepicker({
			dateFormat : 'yy-mm-dd',
			changeMonth : true
		});
	});
</script>
<script>
	$(document).ready(function() {
		$("#srch").select2({
			placeholder : 'Enter Your Food Item'
		});
	});
</script>
<script
	src="${pageContext.request.contextPath}/scripts/select2-3.5.1/select2.js"></script>

<script
	src="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script
	src="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/js/ie10-viewport-bug-workaround.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/js/bootstrap-combobox.js"></script>

<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
<script
	src="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/js/ie-emulation-modes-warning.js"></script>

<style>
.centered-form {
	margin-top: 60px;
}

.centered-form .panel {
	background: rgba(255, 255, 255, 0.8);
	box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
}

.tabs-below>.nav-tabs, .tabs-right>.nav-tabs, .tabs-left>.nav-tabs {
	border-bottom: 0;
}

.tab-content>.tab-pane, .pill-content>.pill-pane {
	display: none;
}

.tab-content>.active, .pill-content>.active {
	display: block;
}

.tabs-below>.nav-tabs {
	border-top: 1px solid #ddd;
}

.tabs-below>.nav-tabs>li {
	margin-top: -1px;
	margin-bottom: 0;
}

.tabs-below>.nav-tabs>li>a {
	-webkit-border-radius: 0 0 4px 4px;
	-moz-border-radius: 0 0 4px 4px;
	border-radius: 0 0 4px 4px;
}

.tabs-below>.nav-tabs>li>a:hover, .tabs-below>.nav-tabs>li>a:focus {
	border-top-color: #ddd;
	border-bottom-color: transparent;
}

.tabs-below>.nav-tabs>.active>a, .tabs-below>.nav-tabs>.active>a:hover,
	.tabs-below>.nav-tabs>.active>a:focus {
	border-color: transparent #ddd #ddd #ddd;
}

.tabs-left>.nav-tabs>li, .tabs-right>.nav-tabs>li {
	float: none;
}

.tabs-left>.nav-tabs>li>a, .tabs-right>.nav-tabs>li>a {
	min-width: 74px;
	margin-right: 0;
	margin-bottom: 3px;
}

.tabs-left>.nav-tabs {
	float: left;
	margin-right: 19px;
	border-right: 1px solid #ddd;
}

.tabs-left>.nav-tabs>li>a {
	margin-right: -1px;
	-webkit-border-radius: 4px 0 0 4px;
	-moz-border-radius: 4px 0 0 4px;
	border-radius: 4px 0 0 4px;
}

.tabs-left>.nav-tabs>li>a:hover, .tabs-left>.nav-tabs>li>a:focus {
	border-color: #eeeeee #dddddd #eeeeee #eeeeee;
}

.tabs-left>.nav-tabs .active>a, .tabs-left>.nav-tabs .active>a:hover,
	.tabs-left>.nav-tabs .active>a:focus {
	border-color: #ddd transparent #ddd #ddd;
	*border-right-color: #ffffff;
}

.tabs-right>.nav-tabs {
	float: right;
	margin-left: 19px;
	border-left: 1px solid #ddd;
}

.tabs-right>.nav-tabs>li>a {
	margin-left: -1px;
	-webkit-border-radius: 0 4px 4px 0;
	-moz-border-radius: 0 4px 4px 0;
	border-radius: 0 4px 4px 0;
}

.tabs-right>.nav-tabs>li>a:hover, .tabs-right>.nav-tabs>li>a:focus {
	border-color: #eeeeee #eeeeee #eeeeee #dddddd;
}

.tabs-right>.nav-tabs .active>a, .tabs-right>.nav-tabs .active>a:hover,
	.tabs-right>.nav-tabs .active>a:focus {
	border-color: #ddd #ddd #ddd transparent;
	*border-left-color: #ffffff;
}
</style>


<script>
	var jsondata;
	var hostelnum;
	var dt;
	var flag = false;
	console.log("sdfsd");
	$(function() {
		$('#myForm').on('submit', function(e) {

			e.preventDefault();
		});
	});
	function updateValue() {

		callAjax2();

	}
	window.addEvent = function(e, ev, f, c) {
		if (e.addEventListener) {
			e.addEventListener(ev, f, c);
		} else if (e.attachEvent) {
			var r = e.attachEvent('on' + ev, f);
			return r;
		} else {
			e['on' + ev] = f;
		}
	};

	window.addEvent(window, "load", updateValue, false);

	function callAjax() {
		dataString = $("#myAjaxRequestForm").serialize();

		//get the form data using another method 
		if (flag == false) {
			hostelnum = $("#hostelno").val();
			dt = $("#datepicker").val();
		}
		dataString = "hostelnum=" + hostelnum + "&date=" + dt;
		flag = false;
		console.log("shiyo");

		// jsondata;
		//make the AJAX request, dataType is set to json
		//meaning we are expecting JSON data in response from the server
		$.ajax({
					type : "POST",
					url : "Viewrating",
					data : dataString,
					dataType : "json",

					//if received a response from the server
					success : function(data, textStatus, jqXHR) {
						//our country code was correct so we have some information to display
						$("#message").empty();
						$("#table").empty();
						console.log(data);
						var txt = "";
						txt += "<tr><th></th><th>Average Ratings</th><tr>";
						var i = 0;
						jsondata = data;
						var n;
						var Breakfast = [];
						var Lunch = [];
						var Tiffin = [];
						var Dinner = [];

						var sumbf = 0, sumlunch = 0, sumtiff = 0, sumdinner = 0;
						var cntbf = 0, cntlunch = 0, cnttiff = 0, cntdinner = 0;
						for ( var key in data) {
							if (data.hasOwnProperty(key)) {
								if (key == "BREAKFAST") {
									Breakfast.push(data[key]);
									if(data[data[key]] != "Not Available"){
									cntbf++;
									sumbf += parseInt(data[data[key]]);
									}
									console.log(data[key]);
									console.log(data[data[key]]);
								} else if (key == "LUNCH") {
									if(data[data[key]] != "Not Available"){
									Lunch.push(data[key]);
									cntlunch++;
									sumlunch += parseInt(data[data[key]]);
									}
								} else if (key == "TIFFIN") {
									if(data[data[key]] != "Not Available"){
									Tiffin.push(data[key]);
									cnttiff++;
									sumtiff += parseInt(data[data[key]]);
									}
								} else if (key == "DINNER") {
									if(data[data[key]] != "Not Available"){
									Dinner.push(data[key]);
									cntdinner++;
									sumdinner += parseInt(data[data[key]]);
									}
									
								}
							}
						}

						var avg = parseFloat(sumbf) / parseFloat(cntbf);
						if(!isNaN(avg)){
						txt += "<tr><td><b>BreakFast</b></td><td><b>"
								+ avg.toString() + "</b><td></tr>";
						}
						else{
							txt += "<tr><td><b>BreakFast</b></td><td><b>"
								+"Not Available" + "</b><td></tr>";
						}
						for (var i = 0; i < Breakfast.length; i++) {
							if(data[Lunch[i]] != "Not Available"){							
							txt += "<tr><td>" + Breakfast[i] + "</td><td>"
									+ data[Breakfast[i]] + "</td></tr>";
							}
							else{
								txt += "<tr><td>" + Breakfast[i] + "</td><td>"
								+ "Not Available" + "</td></tr>";
							}
						}
						avg = parseFloat(sumlunch) / parseFloat(cntlunch);
						if(!isNaN(avg)){
						txt += "<tr><td><b>Lunch</b></td><td><b>"
								+ avg.toString() + "</b><td></tr>";
						}
						else{
							txt += "<tr><td><b>Lunch</b></td><td><b>"
								+ "Not Available" + "</b><td></tr>";
						}
						for (var i = 0; i < Lunch.length; i++) {
							if(data[Lunch[i]] != "Not Available"){
							txt += "<tr><td>" + Lunch[i] + "</td><td>"
									+ data[Lunch[i]] + "</td></tr>";
							}
							else {
								txt += "<tr><td>" + Lunch[i] + "</td><td>"
								+ "Not Available" + "</td></tr>";
							}
						}
						avg = parseFloat(sumtiff) /parseFloat(cnttiff);
						if(!isNaN(avg)){
						txt += "<tr><td><b>Tiffin</b></td><td><b>"
								+ avg.toString() + "</b><td></tr>";
						}
						else{
							txt += "<tr><td><b>Tiffin</b></td><td><b>"
								+ "Not Available" + "</b><td></tr>";
						}
					
						for (var i = 0; i < Tiffin.length; i++) {
							if(data[Lunch[i]] != "Not Available"){
							txt += "<tr><td>" + Tiffin[i] + "</td><td>"
									+ data[Tiffin[i]] + "</td></tr>";
							}
							else{
								txt += "<tr><td>" + Tiffin[i] + "</td><td>"
								+ "Not Available" + "</td></tr>";
							}
						}
						avg = parseFloat(sumdinner)/ parseFloat(cntdinner);
						if(!isNaN(avg)){
						txt += "<tr><td><b>Diner</b></td><td><b>"
								+ avg.toString() + "</b><td></tr>";
						}
						else{
							txt += "<tr><td><b>Diner</b></td><td><b>"
								+ "Not Available "+"</b><td></tr>";
						}
						for (var i = 0; i < Dinner.length; i++) {
							if(data[Lunch[i]] != "Not Available"){
							txt += "<tr><td>" + Dinner[i] + "</td><td>"
									+ data[Dinner[i]] + "</td></tr>";
							}
							else{
								txt += "<tr><td>" + Dinner[i] + "</td><td>"
								+ "Not Available" + "</td></tr>";
							}
						}

						if (txt != "") {
							//	txt += "<input type=submit onclick='sendratings()'>"
							//  txt += "</form>"
							$("#table").append(txt).removeClass("hidden");
							//$('#butt').removeClass("hidden");
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
	function callAjax3(){
		
		dataString = $("#myAjaxRequestForm").serialize();
			var itemname = $("#srch").val();
			var date_start = $("#datepicker_start").val();
			var date_end = $("#datepicker_end").val();
			var hostelnum = $("#hnum").val();
		
		dataString = "hostelnum=" + hostelnum + "&date_start=" + date_start+ "&date_end="+date_end+"&itemname="+itemname;
		console.log(dataString);
		var t1 = date_start.split("-");
		
		var ds = new Date(t1[0], t1[1]-1, t1[2]);
		console.log(ds);
		$.ajax({
			type : "POST",
			url : "Viewrating2",
			data : dataString,
			dataType : "json",
			//if received a response from the server
			success : function(data, textStatus, jqXHR) {
				
				var txt = "";
				$("#table2").empty();
				txt = "<tr><th>Item Name</th><th>Average Rating</th><th>Number Of Votes</th></tr>";

				txt += "<tr><td>"+itemname+"</td><td>"+data[itemname]+"</td><td>"+data["@#"]+"</td></tr>";
				if (txt != "") {
					
					$("#table2").append(txt).removeClass("hidden");
					
				} else {

					$("#ans").append("No Data Available");
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
		
		function addDays(date, days) {
		    var result = new Date(date);
		    result.setDate(date.getDate() + days);
		    return result;
		}
		
		 $.ajax({
			type : "POST",
			url : "Viewrating3",
			data : dataString,
			dataType : "json",
			//if received a response from the server
			success : function(data, textStatus, jqXHR) {
				var lineData=[];
				var daydiff = data["daydiff"];
				for( i=1; i<=10; i++){
					if (data.hasOwnProperty(i.toString())){

					var data123={time: addDays(ds,daydiff*(i-1)), x: data[i]};
					lineData.push(data123);
					console.log(data123);
					}
				}
				InitChart(lineData);

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
		 
		 $.ajax({
				type : "POST",
				url : "GetComments",
				data : dataString,
				dataType : "json",
				//if received a response from the server
				success : function(data, textStatus, jqXHR) {
					var txt = "";
					var txt1 ="";
					$("#comments").empty();
					txt = "<tr><th>User Name</th><th>Comments</th></tr>";
					for(var key in data){
					txt1 += "<tr><td style=\"min-width:130px;\">"+key+"</td><td style=\"min-width:300px;\">"+data[key]+"</td></tr>";
					}
					if (txt1 != "") {
						txt = txt + txt1;
						console.log(txt);
						$("#com_hide").removeClass("hidden");
						$("#comments").append(txt).removeClass("hidden");
						
						
					} else {

						$("#comments").append("No Data Available");
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
	
	
	function InitChart(data) {
	 console.log("paani");
	console.log(data);
	$('#graph').empty();
	 var color = d3.scale.category10();
     // map one colour each to x, y and z
     // keys grabs the key value or heading of each key value pair in the json
     // but not time
     color.domain(d3.keys(data[0]).filter(function (key) {
       return key !== "time";
     }));
console.log(color);
     // create a nested series for passing to the line generator
     // it's best understood by console logging the data
   var series = color.domain().map(function (name) {
	   console.log("sfit " +name);
       return {
    	   
         name: name,
         values: data.map(function (d) {
           return {
             time: d.time,
             score: +d[name]
           };
         })
       };
     }); 
console.log(series);
     // Set the dimensions of the canvas / graph
     var margin = {
         top: 30,
         right: 20,
         bottom: 60,
         left: 75
       },
       width = 650 - margin.left - margin.right,
       height = 250 - margin.top - margin.bottom;

     // Set the ranges
     //var x = d3.time.scale().range([0, width]).domain([0,10]);
     var x = d3.time.scale().range([0, width]);
     var y = d3.scale.linear().range([height, 0]);

     // Define the axes
     var xAxis = d3.svg.axis().scale(x)
       .orient("bottom").ticks(10);

     var yAxis = d3.svg.axis().scale(y)
       .orient("left").ticks(5);

     // Define the line
     // Note you plot the time / score pair from each key you created ealier
     var valueline = d3.svg.line()
       .x(function (d) {
         return x(d.time);
       })
       .y(function (d) {
         return y(d.score);
       });
console.log("valueline");
console.log(valueline);
     // Adds the svg canvas
     var svg = d3.select("#graph")
       .append("svg")
       .attr("width", width + margin.left + margin.right)
       .attr("height", height + margin.top + margin.bottom)
       .append("g")
       .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

     // Scale the range of the data
     x.domain(d3.extent(data, function (d) {
       return d.time;
     }));

     // note the nested nature of this you need to dig an additional level
     y.domain(
       [0,
       5]
      );
     svg.append("text")      // text label for the x axis
       .attr("x", width / 2)
       .attr("y", height + margin.bottom)
       .style("text-anchor", "middle")
       .text("Time");

     svg.append("text")      // text label for the x axis

       .style("text-anchor", "middle")
       .text("Average Ratings").attr("transform",function (d) {
         return "rotate(-90)"
       }).attr("x", -height / 2)
       .attr("y", -30);
     ;
     // create a variable called series and bind the date
     // for each series append a g element and class it as series for css styling
     var series = svg.selectAll(".series")
       .data(series)
       .enter().append("g")
       .attr("class", "series");

     // create the path for each series in the variable series i.e. x, y and z
     // pass each object called x, y nad z to the lne generator
     series.append("path")
     .style("fill", "none") 
       .attr("class", "line")
       .attr("d", function (d) {
          console.log(d); // to see how d3 iterates through series
         return valueline(d.values);
       })
       .style("stroke", "blue")

     // Add the X Axis
     svg.append("g") // Add the X Axis
       .attr("class", "x axis")
       .attr("transform", "translate(0," + height + ")")
       .call(xAxis)
       .selectAll("text")
       .attr("transform", function(d) {
         return "rotate(-30) translate(0,15) "})
         

   // Add the Y Axis
     svg.append("g") // Add the Y Axis
       .attr("class", "y axis")
       .call(yAxis);
	
	
	}

	function callAjax2() {
		//$("srch").select2("val",["dsf","SDfsdf"]);
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
				var bfastArray = data.bfast;//alert("eegg"+bfastArray);
				var lunchArray = data.lunch;//alert("eeff" + data.dinner);
				var tiffinArray = data.tiffin;
				var dinnerArray = data.dinner;
				console.log(lunchArray.length);
			
				var tp = [];
				//$("#srch").select2("val", tp);
				for (i = 0; i < bfastArray.length; i++) {
					console.log("Qsdfsdfsdfsfdsfsdfad");
					var o = new Option(bfastArray[i], bfastArray[i]);
					//o.setAttribute("selected","selected");
					$(o).html(bfastArray[i]);
					console.log(o);
					$("#srch").append(o);

				}
				for (i = 0; i < lunchArray.length; i++) {
					console.log("Qsdfsdfsdfsfdsfsdfad");
					var o = new Option(lunchArray[i], lunchArray[i]);
					//o.setAttribute("selected","selected");
					$(o).html(lunchArray[i]);
					console.log(o);
					$("#srch").append(o);

				}
				for (i = 0; i < tiffinArray.length; i++) {
					console.log("Qsdfsdfsdfsfdsfsdfad");
					var o = new Option(tiffinArray[i], tiffinArray[i]);
					//o.setAttribute("selected","selected");
					$(o).html(tiffinArray[i]);
					console.log(o);
					$("#srch").append(o);

				}
				for (i = 0; i < dinnerArray.length; i++) {
					console.log("Qsdfsdfsdfsfdsfsdfad");
					var o = new Option(dinnerArray[i], dinnerArray[i]);
					//o.setAttribute("selected","selected");
					$(o).html(dinnerArray[i]);
					console.log(o);
					$("#srch").append(o);

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
</script>

</head>



<body>
<div class="container">
	<form id='myForm'>
		<div class="masthead">

			<div class="row">
				<!-- <td class='col-md-10	'> -->
				<h3 class="text-muted col-md-10">Hostel Menu Management</h3>
				<!-- </td> -->
				<!-- <td> -->
				<h4 class="text col-md-2" align="right" vertical-align="center"
					style="margin-top: 25px;"><%=session.getAttribute("consumername")%>
				</h4>
				<!-- </td> -->
			</div>
			<!-- </tr>
			</table> -->
			<ul class="nav nav-justified">
				<li><a href="${pageContext.request.contextPath}/home.jsp">Home</a></li>
				<li><a href="${pageContext.request.contextPath}/giverating.jsp">Rate</a></li>
				<li class="active"><a href="${pageContext.request.contextPath}/SeeRatings.jsp">View
						Ratings</a></li>
				<%
					String category = (String) session.getAttribute("category");
					if (category.equals("ADMINISTRATOR")) {
						String context = request.getContextPath();
						out.println("<li><a href=\"" + context
								+ "/manager_home.jsp\">Set Menu</a></li>");;
					}
				%>

				<li><a href="${pageContext.request.contextPath}/WeeklyMenu.jsp">Weekly
						Menu</a></li>
				
				<li><a
					href="${pageContext.request.contextPath}/login.jsp?status=logout">Logout</a></li>
			</ul>
		</div>
		<div class="panel panel-default">

			<div class="panel-heading">
				<h3 class="panel-title">View All Rating</h3>
			</div>
			<div class="panel-body"></div>

			<div class="row"></div>

			<div class="row">

				<!--  <div class="col-md-6"><h3>Tabs -left</h3>  -->

				<!-- tabs left -->
				<div class="tabbable tabs-left" style="position:relative;  left :20px;">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#a" data-toggle="tab">Hostel</a></li>
						<li><a href="#b" data-toggle="tab">Particular Food Item</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="a">
							<div class="row">
								<div class="col-xs-2 col-sm-2 col-md-2">
									<div class="form-group">
										<select multiple class="combobox form-control"
											onchange="callAjax()" id="hostelno">
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

										</select>
									</div>
								</div>

								<div class="col-xs-2 col-sm-2 col-md-2">
									<input type="text" name="dt" id="datepicker"
										onchange="callAjax()" placeholder="Select Date">
								</div>
							</div>
							<div class="col-xs-3 col-sm-12 col-md-12 ">
								<table id="table"
									style="position: relative; left: 150px; top: -40px;"
									class="hidden table">
									<tr>
										<th></th>
										<th>Average Rating</th>

									</tr>
								</table>
							</div>




						</div>
						<div class="tab-pane" id="b">
							<div class="row">
								<div class="col-xs-2 col-sm-2 col-md-2">
									<select id="srch" style="width: 300px min-width:       300px" onchange="callAjax3()">
									<option value="" selected="selected">Food Item</option>
									</select>
								</div>
								<div class="col-xs-1 col-sm-1 col-md-1"></div>
								<div class="col-xs-2 col-sm-2 col-md-2">
									<input type="text" name="dt" id="datepicker_start" placeholder="Start Date" onchange="callAjax3()">

								</div>
								<div class="col-xs-2 col-sm-2 col-md-2">
									<input type="text" name="dt" id="datepicker_end" placeholder="End Date" onchange="callAjax3()">

								</div>
								<div class="col-xs-2 col-sm-2 col-md-2">
									<select multiple class="combobox form-control"
										onchange="callAjax3()" id="hnum">
										<option value="" selected="selected">Hostel</option>
										<option value="ALL">ALL</option>
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

									</select>
								</div>
							</div>
							<div class="row">
							<div id="ans"  style="position: relative; left: 300px; top: -40px;">
							<table border =1 id="table2"
									style="position: relative; left: 150px; top: 40px;"
									class="hidden">
									<tr>
										<th>Item Name</th>
										<th>Average Rating</th>
										<th>Number Of Votes</th>

									</tr>
								</table>
							</div>
							</div>
							<div class = "row">
							<svg id="graph" style="position: relative; left: 300px;" width="700" height="300" ></svg>
							</div>
							<div class = "row">
							<div id = "com_hide"  class ="hidden"style="position: relative; left: 300px;">
							<h4>Comments</h4>
							<table cellpadding=20px id="comments" border=1; class = "hidden" >
							
							</table>
							</div>
							</div>
						</div>

					</div>
				</div>
				<!-- /tabs -->

			</div>



		</div>
		</div>

	</form>
</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.combobox').combobox();
		});
	</script>


</body>
</html>