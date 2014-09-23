<%@ page 
contentType="text/html; charset=utf-8" 
language="java" 
import="java.sql.*,java.util.*" 
errorPage="" %>

<%
	long startTime = System.currentTimeMillis();
	String start_date_time = new java.util.Date().toString();
	long dbCon = -1;
	long rTime = -1;
	String dbConnectTime = "N/A";
	String runTime  = "N/A";
	
	String version = application.getInitParameter("VERSION"); 
	String buildTime = application.getInitParameter("BUILD_TIME"); 
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
		dbCon = (System.currentTimeMillis() - startTime);
		dbConnectTime = dbCon + "";
        }




	String ipAddress  = request.getHeader("X-FORWARDED-FOR");  
        if(ipAddress == null)  
        {  
          ipAddress = request.getRemoteAddr();  
        }  
	PreparedStatement insert = conn.prepareStatement("insert into visitors(ip,dbconnect,runtime) values(?,?,?)" );

	rTime = (System.currentTimeMillis() - startTime);
	runTime = rTime + "";
	insert.setString(1,ipAddress);
	insert.setLong(2,dbCon);
	insert.setLong(3,rTime);
	insert.executeUpdate();

	try{
		conn.close();
	}catch(Exception ex){}

       
%>

<html>
<head>
<title>AWS PostGres Connection Test</title>
</head>

<body>
<div align="center">
DB Connection Time: <%= dbConnectTime %> milliseconds<br>
Total Run Time: <%= runTime %> milliseconds<br>

<br>
Demo Test: push, pull, compile, deply - V02<br>
Database Connection Test Status: <%= status %>
<hr width="50%"/>
Version: <%= version %><br>
Build Time: <%= buildTime %><br>
</div>
<br>
<%= ipAddress %>


</body>
</html>


