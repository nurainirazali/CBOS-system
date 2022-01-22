package com.example.cbos;

import java.util.Date;

public class Order {
    public Integer order_id;
    public Date order_date;
    public Float order_price;
    public String order_trackingNumber;

    public Order (Integer orderid, Date orderdate, Float orderprice, String trackingnum){
        order_id=orderid;
        order_date=orderdate;
        order_price=orderprice;
        order_trackingNumber=trackingnum;
    }

    public Integer getOrder_id() {
        return order_id;
    }

    public void setOrder_id(Integer order_id) {
        this.order_id = order_id;
    }

    public Date getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }

    public Float getOrder_price() {
        return order_price;
    }

    public void setOrder_price(Float order_price) {
        this.order_price = order_price;
    }

    public String getOrder_trackingNumber() {
        return order_trackingNumber;
    }

    public void setOrder_trackingNumber(String order_trackingNumber) {
        this.order_trackingNumber = order_trackingNumber;
    }

    public void printData(){
        System.out.println("Order id:"+order_id+"\nOrder Date: "+order_date+"\nPrice : RM "+order_price+"\nTracking Number: "+order_trackingNumber);
    }
}
