package com.project.basic.controller;

import com.project.basic.domain.User;
import com.project.basic.service.UserService;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Arrays;
import java.util.Map;
import java.util.logging.Logger;
import java.util.stream.Stream;

@Controller
public class BasicController {
    private static final Logger LOGGER = Logger.getLogger(BasicController.class.getName());
    private final UserService userService;

    public BasicController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/")
    public String greeting(
            Map<String, Object> model) {

        return "appHome";
    }

    @GetMapping("/app")
    public String keysMainPage(
            @AuthenticationPrincipal User user,
            Model model) {

        model.addAttribute("_date1", userService
                .findByRoomNumber(user.getRoomNumber())
                .getDate());

//        Stream.of(userService.findAll())

        model.addAttribute("timeUsersList", userService.findAll());

        return "timer_page";
    }

    @PostMapping("/ttime")
    public String keysTimeUrl(
            Model model,
            @AuthenticationPrincipal User user,
            @RequestParam int nrPokoju,
            @RequestParam("time_to") String date) {

        if("admin".equals(user.getUsername())) {
            if (userService.findByRoomNumber(nrPokoju) == null || userService.findByRoomNumber(nrPokoju).getRoomNumber() != nrPokoju)
                model.addAttribute("userRoomError", "Can't find this room");

            userService.addUserTime(nrPokoju, date);
        }

        return "timer_page";
    }
}