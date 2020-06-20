package com.project.basic.controller;

import com.project.basic.domain.User;
import com.project.basic.domain.dto.UsersDto;
import com.project.basic.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("/ajax")
@AllArgsConstructor
@Log
@CrossOrigin
public class RestControllerAjaxLoadResponseTime {

    private final UserService userService;

/*
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public UsersDto saveUsers(
            @RequestBody UsersDto usersDto) throws ValidationException, ParseException {
        log.info("Handling save users: " + usersDto);
        return userService.saveUser(usersDto);
    }
*/

    @PostMapping(value = "/ttimeAjax", produces = "application/json")
    public boolean setTimerOfTheForm(
            @AuthenticationPrincipal User user,
            @RequestBody UsersDto usersDto) throws ParseException{
        if("admin".equals(user.getUsername())) {
            if (userService.findByRoomNumber(usersDto.getRoomNumber()) == null ||
                    userService.findByRoomNumber(usersDto.getRoomNumber()).getRoomNumber() != usersDto.getRoomNumber()) {
//                httpServletResponse.getWriter().println(false);
//                httpServletResponse.flushBuffer();
                log.info("return: <FALSE>");
                return false;
            }
            userService.addUserTime(usersDto.getRoomNumber(), LocalDateTime.parse(usersDto.getDate()));
        }
//        httpServletResponse.getWriter().println(true);
//        httpServletResponse.flushBuffer();
        log.info("return: <TRUE>");
        return true;

    }

    @GetMapping("/findAll")
    public List<UsersDto> findAllUsers() {
        log.info("Handling find all users request");
        return userService.findOnlyUsersAllTest();
    }
}
