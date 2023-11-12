package com.sqk.backend.controller.reply;

import com.sqk.backend.service.reply.AddReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
public class AddReplyController {
    @Autowired
    private AddReplyService addReplyService;

    @PostMapping("/reply/add/")
    public Map<String, String> addReply(@RequestParam Map<String, String> data) {
        return addReplyService.addReply(data);
    }
}
