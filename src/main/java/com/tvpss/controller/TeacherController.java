package com.tvpss.controller;

import com.tvpss.model.Program;
import com.tvpss.model.School;
import com.tvpss.service.ProgramService;
import com.tvpss.service.SchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class TeacherController {

    @Autowired
    private ProgramService programService;

    @Autowired
    private SchoolService schoolService;  // Add SchoolService

    // Show teacher dashboard
    @GetMapping("/teacher/dashboard")
    public String showDashboard() {
        return "teacher/dashboard";  // This maps to /WEB-INF/views/teacher/teacherDashboard.jsp
    }

    // List all programs
    @GetMapping("/teacher/program")
    public String listPrograms(Model model) {
        List<Program> programs = programService.getAllPrograms();
        model.addAttribute("programs", programs);
        return "teacher/Program";  // This maps to /WEB-INF/views/teacher/Program.jsp
    }

    // Show form to add a new program
    @GetMapping("/teacher/addProgram")
    public String showAddForm(Model model) {
        Program program = new Program();
        List<School> schools = schoolService.getAllSchools();  // Get all schools
        model.addAttribute("program", program);
        model.addAttribute("schools", schools);  // Add schools to the model for the dropdown
        return "teacher/addProgram";  // This maps to /WEB-INF/views/teacher/addProgram.jsp
    }

    // Save new program
    @PostMapping("/teacher/saveProgram")
    public String saveProgram(@ModelAttribute("program") Program program) {
        programService.addProgram(program);
        return "redirect:/teacher/program";  // Redirects to list all programs
    }

    // Show form to edit an existing program
    @GetMapping("/teacher/editProgram/{id}")
    public String showEditForm(@PathVariable("id") int programID, Model model) {
        Program program = programService.getProgramById(programID);
        if (program == null) {
            return "redirect:/teacher/program";  // Redirect if program is not found
        }
        List<School> schools = schoolService.getAllSchools();  // Add school list for dropdown
        model.addAttribute("program", program);
        model.addAttribute("schools", schools);
        return "teacher/editProgram";  // This maps to /WEB-INF/views/teacher/editProgram.jsp
    }

    // Update program details
    @PostMapping("/teacher/updateProgram")
    public String updateProgram(@ModelAttribute("program") Program program) {
        programService.updateProgram(program);
        return "redirect:/teacher/program";  // Redirects to list all programs
    }

    // Delete a program
    @GetMapping("/teacher/deleteProgram/{id}")
    public String deleteProgram(@PathVariable("id") int programID) {
        System.out.println("Deleting program with ID: " + programID);  // Log for debugging
        programService.deleteProgramById(programID);
        return "redirect:/teacher/program";  // Redirects to list all programs
    }
}
