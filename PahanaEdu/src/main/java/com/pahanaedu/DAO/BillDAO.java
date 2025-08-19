package com.pahanaedu.DAO;

import com.pahanaedu.entity.Bill;
import com.pahanaedu.entity.BillItem;
import java.util.List;


public interface BillDAO {
    
    public int createBillWithItems(Bill bill) throws Exception; 
    
    public Bill getBillById(int bill_id) throws Exception;
    
    public List<Bill> getAllBills() throws Exception;
    
        public List<BillItem> getAllBillItems();
    
}
