package com.sqk.backend.controller.article;

import com.sqk.backend.pojo.Article;
import com.sqk.backend.service.article.GetListByUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
public class GetListByUserController {
    @Autowired
    private GetListByUserService getListByUserService;
    @GetMapping("/api/user/article/getlist/")
    public List<Article> getListByUser(@RequestParam Map<String, String> data) {
        return getListByUserService.getListByUser(data);
    }
}
