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
	PreparedStatement pst3 = null;
	PreparedStatement pst4 = null;
	ResultSet rs =null;
	ResultSet result = null;
	ResultSet rfinal = null;
	int[] amou = {-1,-1,-1};
	int[] amount = {-1,-1,-1};
	int[] famount = {-1,-1,-1};
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(connectionURL,"root", "mysql");
		pst1 = con.prepareStatement("select am from splitwiseprobalance where `by`=? and `to`=?");
		pst2 = con.prepareStatement("update splitwiseprobalance set `am`=? where `by`=? and `to`=?");
		pst3 = con.prepareStatement("select am from splitwiseprobalance where `by`=? and `to`=?");
		pst4 = con.prepareStatement("select am from splitwiseprobalance where `by`=? and `to`=?");
		pst1.setString(1,paidby);
		pst2.setString(2,paidby);
		pst3.setString(1,paidby);
		
		if(ar[0]!=null && !(ar[0].equals(paidby))){
			pst1.setString(2,ar[0]);
			pst2.setString(3,ar[0]);
			pst3.setString(2,ar[0]);
			rs= pst1.executeQuery();
			rs.next();
			amou[0] = rs.getInt("am");
			int finalamount = amou[0] + tamount/count;
			pst2.setInt(1,finalamount);
			pst2.executeUpdate();
			result = pst3.executeQuery();
			result.next();
			amount[0] = result.getInt("am");
			pst4.setString(1,ar[0]);
			pst4.setString(2,paidby);
			rfinal = pst4.executeQuery();
			rfinal.next();
			famount[0] = rfinal.getInt("am");
			int c = famount[0] - amount[0];
			if(c>=0){
				out.println(paidby + " owes " + c + " to " + ar[0]);%><br><%
			}
			else{
				out.println(ar[0] + " owes " + (-c) + " to " + paidby);%><br><%
			}
			
		}
		
		if(ar[1]!=null && !(ar[1].equals(paidby))){
			pst1.setString(2,ar[1]);
			pst2.setString(3,ar[1]);
			pst3.setString(2,ar[1]);
			rs = pst1.executeQuery();
			rs.next();
			amou[1] = rs.getInt("am");
			int finalamount = amou[1] + tamount/count;
			pst2.setInt(1,finalamount);
			pst2.executeUpdate();
			result = pst3.executeQuery();
			result.next();
			amount[1] = result.getInt("am");
			pst4.setString(1,ar[1]);
			pst4.setString(2,paidby);
			rfinal = pst4.executeQuery();
			rfinal.next();
			famount[1] = rfinal.getInt("am");
			int c = famount[1] - amount[1];
			if(c>=0){
				out.println(paidby + " owes " + c + " to " + ar[1]);%><br><%
			}
			else{
				out.println(ar[1] + " owes " + (-c) + " to " + paidby);%><br><%
			}
		}
		
		if(ar[2]!=null && !(ar[2].equals(paidby))){
			pst1.setString(2,ar[2]);
			pst2.setString(3,ar[2]);
			pst3.setString(2,ar[2]);
			rs = pst1.executeQuery();
			rs.next();
			amou[2] = rs.getInt("am");
			int finalamount = amou[2] + tamount/count;
			pst2.setInt(1,finalamount);
			pst2.executeUpdate();
			result = pst3.executeQuery();
			result.next();
			amount[2] = result.getInt("am");
			pst4.setString(1,ar[2]);
			pst4.setString(2,paidby);
			rfinal = pst4.executeQuery();
			rfinal.next();
			famount[2] = rfinal.getInt("am");
			int c = famount[2] - amount[2];
			if(c>=0){
				out.println(paidby + " owes " + c + " to " + ar[2]);%><br><%
			}
			else{
				out.println(ar[2] + " owes " + (-c) + " to " + paidby);%><br><%
			}
		}		
	}
	catch(Exception e){
	}
	finally{
	}
	%>	
</body>
</html>