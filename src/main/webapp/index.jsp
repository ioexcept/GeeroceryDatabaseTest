<%@ page 
contentType="text/html; charset=utf-8" 
language="java" 
import="java.sql.*,java.util.*" 
errorPage="" %>

<%
        String status = "Failed";
        String SHARED_DATABASE_URL = System.getenv().get("DATABASE_URL");

        System.out.println("SHARED_DATABASE_URL: " + SHARED_DATABASE_URL);
        StringTokenizer stok = new StringTokenizer(SHARED_DATABASE_URL,":");
        String DATABASE_TYPE = stok.nextToken();
        String DATABASE = SHARED_DATABASE_URL.substring(SHARED_DATABASE_URL.lastIndexOf("/"));
        System.out.println("DATABASE: " + DATABASE);
        String DBUSERNAME = stok.nextToken().substring(2);
        System.out.println("USERNAME: " + DBUSERNAME);
        stok = new StringTokenizer(stok.nextToken(),"@");
        String DBPASSWORD = stok.nextToken();
        System.out.println("PASSWORD: " + DBPASSWORD);
        String URL = "jdbc:postgresql://" + stok.nextToken() + ":5432" + DATABASE;
        System.out.println("URL: " + URL);
//        out.println("URL: " + URL + "<br>");

      	Class.forName("org.postgresql.Driver");
        Connection conn = DriverManager.getConnection(URL,DBUSERNAME,DBPASSWORD);
        System.out.println("Connection established [" + !conn.isClosed() + "]");
 
        if(!conn.isClosed()){
        	status = "Successful";
        }

	try{
		conn.close();
	}catch(Exception ex){}

%>

<html>
<head>
<title>PostGres Connection Test</title>
</head>

<body>
<div align="center">
Demo Test: push, pull, compile, deply - V01<br>
Database Connection Test Status: <%= status %>
</div>
</body>
</html>


