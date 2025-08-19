package com.pahanaedu.DAO;

import com.pahanaedu.entity.Item;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class ItemDAOImpl implements ItemDAO{
    
    private Connection conn;

    public ItemDAOImpl(Connection conn) {
        super();
        this.conn = conn;
    }
    
    public boolean addItems(Item i){
        boolean f=false;
        
        try{
           String sql="insert into item(iname,price,type,photo) values(?,?,?,?)"; 
           PreparedStatement ps=conn.prepareStatement(sql);
           ps.setString(1, i.getIname());
           ps.setDouble(2, i.getPrice());
           ps.setString(3, i.getType());
           ps.setString(4, i.getPhoto());
           
           int r=ps.executeUpdate();
           if(r==1){
               f=true;
           }
           
        }catch (Exception e){
            e.printStackTrace();
        }
        
        return f;
        
    }

    @Override
    public List<Item> getAllItems() {
        
        List<Item> list=new ArrayList<Item>();
        Item i=null;
        
        try{
            String sql="select * from item";
            PreparedStatement ps=conn.prepareStatement(sql);
            
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
                i=new Item();
                i.setItemid(rs.getInt(1));
                i.setIname(rs.getString(2));
                i.setPrice(rs.getDouble(3));
                i.setType(rs.getString(4));
                i.setPhoto(rs.getString(5));
                list.add(i);
            }   
             
                    
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return list;
    }

    @Override
public Item getItemById(int id) {
    Item i = null;
    try {
        String sql = "SELECT * FROM item WHERE itemid = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) { 
            i = new Item();
            i.setItemid(rs.getInt("itemid"));
            i.setIname(rs.getString("iname"));
            i.setPrice(rs.getDouble("price"));
            i.setType(rs.getString("type"));
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return i;
}

@Override
public boolean updatedEditItems(Item i) {
    boolean f = false;
    try {
        String sql = "UPDATE item SET iname=?, price=?, type=? WHERE itemid=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, i.getIname());
        ps.setDouble(2, i.getPrice());
        ps.setString(3, i.getType());
        ps.setInt(4, i.getItemid());

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
    public boolean deleteItems(int id) {
        boolean f= false;
        
        try{
            String sql = "delete from item WHERE itemid=?";
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
