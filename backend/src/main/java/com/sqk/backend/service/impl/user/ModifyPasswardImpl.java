package com.sqk.backend.service.impl.user;

import com.sqk.backend.mapper.UserMapper;
import com.sqk.backend.pojo.User;
import com.sqk.backend.service.impl.utils.UserDetailsImpl;
import com.sqk.backend.service.user.ModifyPassward;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class ModifyPasswardImpl implements ModifyPassward {
     @Autowired
    private UserMapper userMapper;

     @Autowired
    private PasswordEncoder passwordEncoder;

    public Map<String, String> modifyPassward(Map<String, String> data) {
        Map<String, String> map = new HashMap<>();
        UsernamePasswordAuthenticationToken authenticationToken =
                (UsernamePasswordAuthenticationToken) SecurityContextHolder.getContext().getAuthentication();
        UserDetailsImpl loginUser = (UserDetailsImpl) authenticationToken.getPrincipal();
        User user = loginUser.getUser();

        String oldPassword = data.get("oldPassword");
        String newPassword = data.get("newPassword");
        String confirmNewPassword = data.get("confirmNewPassword");



        if (oldPassword.isEmpty() || newPassword.isEmpty() || confirmNewPassword.isEmpty()) {
            map.put("error_message", "密码不能为空");
            return map;
        }

        if (!passwordEncoder.matches(oldPassword,user.getPassword())) {
            map.put("error_message", "原密码错误");
            return map;
        }
        if (passwordEncoder.matches(newPassword,user.getPassword())){
            map.put("error_message", "新密码与原密码相同");
            return map;
        }

        if (!newPassword.equals(confirmNewPassword)) {
            map.put("error_message", "两次密码不一致");
            return map;
        }
        user.setPassword(passwordEncoder.encode(newPassword));
        userMapper.updateById(user);
        map.put("error_message","修改成功");
        return map;
    }
}
