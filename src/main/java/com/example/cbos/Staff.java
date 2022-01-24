package com.example.cbos;

public class Staff implements java.io.Serializable
{
    public String staff_id;
    public String staff_password;
    public String staff_name;
    public String staff_email;
    public String staff_address;
    public String staff_phoneNumber;

    public Staff(){

    }

    public Staff (String staffid, String staffpass, String staffname, String staffemail, String staffadd, String staffphone ){
        staff_id=staffid;
        staff_password=staffpass;
        staff_name=staffname;
        staff_email=staffemail;
        staff_address=staffadd;
        staff_phoneNumber=staffphone;
    }

    public String getStaff_id() {
        return staff_id;
    }

    public void setStaff_id(String staff_id) {
        this.staff_id = staff_id;
    }

    public String getStaff_password() {
        return staff_password;
    }

    public void setStaff_password(String staff_password) {
        this.staff_password = staff_password;
    }

    public String getStaff_name() {
        return staff_name;
    }

    public void setStaff_name(String staff_name) {
        this.staff_name = staff_name;
    }

    public String getStaff_email() {
        return staff_email;
    }

    public void setStaff_email(String staff_email) {
        this.staff_email = staff_email;
    }

    public String getStaff_address() {
        return staff_address;
    }

    public void setStaff_address(String staff_address) {
        this.staff_address = staff_address;
    }

    public String getStaff_phoneNumber() {
        return staff_phoneNumber;
    }

    public void setStaff_phoneNumber(String staff_phoneNumber) {
        this.staff_phoneNumber = staff_phoneNumber;
    }

    public void printData(){
        System.out.println("Staff id: "+staff_id+"\nStaff password: "+staff_password+"\nStaff Name: "+staff_name+"\nStaff Email: "
                +staff_email+"\nStaff Address: "+staff_address+"\nStaff Phone Number: "+staff_phoneNumber);
    }
}
