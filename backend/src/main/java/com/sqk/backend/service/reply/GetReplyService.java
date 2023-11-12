package com.sqk.backend.service.reply;

import com.sqk.backend.pojo.Reply;

import java.util.List;
import java.util.Map;

public interface GetReplyService {
    List<Reply> getReply(Map<String, String> data);
}
