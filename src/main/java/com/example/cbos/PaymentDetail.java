package com.example.cbos;

public class PaymentDetail {
    public Integer payment_detailId;
    public String payment_status;
    public String pay_img;

    public PaymentDetail(Integer payid, String status, String pimg){
        payment_detailId=payid;
        payment_status=status;
        pay_img=pimg;
    }

    public Integer getPayment_detailId() {
        return payment_detailId;
    }

    public void setPayment_detailId(Integer payment_detailId) {
        this.payment_detailId = payment_detailId;
    }

    public String getPayment_status() {
        return payment_status;
    }

    public void setPayment_status(String payment_status) {
        this.payment_status = payment_status;
    }

    public String getPay_img() {return pay_img;}

    public void setPay_img(String pay_img) {this.pay_img = pay_img;}

    public void printData(){
        System.out.println("Payment Id: "+payment_detailId+"\nPayment Status: "+payment_status+ "\nPayment Image: "+pay_img);
    }
}
