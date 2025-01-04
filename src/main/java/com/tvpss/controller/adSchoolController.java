package com.tvpss.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tvpss.model.Crew;
import com.tvpss.service.CrewService;

@Controller
public class adSchoolController {

	@Autowired
	private CrewService crewService;

	@GetMapping("/adminschool/dashboard")
	public String showDashboard(Model model) {
	    List<Crew> pendingApplicants = crewService.getPendingApplicants();
	    model.addAttribute("pendingApplicants", pendingApplicants);
	    model.addAttribute("pageTitle", "Welcome Admin School!");

	    return "adminschool/dashboard"; // Ensure this JSP exists and matches the path
	}


//	@GetMapping("/adminschool/reviewApplicant")
//	public String showReviewApplicantPage(@RequestParam(value = "crewID", required = true) Integer crewID,
//			Model model) {
//		if (crewID == null) {
//			model.addAttribute("errorMessage", "Invalid or missing applicant ID.");
//			return "errorPage";
//		}
//
//		Crew applicant = crewService.getApplicantDetails(crewID);
//		if (applicant == null) {
//			model.addAttribute("errorMessage", "Applicant not found.");
//			return "errorPage";
//		}
//
//		model.addAttribute("applicant", applicant);
//		return "adminschool/reviewApplicant";
//	}

	@GetMapping("/adminschool/reviewApplicant")
	public String reviewApplicant(
	        @RequestParam(value = "crewID", required = false) Integer crewID,
	        @RequestParam(value = "action", required = false) String action,
	        Model model) {

		 List<Crew> pendingApplicants = crewService.getPendingApplicants();
		    model.addAttribute("pendingApplicants", pendingApplicants);
		    model.addAttribute("pageTitle", "Welcome Admin School!");

	    return "adminschool/reviewApplicant";
	}

}
