<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Item</title>

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

<link
	href="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/css/justified-nav.css"
	rel="stylesheet">

<link
	href="${pageContext.request.contextPath}/scripts/select2-3.5.1/select2.css"
	rel="stylesheet" />

<style>
body {
	background-color: #525252;
}

.centered-form {
	margin-top: 80px;
	margin-bottom: 80px;
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
<h3 class="panel-title">Add New Food Item!</h3>
</div>
<div class="panel-body">
<form role="form" action="AddItems" id="item-form">


<div class="input_fields_wrap">


<div class="row">

<div class="col-xs-4 col-sm-4 col-md-4">
<div class="form-group"><input type="text" name="1" id="1"
	class="form-control input-sm" placeholder="Item Name"></div>
</div>



<div class="col-xs-4 col-sm-4 col-md-4"><select multiple
	id="itype1" name="1" style="width: 300px min-width :     300px">
	<option value="BREAKFAST">BREAKFAST</option>
	<option value="LUNCH">LUNCH</option>
	<option value="TIFFIN">TIFFIN</option>
	<option value="DINNER">DINNER</option>
</select></div>
</div>


<!--<div><input type="text" name="mytext[]"></div>--></div>
<button class="add_field_button">Add More Items</button>
<br>
<br>
<input type="submit" value="Add" class="btn btn-info btn-block"
	id="submit"> <br>
<center><br>
<a href="manager_home.jsp">Close</a></center>

</form>
</div>
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



	    jQuery.validator.setDefaults({
			  debug: false,
			  success: "valid"
			});
		jQuery(document).ready(function() { 
			$("#item-form").validate({
			  submitHandler: function (form) {
		            $("#submit").prop("disabled", true); //disable to prevent multiple submits
		            form.submit(); 
		            }
			
			})
			
		});
		
		
		$(document).ready(function() {
			$("#itype1").select2({
	            placeholder: "Item Type"
	        	});
			$('.combobox').combobox();
		    var max_fields      = 20; //maximum input boxes allowed
		    var wrapper         = $(".input_fields_wrap"); //Fields wrapper
		    var add_button      = $(".add_field_button"); //Add button ID
			var uid=1;//Unique id for every field combination
		    var x = 1; //initlal text box count
		    $(add_button).click(function(e){ //on add input button click
		    	console.log($("#1").val());
		    	console.log($("itype1").val());
		        e.preventDefault();
		        if(x < max_fields){ //max input box allowed
		            x++; //text box increment
		            uid++;
		            $(wrapper).append('<div class="row"> \
		            		<div class="col-xs-4 col-sm-4 col-md-4"> \
		            		<div class="form-group"><input type="text" name='+uid+' id='+uid+' \
		            			class="form-control input-sm" placeholder="Item Name"></div> \
		            		</div> \
		            		<div class="col-xs-6 col-sm-6 col-md-6"><select multiple \
		            			id="itype'+uid+'"name='+uid+' style="width: 300px min-width : 300px"> \
		            			<option value="BREAKFAST">BREAKFAST</option> \
		            			<option value="LUNCH">LUNCH</option> \
		            			<option value="TIFFIN">TIFFIN</option> \
		            			<option value="DINNER">DINNER</option> \
		            		</select></div> \
		            		<div class="col-xs-2 col-sm-2 col-md-2"><a href="#" class="remove_field">Remove</a></div></div>'); //add input box
var itype_temp="#itype"+uid;
$(itype_temp).select2({
    placeholder: "Item Type"
	});
		        }
		    });
		    
		    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
		        e.preventDefault(); $(this).parent('div').parent('div').remove(); x--;
		    })
		});
		
	</script>
<script
	src="${pageContext.request.contextPath}/scripts/bootstrap-3.2.0-dist/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/scripts/select2-3.5.1/select2.js"></script>

</body>
</html>


