<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String Name=request.getParameter("Name");
		String Phone_Number =request.getParameter("Phone-Number");
		String Pax_Number=request.getParameter("Pax-Number");
		String Checkin_Date=request.getParameter("Checkin-Date");
		String Checkout_Date=request.getParameter("Checkout-Date");
		String Tour_Package=request.getParameter("Tour-Package");
		String message=request.getParameter("INQUIRE NOW");
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/travel","root","root");
		String s="insert into travel1 values(?,?,?,?,?,?)";
		PreparedStatement p=cn.prepareStatement(s);
		p.setString(1,Name);
		p.setString(2,Phone_Number);
		p.setString(3,Pax_Number);
		p.setString(4,Checkin_Date);
		p.setString(5,Checkout_Date);
		p.setString(6,Tour_Package);
	
		
		int i=p.executeUpdate();
		if(i>0)
		{
			response.sendRedirect("index.html");
		}
	%>
</body>
</html>