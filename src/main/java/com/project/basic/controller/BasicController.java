package com.project.basic.controller;

import com.project.basic.domain.Message;
import com.project.basic.domain.User;
import com.project.basic.repos.MessageRepo;
import com.project.basic.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class BasicController {

    @Autowired
    private MessageRepo messageRepo;

    @GetMapping("/")
    public String app(Map<String, Object> model) {
        return "appHome";
    }

    @GetMapping("/app")
    public String listUser(Map<String, Object> model) {
        Iterable<Message> messages = messageRepo.findAll();
        model.put("messages", messages);
        return "app";
    }

    @PostMapping("/app")
    public String addUser(@RequestParam String text, @RequestParam String tag, Map<String, Object> model) {
        Message message= new Message(text, tag);
        messageRepo.save(message);
        Iterable<Message> messages = messageRepo.findAll();
        model.put("messages", messages);
        return "app";
    }

    @PostMapping("filter")
    public String filterUser(@RequestParam String filter, Map<String, Object> model) {
        Iterable<Message> messages;
        if (filter != null && !filter.isEmpty()) {
            messages = messageRepo.findByTag(filter);
        } else {
            messages = messageRepo.findAll();
        }
        model.put("messages", messages);
        return "app";
    }
}
