package com.example.cbos;

import java.util.Date;

public class Book {
    public Integer book_id;
    public String book_tittle;
    public Integer book_stock;
    public String book_author;
    public String book_ISBN;
    public Date book_publishDate;
    public String book_description;
    public String book_publisher;
    public Integer book_price;
    public String book_img;

    public Book (Integer bookid, String booktitle, Integer bookstock, String author, String isbn,
                 Date publishdate, String desc, String publisher, Integer price , String bimg ){
        book_id=bookid;
        book_tittle=booktitle;
        book_stock=bookstock;
        book_author=author;
        book_ISBN=isbn;
        book_publishDate=publishdate;
        book_description=desc;
        book_publisher=publisher;
        book_price=price;
        book_img=bimg;
    }

    public Integer getBook_id() {
        return book_id;
    }

    public void setBook_id(Integer book_id) {
        this.book_id = book_id;
    }

    public String getBook_tittle() {
        return book_tittle;
    }

    public void setBook_tittle(String book_tittle) {
        this.book_tittle = book_tittle;
    }

    public Integer getBook_stock() {
        return book_stock;
    }

    public void setBook_stock(Integer book_stock) {
        this.book_stock = book_stock;
    }

    public String getBook_author() {
        return book_author;
    }

    public void setBook_author(String book_author) {
        this.book_author = book_author;
    }

    public String getBook_ISBN() {
        return book_ISBN;
    }

    public void setBook_ISBN(String book_ISBN) {
        this.book_ISBN = book_ISBN;
    }

    public Date getBook_publishDate() {
        return book_publishDate;
    }

    public void setBook_publishDate(Date book_publishDate) {
        this.book_publishDate = book_publishDate;
    }

    public String getBook_description() {
        return book_description;
    }

    public void setBook_description(String book_description) {
        this.book_description = book_description;
    }

    public String getBook_publisher() {
        return book_publisher;
    }

    public void setBook_publisher(String book_publisher) {
        this.book_publisher = book_publisher;
    }

    public Integer getBook_price() {
        return book_price;
    }

    public void setBook_price(Integer book_price) {
        this.book_price = book_price;
    }

    public void setBook_img(String book_img) {this.book_img = book_img;}

    public String getBook_img() {return book_img;}

    public void printData(){
        System.out.println("Book id: "+book_id+"\nBook Title: "+book_tittle+"\nBook Stock: "+book_stock+"\nAuthor: "+book_author+
                "\nISBN: "+book_ISBN+"\nPublish Date: "+book_publishDate+"\nDescription: "+book_description+"\nPublisher: "+book_publisher+
                "\nPrice : RM "+book_price+ "\nBook Image: "+book_img);
    }
}
