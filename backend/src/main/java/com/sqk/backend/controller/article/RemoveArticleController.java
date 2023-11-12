package com.sqk.backend.controller.article;

import com.sqk.backend.service.article.RemoveArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
public class RemoveArticleController {
    @Autowired
    private RemoveArticleService removeArticleService;
    @DeleteMapping("/api/user/article/remove/")
    public Map<String, String> removeArticle(@RequestParam Map<String, String> data) {
        return removeArticleService.removeArticle(data);
    }
}
