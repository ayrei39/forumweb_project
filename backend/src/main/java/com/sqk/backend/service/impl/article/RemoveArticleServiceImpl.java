package com.sqk.backend.service.impl.article;

import com.sqk.backend.mapper.ArticleMapper;
import com.sqk.backend.pojo.Article;
import com.sqk.backend.pojo.User;
import com.sqk.backend.service.article.RemoveArticleService;
import com.sqk.backend.service.impl.utils.UserDetailsImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class RemoveArticleServiceImpl implements RemoveArticleService {
    @Autowired
    private ArticleMapper articleMapper;
    @Override
    public Map<String, String> removeArticle(Map<String, String> data) {
        UsernamePasswordAuthenticationToken authenticationToken =
                (UsernamePasswordAuthenticationToken) SecurityContextHolder.getContext().getAuthentication();
        UserDetailsImpl loginUser = (UserDetailsImpl) authenticationToken.getPrincipal();
        User user = loginUser.getUser();

        int article_id = Integer.parseInt(data.get("article_id"));
        Article article = articleMapper.selectById(article_id);
        Map<String, String> map = new HashMap<>();

        if (article == null) {
            map.put("error_message", "article不存在或已被删除");
            return map;
        }

        if (!article.getUserId().equals(user.getId())) {
            map.put("error_message", "没有权限删除该article");
            return map;
        }

        articleMapper.deleteById(article_id);

        map.put("error_message", "success");
        return map;
    }
}
