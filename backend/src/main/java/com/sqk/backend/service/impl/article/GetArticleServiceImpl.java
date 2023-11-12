package com.sqk.backend.service.impl.article;

import com.sqk.backend.mapper.ArticleMapper;
import com.sqk.backend.pojo.Article;
import com.sqk.backend.service.article.GetArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

@Service
public class GetArticleServiceImpl implements GetArticleService {
    @Autowired
    private ArticleMapper articleMapper;

    @Override
    public Map<String, String> getArticle(String articleId) {

        int article_id = Integer.parseInt(articleId);
        Article article = articleMapper.selectById(article_id);
        Map<String, String> map = new HashMap<>();
        map.put("id", article.getId().toString());
        map.put("title", article.getTitle());
        map.put("content", article.getContent());
        map.put("kind", article.getKind());
        map.put("userId", article.getUserId().toString());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        map.put("modifytime", sdf.format(article.getModifytime()));
        return map;
    }
}
