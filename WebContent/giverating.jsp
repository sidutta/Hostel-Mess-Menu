<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/css/bootstrap-theme.min.css">

<!-- Bootstrap ComboBox for dropdown menu -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/css/bootstrap-combobox.css">

<style>
body {
	background-color: #525252;
}

.centered-form {
	margin-top: 60px;
}

.centered-form .panel {
	background: rgba(255, 255, 255, 0.8);
	box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
}
</style>
<title>Give Ratings</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js"
	type="text/javascript"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
	type="text/javascript"></script>
<script>

function callAjax(){
dataString = $("#myAjaxRequestForm").serialize();

//get the form data using another method 
var day = $("#day").val(); 
var foodtype = $("#foodtype").val();
dataString = "day=" + day+"&foodtype="+foodtype;
console.log("yo");

var jsondata;
//make the AJAX request, dataType is set to json
//meaning we are expecting JSON data in response from the server
$.ajax({
    type: "POST",
    url: "Putrating",
    data: dataString,
    dataType: "json",
    
    //if received a response from the server
    success: function( data, textStatus, jqXHR) {
        //our country code was correct so we have some information to display
        	
    	    var txt = "";
            for(var key in data){
                  if(data.hasOwnProperty(key))
                    txt += "<tr><td>"+data[key]+"</td><td>"+key+"</td></tr>"; 
            }
            if(txt != ""){
                $("#table").append(txt).removeClass("hidden");
                console.log(txt);
            }
        
    },
    
    //If there was no resonse from the server
    error: function(jqXHR, textStatus, errorThrown){
         console.log("Something really bad happened " + textStatus);
          $("#ajaxResponse").html(jqXHR.responseText);
    },
    
    //capture the request before it was sent to server
    beforeSend: function(jqXHR, settings){
        //adding some Dummy data to the request
        settings.data += "&dummyData=whatever";
        //disable the button until we get the response
       // $('#myButton').attr("disabled", true);
    },
    
    //this is called after the response or error functions are finsihed
    //so that we can take some action
    complete: function(jqXHR, textStatus){
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
			<div class="row centered-form ">
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
						
						<div class = "row">
							<table id="table" class="hidden">
								<tr>
									<th>ItemId</th>
									<th>Food Name</th>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>