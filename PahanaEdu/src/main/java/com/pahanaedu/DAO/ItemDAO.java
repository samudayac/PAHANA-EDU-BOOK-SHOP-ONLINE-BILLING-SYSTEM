package com.pahanaedu.DAO;

import com.pahanaedu.entity.Item;
import java.util.List;


public interface ItemDAO {
    
        public boolean addItems(Item i);
        
        public List<Item> getAllItems();
        
        public Item getItemById(int id);
    
        public boolean updatedEditItems(Item i);
        
        public boolean deleteItems(int id);
}
