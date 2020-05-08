package com.project.basic.controller;

import com.project.basic.domain.User;
import net.sf.json.JSONObject;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.logging.Logger;

@Controller
public class BasicController {
    private static final Logger LOGGER = Logger.getLogger(BasicController.class.getName());

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "appHome";
    }

    @GetMapping("/app")
    public String keysMainPage(
            Model model) {
        return "timer_page";
    }

    @PostMapping("/asd")
    public String keysTimeUrl(
            Model model,
            @AuthenticationPrincipal User user,
            @RequestParam String nrPokoju,
            @RequestParam("time_to") String date) throws ParseException {


        Date date__ = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm").parse(date);

        LOGGER.warning("nrPokoju --> " + nrPokoju);
//        LOGGER.warning("time_to --> " + date.toString());
        LOGGER.warning("time_to --> " + date);
//        LOGGER.warning("time_to --> " + date.getTime());
        LOGGER.warning("time_to --> " + date__);

        model.addAttribute("_date1", date);
        model.addAttribute("_user", user.getUsername());
        return "timer_page";

    }
}