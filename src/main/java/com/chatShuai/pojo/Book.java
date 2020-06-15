package com.chatShuai.pojo;

public class Book {
    Integer book_id;
    String book_name;
    String book_author;
    String book_describe;

    int book_numbers;

    public Book() {
    }

    public Book(Integer book_id, String book_name, String book_author, String book_describe, int book_numbers) {
        this.book_id = book_id;
        this.book_name = book_name;
        this.book_author = book_author;
        this.book_describe = book_describe;

        this.book_numbers = book_numbers;
    }

    public void setBook_id(Integer book_id) {
        this.book_id = book_id;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public void setBook_author(String book_author) {
        this.book_author = book_author;
    }

    public void setBook_describe(String book_describe) {
        this.book_describe = book_describe;
    }



    public void setBook_numbers(int book_numbers) {
        this.book_numbers = book_numbers;
    }

    public Integer getBook_id() {
        return book_id;
    }

    public String getBook_name() {
        return book_name;
    }

    public String getBook_author() {
        return book_author;
    }

    public String getBook_describe() {
        return book_describe;
    }



    public int getBook_numbers() {
        return book_numbers;
    }

    @Override
    public String toString() {
        return "Book{" +
                "book_id=" + book_id +
                ", book_name='" + book_name + '\'' +
                ", book_author='" + book_author + '\'' +
                ", book_describe='" + book_describe + '\'' +

                ", book_numbers=" + book_numbers +
                '}';
    }
}
