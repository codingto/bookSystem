package service;

import com.chatShuai.pojo.Book;
import com.chatShuai.pojo.BookLike;
import com.chatShuai.service.book.BookService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-dao.xml"})
public class bookService {
    @Autowired
    BookService bookService;

    @Test
    public void name() {
        System.out.println(bookService.getAllBook());
    }

    @Test
    public void like() {
        BookLike bookLike = new BookLike("","数学","","");
        System.out.println(bookService.getAllBooksLike(bookLike));
    }
}
