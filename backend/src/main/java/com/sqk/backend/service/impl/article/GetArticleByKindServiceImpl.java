package com.sqk.backend.service.impl.article;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sqk.backend.mapper.ArticleMapper;
import com.sqk.backend.pojo.Article;
import com.sqk.backend.service.article.GetArticleByKindService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class GetArticleByKindServiceImpl implements GetArticleByKindService {
    @Autowired
    private ArticleMapper articleMapper;

    @Override
    public List<Article> getArticleByKind(Map<String, String> data) {
        String kind = data.get("kind");

        if(kind.equals("all")){
            List<Article> list =  articleMapper.selectList(null);
            return list;
        }

        QueryWrapper<Article> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("kind", kind);

        return articleMapper.selectList(queryWrapper);
    }
}
