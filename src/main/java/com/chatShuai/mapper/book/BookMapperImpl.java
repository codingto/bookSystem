package com.chatShuai.mapper.book;

import com.chatShuai.mapper.user.UserMapper;
import com.chatShuai.pojo.Book;
import com.chatShuai.pojo.BookLike;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

@Component("bookMapper")
public class BookMapperImpl implements BookMapper {

    @Resource(description = "sqlSession")
    SqlSessionTemplate sqlsession;
    public void setSqlsession(SqlSessionTemplate sqlsession) {
        this.sqlsession = sqlsession;
    }

    @Override
    public List<Book> getAllBooks() {
        BookMapper mapper = sqlsession.getMapper(BookMapper.class);
        return mapper.getAllBooks();
    }


    @Override
    public List<Book> getAllBooksLike(BookLike bookLike) {
        BookMapper mapper = sqlsession.getMapper(BookMapper.class);
        return mapper.getAllBooksLike(bookLike);
    }

    @Override
    public Book getBookById(int book_id) {
        BookMapper mapper = sqlsession.getMapper(BookMapper.class);
        return mapper.getBookById(book_id);
    }

    @Override
    public Book getBookByName(String book_name) {
        BookMapper mapper = sqlsession.getMapper(BookMapper.class);
        return mapper.getBookByName(book_name);
    }

    @Override
    public void addBook(Book book) {
        BookMapper mapper = sqlsession.getMapper(BookMapper.class);
        mapper.addBook(book);
    }

    @Override
    public void deleteById(int book_id) {
        BookMapper mapper = sqlsession.getMapper(BookMapper.class);
        mapper.deleteById(book_id);
    }

    @Override
    public void updateBook(Book book) {
        BookMapper mapper = sqlsession.getMapper(BookMapper.class);
        mapper.updateBook(book);
    }
}
