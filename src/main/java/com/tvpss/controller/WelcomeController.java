package com.tvpss.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WelcomeController {

    @GetMapping("/")
    public String showLandingPage(Model model) {
        model.addAttribute("title", "TVPSS - Management Information System");
        model.addAttribute("description", "Welcome to the TVPSS Management Information System!");
        return "landingPage"; // Refers to /WEB-INF/views/landingPage.jsp
    }
}
