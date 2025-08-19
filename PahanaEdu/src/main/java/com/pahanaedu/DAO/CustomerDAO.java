package com.pahanaedu.DAO;

import com.pahanaedu.entity.Customer;
import com.pahanaedu.entity.User;
import java.util.List;


public interface CustomerDAO {
    
    public boolean customerAdd(Customer ca);
    
    public List<Customer> getAllCustomers();
    
     public Customer getCustomerByAccountno(int accountno);
    
    public boolean updatedEditCustomer(Customer c);  
    
    public boolean deleteCustomer(int accountno);
    
}
