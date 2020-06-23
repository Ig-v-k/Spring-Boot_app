package com.project.basic.controller;

import com.project.basic.component.PusherWrapperResponse;
import com.project.basic.domain.User;
import com.project.basic.service.UserService;
import com.pusher.rest.Pusher;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.ParseException;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.stream.Collectors;

@Controller
@AllArgsConstructor
@Log
public class BasicController {
//
//    @Autowired
//    private final PusherWrapperResponse pusherWrapperResponse;

    @Autowired
    private final UserService userService;

    //    path:http://localhost:8080/*
    @GetMapping("/")
    public String greeting(
            Model model) {

//        pusherWrapperResponse.setPusherWrapperTrigger("my-channel", "my-event", Collections.singletonMap("message", "Hello World"));

        getOnlyNotNull(model);

        return "appHome";
    }

    //    path:http://localhost:8080/app
    @GetMapping("/app")
    public String keysMainPage() {
        return "timer_page";
    }

    //    path:http://localhost:8080/app/{userRoomNumber}
    @GetMapping("/app/{userRoomNumber}")
    public String keysMainPage(
            Model model,
            @PathVariable int userRoomNumber) {

        model.addAttribute("userRoomNumberForEdit", userRoomNumber);

        return "timer_page";
    }

    //    path:http://localhost:8080/ttime
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