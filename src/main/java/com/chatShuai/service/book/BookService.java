package com.chatShuai.service.book;

import com.alibaba.fastjson.JSON;
import com.chatShuai.mapper.book.BookMapperImpl;
import com.chatShuai.pojo.Book;
import com.chatShuai.pojo.BookLike;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("bookService")
public class BookService {
    @Resource(name="bookMapper")
    BookMapperImpl bookMapper;

    /**
     *
     * @return ListBooks的Json字符串
     */
    public String getAllBook(){
        List<Book> books = bookMapper.getAllBooks();
        return JSON.toJSONString(books);
    }
    public void deleteBookById(int book_id){
         bookMapper.deleteById(book_id);
    }

    /**
     *
     *
     * @return Book类的Json字符串
     */
    public String getBookById(int book_id){
        Book book = bookMapper.getBookById(book_id);

        return JSON.toJSONString(book);
    }

    public void updataBook(Book book){
        bookMapper.updateBook(book);
    }
    public void addBook(Book book){
        bookMapper.addBook(book);
    }

    //方便模糊查询，转换
    public BookLike tempLike(BookLike bookLike){
        //空变%
        if("".equals(bookLike.getBook_id())){
            bookLike.setBook_id("%");
        }

        if("".equals(bookLike.getBook_name())){
            bookLike.setBook_name("%");
        }else {
            bookLike.setBook_name("%"+bookLike.getBook_name()+"%");
        }

        if("".equals(bookLike.getBook_author())){
            bookLike.setBook_author("%");
        }
        if("".equals(bookLike.getBook_describe())){
            bookLike.setBook_describe("%");
        }else{
            bookLike.setBook_describe("%"+bookLike.getBook_describe()+"%");
        }

        return bookLike;
    }
    public List<Book> getAllBooksLike(BookLike bookLike){

        List<Book> allBooksLike = bookMapper.getAllBooksLike(tempLike(bookLike));

        return allBooksLike;
    }
}
