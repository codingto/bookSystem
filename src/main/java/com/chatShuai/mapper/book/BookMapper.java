package com.chatShuai.mapper.book;

import com.chatShuai.pojo.Book;
import com.chatShuai.pojo.BookLike;

import java.util.List;

public interface BookMapper {
    List<Book> getAllBooks();

    List<Book> getAllBooksLike(BookLike bookLike);//模糊查询

    Book getBookById(int book_id);

    Book getBookByName(String book_name);

    void addBook(Book book);

    void deleteById(int book_id);

    void updateBook(Book book);

}
