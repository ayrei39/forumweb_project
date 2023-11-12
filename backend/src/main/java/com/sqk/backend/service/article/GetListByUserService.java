package com.sqk.backend.service.article;

import com.sqk.backend.pojo.Article;

import java.util.List;
import java.util.Map;

public interface GetListByUserService {
    List<Article> getListByUser(Map<String, String> data);
}
