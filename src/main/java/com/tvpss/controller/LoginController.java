package com.tvpss.controller;

import com.tvpss.model.AdminSchool;
import com.tvpss.model.User;
import com.tvpss.model.UserRoles;
import com.tvpss.service.AdminSchoolService;
import com.tvpss.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.servlet.http.HttpSession;
@Controller
@RequestMapping("/")
public class LoginController {

    @Autowired
    private UserService userService;
    
    @Autowired 
    private AdminSchoolService adminSchoolService;

    @RequestMapping("/login")
    public String loginPage() {
    	
        return "login"; // Display login.jsp
    }

    @PostMapping("/authenticate")
    public String authenticateUser(@RequestParam("email") String email,
                                    @RequestParam("password") String password,
                                    HttpSession session,
                                    RedirectAttributes redirectAttributes) {
        User user = userService.authenticateUser(email, password);

        if (user != null) {
            session.setAttribute("userID", user.getUserId());
            session.setAttribute("username", user.getName());
            session.setAttribute("userRole", user.getRole());
            session.setAttribute("userEmail", user.getEmail());
            if (user.getRole() == UserRoles.ADMIN_SCHOOL) {
                // Fetch the adminSchoolID based on the logged-in user's ID
                Integer adminSchoolID = adminSchoolService.findSchoolAdminIDByUserId(user.getUserId());
                if (adminSchoolID != null) {
                    session.setAttribute("adminSchoolID", adminSchoolID);
                    redirectAttributes.addFlashAttribute("message", "Welcome School Admin!");
                    return "redirect:/adminschool/dashboard";
                } else {
                    redirectAttributes.addFlashAttribute("error", "School Admin ID not found!");
                    return "redirect:/login";
                }
            }

            // Handle other roles (e.g., State Admin, etc.)
            if (user.getRole() == UserRoles.STATE_ADMIN) {
                redirectAttributes.addFlashAttribute("message", "Welcome State Admin!");
                return "redirect:/adminstate/dashboard";
            }
            
            else if (user.getRole() == UserRoles.TEACHER) {
                redirectAttributes.addFlashAttribute("message", "Welcome State Admin!");
                return "redirect:/teacher/dashboard";
            }else
            {
            	redirectAttributes.addFlashAttribute("message", "Welcome State Admin!");
                return "redirect:/student/dashboard";
            }
        }

        // If authentication fails
        redirectAttributes.addFlashAttribute("error", "Invalid email or password!");
        return "redirect:/login";
    }
    


}
