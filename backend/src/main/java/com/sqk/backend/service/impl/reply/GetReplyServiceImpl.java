package com.sqk.backend.service.impl.reply;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sqk.backend.mapper.ReplyMapper;
import com.sqk.backend.pojo.Reply;
import com.sqk.backend.service.reply.GetReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class GetReplyServiceImpl implements GetReplyService {
    @Autowired
    private ReplyMapper replyMapper;

    @Override
    public List<Reply> getReply(Map<String, String> data) {
        int article_id = Integer.parseInt(data.get("article_id"));

        QueryWrapper<Reply> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("article_id", article_id);
        return replyMapper.selectList(queryWrapper);
    }
}
