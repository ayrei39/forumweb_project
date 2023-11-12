package com.sqk.backend.service.impl.user;

import com.sqk.backend.pojo.User;
import com.sqk.backend.service.impl.utils.UserDetailsImpl;
import com.sqk.backend.service.user.LoginService;
import com.sqk.backend.utils.JwtUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private AuthenticationManager authenticationManager;

    @Override
    public Map<String, String> getToken(String username, String password) {
        // 将明文的用户名密码转换成加密的字符串
        UsernamePasswordAuthenticationToken authenticationToken =
                new UsernamePasswordAuthenticationToken(username, password);

        // authenticationManager.authenticate(authenticationToken).var 自动定义变量
        Authentication authenticate = authenticationManager.authenticate(authenticationToken); // 如果登陆失败会自动处理

        // 登陆成功，取出用户
        UserDetailsImpl loginUser = (UserDetailsImpl) authenticate.getPrincipal();
        User user = loginUser.getUser();
        String jwt = JwtUtil.createJWT(user.getId().toString());

        Map<String, String> map = new HashMap<>();
        map.put("error_message", "success");
        map.put("token", jwt);

        return map;
    }

}