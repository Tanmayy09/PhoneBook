package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.User;
import java.sql.ResultSet;

public class UserDao 
{
	private Connection conn;

	public UserDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean userRegister(User u)
	{
		boolean f =false;
		
		try
		{
			String sql = "insert into user(name,email,password) values(?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			
			int i = ps.executeUpdate();
			if(i==1)
				f=true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return f;
	}
        
        public User UserLogin(String e, String p)
        {
            User user=null;
            
            try
            {
                String login = "select * from user where email=? and password=?";
                PreparedStatement ps = conn.prepareStatement(login);
                ps.setString(1, e);
                ps.setString(2,p);
                
                ResultSet rs = ps.executeQuery();
                
                while(rs.next())
                {
                    user= new User();
                    user.setId(rs.getInt(1));
                    user.setName(rs.getString(2));
                    user.setEmail(rs.getString(3));
                    user.setPassword(rs.getString(4));
                }
            }
            catch(Exception ex)
            {
                ex.printStackTrace();
            }
            return user;
        }
}
