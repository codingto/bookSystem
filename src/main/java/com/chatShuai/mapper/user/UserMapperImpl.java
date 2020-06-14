package com.chatShuai.mapper.user;

import com.chatShuai.pojo.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

@Component("userMapper")
public class UserMapperImpl implements UserMapper{
    @Resource(description = "sqlSession")
    SqlSessionTemplate sqlsession;

    public void setSqlsession(SqlSessionTemplate sqlsession) {
        this.sqlsession = sqlsession;
    }

    @Override
    public List<User> getAllUsers() {
        UserMapper mapper = sqlsession.getMapper(UserMapper.class);
        return mapper.getAllUsers();

    }

    @Override
    public User getUserById(int id) {
        UserMapper mapper = sqlsession.getMapper(UserMapper.class);
        return mapper.getUserById(id);
    }

    @Override
    public User getUserByName(String name) {

        UserMapper mapper = sqlsession.getMapper(UserMapper.class);
        return mapper.getUserByName(name);
    }

    @Override
    public void addUser(User user) {
        UserMapper mapper = sqlsession.getMapper(UserMapper.class);
        mapper.addUser(user);
    }

    @Override
    public void deleteById(int id) {
        UserMapper mapper = sqlsession.getMapper(UserMapper.class);
        mapper.deleteById(id);
    }

    @Override
    public void updateUser(User user) {
        UserMapper mapper = sqlsession.getMapper(UserMapper.class);
        mapper.updateUser(user);
    }
}
