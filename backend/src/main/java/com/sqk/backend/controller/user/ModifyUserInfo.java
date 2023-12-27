package com.sqk.backend.controller.user;

import com.sqk.backend.service.article.AddArticleService;
import com.sqk.backend.service.impl.user.ModifyUserInfoImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
public class ModifyUserInfo {
    @Autowired
    private ModifyUserInfoImpl modifyUserInfo;

    @PostMapping("/user/modify/")
    public Map<String, String> modify(@RequestParam Map<String, String> data) {
        return modifyUserInfo.modify(data);
    }
}
