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
	String connectionURL = "jdbc:mysql://localhost:3310/student?autoReconnect=true&useSSL=false";
	Connection con=null;
	PreparedStatement pst1 =null;
	PreparedStatement pst2 =null;
	ResultSet rs =null;
	//String query1 = "select am from splitwiseprobalance where by=? and to=?";
	//String query2 = "update splitwiseprobalance set `am`=? where `by`=? and `to`=?";
	int[] amou = {-1,-1,-1};
	int[] amount = {-1,-1,-1};
	//String use1 = request.getParameter("use1");
	//String use2 = request.getParameter("use2");
	//String use3 = request.getParameter("use3");
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(connectionURL,"root", "mysql");
		pst1 = con.prepareStatement("select am from splitwiseprobalance where `by`=? and `to`=?");
		pst2 = con.prepareStatement("update splitwiseprobalance set `am`=? where `by`=? and `to`=?");
		pst1.setString(1,paidby);
		pst2.setString(2,paidby);
		if(ar[0]!=null && !(ar[0].equals(paidby))){
		pst1.setString(2,ar[0]);
		pst2.setString(3,ar[0]);
		rs= pst1.executeQuery();
		rs.next();
		amou[0] = rs.getInt("am");
		int finalamount = amou[0] + tamount/count;
		pst2.setInt(1,finalamount);
		pst2.executeUpdate();
// 		rs= pst1.executeQuery();
// 		out.println("HELLO1");
// 		amount[0] = rs.getInt("am");
// 		out.println(ar[0] + " owes " + amount[0] + " to " + paidby);
		}
		if(ar[1]!=null && !(ar[1].equals(paidby))){
		pst1.setString(2,ar[1]);
		pst2.setString(3,ar[1]);
		rs = pst1.executeQuery();
		rs.next();
		amou[1] = rs.getInt("am");
		int finalamount = amou[1] + tamount/count;
		pst2.setInt(1,finalamount);
		pst2.executeUpdate();
// 		rs= pst1.executeQuery();
// 		out.println("HELLO2");
// 		amount[1] = rs.getInt("am");
// 		out.println(ar[1] + " owes " + amount[1] + " to " + paidby);
		}
		if(ar[2]!=null && !(ar[2].equals(paidby))){
		pst1.setString(2,ar[2]);
		pst2.setString(3,ar[2]);
		rs = pst1.executeQuery();
		rs.next();
		amou[2] = rs.getInt("am");
		int finalamount = amou[2] + tamount/count;
		pst2.setInt(1,finalamount);
		pst2.executeUpdate();
// 		rs= pst1.executeQuery();
// 		out.println("HELLO3");
// 		amount[2] = rs.getInt("am");
// 		out.println(ar[2] + " owes " + amount[2] + " to " + paidby);
		}		
	}
	catch(Exception e){
	}
	finally{
	}
	%><p>
	<%
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