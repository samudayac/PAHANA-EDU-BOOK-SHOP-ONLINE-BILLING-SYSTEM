
package com.pahanaedu.DAO;

import com.pahanaedu.entity.Bill;
import com.pahanaedu.entity.BillItem;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class BillDAOImpl implements BillDAO{
    
        private Connection conn;

    public BillDAOImpl(Connection conn) {
        super();
        this.conn = conn;
    }

    @Override
    public int createBillWithItems(Bill bill) throws Exception{
        
        int generatedBillId = -1;
        PreparedStatement psBill = null;
        PreparedStatement psItem = null;
        try {
            conn.setAutoCommit(false);

            String sqlBill = "INSERT INTO bill(accountno, user_id, total_amount) VALUES(?,?,?)";
            psBill = conn.prepareStatement(sqlBill, Statement.RETURN_GENERATED_KEYS);
            psBill.setInt(1, bill.getAccountno());
            psBill.setInt(2, bill.getUser_id());
            psBill.setDouble(3, bill.getTotal_amount());

            int r = psBill.executeUpdate();
            if (r == 0) throw new Exception("Insert bill failed.");

            ResultSet rs = psBill.getGeneratedKeys();
            if (rs.next()) {
                generatedBillId = rs.getInt(1);
            } else {
                throw new Exception("Failed to get generated bill id.");
            }

            String sqlItem = "INSERT INTO bill_item(bill_id, itemid, iname, quantity, unit_price, amount) VALUES(?,?,?,?,?,?)";
            psItem = conn.prepareStatement(sqlItem);

            for (BillItem bi : bill.getItems()) {
                psItem.setInt(1, generatedBillId);
                psItem.setInt(2, bi.getItemid());
                psItem.setString(3, bi.getIname());
                psItem.setInt(4, bi.getQuantity());
                psItem.setDouble(5, bi.getUnit_price());
                psItem.setDouble(6, bi.getAmount());
                psItem.addBatch();
            }

            psItem.executeBatch();
            conn.commit();
            return generatedBillId;
        } catch (Exception ex) {
            try { conn.rollback(); } 
            catch (Exception ignore) {}
            throw ex;
        } finally {
            try { if (psBill != null) 
                psBill.close(); 
            } 
            catch (Exception e) {}
            try { if (psItem != null) psItem.close(); } catch (Exception e) {}
            try { conn.setAutoCommit(true); } catch (Exception e) {}
        }
    }

    @Override
    public Bill getBillById(int bill_id) throws Exception{
        Bill bill = null;
        PreparedStatement ps = null;
        PreparedStatement psItems = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT bill_id, accountno, user_id, total_amount FROM bill WHERE bill_id=?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, bill_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                bill = new Bill();
                bill.setBill_id(rs.getInt("bill_id"));
                bill.setAccountno(rs.getInt("accountno"));
                bill.setUser_id(rs.getInt("user_id"));

                String sqlItems = "SELECT bi.bill_item_id, bi.bill_id, bi.itemid, i.iname, bi.quantity, bi.unit_price, bi.amount "
                                  + "FROM bill_item bi JOIN item i ON bi.itemid = i.itemid WHERE bi.bill_id = ?";
                psItems = conn.prepareStatement(sqlItems);
                psItems.setInt(1, bill_id);
                ResultSet r2 = psItems.executeQuery();
                List<com.pahanaedu.entity.BillItem> list = new ArrayList<>();
                while (r2.next()) {
                    com.pahanaedu.entity.BillItem bi = new com.pahanaedu.entity.BillItem();
                    bi.setBill_item_id(r2.getInt("bill_item_id"));
                    bi.setBill_id(r2.getInt("bill_id"));
                    bi.setItemid(r2.getInt("itemid"));
                    bi.setIname(r2.getString("iname"));
                    bi.setQuantity(r2.getInt("quantity"));
                    bi.setUnit_price(r2.getDouble("unit_price"));
                    bi.setAmount(r2.getDouble("amount"));
                    list.add(bi);
                }
                bill.setItems(list);
            }
            return bill;
        } finally {
            try { 
                if (rs != null) 
                    rs.close(); 
            } catch (Exception e) 
            {}
            
            
            try { 
                if (ps != null) 
                    ps.close(); 
            } catch (Exception e) 
            {}
            try { 
                if (psItems != null) 
                    psItems.close(); 
            } catch (Exception e)
            {}
        }
    }

    @Override
    public List<Bill> getAllBills() throws Exception{
       List<Bill> result = new ArrayList<>();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT bill_id, accountno, user_id, total_amount, bill_date FROM bill WHERE accountno = ?";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                result.add(getBillById(rs.getInt("bill_id")));
            }
            return result;
        } finally { 
            try { 
                if (rs != null) 
                    rs.close(); } 
            
            catch (Exception e) {
            e.printStackTrace();
            }
            try { if (ps != null)
                ps.close(); } 
            
            catch (Exception e) 
            {
            e.printStackTrace();
            }
        }
    }

    @Override
    public List<BillItem> getAllBillItems() {
    List<BillItem> list = new ArrayList<>();
    BillItem bi = null;

    try {
        String sql = "select * from bill_item";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            bi = new BillItem();
            bi.setBill_item_id(rs.getInt(1));
            bi.setBill_id(rs.getInt(2));
            bi.setItemid(rs.getInt(3));
            bi.setIname(rs.getString(4));
            bi.setQuantity(rs.getInt(5));
            bi.setUnit_price(rs.getDouble(6));
            bi.setAmount(rs.getDouble(7));
            list.add(bi);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    return list;
}

    
    
    
}
