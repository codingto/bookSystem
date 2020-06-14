package service;

import com.chatShuai.pojo.User;
import com.chatShuai.service.user.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-dao.xml"})
public class test1 {
    @Autowired
    UserService userService;
    @Test
    public void getallUsers() {
//
        userService.userLoginCheck("111","222");
    }
}
