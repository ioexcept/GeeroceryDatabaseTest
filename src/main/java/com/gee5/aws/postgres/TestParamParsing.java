package com.gee5.aws.postgres;

import java.util.*;
import java.sql.*;

public class TestParamParsing {

	public TestParamParsing() {
		
		Connection conn = null;
		
		try{
			String SHARED_DATABASE_URL = "postgres://geeroceries:hdtcgsf0@localhost:5432/geeroceries";
			
			
//			String SHARED_DATABASE_URL = "postgres://qlbfzpvuujrpfy:ZyjMJ-Ruj9O5eTNFMT-7SY2ALA@ec2-174-129-218-200.compute-1.amazonaws.com:5432/dfe83n0oai3gie";
//			String SHARED_DATABASE_URL = "postgres://geeroceries:hdtcgsf0@localhost:5432/postgres";
//			String SHARED_DATABASE_URL = System.getenv().get("DATABASE_URL");
			
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
		    String URL = "jdbc:postgresql://" + stok.nextToken() + DATABASE;
		    System.out.println("URL: " + URL);
		    conn = DriverManager.getConnection(URL,DBUSERNAME,DBPASSWORD);
		    System.out.println("Connection established [" + !conn.isClosed() + "]");

		    
/*  
		    String url = "jdbc:postgresql://174.129.218.200:5432/dfe83n0oai3gie";
		    Properties props = new Properties();
		    props.setProperty("user","qlbfzpvuujrpfy");
		    props.setProperty("password","ZyjMJ-Ruj9O5eTNFMT-7SY2ALA");
//		    props.setProperty("ssl","true");
		    conn = DriverManager.getConnection(url, props);
		    
		    
//		    conn = DriverManager.getConnection("jdbc:postgresql://ec2-174-129-218-200.compute-1.amazonaws.com:5432/dfe83n0oai3gie","qlbfzpvuujrpfy","ZyjMJ-Ruj9O5eTNFMT-7SY2ALA");
//		    conn = DriverManager.getConnection("jdbc:postgresql://qlbfzpvuujrpfy:ZyjMJ-Ruj9O5eTNFMT-7SY2ALA@ec2-174-129-218-200.compute-1.amazonaws.com:5432/dfe83n0oai3gie");
		    
//		    jdbc:postgresql://host:port/database
*/
		    
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			try{conn.close();}catch(Exception ex){ex.printStackTrace();}
		}
	}
	                 
	                 
	                 
	public static void main(String[] args) {
		new TestParamParsing();
	}

}
