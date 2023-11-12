package com.sqk.backend.service.impl.article;

import com.sqk.backend.mapper.ArticleMapper;
import com.sqk.backend.pojo.Article;
import com.sqk.backend.pojo.User;
import com.sqk.backend.service.article.AddArticleService;
import com.sqk.backend.service.impl.utils.UserDetailsImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Service
public class AddArticleServiceImpl implements AddArticleService {

    @Autowired
    private ArticleMapper articleMapper;

    @Override
    public Map<String, String> addArticle(Map<String, String> data) {
        UsernamePasswordAuthenticationToken authenticationToken =
                (UsernamePasswordAuthenticationToken) SecurityContextHolder.getContext().getAuthentication();
        UserDetailsImpl loginUser = (UserDetailsImpl) authenticationToken.getPrincipal();
        User user = loginUser.getUser();

        String title = data.get("title");
        String content = data.get("content");
        String kind = data.get("kind");

        Map<String, String> map = new HashMap<>();

        if (title == null || title.length() == 0) {
            map.put("error_message", "标题不能为空");
            return map;
        }

        if (title.length() > 100) {
            map.put("error_message", "标题长度不能大于100");
            return map;
        }


        if (content == null || content.length() == 0) {
            map.put("error_message", "content不能为空");
            return map;
        }

        if (content.length() > 10000) {
            map.put("error_message", "content超出字数限制");
            return map;
        }

        if (kind == null || kind.length() == 0) {
            map.put("error_message", "kind不能为空");
            return map;
        }

        Date now = new Date();
        Article article = new Article(null, user.getId(), title, content, kind, now, now);

        articleMapper.insert(article);
        map.put("error_message", "success");
        map.put("id",article.getId().toString());
        return map;
    }
}
