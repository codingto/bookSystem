package mapper;

import com.chatShuai.mapper.book.BookMapper;
import com.chatShuai.mapper.book.BookMapperImpl;
import com.chatShuai.pojo.Book;
import com.chatShuai.pojo.BookLike;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-dao.xml"})
public class bookTest {
    @Resource(name="bookMapper")
    BookMapperImpl bookMapper;

    @Test
    public void getallbook() {
        for (Book allBook : bookMapper.getAllBooks()) {
            System.out.println(allBook);
        }
    }

    @Test
    public void getBookById() {
        System.out.println(bookMapper.getBookById(1));
    }
    @Test
    public void getBookByName() {
        System.out.println(bookMapper.getBookByName("数学复习全书"));
    }
    @Test
    public void addBook() {

                bookMapper.addBook(
                        new Book(null,
                                "TestBook",
                                "TestBook",
                                "TestBook",

                                222));
    }

    @Test
    public void deleteById() {
        bookMapper.deleteById(4);
    }

    @Test
    public void updateBook() {
        bookMapper.updateBook(new Book(5,
                "TestBook2",
                "TestBook",
                "TestBook",

                222));
    }

    //模糊查询
    @Test
    public void queryLike() {
        List<Book> books = bookMapper.getAllBooksLike(new BookLike("", "数学", "%", "%"));
        System.out.println(books);
        for (Book book : books) {
            System.out.println("book:"+book);
        }
    }
}
