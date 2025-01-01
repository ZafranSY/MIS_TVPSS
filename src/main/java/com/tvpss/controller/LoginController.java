package com.tvpss.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class LoginController {

    @RequestMapping("/login")
    public String loginPage() {
        // Display the login page
        return "login"; // Refers to the login.jsp file
    }

    @PostMapping("/authenticate")
    public ModelAndView authenticateUser(@RequestParam("username") String username,
                                         @RequestParam("password") String password) {
        ModelAndView modelAndView = new ModelAndView();

        // Simulated role determination (replace this with your authentication logic)
        String role = determineUserRole(username, password);

        switch (role) {
            case "admin":
                modelAndView.setViewName("adminPage");
                modelAndView.addObject("message", "Welcome Admin!");
                break;
            case "coach":
                modelAndView.setViewName("coachPage");
                modelAndView.addObject("message", "Welcome Coach!");
                break;
            case "trainee":
                modelAndView.setViewName("traineePage");
                modelAndView.addObject("message", "Welcome Trainee!");
                break;
            default:
                modelAndView.setViewName("errorPage");
                modelAndView.addObject("errorMessage", "Invalid username or password.");
                break;
        }
        return modelAndView;
    }

    // Simulated role determination logic (replace with actual authentication logic)
    private String determineUserRole(String username, String password) {
        // Replace this with actual logic (e.g., database lookup or authentication service)
        if ("admin".equals(username) && "adminpass".equals(password)) {
            return "admin";
        } else if ("coach".equals(username) && "coachpass".equals(password)) {
            return "coach";
        } else if ("trainee".equals(username) && "traineepass".equals(password)) {
            return "trainee";
        } else {
            return "invalid";
        }
    }
}
