package com.chatShuai.service.user;

import com.chatShuai.mapper.user.UserMapper;
import com.chatShuai.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("userService")
public class UserService {
    @Resource(name = "userMapper")
    UserMapper userMapper;

    /**
     * 返回值：含义
     * -1：无此用户
     * 0：有用户，但密码错误
     * 1：密码正确
     */
    public int userLoginCheck(String name,String pwd) {
        //密码是否与用户名匹配
        User user =  userMapper.getUserByName(name);

        if(user==null){//无此用户
            return -1;
        }else if(!pwd.equals(user.getPwd())){//密码错误
            return 0;
        }else{
            return 1;
        }
    }

    /**
     * 返回值：含义
     *      * -1：用户名已存在
     *      * 1：该用户名可以注册
     */
    public int userRegister(String name,String pwd) {
        //密码是否与用户名匹配
        User user =  userMapper.getUserByName(name);

        if(user!=null){
            //用户已存在
            return -1;
        }else{
            //用户名可用,添加用户
            userMapper.addUser(new User(null,name,pwd));
            return 1;
        }
    }
}
