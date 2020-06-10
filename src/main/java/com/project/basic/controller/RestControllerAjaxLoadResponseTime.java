package com.project.basic.controller;

import com.project.basic.domain.dto.UsersDto;
import com.project.basic.exeption.ValidationException;
import com.project.basic.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.util.List;

@RestController
@RequestMapping("/users")
@AllArgsConstructor
@Log
@CrossOrigin
public class RestControllerAjaxLoadResponseTime {

    private final UserService userService;

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public UsersDto saveUsers(
            @RequestBody UsersDto usersDto) throws ValidationException, ParseException {
        log.info("Handling save users: " + usersDto);
        return userService.saveUser(usersDto);
    }

    @GetMapping("/findAll")
    public List<UsersDto> findAllUsers() {
        log.info("Handling find all users request");
        return userService.findOnlyUsersAllTest();
    }
}
