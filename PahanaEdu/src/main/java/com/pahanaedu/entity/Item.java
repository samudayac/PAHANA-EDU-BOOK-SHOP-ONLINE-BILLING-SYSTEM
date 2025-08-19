package com.pahanaedu.entity;


public class Item {
    
    private int itemid;
    private String iname;
    private Double price;
    private String type;
    private String photo;

    public Item(){
        super();
    }
    
    public Item(String iname, Double price, String type, String photo) 
    {
        super();
        this.iname = iname;
        this.price = price;
        this.type = type;
        this.photo = photo;
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

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    @Override
    public String toString() {
        return "Item{" + "itemid=" + itemid + ", iname=" + iname + ", price=" + price + ", type=" + type + ", photo=" + photo + '}';
    }


    
}
