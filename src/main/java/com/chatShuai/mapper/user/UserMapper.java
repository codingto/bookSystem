package com.chatShuai.mapper.user;

import com.chatShuai.pojo.User;

import java.util.List;

public interface UserMapper {
    List<User> getAllUsers();

    User getUserById(int id);

    User getUserByName(String name);

    void addUser(User user);

    void deleteById(int id);

    void updateUser(User user);
}
