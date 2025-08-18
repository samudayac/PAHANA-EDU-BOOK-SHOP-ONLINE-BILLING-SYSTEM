package com.pahanaedu.DAO;

import com.pahanaedu.entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAOImpl implements UserDAO{
    
    private Connection conn;

    public UserDAOImpl(Connection conn) {
        super();
        this.conn = conn;
    }
    
    public boolean userRegister(User us){
        boolean f=false;
        
        try{
           String sql="insert into user(name,email,contactno,address,password) values(?,?,?,?,?)"; 
           PreparedStatement ps=conn.prepareStatement(sql);
           ps.setString(1, us.getName());
           ps.setString(2, us.getEmail());
           ps.setString(3, us.getContactno());
           ps.setString(4, us.getAddress());
           ps.setString(5, us.getPassword());
           
           int i=ps.executeUpdate();
           if(i==1){
               f=true;
           }
           
        }catch (Exception e){
            e.printStackTrace();
        }
        
        return f;
        
    }

    public User login(String email, String password) {
       User us=null;
        
        try{
            String sql="select * from user where email=? and password=?";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
                us=new User();
                us.setId(rs.getInt(1));
                us.setName(rs.getString(2));
                us.setEmail(rs.getString(3));
                us.setContactno(rs.getString(4));
                us.setAddress(rs.getString(5));
                us.setPassword(rs.getString(6));
                
            }
            
        }catch (Exception e){
            e.printStackTrace();
        }
         
        return us;
         
    }

    @Override
    public List<User> getAllUsers() {
        
        List<User> list=new ArrayList<User>();
        User u=null;
        
        try{
            String sql="select * from user";
            PreparedStatement ps=conn.prepareStatement(sql);
            
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
                u=new User();
                u.setId(rs.getInt(1));
                u.setName(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setContactno(rs.getString(4));
                u.setAddress(rs.getString(5));
                u.setPassword(rs.getString(6));
                list.add(u);
            }   
             
                    
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return list;
    }

    @Override
    public User getUserById(int id) {
    User u = null;
    try {
        String sql = "SELECT * FROM user WHERE id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) { 
            u = new User();
            u.setId(rs.getInt("id"));
            u.setName(rs.getString("name"));
            u.setEmail(rs.getString("email"));
            u.setContactno(rs.getString("contactno"));
            u.setAddress(rs.getString("address"));
            u.setPassword(rs.getString("password"));
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return u;
}

   @Override
public boolean updatedEditUsers(User u) {
    boolean f = false;
    try {
        String sql = "UPDATE user SET name=?, email=?, contactno=?, address=?, password=? WHERE id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, u.getName());
        ps.setString(2, u.getEmail());
        ps.setString(3, u.getContactno());
        ps.setString(4, u.getAddress());
        ps.setString(5, u.getPassword());
        ps.setInt(6, u.getId());

        int r = ps.executeUpdate();
        if (r == 1) {
            f = true;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return f;
}

    @Override
    public boolean deleteUser(int id) {
        boolean f= false;
        
        try{
            String sql = "delete from user WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

        int r = ps.executeUpdate();
        if (r == 1) {
            f = true;
        }
            
        }catch(Exception e){
            e.printStackTrace();
            
        }
        
        return f;
    }

    
    
    
}
