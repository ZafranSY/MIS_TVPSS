package com.tvpss.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tvpss.service.CrewService;
import com.tvpss.model.*;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class studentController
 */
@Controller
public class studentController
{
	@Autowired
	private CrewService crewservice;
	
 @GetMapping("/student/dashboard")
 public String showDashboard()
 {
	 return "student/dashboard";
 }
 //S
 @GetMapping("/student/crewTask")
 public String showCrewTask(HttpSession session) {
     // Retrieve UserID from the session
     Integer userID = (Integer) session.getAttribute("userID");

     if (userID == null) {
         // Redirect to login if UserID is missing
         return "redirect:/login";
     }

     // Check if the user has a Crew record
     Crew crew = crewservice.getCrewValidationByUserID(userID);

     if (crew == null) {
         // Redirect to Encourage Registration page if no CrewID is found
         return "student/encourageRegistration";
     }

     // Show Crew Task page if CrewID exists
     return "student/crewTask";
 }
 @GetMapping("/student/crewRegistration")
 public String showCrewRegistration()
 {
	 
	 return "student/CrewRegistration";
 }


}
