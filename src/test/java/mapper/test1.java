package mapper;

import com.chatShuai.mapper.user.UserMapperImpl;
import com.chatShuai.pojo.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-dao.xml"})
public class test1 {

    @Resource(name = "userMapper")
    UserMapperImpl userMapper;
    @Test
    public void usergetall() {

        for (User user : userMapper.getAllUsers()) {
            System.out.println(user);
        }
    }

    @Test
    public void getuserbyid() {
        System.out.println(userMapper.getUserById(16));
    }
    @Test
    public void getuserbyname() {
        System.out.println(userMapper.getUserByName("shuai"));
    }
    @Test
    public void addUser() {
        userMapper.addUser(new User(null,"shuaige","asd"));
    }

    @Test
    public void deleteUserByid() {
        userMapper.deleteById(21);
    }

    @Test
    public void updata() {
        userMapper.updateUser(new User(16,"帅哥","ssss"));
    }
}
