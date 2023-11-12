package com.sqk.backend.service.impl.article;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sqk.backend.mapper.ArticleMapper;
import com.sqk.backend.pojo.Article;
import com.sqk.backend.service.article.GetListByUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class GetListByUserServiceImpl implements GetListByUserService {
    @Autowired
    private ArticleMapper articleMapper;

    @Override
    public List<Article> getListByUser(Map<String, String> data) {

        int user_id = Integer.parseInt(data.get("user_id"));
        QueryWrapper<Article> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_id", user_id);

        return articleMapper.selectList(queryWrapper);
    }
}
