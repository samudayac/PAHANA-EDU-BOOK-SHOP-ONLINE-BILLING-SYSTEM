package com.pahanaedu.entity;


public class BillItem {
    
    private int bill_item_id;
    private int bill_id;         
    private int itemid;
    private String iname; 
    private int quantity;
    private Double unit_price;
    private Double amount;
    
    public BillItem() { 
    super();
    }

    public int getBill_item_id() {
        return bill_item_id;
    }

    public void setBill_item_id(int bill_item_id) {
        this.bill_item_id = bill_item_id;
    }

    public int getBill_id() {
        return bill_id;
    }

    public void setBill_id(int bill_id) {
        this.bill_id = bill_id;
    }

    public int getItemid() {
        return itemid;
    }

    public void setItemid(int itemid) {
        this.itemid = itemid;
    }

    public String getIname() {
        return iname;
    }

    public void setIname(String iname) {
        this.iname = iname;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Double getUnit_price() {
        return unit_price;
    }

    public void setUnit_price(Double unit_price) {
        this.unit_price = unit_price;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "BillItem{" + "bill_item_id=" + bill_item_id + ", bill_id=" + bill_id + ", itemid=" + itemid + ", iname=" + iname + ", quantity=" + quantity + ", unit_price=" + unit_price + ", amount=" + amount + '}';
    }
    
    
    
}
