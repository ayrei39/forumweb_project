package com.sqk.backend.service.article;

import java.util.Map;

public interface GetArticleService {
    Map<String, String> getArticle(String articleId);
}
