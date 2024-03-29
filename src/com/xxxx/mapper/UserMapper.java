package com.xxxx.mapper;

import com.xxxx.entity.User;

// 用户接口类
public interface UserMapper {
    public User queryUserByName(String userName);
    public int addUser(User user);

    public User queryUserByID(Integer userid);
}
