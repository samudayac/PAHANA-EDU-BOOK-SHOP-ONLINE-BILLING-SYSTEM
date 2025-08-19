package com.pahanaedu.entity;

import java.sql.Date;
import java.util.List;


public class Bill {
    
    private int bill_id;
    private int accountno;         
    private int user_id;           
    private double total_amount;
    private List<BillItem> items;
    
    
    public Bill() { 
    super();
    }

    public int getBill_id() {
        return bill_id;
    }

    public void setBill_id(int bill_id) {
        this.bill_id = bill_id;
    }

    public int getAccountno() {
        return accountno;
    }

    public void setAccountno(int accountno) {
        this.accountno = accountno;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public double getTotal_amount() {
        return total_amount;
    }

    public void setTotal_amount(double total_amount) {
        this.total_amount = total_amount;
    }

    public List<BillItem> getItems() {
        return items;
    }

    public void setItems(List<BillItem> items) {
        this.items = items;
    }

    @Override
    public String toString() {
        return "Bill{" + "bill_id=" + bill_id + ", accountno=" + accountno + ", user_id=" + user_id + ", total_amount=" + total_amount + ", items=" + items + '}';
    }

    
    
}
