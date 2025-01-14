package com.tvpss.controller;

import com.tvpss.model.Program;
import com.tvpss.service.ProgramService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class TeacherController {

    @Autowired
    private ProgramService programService;



    // Show teacher dashboard
    @GetMapping("/dashboard")
    public String showDashboard() {
        return "teacher/teacherDashboard";  // This maps to /WEB-INF/views/teacher/teacherDashboard.jsp
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
        model.addAttribute("program", new Program());
        return "teacher/addProgram";  // This maps to /WEB-INF/views/teacher/addProgram.jsp
    }

    // Save new program
    @PostMapping("/teacher/saveProgram")
    public String saveProgram(@ModelAttribute("program") Program program) {
        programService.addProgram(program);
        return "redirect:/teacher/program";  // Redirects to list all programs (corrected path)
    }

    // Show form to edit an existing program
    @GetMapping("/teacher/editProgram/{id}")
    public String showEditForm(@PathVariable("id") int programID, Model model) {
        Program program = programService.getProgramById(programID);
        if (program == null) {
            return "redirect:/teacher/program";  // Redirect if program is not found
        }
        model.addAttribute("program", program);
        return "teacher/editProgram";  // This maps to /WEB-INF/views/teacher/editProgram.jsp
    }

    // Update program details
    @PostMapping("/teacher/updateProgram")
    public String updateProgram(@ModelAttribute("program") Program program) {
        programService.updateProgram(program);
        return "redirect:/teacher/program";  // Redirects to list all programs (corrected path)
    }

    // Delete a program
    @GetMapping("/teacher/deleteProgram/{id}")
    public String deleteProgram(@PathVariable("id") int programID) {
        System.out.println("Deleting program with ID: " + programID);  // Log for debugging
        programService.deleteProgramById(programID);
        return "redirect:/teacher/program";  // Redirects to list all programs (corrected path)
    }
}
