package com.sqk.backend.service.impl.reply;

import com.sqk.backend.mapper.ReplyMapper;
import com.sqk.backend.pojo.Reply;
import com.sqk.backend.pojo.User;
import com.sqk.backend.service.impl.utils.UserDetailsImpl;
import com.sqk.backend.service.reply.AddReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Service
public class AddReplyServiceImpl implements AddReplyService {
    @Autowired
    private ReplyMapper replyMapper;

    @Override
    public Map<String, String> addReply(Map<String, String> data) {
        UsernamePasswordAuthenticationToken authenticationToken =
                (UsernamePasswordAuthenticationToken) SecurityContextHolder.getContext().getAuthentication();
        UserDetailsImpl loginUser = (UserDetailsImpl) authenticationToken.getPrincipal();
        User user = loginUser.getUser();

        int articleId = Integer.parseInt(data.get("articleId"));
        String content = data.get("content");

        Map<String, String> map = new HashMap<>();

        if (content == null || content.length() == 0) {
            map.put("error_message", "content不能为空");
            return map;
        }

        if (content.length() > 10000) {
            map.put("error_message", "content超出字数限制");
            return map;
        }

        Date now = new Date();
        Reply reply = new Reply(null, user.getId(), articleId, content, now);

        replyMapper.insert(reply);
        map.put("error_message", "success");

        return map;
    }
}
