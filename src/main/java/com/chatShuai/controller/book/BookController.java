package com.chatShuai.controller.book;

import com.alibaba.fastjson.JSON;
import com.chatShuai.pojo.Book;
import com.chatShuai.pojo.BookLike;
import com.chatShuai.service.book.BookService;
import com.chatShuai.service.user.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class BookController {
    @Resource(name = "bookService")
    BookService bookService;
    @RequestMapping(value = "/getAllBook", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getAllBook(HttpServletRequest request) {
//        System.out.println("BookGetAll!!");
        return bookService.getAllBook();
    }
    @RequestMapping(value = "/deleteBook", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String deleteBook(HttpServletRequest request) {
//        System.out.println("BookGetAll!!");
        int book_id = Integer.parseInt(request.getParameter("book_id"));
        bookService.deleteBookById(book_id);
        return "yes";

    }
    //转跳updateBook
    @RequestMapping(value = "/toUpdataBook", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getBookById(HttpServletRequest request) {
//        System.out.println("BookGetAll!!");
        int book_id = Integer.parseInt(request.getParameter("book_id"));//获取ajax中data
        String json =  bookService.getBookById(book_id);
        request.getSession().setAttribute("book",json);
        System.out.println(json);
        return json;

    }

    //真正的更新
    @RequestMapping(value = "/updataBook", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String updataBook(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("book_id"));
        String book_name = request.getParameter("book_name");
        String book_author = request.getParameter("book_author");
        String book_describe = request.getParameter("book_describe");
        int book_numbers = Integer.parseInt(request.getParameter("book_numbers"));
        bookService.updataBook(new Book(id,book_name,book_author,book_describe,book_numbers));


        return "updataSuccess";
    }

    @RequestMapping(value = "/addBook", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String addBook(HttpServletRequest request) {

        String book_name = request.getParameter("book_name");
        String book_author = request.getParameter("book_author");
        String book_describe = request.getParameter("book_describe");
        int book_numbers = Integer.parseInt(request.getParameter("book_numbers"));
        bookService.addBook(new Book(null,book_name,book_author,book_describe,book_numbers));
        return "add success";
    }

    @RequestMapping(value = "/queryBook", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String queryBook(HttpServletRequest request) {
        //模糊查询处理

        String book_id = request.getParameter("book_id");
        String book_name = request.getParameter("book_name");
        String book_author = request.getParameter("book_author");
        String book_describe = request.getParameter("book_describe");
        BookLike bookLike = new BookLike(book_id, book_name, book_author, book_describe);
        List<Book> allBooksLike = bookService.getAllBooksLike(bookLike);
        System.out.println(allBooksLike);
        return JSON.toJSONString(allBooksLike);
    }
}
