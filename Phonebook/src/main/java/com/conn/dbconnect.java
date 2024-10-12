package com.conn;

import java.sql.*;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbconnect 
{
	private static Connection conn;
	
	public static Connection getConn()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/phonebook","root","T@nmay83##");
		}
		catch(SQLException | ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		return conn;
	}
}
