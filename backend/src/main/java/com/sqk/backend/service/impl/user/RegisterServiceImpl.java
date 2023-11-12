package com.sqk.backend.service.impl.user;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sqk.backend.mapper.UserMapper;
import com.sqk.backend.pojo.User;
import com.sqk.backend.service.user.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RegisterServiceImpl implements RegisterService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public Map<String, String> register(String username, String password, String confirmPassword) {
        Map<String,String> map = new HashMap<>();
        if (username == null) {
            map.put("error_message","用户名不能为空");
            return map;
        }
        if (password == null) {
            map.put("error_message","密码不能为空");
            return map;
        }
        username = username.trim(); // 去除字符串的头尾空格\
        if (username.length() == 0) {
            map.put("error_message","用户名不能为空");
            return map;
        }

        if (password.length() == 0) {
            map.put("error_message","密码长度不能为0");
            return map;
        }

        if (username.length() > 100) {
            map.put("error_message","用户名长度不能大于100");
            return map;
        }

        if (password.length() > 100 || confirmPassword.length() > 100) {
            map.put("error_message","密码长度不能大于100");
            return map;
        }

        if (!password.equals(confirmPassword)) {
            map.put("error_message","两次密码不一致");
            return map;
        }

        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username",username);
        List<User> users = userMapper.selectList(queryWrapper);
        if (!users.isEmpty()) {
            map.put("error_message","用户名已存在");
            return map;
        }

        String encodedPassword = passwordEncoder.encode(password);
        String photo = "https://bocchi.rocks/assets/img/page/special/present_69/download/op/ico_op_05.png";
        User user = new User(null, username, encodedPassword, photo);
        userMapper.insert(user);

        map.put("error_message","success");
        return map;
    }
}
