package com.tvpss.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import com.tvpss.model.Crew;
import com.tvpss.model.Program;
import com.tvpss.model.crewTask;
import com.tvpss.service.CrewService;
import com.tvpss.service.crewTaskService;
import com.tvpss.service.ProgramService;

@Controller
public class adSchoolController {

	@Autowired
	private CrewService crewService;
	
	@Autowired
	private crewTaskService crewTaskService;
	
	@Autowired
	private ProgramService programService;

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
	        response.put("ReasonToJoin", crew.getReasonToJoin());
	        response.put("ICNumber", crew.getICNumber());
	    } else {
	        response.put("error", "Crew not found");
	    }

	    return response;
	}
	@PostMapping("/adminschool/updateApplicationStatus")
    public ResponseEntity<String> updateApplicationStatus(@RequestBody Map<String, Object> payload) {
        try {
            int crewID = (int) payload.get("crewID");
            String status = (String) payload.get("status");
            crewService.updateApplicationStatus(crewID, status);
            return ResponseEntity.ok("Application status updated successfully.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
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
	 public Map<String, Object> getTaskDetailsByID(@RequestParam("taskID") int taskID,  HttpSession session) {
	     crewTask task = crewTaskService.getTaskByID(taskID);
	     Map<String, Object> response = new HashMap<>();
	     
	        session.setAttribute("taskId", task.getTaskId());
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
	 
	 @DeleteMapping("/adminschool/deleteTask/{taskId}")
	 @ResponseBody
	 public ResponseEntity<String> deleteTask(@PathVariable("taskId") Integer taskId) {
	     try {
	         crewTaskService.deleteTask(taskId);
	         return ResponseEntity.ok("Task deleted successfully");
	     } catch (Exception e) {
	         return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                            .body("Error deleting task: " + e.getMessage());
	     }
	 }
	 @PostMapping("/adminschool/deleteCrew")
	 @ResponseBody
	 public Map<String, Object> deleteCrew(@RequestParam("crewID") Integer crewId) {
	     Map<String, Object> response = new HashMap<>();
	     try {
	         // Your deletion logic here
	         crewService.deleteCrew(crewId);
	         response.put("success", true);
	         response.put("message", "Crew member deleted successfully");
	     } catch (Exception e) {
	         response.put("success", false);
	         response.put("message", "Failed to delete crew member: " + e.getMessage());
	     }
	     return response;
	 }
	 @PostMapping("/adminschool/createTask")
	 @ResponseBody
	 public Map createCrew(@RequestBody Map<String, Object> requestData) {
	     Map<String, Object> response = new HashMap<>();
	     
	     try {
	         Integer crewId = Integer.parseInt(requestData.get("crewID").toString());
	         String title = (String) requestData.get("title");
	         String description = (String) requestData.get("description");
	         
	         // Parse the string to java.util.Date first
	         SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	         java.util.Date utilDate = dateFormat.parse((String) requestData.get("dueDate"));
	         
	         // Convert to java.sql.Date
	         java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
	         
	         crewTaskService.CreateTask(title, description, sqlDate, crewId);
	         response.put("success", true);
	         response.put("message", "Task created successfully");
	     } catch (Exception e) {
	         response.put("success", false);
	         response.put("message", "Failed to create task: " + e.getMessage());
	     }
	     return response;
	 }
	 /*@PostMapping("/adminschool/updateTask")
	 @ResponseBody
	 public Map<String, Object> updateTask(@RequestBody Map<String, Object> requestData) {
	     Map<String, Object> response = new HashMap<>();

	     try {
	         Integer taskId = Integer.parseInt(requestData.get("taskID").toString());
	         String title = (String) requestData.get("title");
	         String description = (String) requestData.get("description");

	         // Parse the string to java.util.Date
	         SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	         java.util.Date utilDate = dateFormat.parse((String) requestData.get("dueDate"));

	         // Convert to java.sql.Date
	         java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

	         // Call your service method to update the task
	         crewTaskService.updateTask(title, description, sqlDate, taskId);
	         
	         response.put("success", true);
	         response.put("message", "Task updated successfully");
	     } catch (Exception e) {
	         response.put("success", false);
	         response.put("message", "Failed to update task: " + e.getMessage());
	         e.printStackTrace();
	     }
	     return response;
	 }*/
	 @PutMapping("/adminschool/updateTask")
	 @ResponseBody
	 public Map<String, Object> updateTask(@RequestBody Map<String, Object> requestData) {
	     Map<String, Object> response = new HashMap<>();
	     try {
	         Integer taskId = Integer.parseInt(String.valueOf(requestData.get("taskID")));
	         String title = (String) requestData.get("title");
	         String description = (String) requestData.get("description");
	         String dueDate = (String) requestData.get("dueDate");

	         if (dueDate == null || dueDate.isEmpty()) {
	             throw new IllegalArgumentException("Due date cannot be null or empty");
	         }

	         SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	         java.sql.Date sqlDate = new java.sql.Date(dateFormat.parse(dueDate).getTime());

	         crewTaskService.updateTask(title, description, sqlDate, taskId);
	         response.put("success", true);
	         response.put("message", "Task updated successfully");
	     } catch (Exception e) {
	         response.put("success", false);
	         response.put("message", "Error updating task: " + e.getMessage());
	     }
	     return response;
	 }

	// Add this configuration class
	

/*	 @Configuration
	 public class WebConfig implements WebMvcConfigurer {
	     @Override
	     public void addCorsMappings(CorsRegistry registry) {
	         registry.addMapping("/**")
	                 .allowedMethods("GET", "POST", "PUT", "DELETE")
	                 .allowedOrigins("http://localhost:8080") // Adjust origin as needed
	                 .allowCredentials(true);
	     }
	 }
	 */
	    @GetMapping("/adminschool/program")
	    public String listPrograms(Model model) {
	        try {
	            List<Program> programs = programService.getAllPrograms();
	            if (programs == null || programs.isEmpty()) {
	                model.addAttribute("errorMessage", "No programs available.");
	            } else {
	                model.addAttribute("programs", programs);
	            }
	            return "adminschool/program";
	        } catch (Exception e) {
	            model.addAttribute("errorMessage", "Error fetching programs: " + e.getMessage());
	            return "errorPage";
	        }
	    }

}