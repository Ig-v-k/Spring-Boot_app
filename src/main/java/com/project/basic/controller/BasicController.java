package com.project.basic.controller;

import com.project.basic.domain.User;
import com.project.basic.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.ParseException;
import java.time.LocalDateTime;
import java.util.stream.Collectors;

@Controller
@AllArgsConstructor
@Log
public class BasicController {

    private final UserService userService;

    @GetMapping("/")
    public String greeting(
            Model model) {

        getOnlyNotNull(model);

        return "appHome";
    }

    @GetMapping("/app")
    public String keysMainPage(
            Model model) {

        getOnlyNotNull(model);

        return "timer_page";
    }

    @PostMapping("/ttime")
    public String keysTimeUrl(
            Model model,
            @AuthenticationPrincipal User user,
            @RequestParam("roomNumberForm") int valueRoomNumberForm,
            @RequestParam("time_to") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime date) throws ParseException {
        if("admin".equals(user.getUsername())) {
            if (userService.findByRoomNumber(valueRoomNumberForm) == null || userService.findByRoomNumber(valueRoomNumberForm).getRoomNumber() != valueRoomNumberForm) {
                model.addAttribute("userRoomError", "Can't find this room");
                return "timer_page";
            }
            userService.addUserTime(valueRoomNumberForm, date);
        }

        model.addAttribute("userRoomSuccess", "The time by success has been added!");

        return "timer_page";
    }

    private void getOnlyNotNull(Model model) {
        model.addAttribute("timeUsersList", userService
                .findOnlyUsersAll()
                .stream().filter(user1 -> user1.getDate() != null).collect(Collectors.toList()));
    }
}