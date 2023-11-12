package com.sqk.backend.controller.user;

import com.sqk.backend.service.user.GetUserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
public class GetUserInfoController {
    @Autowired
    private GetUserInfoService getUserInfoService;

    @GetMapping("/user/getinfo/")
    public Map<String, String>  getUserInfo(String userId) {
        return getUserInfoService.getUserInfo(userId);
    }
}
