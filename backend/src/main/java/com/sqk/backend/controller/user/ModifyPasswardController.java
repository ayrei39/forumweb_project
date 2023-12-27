package com.sqk.backend.controller.user;

import com.sqk.backend.service.user.ModifyPassward;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
public class ModifyPasswardController {
    @Autowired
    private ModifyPassward modifyPassward;

    @PostMapping("/user/modify/passward/")
    public Map<String, String> modify(@RequestParam Map<String, String> data) {
        return modifyPassward.modifyPassward(data);
    }
}
