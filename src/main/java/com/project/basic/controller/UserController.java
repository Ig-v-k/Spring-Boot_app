package com.project.basic.controller;

import com.project.basic.domain.Role;
import com.project.basic.domain.User;
import com.project.basic.service.UserService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    // /user : GET
    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping
    public String userList(
            Model model) {

        model.addAttribute("users", userService.findAll());

        return "userList";
    }

    // /user : POST
    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping
    public String userSave(
            @RequestParam String username,
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user) {

        userService.saveUser(user, username, form);

        return "redirect:/user";
    }

    // /user{username} : GET
    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("{username}")
    public String userEditForm(
            @PathVariable String username,
            Model model) {

        model.addAttribute("user", userService.findByUsername(username));
        model.addAttribute("roles", Role.values());

        return "userEdit";
    }

    // /user{username}/{userId} : GET
    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("{username}/{userId}")
    public String userDelete(
            @PathVariable String username,
            @PathVariable Long userId,
            Model model) {

        userService.deleteById(userId);

        model.addAttribute("users", userService.findAll());

        return "userList";
    }

    // /user/profile : GET
//    @GetMapping("profile")
//    public String userProfile(
//            Model model,
//            @AuthenticationPrincipal User user) {
//
//        model.addAttribute("username", user.getUsername());
//        model.addAttribute("email", user.getEmail());
//
//        return "profile";
//    }

    // /user/profile : POST
//    @PostMapping("profile")
//    public String userUpdateProfile(
//            @AuthenticationPrincipal User user,
//            @RequestParam String password,
//            @RequestParam String email) {
//
//        userService.updateProfile(user, password, email);
//
//        return "redirect:/user/profile";
//    }
}
