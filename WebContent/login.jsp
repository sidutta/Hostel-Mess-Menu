<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mess Data Analytics</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<style>
body {
	background: #eee !important;
}

.wrapper {
	margin-top: 80px;
	margin-bottom: 80px;
}

.form-signin {
	max-width: 380px;
	padding: 15px 35px 45px;
	margin: 0 auto;
	background-color: #fff;
	border: 1px solid rgba(0, 0, 0, 0.1);
	.
	form-signin-heading
	,
	.checkbox
	{
	margin-bottom
	:
	30px;
}

.checkbox {
	font-weight: normal;
}

.form-control {
	position: relative;
	font-size: 16px;
	height: auto;
	padding: 10px;
	@
	include
	box-sizing(border-box);
	&:
	focus
	{
	z-index
	:
	2;
}

}
input[type="text"] {
	margin-bottom: -1px;
	border-bottom-left-radius: 0;
	border-bottom-right-radius: 0;
}

input[type="password"] {
	margin-bottom: 20px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}
}
</style>

</head>
<body>
	<center>
		<h2>Mess Data Analytics</h2>
	</center>
	<p>
	<center>
		<h2>Welcome!</h2>
	</center>
	</p>

	<center>
		<div class="wrapper">
			<form class="form-signin" action="Login" id="login">
				<h2 class="form-signin-heading">Please login</h2>
				<input type="text" class="form-control" name="username"
					id="username" placeholder="Username" required="" autofocus="" /> <input
					type="password" class="form-control" name="password" id="password"
					placeholder="Password" required="" /> <label class="checkbox">

					<%
						String invalidLoginPrompt = "";
						String status = request.getParameter("status");
						if ("wrong".equals(status))
							invalidLoginPrompt = "Invalid username/ password <br>";
						else {
							Cookie cookie = null;
							Cookie[] cookies = null;
							// Get an array of Cookies associated with this domain
							cookies = request.getCookies();
							if ("logout".equals(status)) {

								if (cookies != null) {
									for (int i = 0; i < cookies.length; i++) {
										cookie = cookies[i];
										if ((cookie.getName()).toString().equals("username")) {
											cookie.setMaxAge(0);
											response.addCookie(cookie);
										}
									}
								}
							} else {
								if (cookies != null) {
									for (int i = 0; i < cookies.length; i++) {
										cookie = cookies[i];
										if ((cookie.getName()).toString().equals("username")) {
											response.addCookie(cookie);
											/* request.setAttribute("logintype","cookie");
											request.setAttribute("loggedinuser", (cookie.getValue()).toString()); */
											response.sendRedirect("/hostel-menu-mgmt/Login");
										}
									}
								}
							}
						}
					%> <%=invalidLoginPrompt%> <input type="checkbox" value="remember"
					id="remember" name="remember"> Remember me



				</label>
				<button class="btn btn-lg btn-primary btn-block" type="submit"
					id="submit">Login</button>
				<br> <a href="signup.jsp"> Register! </a>
			</form>

		</div>
	</center>


</body>
</html>