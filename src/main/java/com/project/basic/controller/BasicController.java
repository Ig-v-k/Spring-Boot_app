package com.project.basic.controller;

import com.project.basic.domain.User;
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
    private UserRepo userRepo;

    @GetMapping("/app")
    public String app(@RequestParam(name="name", required=false, defaultValue="World") String name, Map<String, Object> model) {
        model.put("name", name);
        return "appHome";
    }

    @GetMapping
    public String listUser(Map<String, Object> model) {
        Iterable<User> users = userRepo.findAll();
        model.put("users", users);
        return "main";
    }

    @PostMapping
    public String addUser(@RequestParam String userName, @RequestParam String password, Map<String, Object> model) {
        User user= new User(userName, password);
        userRepo.save(user);
        Iterable<User> users = userRepo.findAll();
        model.put("users", users);
        return "main";
    }

    @PostMapping("filter")
    public String filterUser(@RequestParam String filter, Map<String, Object> model) {
        Iterable<User> users;
        if (filter != null && !filter.isEmpty()) {
            users = userRepo.findByUserName(filter);
        } else {
            users = userRepo.findAll();
        }
        model.put("users", users);
        return "main";
    }
}
