<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
</head>
<body>
	<div class="container">
		<div class="row centered-form">
			<div
				class="col-xs-12 col-sm-9 col-md-7 col-sm-offset-2 col-md-offset-3 col-sm-offset-3">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							Sign up for Mess Data Analytics <small>It's free!</small>
						</h3>
					</div>
					<div class="panel-body">
						<form role="form" action="Registration" id="registration-form">

							<div class="row">
								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">
										<input type="text" name="first_name" id="first_name"
											class="form-control input-sm" placeholder="Name">
									</div>
								</div>
								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">
										<input type="text" name="username" id="username"
											class="form-control input-sm" placeholder="username">
									</div>
								</div>
							</div>



							<div class="row">
								<div class="col-xs-6 col-sm-5 col-md-6">
									<div class="form-group">
										<input type="text" name="email" id="email"
											class="form-control input-sm" placeholder="Email Address">
									</div>
								</div>

								<!-- <div class="col-xs-2 col-sm-2 col-md-2">
									<div class="form-group btn-group">
										<input type="text" name="hostelno" id="hostelno"
											class="form-control input-sm" placeholder="H1">
										<li class="dropdown" id="accountmenu">
										<button class="btn btn-default dropdown-toggle" type="button"
											id="dropdownMenuHostel" data-toggle="dropdown">
											<span class="selection">Hostel</span> <span class="caret"></span>
										</button>

										<ul class="dropdown-menu">
											<li><a href="#">H-1</a></li>
											<li><a href="#">H-2</a></li>
											<li><a href="#">H-3</a></li>
											<li><a href="#">H-4</a></li>
											<li><a href="#">H-5</a></li>
											<li><a href="#">H-6</a></li>
											<li><a href="#">H-7</a></li>
											<li><a href="#">H-8</a></li>
											<li><a href="#">H-9</a></li>
											<li><a href="#">H-10</a></li>
											<li><a href="#">H-11</a></li>
											<li><a href="#">H-12</a></li>
											<li><a href="#">H-13</a></li>
											<li><a href="#">H-14</a></li>
											<li><a href="#">H-15</a></li>
										</ul>
										</li>
									</div>
								</div> -->

								<div class="col-xs-3 col-sm-3 col-md-3">
									<div class="form-group">
										<select class="combobox form-control" name="hostelno">
											<option value="" selected="selected">Hostel</option>
											<option value="H1">H1</option>
											<option value="H2">H2</option>
											<option value="H3">H3</option>
											<option value="H4">H4</option>
											<option value="H5">H5</option>
											<option value="H6">H6</option>
											<option value="H7">H7</option>
											<option value="H8">H8</option>
											<option value="H9">H9</option>
											<option value="H10">H-10</option>
											<option value="H11">H-11</option>
											<option value="H12">H-12</option>
											<option value="H13">H-13</option>
											<option value="H14">H-14</option>
											<option value="H15">H-15</option>

										</select>
									</div>
								</div>



								<!-- <div class="col-xs-4 col-sm-4 col-md-4">
									<div class="form-group btn-group">
										<button class="form-group btn btn-default dropdown-toggle"
											type="button" id="dropdownMenuCategory"
											data-toggle="dropdown">
											<span class="selection" name="dropdownMenuCategory">Category</span>
											<span class="caret"></span>
										</button>

										<ul class="dropdown-menu">
											<li><a href="#">Consumer</a></li>
											<li><a href="#">Administrator</a></li>

										</ul>
									</div>
								</div> -->


								<div class="col-xs-3 col-sm-4 col-md-3 	">
									<div class="form-group">
										<select class="combobox form-control" name="category">
											<option value="" selected="selected">Category</option>
											<option value="Consumer">Consumer</option>
											<option value="Administrator">Admin</option>

										</select>
									</div>
								</div>

							</div>

							<div class="row">
								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">
										<input type="password" name="password" id="password"
											class="form-control input-sm" placeholder="Password">
									</div>
								</div>
								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">
										<input type="password" name="password_again"
											id="password_again" class="form-control input-sm"
											placeholder="Confirm Password">
									</div>
								</div>
							</div>

							<input type="submit" value="Register"
								class="btn btn-info btn-block" id="submit"> <br>
							<center>
								<%
									String invalidLoginPrompt = "";
									String status = request.getParameter("status");
									if ("usernametaken".equals(status))
										invalidLoginPrompt = "ERROR: username taken <br>";
									if ("emailregistered".equals(status))
										invalidLoginPrompt = "ERROR: email id has been used before <br>";
								%>
								<%=invalidLoginPrompt%>
								<br> <a href="login.jsp">Already Registered?</a>
							</center>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/jquery.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/js/bootstrap-combobox.js"></script>
	<script
		src="${pageContext.request.contextPath}/scripts/jquery.validate.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/scripts/additional-methods.min.js"></script>

	<%-- <script type="text/javascript"
		src="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/bootstrap-dropdown.js"></script> --%>
	<script type="text/javascript">

		$(document).ready(function() {
			$('.combobox').combobox();
		});
	    jQuery.validator.setDefaults({
			  debug: false,
			  success: "valid"
			});
		jQuery(document).ready(function() { 
			$("#registration-form").validate({
			  rules: {
				  email: {
				      required: true,
				      email: true
				    },
			    password: "required",
			    password_again: {
			      equalTo: "#password"
			    },
			    first_name: "required",
			    username: "required"
			  },
			  submitHandler: function (form) {
		            $("#submit").prop("disabled", true); //disable to prevent multiple submits
		            form.submit(); 
		            }
			
			})
			
		}); 
	</script>
	<script
		src="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/js/bootstrap.min.js"></script>
</body>
</html>


