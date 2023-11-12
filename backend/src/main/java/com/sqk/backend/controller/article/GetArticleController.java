package com.sqk.backend.controller.article;

import com.sqk.backend.service.article.GetArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
public class GetArticleController {
    @Autowired
    private GetArticleService getArticleService;

    @GetMapping("/article/get/")
    public Map<String, String> getUserInfo(String articleId) {
        return getArticleService.getArticle(articleId);
    }
}
