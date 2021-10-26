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
	<%
	String[] ar = new String[3];
	ar[0]= request.getParameter("use1");
	ar[1]= request.getParameter("use2");
	ar[2]= request.getParameter("use3");
	int count=0;
	for(String s : ar){
		if(s!=null){
			count++;
		}
	}
	String paidby = request.getParameter("paidby");
	int tamount = Integer.parseInt(request.getParameter("amount"));
	String connectionURL = "jdbc:mysql://localhost:3310/student";
	Connection con=null;
	PreparedStatement pst1 =null;
	PreparedStatement pst2 =null;
	ResultSet rs =null;
	String query1 = "select am from splitwiseprobalance where (by,to) = (?,?)";
	String query2 = "update splitwiseprobalance set am=? where (by,to)=(?,?)";
	int[] amou = {58,25,1};
	//String use1 = request.getParameter("use1");
	//String use2 = request.getParameter("use2");
	//String use3 = request.getParameter("use3");
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(connectionURL,"root", "mysql");
		pst1 = con.prepareStatement(query1);
		rs = pst1.executeQuery();
		pst1.setString(1,paidby);
		if(ar[0]!=null && !(ar[0].equals(paidby))){
		pst1.setString(2,ar[0]);
		amou[0] = rs.getInt("am");
		}
		if(ar[1]!=null && !(ar[1].equals(paidby))){
		pst1.setString(2,ar[1]);
		amou[1] = rs.getInt("am");
		}
		if(ar[2]!=null && !(ar[2].equals(paidby))){
		pst1.setString(2,ar[2]);
		amou[2] = rs.getInt("am");
		}		
	}
	catch(Exception e){
	}
	finally{
	}
	%><p>
	<%
	for(int e:amou){
		out.println(e + " ");
	}
	if(ar[0]==null || ar[0].equals(paidby)){}
	else{
	%>
	<%= ar[0] %>  owes  <%= tamount/count %> to <%= paidby %><br>
	<%}
	if(ar[1]==null || ar[1].equals(paidby)){}
	else{
	%>
	<%= ar[1] %>  owes  <%= tamount/count %>  to  <%= paidby %><br>
	<%}
	if(ar[2]==null || ar[2].equals(paidby)){}
	else{
	%>
	<%= ar[2] %>  owes  <%= tamount/count %>  to  <%= paidby %><br>
	<%}
	%></p>
	
	
</body>
</html>