package com.tvpss.controller;

import com.tvpss.model.User;
import com.tvpss.model.UserRoles;
import com.tvpss.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class LoginController {

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String loginPage() {
        return "login"; // Display login.jsp
    }
    @PostMapping("/authenticate")
    public ModelAndView authenticateUser(@RequestParam("email") String email,
                                         @RequestParam("password") String password) {
        ModelAndView modelAndView = new ModelAndView();
        User user = userService.authenticateUser(email, password);

        if (user != null) {
            switch (user.getRole()) {
                case UserRoles.STATE_ADMIN:
                    modelAndView.setViewName("/adminstate/dashboard");
                    modelAndView.addObject("message", "Welcome Teacher!");                    
                    break;
                case UserRoles.ADMIN_SCHOOL:
                	 modelAndView.setViewName("/adminschool/dashboard");
                     modelAndView.addObject("message", "Welcome Teacher!");   

                    break;
                case UserRoles.TEACHER:
                    modelAndView.setViewName("teacherPage");
                    modelAndView.addObject("message", "Welcome Teacher!");
                    break;
                case UserRoles.STUDENT:
                    modelAndView.setViewName("studentPage");
                    modelAndView.addObject("message", "Welcome Student!");
                    break;
                default:
                    modelAndView.setViewName("login");
                    modelAndView.addObject("errorMessage", "Invalid role.");
            }
        } else {
            modelAndView.setViewName("login");
            modelAndView.addObject("errorMessage", "Invalid username or password.");
        }

        return modelAndView;
    }

}
