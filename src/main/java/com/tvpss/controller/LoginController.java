package com.tvpss.controller;

import com.tvpss.model.User;
import com.tvpss.model.UserRoles;
import com.tvpss.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    public String authenticateUser(@RequestParam("email") String email,
                                    @RequestParam("password") String password,
                                    RedirectAttributes redirectAttributes) {
        User user = userService.authenticateUser(email, password);

        if (user != null) {
            switch (user.getRole()) {
                case UserRoles.STATE_ADMIN:
                    redirectAttributes.addFlashAttribute("message", "Welcome State Admin!");
                    return "redirect:/adminstate/dashboard";

                case UserRoles.ADMIN_SCHOOL:
                    redirectAttributes.addFlashAttribute("message", "Welcome School Admin!");
                    return "redirect:/adminschool/reviewApplicant";

                case UserRoles.TEACHER:
                    redirectAttributes.addFlashAttribute("message", "Welcome Teacher!");
                    return "redirect:/teacher/dashboard";

                case UserRoles.STUDENT:
                    redirectAttributes.addFlashAttribute("message", "Welcome Student!");
                    return "redirect:/student/dashboard";

                default:
                    redirectAttributes.addFlashAttribute("errorMessage", "Invalid role.");
                    return "redirect:/login";
            }
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "Invalid username or password.");
            return "redirect:/login";
        }
    }
}
