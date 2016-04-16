<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Login Page</title>
	<%
	String message=(String)request.getAttribute("message");
	
	%>
	<!-- Bootstrap -->
	<link href="css/bootstrap.css" rel="stylesheet" media="screen">
	<link href="css/custom.css" rel="stylesheet" media="screen">

	<!-- Animo css-->
	<link href="css/animate+animo.css" rel="stylesheet" media="screen">
	
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	  <script src="assets/js/html5shiv.js"></script>
	  <script src="assets/js/respond.min.js"></script>
	<![endif]-->
	
	
	<!-- Load jQuery -->
	<script src="js/jquery.v2.0.3.js"></script>
<script type="text/javascript">
function openMsg()
{
	
	 window.setTimeout(function bye(){document.getElementById("errorbox").style.visibility='hidden';}, 2000);
}
</script>

  </head>
  <body>
	<!-- 100% Width & Height container  -->
	
	
	
	<div class="login-fullwidith">
	<%
			System.out.println(message+" is a error message");
				if(message!=null){
				%>
				<div id="errorbox" class="login-c3" style="margin-top: 50px ! important; width: 354px; text-align: center;" id="alert_div">
				<div  style="margin-top: 15px; color: white;">
				<%=message %>	</div></div>
				 <script type="text/javascript">
		
		 
		// alert('hiii');
		 openMsg();
		 
		 </script>
				
				
				<%} %>
		<form name="f" action="welcome" method="POST">
		<%-- <form:form action="j_spring_security_check" commandName="loginUser" method="POST"> --%>
		<!-- Login Wrap  -->
		<div class="login-wrap">
		
		
            <div class="logo_new">
            <!-- style="height: 66px;width:133px;"  -->
             <img  src="images/logo_avi.png" />
             <!--    <img style="width: 178px;" src="images/Digital Vault2.png" /> -->
            </div>
			<div class="login-c1">
				<div class="cpadding50">
					<div class="username"></div>
					<input name="j_username" id="j_username" type="text" class="form-control logpadding username" placeholder="Username" required />
					<%--<form:input path="userid" name="j_username" id="j_username" cssClass="form-control logpadding username" placeholder="Username"/> --%>
					<br/>
					<div class="password"></div>
					<input name="j_password" id="j_password" type="password" class="form-control logpadding password" placeholder="Password" required  >
					<%--<form:password path="password" name="j_password" id="j_password" cssClass="form-control logpadding password" placeholder="Password"/> --%>
				</div>
			
			</div>
			
			<div class="login-c2">
				<div class="logmargfix">
					<div class="chpadding50">
							<div class="alignbottom">
								<input type="submit" value="Sign In" class="btn-search4" name="submit"/>
								<!-- <button class="btn-search4"  type="submit" onclick="errorMessage()">Submit</button>	 -->					
							</div>
							<!--  <div class="alignbottom2">
							  <div class="checkbox">
								<label>
								  <input type="checkbox">Remember
								</label>
							  </div>
							</div> 
				 -->
					</div>
					
				</div>
							
			</div>
			
			<div class="login-c3">
				
				<div class="right"><a class="whitelink" href="javascript:void(0)"><!-- Welcome to Digital Vault!! --></a></div> 
			</div>	
		</div>
		<!-- End of Login Wrap  -->
	</form>
	<%-- </form:form> --%>
	</div>	
	<!-- End of Container  -->

	<!-- Javascript  -->
	<!--<script src="js/initialize-loginpage.js"></script>-->
	<script src="js/jquery.easing.js"></script>
	<!-- Load Animo -->
	<script src="js/animo.js"></script>
	<script>
	function errorMessage(){
		$('.login-wrap').animo( { animation: 'tada' } );
	}
	</script>
	
  </body>
</html>