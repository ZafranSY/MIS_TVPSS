package com.tvpss.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpSession;
import com.tvpss.model.Crew;
import com.tvpss.model.crewTask;
import com.tvpss.service.CrewService;
import com.tvpss.service.crewTaskService;

@Controller
public class adSchoolController {

	@Autowired
	private CrewService crewService;
	
	@Autowired
	private crewTaskService crewTaskService;

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
	public String reviewApplicant(@RequestParam(value = "crewID", required = false) Integer crewID,
	                               @RequestParam(value = "action", required = false) String action,
	                               HttpSession session,
	                               Model model) {
	    Integer adminSchoolID = (Integer) session.getAttribute("adminSchoolID");

	    if (adminSchoolID != null) {
	        // Fetch pending and approved applicants by school
	        List<Crew> pendingApplicants = crewService.getPendingApplicantsbySchool(adminSchoolID);
	        List<Crew> approvedApplicants = crewService.getApprovedApplicantsbySchool(adminSchoolID);
	        
	        if(pendingApplicants == null)
	        {
		        model.addAttribute("testingpendingApplicants", "pendingApplicants is null !");

	        }
	        model.addAttribute("pendingApplicants", pendingApplicants);
	        model.addAttribute("approvedApplicants", approvedApplicants);
	        model.addAttribute("pageTitle", "Welcome Admin School!");
	        return "adminschool/reviewApplicant";
	    } else {
	        model.addAttribute("error", "Unauthorized access!");
	        return "errorPage";
	    }
	}
	

	@GetMapping(value = "/adminschool/getApplicantDetails", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, Object> getApplicantDetails(@RequestParam("crewID") int crewID) {
	    Crew crew = crewService.getApplicantDetails(crewID);
	    Map<String, Object> response = new HashMap<>();

	    if (crew != null) {
	        response.put("name", crew.getUser().getName());
	        response.put("email", crew.getUser().getEmail());
	        response.put("role", crew.getRole());
	        response.put("address", crew.getAddress());
	        response.put("schoolName", crew.getSchoolName());
	        response.put("applicationStatus", crew.getApplicationStatus());
	    } else {
	        response.put("error", "Crew not found");
	    }

	    return response;
	}
	@PostMapping("/adminschool/updateApplicationStatus")
    @Transactional
    public ResponseEntity<String> updateApplicationStatus(@RequestParam("crewID") int crewID,
                                                          @RequestParam("status") String status) {
        try {
            crewService.updateApplicationStatus(crewID, status);
            return ResponseEntity.ok("Application status updated successfully.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                                 .body("Failed to update application status.");
        }
    }
	@GetMapping("/adminschool/crewTask")
	public String showCrewtask(@RequestParam(value = "crewID", required = false) Integer crewID,
            @RequestParam(value = "action", required = false) String action,
            HttpSession session,
            Model model) {
		
		 Integer adminSchoolID = (Integer) session.getAttribute("adminSchoolID");

		    if (adminSchoolID != null) {
		        // Fetch pending and approved applicants by school
		        List<Crew> AllApplicantsbyschool = crewTaskService.getAllApplicantsbySchool(adminSchoolID);
		        
		        model.addAttribute("AllApplicantsbyschool", AllApplicantsbyschool);
		        model.addAttribute("pageTitle", "Welcome Admin School!");
		        
		        if (crewID != null) {
		            List<crewTask> pendingTasks = crewTaskService.getPendingTaskStatusbyCrewID(crewID);
		            List<crewTask> completeTasks = crewTaskService.getCompleteTaskStatus(crewID);

		            model.addAttribute("pendingTasks", pendingTasks);
		            model.addAttribute("completeTasks", completeTasks);
		        }

		        model.addAttribute("pageTitle", "Crew Tasks");
		        
		        return "adminschool/crewTask";
		    } else {
		        model.addAttribute("error", "Unauthorized access!");
		        return "errorPage";
		    }
	}

	 @GetMapping(value = "/adminschool/getTaskDetails", produces = MediaType.APPLICATION_JSON_VALUE)
	    @ResponseBody
	    public Map<String, Object> getAllTaskbyCrewID(@RequestParam("crewID") int crewID) {
	        // Fetch tasks by CrewID
	        List<crewTask> crewTasks = crewTaskService.getAllTaskbyCrewID(crewID);
	        
	        Map<String, Object> response = new HashMap<>();

	        if (crewTasks != null && !crewTasks.isEmpty()) {
	            response.put("tasks", crewTasks.stream().map(task -> {
	                Map<String, Object> taskDetails = new HashMap<>();
	                taskDetails.put("TaskTitle", task.getTaskTitle());
	                taskDetails.put("TaskDescription", task.getTaskDescription());
	                taskDetails.put("TaskDueDate", task.getTaskDueDate());
	                taskDetails.put("TaskID", task.getTaskId());
	                taskDetails.put("TaskStatus", task.getTaskStatus());
	                taskDetails.put("isOverdue", task.isOverdue());
	                return taskDetails;
	            }).toList());
	        } else {
	            response.put("error", "No tasks found for the given CrewID.");
	        }

	        return response;
	    }
	 @GetMapping(value = "/adminschool/getTaskDetailsByID", produces = MediaType.APPLICATION_JSON_VALUE)
	 @ResponseBody
	 public Map<String, Object> getTaskDetailsByID(@RequestParam("taskID") int taskID) {
	     crewTask task = crewTaskService.getTaskByID(taskID);
	     Map<String, Object> response = new HashMap<>();

	     if (task != null) {
	         response.put("TaskID", task.getTaskId());
	         response.put("TaskTitle", task.getTaskTitle());
	         response.put("TaskDescription", task.getTaskDescription());
	         response.put("TaskDueDate", task.getTaskDueDate());
	         response.put("TaskStatus", task.getTaskStatus());
	         response.put("isOverdue", task.isOverdue());
	     } else {
	         response.put("error", "Task not found");
	     }

	     return response;
	 }
	 @GetMapping("/adminschool/addTask")
		public String showAddTask(Model model) {

		    return "adminschool/addTask"; // Ensure this JSP exists and matches the path
		}
	 



}
