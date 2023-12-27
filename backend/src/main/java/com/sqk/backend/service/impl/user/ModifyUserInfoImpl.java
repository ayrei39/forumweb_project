package com.sqk.backend.service.impl.user;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sqk.backend.mapper.ReplyMapper;
import com.sqk.backend.mapper.UserMapper;
import com.sqk.backend.pojo.User;
import com.sqk.backend.service.impl.utils.UserDetailsImpl;
import com.sqk.backend.service.user.ModifyUserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ModifyUserInfoImpl implements ModifyUserInfo {
     @Autowired
    private UserMapper userMapper;

    @Override
    public Map<String, String> modify(Map<String, String> data) {
        Map<String,String> map = new HashMap<>();
        UsernamePasswordAuthenticationToken authenticationToken =
                (UsernamePasswordAuthenticationToken) SecurityContextHolder.getContext().getAuthentication();
        UserDetailsImpl loginUser = (UserDetailsImpl) authenticationToken.getPrincipal();
        User user = loginUser.getUser();

        String username = data.get("username");



        if (username.isEmpty()) {

            map.put("error_message","用户名为空");
            return map;
        }

        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username",username);
        List<User> users = userMapper.selectList(queryWrapper);
        if (!users.isEmpty()) {

            map.put("error_message","用户名已存在");
            return map;
        }

        if (user.getUsername().equals(username)) {

            map.put("error_message","用户名未修改");
            return map;
        }
        user.setUsername(username);

        userMapper.updateById(user);

        map.put("success_message","修改成功");
        return map;
    }
}
