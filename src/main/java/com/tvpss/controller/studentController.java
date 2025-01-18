package com.tvpss.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tvpss.service.AdminSchoolService;
import com.tvpss.service.CrewService;
import com.tvpss.service.DistrictService;
import com.tvpss.service.SchoolService;
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
	
	@Autowired
	private DistrictService districtService;
	
	@Autowired
	private SchoolService schoolService;
	
	@Autowired
	private AdminSchoolService adminSchoolService;
	
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
 public String showRegistrationForm(Model model) {
     model.addAttribute("crew", new Crew());
     List <District> district = districtService.getAllDistrict();
     model.addAttribute("district", district);
     return "student/CrewRegistration";
 }

 @PostMapping("/student/crewRegistration")
 public String processRegistration(@ModelAttribute("crew") Crew crew,
                                 BindingResult result,
                                 HttpSession session) {
	 System.out.println("Received registration request"); // Debug log
	    System.out.println("School Name: " + crew.getSchoolName()); // Debug log
	    
	    if (result.hasErrors()) {
	        System.out.println("Form has errors: " + result.getAllErrors()); // Debug log
	        return "student/CrewRegistration";
	    }
     if (result.hasErrors()) {
         return "student/CrewRegistration";
     }
     
     // Get userID from session
     int userID = (int) session.getAttribute("userID");
     
     // Initialize User if null
     if (crew.getUser() == null) {
         crew.setUser(new User());
     }
     
     // Set userID in Crew's User object
     crew.getUser().setUserId(userID);
     crew.setApplicationStatus("pending");
     crew.setRole("Student");
     
     // Get AdminSchool based on school name from the form
     String selectedSchoolName = crew.getSchoolName(); // This will come from the form
     AdminSchool adminSchool = adminSchoolService.getAdminSchoolBySchoolName(selectedSchoolName);
     
     if (adminSchool != null) {
         // Set the found AdminSchool to the crew
         crew.setAdminSchool(adminSchool);
     } else {
         // Handle case where AdminSchool is not found
         result.rejectValue("schoolName", "error.schoolName", "School not found in admin database");
         return "student/CrewRegistration";
     }
     
     try {
         crewservice.CrewRegistration(crew);
         return "redirect:/student/crewTask";
     } catch (Exception e) {
         e.printStackTrace();
         return "student/CrewRegistration";
     }
 }
 @GetMapping("/student/getSchoolsByDistrict")
 @ResponseBody
 public ResponseEntity<?> getSchoolsByDistrict(@RequestParam(required = true) Long districtID) {
     try {
         if (districtID == null) {
             return ResponseEntity.badRequest().body("District ID cannot be null");
         }
         
         List<School> schools = schoolService.getSchoolByDistrict(districtID);
         
         if (schools.isEmpty()) {
             return ResponseEntity.ok(Collections.emptyList());
         }
         
         return ResponseEntity.ok(schools);
     } catch (Exception e) {
         return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
             .body("Error fetching schools: " + e.getMessage());
     }
 }



}
