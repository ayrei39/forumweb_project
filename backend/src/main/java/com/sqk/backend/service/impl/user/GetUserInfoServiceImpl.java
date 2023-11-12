package com.sqk.backend.service.impl.user;

import com.sqk.backend.mapper.UserMapper;
import com.sqk.backend.pojo.User;
import com.sqk.backend.service.user.GetUserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class GetUserInfoServiceImpl implements GetUserInfoService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public Map<String, String> getUserInfo(String userId) {
        int user_id = Integer.parseInt(userId);
        User user = userMapper.selectById(user_id);
        Map<String, String> map = new HashMap<>();
        map.put("id", user.getId().toString());
        map.put("username", user.getUsername());
        map.put("photo", user.getPhoto());
        return map;
    }
}
