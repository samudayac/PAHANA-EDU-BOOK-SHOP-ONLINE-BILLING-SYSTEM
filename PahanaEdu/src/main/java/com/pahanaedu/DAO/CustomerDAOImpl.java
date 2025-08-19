package com.pahanaedu.DAO;

import com.pahanaedu.entity.Customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class CustomerDAOImpl implements CustomerDAO{
    private Connection conn;

    public CustomerDAOImpl(Connection conn) {
        super();
        this.conn = conn;
    }
    
    public boolean customerAdd(Customer ca){
        boolean f=false;
        
        try{
           String sql="insert into customer(name,address,contactno) values(?,?,?)"; 
           PreparedStatement ps=conn.prepareStatement(sql);
           ps.setString(1, ca.getName());
           ps.setString(2, ca.getAddress());
           ps.setString(3, ca.getContactno());
           
           int i=ps.executeUpdate();
           if(i==1){
               f=true;
           }
           
        }catch (Exception e){
            e.printStackTrace();
        }
        
        return f;
        
    }

    @Override
    public List<Customer> getAllCustomers() {
        
        List<Customer> list=new ArrayList<Customer>();
        Customer c=null;
        
        try{
            String sql="select * from customer";
            PreparedStatement ps=conn.prepareStatement(sql);
            
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
                c=new Customer();
                c.setAccountno(rs.getInt(1));
                c.setName(rs.getString(2));
                c.setAddress(rs.getString(3));
                c.setContactno(rs.getString(4));
                list.add(c);
            }   
             
                    
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return list;
    }

    @Override
    public Customer getCustomerByAccountno(int accountno) {
    Customer c = null;
    try {
        String sql = "SELECT * FROM customer WHERE accountno = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, accountno);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) { 
            c = new Customer();
            c.setAccountno(rs.getInt("accountno"));
            c.setName(rs.getString("name"));
            c.setAddress(rs.getString("address"));
            c.setContactno(rs.getString("contactno"));
            
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return c;
}
    @Override
    public boolean updatedEditCustomer(Customer c) {
    boolean f = false;
    try {
        String sql = "UPDATE customer SET name=?, address=?, contactno=? WHERE accountno=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, c.getName());
        ps.setString(2, c.getAddress());
        ps.setString(3, c.getContactno());
        ps.setInt(4, c.getAccountno());

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
    public boolean deleteCustomer(int accountno) {
        boolean f= false;
        
        try{
            String sql = "delete from customer WHERE accountno=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, accountno);

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

    

