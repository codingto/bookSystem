package com.chatShuai.pojo;

/**
 * 用于模糊查询
 */
public class BookLike {
    String book_id;
    String book_name;
    String book_author;
    String book_describe;



    public BookLike() {
    }

    public BookLike(String book_id, String book_name, String book_author, String book_describe) {
        this.book_id = book_id;
        this.book_name = book_name;
        this.book_author = book_author;
        this.book_describe = book_describe;


    }

    public void setBook_id(String book_id) {
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





    public String getBook_id() {
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





    @Override
    public String toString() {
        return "Book{" +
                "book_id=" + book_id +
                ", book_name='" + book_name + '\'' +
                ", book_author='" + book_author + '\'' +
                ", book_describe='" + book_describe + '\'' +
                '}';
    }
}
