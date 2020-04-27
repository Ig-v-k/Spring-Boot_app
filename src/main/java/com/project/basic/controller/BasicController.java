package com.project.basic.controller;

import com.project.basic.domain.Message;
import com.project.basic.domain.User;
import com.project.basic.repos.MessageRepo;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class BasicController {

    private final MessageRepo messageRepo;

    public BasicController(MessageRepo messageRepo) {
        this.messageRepo = messageRepo;
    }

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "appHome";
    }

    @GetMapping("/app")
    public String app(@RequestParam(required = false, defaultValue = "") String filter, Model model) {
        Iterable<Message> messages = messageRepo.findAll();

        if (filter != null && !filter.isEmpty())
            messages = messageRepo.findByText(filter);
        else
            messages = messageRepo.findAll();

        model.addAttribute("messages", messages);
        model.addAttribute("filter", filter);

        return "app";
    }

    @PostMapping("/app")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String text,
            @RequestParam String tag, Map<String, Object> model) {
        Message message = new Message(text, tag, user);
        messageRepo.save(message);
        Iterable<Message> messages = messageRepo.findAll();
        model.put("messages", messages);
        return "app";
    }
}
