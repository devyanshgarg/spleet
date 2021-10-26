<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>SplitWise Pro Expenses</h1><br><br>
	<h2>-Add Expense</h2><br>
	<%
	String connectionURL = "jdbc:mysql://localhost:3310/student?autoReconnect=true&useSSL=false";
	Connection con=null;
	Statement st =null;
	ResultSet rs =null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(connectionURL,"root", "mysql");
		st = con.createStatement();
		rs = st.executeQuery("select username from splitwisepro");
// 		rs.next();
// 		String user1 = rs.getString(1);
// 		rs.next();
// 		String user2 = rs.getString(2);
// 		rs.next();
// 		String user3 = rs.getString(3);
		%>
		<form action="splitt.jsp" method="get">
			<b>Total Amount</b> <input type="number" name="amount"><br>
			<p><b>Paid By  - </b></p>
			<input type="radio" id="u1" name="paidby" value="Mahender">
			<label for="u1">Mahender</label><br>
			<input type="radio" id="u2" name="paidby" value="Naman">
			<label for="u2">Naman</label><br>
			<input type="radio" id="u3" name="paidby" value="Dhruv">
			<label for="u1">Dhruv</label><br>
			<p><b>Split Between :</b> </p>
			 <input type="checkbox" id="us1" name="use1" value="Mahender">
  			 <label for="us1">Mahender</label><br>
  			 <input type="checkbox" id="us2" name="use2" value="Naman">
  			 <label for="us2">Naman</label><br>
  			 <input type="checkbox" id="us3" name="use3" value="Dhruv">
  			 <label for="us3">Dhruv</label><br><br>
  			 <input type="submit" value="Split">			
		</form> 
		<%	}
	catch(Exception e){
		
	}
	finally{
		st.close();
		con.close();
	}
	%>
	
	
	
	
</body>
</html>