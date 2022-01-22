package com.example.cbos;

public class User {
    public Integer user_id;
    public String user_password;
    public String user_name;
    public String user_email;
    public String user_address;
    public String user_phoneNumber;

    public User (Integer userid, String userpass, String username, String useremail, String useradd, String userphone ){
        user_id=userid;
        user_password=userpass;
        user_name=username;
        user_email=useremail;
        user_address=useradd;
        user_phoneNumber=userphone;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getUser_address() {
        return user_address;
    }

    public void setUser_address(String user_address) {
        this.user_address = user_address;
    }

    public String getUser_phoneNumber() {
        return user_phoneNumber;
    }

    public void setUser_phoneNumber(String user_phoneNumber) {
        this.user_phoneNumber = user_phoneNumber;
    }

    public void printData(){
        System.out.println("User id: "+user_id+"\nUser password: "+user_password+"\nUser Name: "+user_name+"\nUser Email: "
                +user_email+"\nUser Address: "+user_address+"\nUser Phone Number: "+user_phoneNumber);
    }
}
