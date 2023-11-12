package com.sqk.backend.controller.article;

import com.sqk.backend.pojo.Article;
import com.sqk.backend.service.article.GetArticleByKindService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
public class GetArticleByKindController {
    @Autowired
    private GetArticleByKindService getArticleByKindService;
    @GetMapping("/api/article/kind/")
    public List<Article> getListByKind(@RequestParam Map<String, String> data) {
        return getArticleByKindService.getArticleByKind(data);
    }
}
