package com.project.basic.controller;

import com.project.basic.domain.User;
import com.project.basic.domain.dto.CaptchaResponseDto;
import com.project.basic.service.UserService;
import lombok.extern.java.Log;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import javax.validation.Valid;
import java.util.Collections;
import java.util.Map;

@Controller
@Log
@PropertySource("classpath:application.properties")
public class RegistrationController implements com.project.basic.utils.StringUtils {

    private final UserService userService;

    @Autowired
    private RestTemplate restTemplate;

    public RegistrationController(UserService userService) {
        this.userService = userService;
    }

    @Value("${recaptcha.secret}")
    private String recaptchaString;

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(
            @RequestParam("password2") String passwordConfirmation,
            @RequestParam("g-recaptcha-response") String captchaResponse,
            @Valid User user,
            BindingResult bindingResult,
            Model model) {

        String url = String.format(CAPTCHA_URL, recaptchaString, captchaResponse);
        CaptchaResponseDto response = restTemplate.postForObject(url, Collections.emptyList(), CaptchaResponseDto.class);

        if(!response.isSuccess())
            model.addAttribute("captchaError", "Fill captcha");

        boolean isConfirmEmpty = StringUtils.isEmpty(passwordConfirmation);
        if(isConfirmEmpty) {
            model.addAttribute("password2Error", "Password confirmation can't be empty");
        }

        if (user.getPassword() != null && !user.getPassword().equals(passwordConfirmation)) {
            model.addAttribute("passwordError", "Passwords are different!");
        }

        if (isConfirmEmpty || bindingResult.hasErrors() || !response.isSuccess()) {
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);

            model.mergeAttributes(errors);

            return "registration";
        }

        if(userService.findByCardNumber(user.getCardNumber()) != null) {
            model.addAttribute("cardnumberError", "User with this card number is exist");
            return "registration";
        }

        if(userService.findByRoomNumber(user.getRoomNumber()) != null) {
            model.addAttribute("roomnumberError", "User with this room number is exist");
            return "registration";
        }

        if (!userService.addUser(user)) {
            model.addAttribute("usernameError", "User exists!");
            return "registration";
        }

        return "redirect:/login";
    }

    @GetMapping("/activate/{code}")
    public String activate(
            Model model,
            @PathVariable String code) {

        boolean isActivated = userService.activateUser(code);

        if (isActivated) {
            model.addAttribute("message", "User successfully activated");
        } else {
            model.addAttribute("message", "Activation code is not found!");
        }

        return "login";
    }
}