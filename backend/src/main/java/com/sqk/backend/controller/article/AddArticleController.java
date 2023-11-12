package com.sqk.backend.controller.article;

import com.sqk.backend.service.article.AddArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
public class AddArticleController {
    @Autowired
    private AddArticleService addArticleService;

    @PostMapping("/api/user/article/add/")
    public Map<String, String> addArticle(@RequestParam Map<String, String> data) {
        return addArticleService.addArticle(data);
    }
}
