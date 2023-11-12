package com.sqk.backend.controller.user;

import com.sqk.backend.service.user.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
public class LoginController {

    @Autowired
    private LoginService loginService;

    @PostMapping("/user/account/token/") // 要在SecurityConfig中放行
    public Map<String, String> getToken(@RequestParam Map<String,String> map) {
        String username = map.get("username");
        String password = map.get("password");

        return loginService.getToken(username,password);
    }
}