package com.xxxx.service;

import com.xxxx.entity.User;
import com.xxxx.entity.vo.MessageModel;
import com.xxxx.mapper.UserMapper;
import com.xxxx.util.GetSqlSession;
import com.xxxx.util.StringUtil;
import org.apache.ibatis.session.SqlSession;

/**
 * 业务逻辑
 */
public class UserService {
    // 用户登录
    public MessageModel userLogin(String uname, String upwd) {
        MessageModel messageModel = new MessageModel();
        // 回显数据
        User u = new User();
        u.setUserName(uname);
        u.setUserPwd(upwd);
        messageModel.setObject(u);

        // 参数非空判断
        if (StringUtil.isEmpty(uname) || StringUtil.isEmpty(upwd)) {
            // 将状态码、提示信息、回显数据设置到消息模型对象中，返回消息模型对象
            messageModel.setCode(0);
            messageModel.setMsg("用户姓名和密码不能为空！");
            // 回显数据
            return messageModel;
        }

        // 调用Mapper（Dao）层的查询方法，通过用户名查询用户对象
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);
        User user = userMapper.queryUserByName(uname);

        // 判断用户对象是否为空
        if (user == null) {
            // 将状态码、提示信息、回显数据设置到消息模型对象中，返回消息模型对象
            messageModel.setCode(0);
            messageModel.setMsg("用户不存在");
            return messageModel;
        }

        // 比较密码
        if (!upwd.equals(user.getUserPwd())) {
            // 将状态码、提示信息、回显数据设置到消息模型对象中，返回消息模型对象
            messageModel.setCode(0);
            messageModel.setMsg("用户密码不正确");
            return messageModel;
        }

        // 登录成功，将用户信息设置到信息模型中
        messageModel.setObject(user);
        return messageModel;
    }

    // 用户注册
    public MessageModel userRegister(String uname, String upwd, Integer uid, Integer uage) {
        MessageModel messageModel = new MessageModel();
        // 回显数据
        User u = new User();
        u.setUserName(uname);
        u.setUserPwd(upwd);
        u.setUserId(uid);
        u.setUserAge(uage);
        messageModel.setObject(u);

        // 参数非空判断
        if (StringUtil.isEmpty(uname) || StringUtil.isEmpty(upwd)) {
            // 将状态码、提示信息、回显数据设置到消息模型对象中，返回消息模型对象
            messageModel.setCode(0);
            messageModel.setMsg("用户姓名和密码不能为空！");
            // 回显数据
            return messageModel;
        }

        // 调用Mapper（Dao）层的查询方法，通过ID查询是否已经存在账户
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);
        User oldUser = userMapper.queryUserByID(uid);

        // 判断用户对象是否存在
        if (oldUser != null) {
            // 将状态码、提示信息、回显数据设置到消息模型对象中，返回消息模型对象
            messageModel.setCode(0);
            messageModel.setMsg("用户已存在");
            return messageModel;
        }


        // 调用Mapper（Dao）层，注册账户
        int newUser = userMapper.addUser(u);

        session.commit();

        return messageModel;
    }

    // 根据ID显示用户信息
    public static User loadUserByID(Integer uid){
        // 调用Mapper（Dao）层的查询方法，通过用户名查询用户对象
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);
        User user = userMapper.queryUserByID(uid);
        return user;
    }
    public static User loadUserByName(String userName){
        // 调用Mapper（Dao）层的查询方法，通过用户名查询用户对象
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);
        User user = userMapper.queryUserByName(userName);
        return user;
    }
}
