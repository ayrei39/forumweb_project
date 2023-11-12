package com.sqk.backend.controller.reply;

import com.sqk.backend.pojo.Reply;
import com.sqk.backend.service.reply.GetReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
public class GetReplyController {
    @Autowired
    private GetReplyService getReplyService;

    @GetMapping("/reply/list/")
    public List<Reply> getReply(@RequestParam Map<String, String> data) {
        return getReplyService.getReply(data);
    }
}
