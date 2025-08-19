package com.pahanaedu.entity;


public class Customer {
    
    private int accountno;
    private String name;
    private String address;
    private String contactno;
    
    public Customer() {
        super();
    }

    public int getAccountno() {
        return accountno;
    }

    public void setAccountno(int accountno) {
        this.accountno = accountno;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContactno() {
        return contactno;
    }

    public void setContactno(String contactno) {
        this.contactno = contactno;
    }

    @Override
    public String toString() {
        return "Customer{" + "accountno=" + accountno + ", name=" + name + ", address=" + address + ", contactno=" + contactno + '}';
    }
    
    

    
}
